From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
Date: Tue, 11 Apr 2017 16:49:52 +0200
Message-ID: <20170411164952.52357b4f@bbrezillon>
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
        <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
        <20170322144507.4d80d2cc@bbrezillon>
        <0dccc0abcf234e98be6d340027cf1a30@SIWEX5A.sing.micron.com>
        <20170322155216.319efc3e@bbrezillon>
        <414dd35931814ce38381a251917ad79f@SIWEX5A.sing.micron.com>
        <20170411145102.563fa388@bbrezillon>
        <106593e04c494120b323836b8bc54f7f@SIWEX5A.sing.micron.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <106593e04c494120b323836b8bc54f7f-aBoyCxvc2dBaXkNJqdKpEhSpLNRU/VIH@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Bean Huo (beanhuo)" <beanhuo-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 11 Apr 2017 14:26:02 +0000
"Bean Huo (beanhuo)" <beanhuo-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org> wrote:

> >
> >Hi Bean,
> >
> >On Mon, 3 Apr 2017 11:31:05 +0000
> >"Bean Huo (beanhuo)" <beanhuo-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org> wrote:
> >  
> >> Hi, Boris and Thomas
> >>  
> >> >>
> >> >> Ok, but I recommend that 70s should be the first choice on this
> >> >> single solution, it doesn't need to read twice to detect its bitflips count.  
> >> >
> >> >That's exactly why we need to differentiate the 2 chips.  
> >>
> >> Sorry for later this response.
> >> Below is the pseudo codes about how to differentiate these 2 series
> >> parallel NAND with on-die ECC:
> >>
> >> if (NAND == SLC ) { // on-die ECC only exists in SLC //check device ID
> >> byte 4
> >>      if ((ID.byte4 & 0x02) == 0x02) {// internal ECC level ==10b  
> >
> >So here the MT29F1G08ABADAWP datasheet says 0x2 <=> 4bit/512bytes ECC.
> >  
> >> 	if (ID.byte4 & 0x80) {//on-Die ECC enabled  
> >
> >Did you read my last reply?
> >Thomas discovered that ID[4].bit7 is actually reflecting the ECC engine state (1 if
> >the engine is enabled, 0 if it's disabled), not whether the NAND supports on-die
> >ECC or not, so no this test is not reliable.
> >  
> >>                     if (ONFI.byte112 == 4)
> >> 		 60s SLC NAND with on-die ECC
> >> 	    else if (ONFI.byte112 == 8)
> >>      	              70s SLC NAND with on-die ECC  
> >
> >This is completely fucked up! Now the ONFI param page says the NAND requires
> >8bits/512bytes, while the ID bytes advertised an on-die ECC providing
> >4bits/512bytes correctability.
> >So either your algorithm is wrong, or the ID and ONFI param page are contracting
> >(not sure what solution I'd prefer...).
> >  
> >> 	    else
> >>                           Doesn't support on-die ECC  
> >
> >Sorry to say that, but I find it worrisome that even someone from Micron is not
> >able to get it right.
> >  
> 
> Sorry, would you please specify which one is wrong or confuse you?

The initial 'if (ID.byte4 & 0x80)' is wrong, because this bit is only
set when someone enabled the ECC engine using the SET_FEATURE command
(this has been verified by Thomas who tried to disable the feature in
the bootloader and noticed that on-die ECC was reported as
'unsupported' by the kernel).

Maybe I was wrong about your 'if ((ID.byte4 & 0x02) == 0x02)' test,
because you apparently only mask bit 1 and not bits 0 and 1.
Anyway, I can't tell if this is valid because I don't have access to
the M79A datasheets you're referring to.


> 
> >I think we'll stick to the model name to detect whether on-die ECC is supported.
> >  
> You want one solution that can clearly differentiate two serial SLC NAND, but NAND ONFI table
> and device Id are always changing. It is easy to draw a perfect solution to do that.
> OK, if you like maintain a huge/ugly table in MTD, please do that.

I'm not happy with the big ID table either, but unless I'm missing
something, what you propose does not work for the MT29F1G08ABADAWP, so
I prefer to rely on something I can trust.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
