From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: mvebu: add ethernet to the cm-a510 board
Date: Fri, 30 Jan 2015 10:44:07 +0100
Message-ID: <54CB5267.5060004@gmail.com>
References: <E1YH5bU-0005mG-3L@bombadil.infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1YH5bU-0005mG-3L-PfSpb0PWhxZc2C7mugBRk2EX/6BAtgUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gabriel Dobato <dobatog-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[added MVEBU maintainers and Gabriel to Cc]

On 30.01.2015 07:06, Jean-Francois Moine wrote:
> This patch enables the ethernet device by default, permitting CM-A510
> boards to access the network when an ethernet connector is present.
>
> Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
> Tested-by: Gabriel Dobato <dobatog-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Jean-Francois,

great you are helping out Gabriel to get his CM-A510 up and running!

I had a closer look on the Compulab website of the SoM [1] and think
that we'll have to convert it to dove-cm-a510.dtsi and the baseboard
Gabriel is using (maybe SBC-A510 [2]).

The dove-cm-a510.dts was a blind port of what was in mach-dove when
we started with DT, so most of it is probably bogus.

For the ethernet port this patch is about, the PHY (RTL8211) is part
of the SoM, the jack is not. So, we cannot really tell, if that port
can ever be used on a specific baseboard. I suggest to put the
corresponding nodes into the dtsi, but leave them status = "disabled".

The baseboard dts should enable them like your patch does, if the
ethernet jack is available. The same is true for the sdio0 and sata0
nodes you can see below. However, sdio1 is connected to a USI WiFi
module with Marvel 8686 on the SoM.

Can you take over and prepare the necessary patches? That would
be great!

BTW, I wouldn't mind if the cm510 related dts files you are touching
move over to dual-license [3] now :)

Sebastian

[1] http://www.compulab.co.il/products/computer-on-modules/cm-a510/#diagram
[2] www.compulab.co.il/products/sbcs/sbc-a510/
[3] http://permalink.gmane.org/gmane.linux.ports.arm.kernel/389206

> ---
>   arch/arm/boot/dts/dove-cm-a510.dts | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/dove-cm-a510.dts b/arch/arm/boot/dts/dove-cm-a510.dts
> index 50c0d69..404e983 100644
> --- a/arch/arm/boot/dts/dove-cm-a510.dts
> +++ b/arch/arm/boot/dts/dove-cm-a510.dts
> @@ -21,6 +21,8 @@
>   &sdio0 { status = "okay"; };
>   &sdio1 { status = "okay"; };
>   &sata0 { status = "okay"; };
> +&eth { status = "okay"; };
> +&mdio { status ="okay";};
>
>   &spi0 {
>   	status = "okay";
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
