From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/2] ohci-platform: Add support for
 devicetree instantiation
Date: Thu, 09 Jan 2014 23:14:30 +0300
Message-ID: <52CF0326.1090407@cogentembedded.com>
References: <1389290226-6971-1-git-send-email-hdegoede@redhat.com> <1389290226-6971-2-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Return-path: <linux-sunxi+bncBC6MFNV32EFRBE7KXOLAKGQEZDO7V4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1389290226-6971-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 01/09/2014 08:57 PM, Hans de Goede wrote:

> Add support for ohci-platform instantiation from devicetree, including
> optionally getting clks and a phy from devicetree, and enabling / disabling
> those on power_on / off.

> This should allow using ohci-platform from devicetree in various cases.
> Specifically after this commit it can be used for the ohci controller found
> on Allwinner sunxi SoCs.

> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>   .../devicetree/bindings/usb/mmio-ohci.txt          |  22 +++
>   drivers/usb/host/ohci-platform.c                   | 150 ++++++++++++++++++---
>   2 files changed, 152 insertions(+), 20 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/usb/mmio-ohci.txt

> diff --git a/Documentation/devicetree/bindings/usb/mmio-ohci.txt b/Documentation/devicetree/bindings/usb/mmio-ohci.txt
> new file mode 100644
> index 0000000..9c776ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/mmio-ohci.txt
> @@ -0,0 +1,22 @@
> +Generic MMIO OHCI controller

    OHCI controller always uses MMIO, and likewise EHCI. You don't need to 
specifically mention it.

> +
> +Required properties:
> +- compatible : "mmio-ohci"

    Likewise, it's not a good name. Why not call it "platform-ohci"?

> +- reg : ohci controller register range (address and length)
> +- interrupts : ohci controller interrupt
> +
> +Optional properties:
> +- clocks : a list of phandle + clock specifier pairs
> +- phys : phandle + phy specifier pair
> +- phy-names : "usb"
> +
> +Example:
> +
> +	ohci0: ohci@0x01c14400 {
> +		compatible = "mmio-ohci";
> +		reg = <0x01c14400 0x100>;
> +		interrupts = <64>;
> +		clocks = <&usb_clk 6>, <&ahb_gates 2>;
> +		phys = <&usbphy 1>;
> +		phy-names = "usb";
> +	};

WBR, Sergei
