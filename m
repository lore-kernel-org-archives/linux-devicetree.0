From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] arm: dts: bcm5301x: Add syscon based reboot in DT
Date: Tue, 5 Jan 2016 17:26:06 -0500
Message-ID: <20160105222605.GL31867@broadcom.com>
References: <1450474676-10210-1-git-send-email-jonmason@broadcom.com>
 <1450474676-10210-3-git-send-email-jonmason@broadcom.com>
 <2180042.V6T2Tnxp6B@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2180042.V6T2Tnxp6B@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 18, 2015 at 10:44:28PM +0100, Arnd Bergmann wrote:
> On Friday 18 December 2015 16:37:56 Jon Mason wrote:
> > +       cru: cru@1800c184 {
> > +               compatible = "syscon";
> > +               reg = <0x1800c184 0xc>;
> > +       };
> 
> It's unusual for a device to start at such an odd address. Are you sure
> it's not a larger device starting at 0x1800c000 or 0x18000000?

The CRU (Clock and Reset Unit) starts at 0x1800c100, with the
following layout:

CRU Clock Management at 0x1800c100-0x1800c180
CRU Reset at 0x1800c184
CRU Period Sample Clock at 0x1800c188
CRU Interrupt register at 0x1800c18c
CRU MDIO Control at 0x1800c190
CRU GPIO at 0x1800c1c0-0x1800c1e0
CRU SDIO 0x1800c200-0x1800c214
CRU RoboSW Interrupt at 0x1800c280
CRU Straps Control at 0x1800c2a0

The clock driver is already referencing the registers between
0x1800c100-0x1800c180, and the GPIO driver is referencing registers
between 0x1800c1c0-0x1800c1e0.

The reset part of the syscon seems to be the only useful thing in this
block.  Am I approaching this incorrectly?


> Also, please provide a more specific compatible string based on the
> name of the device in the data sheet. The node name in contrast should
> be more generic, e.g.
> 
> 	cru: system-controller@1800c000 {
> 		compatible = "brcm,bcm53010-cru", "syscon";

This is very similar between the NS and NSP (and NS2) platforms.  I'll
verify the layout and see if this can't be "brcm,iproc-cru" or
something similar.

Thanks,
Jon

> 		reg = <0x1800c000 0x400>; /* whatever the data sheet says */
> 	};
> 
> 
> 	Arnd
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
