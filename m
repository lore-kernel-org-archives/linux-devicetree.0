From: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: orange-pi-zero-plus2: fix sdcard detect
Date: Sun, 3 Dec 2017 23:13:27 +0300
Message-ID: <20171203201327.23ncp6goyxshiw4r@speedy.hunter>
References: <20171106122633.5mnqfh6xhmmxr45s@flea>
 <20171106161306.tq6yeq6bq36ridj3@speedy.hunter>
 <CAMty3ZCYQx0MfiJnOZPtO4nSAtOrGicOzw_x_AznTiEW8h2sLg@mail.gmail.com>
 <CAMty3ZANhL7cHqYw4VY2Sj_JUZGyqFZ+7pLssc1tniN3BdupOA@mail.gmail.com>
 <20171107201245.gptgfli54o6eqmrj@speedy.hunter>
 <CAMty3ZB3aXCsd9VkibjxPdA=BXvXr3nMbGJJvtZN_z2SGVUAXA@mail.gmail.com>
 <20171113192411.kmohcthzickk4n5v@speedy.hunter>
 <20171114143941.3qgdlqn4xfarfhql@flea.lan>
 <20171114185315.gwyacchfct4zvyif@speedy.hunter>
 <CAMty3ZDQqaiZ0RxtngWdX9PCW2+tzXLVB64heHLjRBeVF2-FCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMty3ZDQqaiZ0RxtngWdX9PCW2+tzXLVB64heHLjRBeVF2-FCQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Maxime,

> >> > Do you plan to accept this patch as well ? Or you would prefer to wait
> >> > for the confirmation from Jagan as well ?
> >>
> >> I'm happy with the patch, but I was under the impression that the
> >> discussion had not settled yet. If it did, then yeah I'll merge it :)
> >
> > Both schematics and my tests on v1.0 board confirm that this fix is ok.
> > However we haven't yet got the ACK from Jagan, the original submitter
> > of this dts file. FWIW discussion was mostly about the problems with
> > his setup and not about the fix itself.
> >
> > Jagan,
> > did you have a chance to resolve the issues with your setup and verify
> > that boot from sd-card is fixed by this patch ?
> 
> Acked-by: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>

It looks like discussion has finally settled: here is ACK from Jagan.
Could you please take this patch.

Regards,
Sergey
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
