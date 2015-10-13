From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/5] arm: dts: lpc32xx: fix improper usage of ranges property
Date: Tue, 13 Oct 2015 14:44:49 +0200
Message-ID: <7277011.vmOGiecsKn@wuerfel>
References: <1444694045-22000-1-git-send-email-vz@mleia.com> <1444694045-22000-3-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444694045-22000-3-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 13 October 2015 02:54:02 Vladimir Zapolskiy wrote:
> The change corrects invalid custom translations to 1:1 translations,
> otherwise during initialization there are too many failed attempts to
> translate addresses from subnodes, which anyway result in fallback 1:1
> translations, also it is found that due to this problem proper usage
> of ranges property in subnodes (e.g. for defining flash partitions)
> can not be done.
> 
> Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
> 

I don't get it. What kind of errors do you see? The existing
version looks cleaner than the new one, as it only translates
the MMIO areas that are actually used.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
