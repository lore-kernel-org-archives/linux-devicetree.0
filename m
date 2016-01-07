From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v11 3/3] MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND
 device tree nodes
Date: Thu, 7 Jan 2016 09:33:50 -0800
Message-ID: <20160107173350.GF109450@google.com>
References: <1451910884-18710-1-git-send-email-harvey.hunt@imgtec.com>
 <1451910884-18710-4-git-send-email-harvey.hunt@imgtec.com>
 <20160107012903.GX109450@google.com>
 <568E327D.8040905@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <568E327D.8040905-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alex-oucj9GSTHrKwpo/f3jThPQ@public.gmane.org, Alex Smith <alex.smith-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Harvey + Ralf,

On Thu, Jan 07, 2016 at 09:40:13AM +0000, Harvey Hunt wrote:
> On 07/01/16 01:29, Brian Norris wrote:
> >On Mon, Jan 04, 2016 at 12:34:44PM +0000, Harvey Hunt wrote:
> >>diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
> >>index 9fcb9e7..782258c 100644
> >>--- a/arch/mips/boot/dts/ingenic/ci20.dts
> >>+++ b/arch/mips/boot/dts/ingenic/ci20.dts
> >
> >As I noted on patch 1, you need to send this to linux-mips + Ralf.
> 
> I forgot to CC Ralf on this version, but he took v9 (no change
> between v9 and v11) through linux-mips as can be seen here:
> http://patchwork.linux-mips.org/patch/11695/

OK.

> >>@@ -42,3 +42,66 @@
> >>  &uart4 {
> >>  	status = "okay";
> >>  };
> >>+
> >>+&nemc {
> >>+	status = "okay";
> >>+
> >>+	nandc: nand-controller@1 {
> >>+		compatible = "ingenic,jz4780-nand";
> >>+		reg = <1 0 0x1000000>;
> >>+
> >>+		#address-cells = <1>;
> >>+		#size-cells = <0>;
> >>+
> >>+		ingenic,bch-controller = <&bch>;
> >>+
> >>+		ingenic,nemc-tAS = <10>;
> >>+		ingenic,nemc-tAH = <5>;
> >>+		ingenic,nemc-tBP = <10>;
> >>+		ingenic,nemc-tAW = <15>;
> >>+		ingenic,nemc-tSTRV = <100>;
> >>+
> >>+		nand@1 {
> >>+			reg = <1>;
> >>+
> >>+			nand-ecc-step-size = <1024>;
> >>+			nand-ecc-strength = <24>;
> >>+			nand-ecc-mode = "hw";
> >>+			nand-on-flash-bbt;
> >>+
> >>+			partitions {
> >>+				#address-cells = <2>;
> >>+				#size-cells = <2>;
> >
> >This binding was updated, so you need:
> >
> >				compatible = "fixed-partitions";
> 
> This has been fixed in mips-linux here:
> http://patchwork.linux-mips.org/patch/11914/

Ralf: it looks like you applied the DTS changes twice, essentially.
Might want to fix that:

[From arch/mips/boot/dts/ingenic/ci20.dts]
...
&nemc {
	...
	nandc: nand-controller@1 {
		...
		nand@1 {
			...
			partitions {
				compatible = "fixed-partitions";
				...
			};
		};
	};
};

&bch {
	status = "okay";
};

&nemc {
	...
	nandc: nand-controller@1 {
		...
		nand@1 {
			...
			partitions {
				...
			};
		};
	};
};

&bch {
	status = "okay";
};


Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
