MIME-Version: 1.0
Date: Thu, 30 Aug 2018 14:32:20 -0500
References: <20180828124858.2183-1-semtax33@gmail.com>
In-Reply-To: <20180828124858.2183-1-semtax33@gmail.com>
Message-ID: <CAL_JsqJrhYLXE26YDPNp3zGxmv-HeKhYLNh7VGdz+vTPHq5pyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: fix document typo
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: semtax33@gmail.com
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 28, 2018 at 7:49 AM sim manseop <semtax33@gmail.com> wrote:
>

Please write a better subject. As-is, it could apply to any binding file.

> Fix Documentation typo : (SMbus -> SMBus)
>
> Signed-off-by: manseop sim <semtax33@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index 11263982470e..44efafdfd7f5 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -84,7 +84,7 @@ Binding may contain optional "interrupts" property, describing interrupts
>  used by the device. I2C core will assign "irq" interrupt (or the very first
>  interrupt if not using interrupt names) as primary interrupt for the slave.
>
> -Alternatively, devices supporting SMbus Host Notify, and connected to
> +Alternatively, devices supporting SMBus Host Notify, and connected to
>  adapters that support this feature, may use "host-notify" property. I2C
>  core will create a virtual interrupt for Host Notify and assign it as
>  primary interrupt for the slave.
> --
> 2.17.1
>
