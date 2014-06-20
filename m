From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 3/3] ARM: shmobile: henninger: enable internal PCI
Date: Sat, 21 Jun 2014 02:28:35 +0400
Message-ID: <53A4B593.1020700@cogentembedded.com>
References: <201406210044.51620.sergei.shtylyov@cogentembedded.com> <201406210051.28040.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <201406210051.28040.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 06/21/2014 12:51 AM, Sergei Shtylyov wrote:

> Enable internal AHB-PCI bridges for the USB EHCI/OHCI controllers attached to
> them.

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> ---
> Changes in version 3:
> - refreshed the patch.

>   arch/arm/boot/dts/r8a7791-henninger.dts |   22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> Index: renesas/arch/arm/boot/dts/r8a7791-henninger.dts
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7791-henninger.dts
> +++ renesas/arch/arm/boot/dts/r8a7791-henninger.dts
[...]
> @@ -217,3 +227,15 @@
>   		spi-cpha;
>   	};
>   };
> +
> +&pci0 {
> +	status = "okay";
> +	pinctrl-0 = <&usb0_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&pci1 {
> +	status = "okay";
> +	pinctrl-0 = <&usb1_pins>;
> +	pinctrl-names = "default";
> +};

    Gah, I forgot to refresh this patch one final time before sending out... :-/

WBR, Sergei

