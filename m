From: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Subject: Re: [PATCH 0/5] mtd: nand: add support for on-die ECC
Date: Tue, 21 Mar 2017 23:33:50 +0100
Message-ID: <c6ffc948-85ba-21dc-871c-3fd0b7b4b97b@nod.at>
References: <1490092686-16509-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490092686-16509-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thomas,

Am 21.03.2017 um 11:38 schrieb Thomas Petazzoni:
> Hello,
> 
> This patch series adds support for on-die ECC, i.e ECC performed by
> the NAND chip itself, as opposed to having the ECC calculated by the
> NAND controller or in software.
> 
> It is useful in situations where the NAND chip has an ECC requirement
> that is not met by the ECC capabilities of the NAND controller.
> 
> Patch 1 adjusts the NAND generic DT binding to add "on-die" as an
> nand-ecc-mode.
> 
> Patch 2 adds the core support for on-die ECC, which is really simple
> and minimal: all the work is really done in the vendor-specific NAND
> code.
> 
> Patch 3 and 4 adds the on-die ECC implementation for Micron NANDs.
> 
> Patch 5 allows the FSMC NAND driver to use on-die ECC.
> 
> This series was tested on a SPEAr600 platform, with a Micron
> MT29F1G08ABADAWP NAND. The mtd_nandbiterrs.ko test is passing
> successfully, which shows that the on-die ECC is correcting bitflips
> as expected.

This series looks good to me. Great job!

Reviewed-by: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>

Thanks,
//richard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
