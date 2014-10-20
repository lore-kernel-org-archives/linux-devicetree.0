From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/3] ARM: meson: Add reset controller
Date: Mon, 20 Oct 2014 14:01:02 +0200
Message-ID: <20141020120102.GC29697@carlo-MacBookPro>
References: <1413803985-8363-1-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1413803985-8363-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 20, 2014 at 01:19:42PM +0200, Carlo Caione wrote:
> Apparently several IPs found in the MesonX SoCs can be reset by programming a
> specific bit in a register in the so called AO (Always-On) domain. From the
> documentation released by Amlogic under NDA it is not clear which devices can
> be reset acting on this register. So far from the sources release by Amlogic it
> seems that at least two IPs use this register for reset: RTC and UART. Since I
> need it to reset the RTC, I wrote this small driver.

Hi Philipp,
a couple of minutes ago I received new documentation about the
controller. I'll submit a v4 soon.

Thanks,

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
