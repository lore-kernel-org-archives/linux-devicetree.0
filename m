From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/5] arm: dts: lpc32xx: fix improper usage of ranges property
Date: Tue, 13 Oct 2015 21:36:09 +0200
Message-ID: <5493797.P10V9v7QAu@wuerfel>
References: <1444694045-22000-1-git-send-email-vz@mleia.com> <7277011.vmOGiecsKn@wuerfel> <561D287C.9010400@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561D287C.9010400-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 13 October 2015 18:51:24 Vladimir Zapolskiy wrote:
> On 13.10.2015 15:44, Arnd Bergmann wrote:
> > I don't get it. What kind of errors do you see? The existing
> > version looks cleaner than the new one, as it only translates
> > the MMIO areas that are actually used.
> > 
> 
> The problem is found when I add PL175 device node to lpc32xx.dtsi and
> expand the node in my board file. The external memory controller manages
> up to 4 memory devices, which by means of the controller are mapped into
> physical memory starting from address 0xe0000000.
> 
> Below are my declarations, similar to one found in lpc18xx.dtsi.
> 
> lpc32xx.dtsi change common for all LPC32xx boards:
> 
> emc: emc@31080000 {
> 	compatible = "arm,pl175", "arm,primecell";
> 	reg = <0x31080000 0x1000>;
> 	clocks = <&scf LPC32XX_CLK_DDRAM>;
> 	clock-names = "mpmcclk";
> 
> 	#address-cells = <1>;
> 	#size-cells = <1>;
> 	ranges = <0 0xe0000000 0x01000000>,
> 		 <1 0xe1000000 0x01000000>,
> 		 <2 0xe2000000 0x01000000>,
> 		 <3 0xe3000000 0x01000000>;
> 	status = "disabled";
> };
> 

Ok, got it.

> Support of EMC device node will be added to lpc32xx.dtsi, when this kind
> of problem is fixed.

As I see it, the problem is that you now have ranges that are not
for devices inside of the device but that are external. As the
memory-controller node needs both its own registers and the translation
for the external ones, we unfortunately can't just put it in the root
node, which would avoid the issue.

Instead, I would suggest adding a range for the 0xe0000000 area.


	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
