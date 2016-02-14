From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 4/7] ARM: dts: imx: Add support for Advantech/GE Bx50v3
Date: Sun, 14 Feb 2016 10:19:29 +0800
Message-ID: <20160214021929.GC6756@tiger>
References: <1454109558-22800-1-git-send-email-akshay.bhat@timesys.com>
 <1454109558-22800-5-git-send-email-akshay.bhat@timesys.com>
 <20160203145256.GR8307@tiger>
 <56B3E578.2080209@timesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56B3E578.2080209-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 04, 2016 at 06:57:44PM -0500, Akshay Bhat wrote:
> >>+/ {
> >>+	clocks {
> >>+		#address-cells = <1>;
> >>+		#size-cells = <0>;
> >
> >These are already specified in imx6qdl.dtsi.
> >
> 
> Will fix this. Once it is removed, should I have a new line before
> the child node?
> eg:
> 
> clocks {
> 

No, this new line is not needed.

Shawn

> 	mclk: clock@0 {
> 		compatible = "fixed-clock";
> >>+
> >>+		mclk: clock@0 {
> >>+			compatible = "fixed-clock";
> >>+			reg = <0>;
> >>+			#clock-cells = <0>;
> >>+			clock-frequency = <22000000>;
> >>+		};
> >>+	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
