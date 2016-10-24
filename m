From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: arch_timer: Add device tree binding for
 hisilicon-161x01 erratum
Date: Mon, 24 Oct 2016 12:16:08 +0100
Message-ID: <20161024111608.GG15620@leverpostej>
References: <962ea92f-870b-e1d0-5bb7-1a6d66c35122@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <962ea92f-870b-e1d0-5bb7-1a6d66c35122-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 23, 2016 at 11:21:10AM +0800, Ding Tianhong wrote:
> +- hisilicon,erratum-161x01 : A boolean property. Indicates the presence of
> +  QorIQ erratum 161201, which says that reading the counter is
> +  unreliable unless the small range of value is returned by back-to-back reads.
> +  This also affects writes to the tval register, due to the implicit
> +  counter read.

Is "161x01" the *exact* erratum number, or is the 'x' a wildcard? Please
use the *exact* erratum number, even if that means we have to list
several.

Is "161x01" an *erratum* number, or the *part* number of affected
devices?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
