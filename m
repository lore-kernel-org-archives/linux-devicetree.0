From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 01/11] dm: serial: Update binding for PL01x
 serial UART
Date: Mon, 10 Aug 2015 21:57:46 -0600
Message-ID: <55C972BA.5050706@wwwdotorg.org>
References: <1438954951-13329-1-git-send-email-sjg@chromium.org>
 <1438954951-13329-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1438954951-13329-2-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Simon Glass <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, U-Boot Mailing List <u-boot@lists.denx.de>, Joe Hershberger <joe.hershberger@ni.com>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

On 08/07/2015 07:42 AM, Simon Glass wrote:
> This binding differs from that of Linux. Update it and change existing
> users.

Is that meant to imply that this patch fixes the copy of the binding doc
in U-Boot so it does match the kernel's copy?

> Changes in v3:
> - Rename binding file to pl01x.txt

The file is named pl011.txt in the kernel. Shouldn't U-Boot's copy be
named the same?


> diff --git a/arch/arm/dts/stv0991.dts b/arch/arm/dts/stv0991.dts

>  	uart0: serial@0x80406000 {
>  		compatible = "arm,pl011", "arm,primecell";
>  		reg = <0x80406000 0x1000>;
> -		clock = <2700000>;
> +		clock-frequency = <2700000>;

I don't see either "clock" or "clock-frequency" mentioned in the Linux
binding doc.

> diff --git a/doc/device-tree-bindings/serial/pl01x.txt b/doc/device-tree-bindings/serial/pl01x.txt

>  Required properties:
> -- compatible: must be "arm,primecell", "arm,pl011" or "arm,pl010"
> +- compatible: must be "arm,primecell", "arm,pl011"

It'd be worth mentioning which version of Linux this binding doc came
from; that text has changed in linux-next since v4.1 which is what I
assume you're importing.

> diff --git a/drivers/serial/serial_pl01x.c b/drivers/serial/serial_pl01x.c

> @@ -365,13 +365,15 @@ static int pl01x_serial_ofdata_to_platdata(struct udevice *dev)
>  	struct pl01x_serial_platdata *plat = dev_get_platdata(dev);
>  	fdt_addr_t addr;
>  
> -	addr = fdtdec_get_addr(gd->fdt_blob, dev->of_offset, "reg");
> +	addr = dev_get_addr(dev);
>  	if (addr == FDT_ADDR_T_NONE)
>  		return -EINVAL;

That looks like an unrelated change.
