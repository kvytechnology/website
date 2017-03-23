defmodule SoftwareAgency.Emails do
  use Bamboo.Phoenix, view: SoftwareAgency.EmailView

  def inquery(%{"email" => email, "firstname" => first, "lastname" => last, "message" => message, "phone" => phone}) do
    new_email
    |> to("long@kvytechnology.com")
    |> from("long@kvytechnology.com")
    |> subject("From #{first} #{last} - #{email} - #{phone}!")
    |> text_body(message)
  end
end
