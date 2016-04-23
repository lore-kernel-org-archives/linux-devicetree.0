From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: strange dtc errors after adding sram node
Date: Sat, 23 Apr 2016 10:24:22 +0200
Message-ID: <5929251.U2lOfbMTgH@wuerfel>
References: <571B283F.8010707@lategoodbye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <571B283F.8010707-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <info-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Cc: kernelnewbies-7JyXY6prKcjpASu1u0TL5ti2O/JbrIOy@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause-L1vi/lXTdtsfGbAt6QbQcg@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 23 April 2016 09:46:07 Stefan Wahren wrote:
> -       ahb@80080000 {
> +       ahb@00000000 {
>                 compatible = "simple-bus";
>                 #address-cells = <1>;
>                 #size-cells = <1>;
> -               reg = <0x80080000 0x80000>;
> +               reg = <0x00000000 0x20000>, <0x80080000 0x80000>;
>                 ranges;
> 
> +               ocram: sram@00000000 {
> +                       compatible = "mmio-sram";
> +                       reg = <0x00000000 0x20000>;
> +               };
> +
>                 usb0: usb@80080000 {
>                         compatible = "fsl,imx28-usb", "fsl,imx27-usb";
>                         reg = <0x80080000 0x10000>;

Something odd about this is that you have duplicated addresses:
The sram node has the same "reg" property as the "ahb" node, 
and also the  existing address (0x80080000) overlaps with that of
the usb node.

The registers of a device should generally be non-overlapping
with registers of other devices.

Further, the binding of "simple-bus" doesn't specify any particular
register layout for its internal register set.

My best guess is that the author of the original dts file confused
the 'reg' property of the ahb node with a 'ranges' property that should
list which address range gets translated into what child addresses.

I don't see how that could lead to the dtc error you get, but it's
probably worth fixing anyway.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
