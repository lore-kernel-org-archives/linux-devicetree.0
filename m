From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: arch_timer: Add device tree binding for
 hisilicon-161x01 erratum
Date: Mon, 24 Oct 2016 14:39:46 +0100
Message-ID: <20161024133945.GL15620@leverpostej>
References: <962ea92f-870b-e1d0-5bb7-1a6d66c35122@huawei.com>
 <20161024111608.GG15620@leverpostej>
 <7e839df8-f8f7-3b16-8321-4ff45b6c5884@huawei.com>
 <20161024131617.GJ15620@leverpostej>
 <1dcfb21a-7417-282e-f187-425d2c148672@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1dcfb21a-7417-282e-f187-425d2c148672-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 24, 2016 at 09:23:10PM +0800, Ding Tianhong wrote:
> On 2016/10/24 21:16, Mark Rutland wrote:
> > On Mon, Oct 24, 2016 at 08:40:01PM +0800, Ding Tianhong wrote:
> >> On 2016/10/24 19:16, Mark Rutland wrote:
> >>> Is "161x01" the *exact* erratum number, or is the 'x' a wildcard?
> >>
> >> The 'x' is a wildcard, it will cover 161001 to 161601 several numbers,
> > 
> > Given you're using a wildcard, I take it that this is a *part* number?
> 
> Yes, I was doubt how to fix this, should I choose a better erratum number?

Typically, we expect that each vendor has some central database of their
errata, with each having a unique ID.

If Huawei do not have such a database, I do not think that we should
invent an erratum number here.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
