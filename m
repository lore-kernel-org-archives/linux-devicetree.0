From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 2/2] memory: atmel-ebi: add DT bindings documentation
Date: Thu, 28 Apr 2016 15:17:58 +0200
Message-ID: <20160428151758.7fe54037@bbrezillon>
References: <1461767754-12189-1-git-send-email-boris.brezillon@free-electrons.com>
	<1461767754-12189-3-git-send-email-boris.brezillon@free-electrons.com>
	<CACh+v5OO+UQ_EiWVyewdMHnMB-p3nd6N=R5P7K4V_4=ymy-YuQ@mail.gmail.com>
	<20160428104925.7eb12ca2@bbrezillon>
	<CACh+v5Mi2Qd58SZkwW0mZ3ZJx3Rv3mwSkRqzgHwBTxpUbwjVFQ@mail.gmail.com>
	<20160428144607.191a29f2@bbrezillon>
	<CACh+v5ObRAf=7D3tbQdAzef+QRVObF_9eHJEreXwxVyrV8THcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACh+v5ObRAf=7D3tbQdAzef+QRVObF_9eHJEreXwxVyrV8THcA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 28 Apr 2016 14:54:39 +0200
Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org> wrote:

> 2016-04-28 14:46 GMT+02:00 Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > On Thu, 28 Apr 2016 14:18:25 +0200
> > Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org> wrote:  
> >> >> > +
> >> >> > +- atmel,ncs-rd-setup-ns
> >> >> > +- atmel,nrd-setup-ns
> >> >> > +- atmel,ncs-wr-setup-ns
> >> >> > +- atmel,nwe-setup-ns
> >> >> > +- atmel,ncs-rd-pulse-ns
> >> >> > +- atmel,nrd-pulse-ns
> >> >> > +- atmel,ncs-wr-pulse-ns
> >> >> > +- atmel,nwe-pulse-ns
> >> >> > +- atmel,nwe-cycle-ns
> >> >> > +- atmel,nrd-cycle-ns
> >> >> > +- atmel,tdf-ns  
> >> >>
> >> >> One thought about the configuration in 'ns' unit: Some devices may
> >> >> have requirements expressed in clock cycles (I'm thinking of FPGA
> >> >> here). At  a fixed frequency one can always convert manually from 'ns'
> >> >> to 'clocks' but it's a bit tedious and prone to rounding errors. And
> >> >> It 'll  break when the EBI frequency is changed  
> >> >
> >> > If you don't mind, I'd like to first get this version accepted, and
> >> > we'll extend it with timings expressed in clock cycles afterward.
> >> >
> >> > BTW, could you describe a real use case where timings should be
> >> > expressed in clock cycles? I mean, usually the devices have some timing
> >> > constraints (tXX_min = Y ns), and I don't see why it would differ for
> >> > FPGA interfaces, but I'm clearly not an FPGA expert.  
> >>
> >> I'm not either, I only toyed with FPGA. That's just what experienced
> >> FPGA designer told me.
> >> I guess that it boils down to: FPGA are more suited for a synchronous
> >> design than an asynchronous one.  
> >
> > The thing is, all the timings are based on the master clock, and,
> > AFAICS, this clk signal is not exposed, so you're basing your clk-cycle  
> while EBI itself is asynchronous, the clk can be exposed through one
> of the PCK. I've seen this in real projects.

Okay, then it makes sense. But if you need such a complex thing it
would probably be better to create a new driver and let this driver
adapt the timings dynamically (I plan to expose an few fonctions for
the NAND controller, so it would be possible to create an FPGA driver
referencing the PCK clk and adapting the EBI timings).

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
