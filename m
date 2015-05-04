From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 2/2] am335x-evm: add bluetooth support
Date: Mon, 4 May 2015 17:28:20 -0500
Message-ID: <CAL_JsqJd=6nG1S-Mds+MiS4wSmKnOUo2nBnA6wjGSycXECLpcQ@mail.gmail.com>
References: <1430655569-27849-1-git-send-email-eyalr@ti.com> <1430655569-27849-2-git-send-email-eyalr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1430655569-27849-2-git-send-email-eyalr@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Eyal Reizer <eyalreizer@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-omap <linux-omap@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Eliad Peller <eliad@wizery.com>, Eyal Reizer <eyalr@ti.com>
List-Id: devicetree@vger.kernel.org

On Sun, May 3, 2015 at 7:19 AM, Eyal Reizer <eyalreizer@gmail.com> wrote:
> From: Eliad Peller <eliad@wizery.com>
>
> uart1 is used for shared transport (used for multiplexing
> bluetooth and nfc data). add the needed muxes and definitions.
>
> Signed-off-by: Eliad Peller <eliad@wizery.com>
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  arch/arm/boot/dts/am335x-evm.dts |   28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
> index 0f398fa..5968cde 100644
> --- a/arch/arm/boot/dts/am335x-evm.dts
> +++ b/arch/arm/boot/dts/am335x-evm.dts
> @@ -135,6 +135,18 @@
>                 };
>         };
>
> +       kim {
> +               compatible = "kim";

Who is kim?

> +               nshutdown_gpio = <117>; /* Bank3, pin21 */

We have a standard way to specify gpios.

> +               dev_name = "/dev/ttyS1";

Uh, Linux specific. No.

> +               flow_cntrl = <1>;
> +               baud_rate = <3000000>;

I believe there are standard properties for uarts for both of these.

Is any of this documented?

Rob
