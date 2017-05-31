From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/4] ARM: dts: at91: Migrate to the new EBI/NAND
 bindings
Date: Wed, 31 May 2017 11:56:45 +0200
Message-ID: <20170531095645.7jwews2fbofhntjk@piout.net>
References: <1496136054-12390-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1496136054-12390-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rodolfo Giometti <giometti-k2GhghHVRtY@public.gmane.org>, Antoine Aubert <a.aubert-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, info-inJ12LbcDfezQB+pC5nmwQ@public.gmane.org, Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30/05/2017 at 11:20:50 +0200, Boris Brezillon wrote:
> Hello,
> 
> This is the last step of the EBI/NAND bindings rework started here [1].
> 
> The first patch is adding missing nfc-io bindings doc to atmel-nand.txt
> and can be applied independently.
> 
> Patches 2 and 3 are migrating all at91/sama5 SoCs (except the
> at91rm9200) to the new EBI/NAND representation introduced in 4.12.
> 
> The last patch is showing how one can add a non-NAND device under the
> EBI bus.
> 
> Regards,
> 
> Boris
> 
> [1]http://lkml.iu.edu/hypermail/linux/kernel/1703.2/00124.html
> 
> Changes since v1:
> - Cc board maintainers
> - merge patches 3 and 4 into a single patch doing all board
>   modifications
> 
> Boris Brezillon (4):
>   dt-bindings: mtd: atmel-nand: Document the nfc-io bindings
>   ARM: dts: at91: Declare EBI/NAND controllers
>   ARM: dts: at91: Switch to the new NAND bindings
>   ARM: dts: at91: Add the NOR flash available on sama5d3 dev kits
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
