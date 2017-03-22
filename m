From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
Date: Wed, 22 Mar 2017 15:52:16 +0100
Message-ID: <20170322155216.319efc3e@bbrezillon>
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
        <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
        <20170322144507.4d80d2cc@bbrezillon>
        <0dccc0abcf234e98be6d340027cf1a30@SIWEX5A.sing.micron.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0dccc0abcf234e98be6d340027cf1a30-aBoyCxvc2dBaXkNJqdKpEhSpLNRU/VIH@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Bean Huo (beanhuo)" <beanhuo-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> >> I noticed that this patches are based on MT29F1G08ABADAWP SLC NAND, it is  
> >our 60s 34nm SLC NAND.  
> >> So far, we have 2 series SLC NAND with implementations of on die ECC.
> >> 1. M79A for all 25nm (70series) SLC NAND with on-die ECC (M78A, M79A,
> >> and future design M70A) 2. M60A for all 34nm (60series) SLC NAND with
> >> on-die ECC  
> >
> >Do you have an easy way to differentiate those 2 generations of chip, or should
> >we base our detection on the model name provided in the ONFI parameter page?
> >  
> Of course, you can use model name, but I think we will keep a big table to include every NAND information.
> Also, it doesn't look nice and always changes.
> 
> The better solution is:
> 
> For the Micron SLC NAND with on Die ECC, please note only for the "SLC NAND with on Die ECC",
> You can always differentiate these two generation NAND by ONFI table byte 112 "Number of bits
> ECC correctability ", if its value is 4, it is 60s; if it's 8, it is 70s. this is a permanent method for both
> 60s and 70s "SLC NAND with on Die ECC".

The question is, how can we know if the NAND supports on-die ECC?

We were basing our detection on the "Internal ECC" bit in READ_ID, but
it seems this bit is actually reflecting the current ECC engine status
(enabled/disabled), which is disturbing, since information returned by
the READ_ID are supposed to be static :-(.

> 
> >>
> >> NAND_STATUS_FAIL:
> >> For the both of series SLC NAND with on-die ECC, SR bit 0
> >> (NAND_STATUS_FAIL) indicates an uncorrectable read fail, data is lost,
> >> no recovery possible, unless we have software additional protection, the block  
> >is not necessarily bad but the data is lost.  
> >>
> >> NAND_STATUS_WRITE_RECOMMENDED:
> >>
> >> For the NAND_STATUS_WRITE_RECOMMENDED, it only works on 60s NAND, it
> >> is 4 bit ECC, the status register only indicates if there is 0 or 1-4 correctable  
> >error bits. We don't want to trigger refresh if only 1 or 2 bits fail.  
> >> the base refresh is that if there 3 or 4 bitflips. But unfortunately we can't get  
> >failed bit count trough read status register.  
> >> SW workaround proposal:
> >> 1. If SR bit 3 is set to 1 it means 1~4 bitflips and correctable.
> >> 2. Read out the page with ECC ON
> >> 3. Read out the page with ECC OFF
> >> 4. Compare the data
> >> 5. Count the number of bitflips for the sectors (there are 4 ECC
> >> sectors) 6. if 3 or more fail bits, trigger fresh.
> >> I know this is not good solution, but if as long as
> >> NAND_STATUS_WRITE_RECOMMENDED is set, and trigger refresh, this will  
> >definitely increase NAND PE cycle.
> >
> >We discussed that with Thomas when developing the solution. I suggested to first
> >go for a simple solution even if it implies unneeded PE cycles when bitflips are
> >detected, but maybe I was wrong. In any case, it shouldn't be to hard to do what
> >you suggest.
> >  
> 
> Ok, but I recommend that 70s should be the first choice on this single solution,
> it doesn't need to read twice to detect its bitflips count.

That's exactly why we need to differentiate the 2 chips.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
