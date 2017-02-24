From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
Date: Fri, 24 Feb 2017 09:55:09 +0100
Message-ID: <20170224095509.777da771@bbrezillon>
References: <CAHp75Vcb9gtzF7LvH74JwL4dTUyQvKmg=dnTXKfjhVHuyK3WXg@mail.gmail.com>
        <20170221112720.ynehsryprhrhzjla@piout.net>
        <CAHp75VcKjYYAw8gw8yYXrd-vzZo50WOQ06AzPx+0g9Zakzjm-w@mail.gmail.com>
        <20170221162133.jch6yzpotj4s7zob@piout.net>
        <CAHp75VeB4eVuN5NMfAfQUtssuHezTyAM8FUswuR8FheUk1V-oA@mail.gmail.com>
        <CAHp75Vc54+GR99qM8vUDfQnehFx0g5q137k-w5XY3023UZyr5w@mail.gmail.com>
        <20170221171438.e5hvruoixafpcdps@piout.net>
        <CACiLriSdRM4ZfoDsxFhf6ZVwAtacJOJ28M8CvOg6kC_XN0T-Mw@mail.gmail.com>
        <20170224081430.GB19663@samfundet.no>
        <20170224092742.3ce205e2@bbrezillon>
        <20170224085209.GA27812@samfundet.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170224085209.GA27812-BrfabpQBY5qlHtIdYg32fQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans-Christian Noren Egtvedt <egtvedt-BrfabpQBY5qlHtIdYg32fQ@public.gmane.org>
Cc: =?UTF-8?B?SMOldmFyZA==?= Skinnemoen <hskinnemoen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, "open list:MEMORY TECHNOLOGY..." <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland@ar>
List-Id: devicetree@vger.kernel.org

On Fri, 24 Feb 2017 09:52:09 +0100
Hans-Christian Noren Egtvedt <egtvedt-BrfabpQBY5qlHtIdYg32fQ@public.gmane.org> wrote:

> Around Fri 24 Feb 2017 09:27:42 +0100 or thereabout, Boris Brezillon wrote:
> > On Fri, 24 Feb 2017 09:14:30 +0100 Hans-Christian Noren Egtvedt <egtvedt-BrfabpQBY5qlHtIdYg32fQ@public.gmane.org> wrote:  
> >> Around Thu 23 Feb 2017 21:18:13 -0800 or thereabout, Håvard Skinnemoen wrote:  
> >> > On Tue, Feb 21, 2017 at 9:14 AM, Alexandre Belloni
> >> > <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:    
> >> >> On 21/02/2017 at 18:43:35 +0200, Andy Shevchenko wrote:    
> 
> <snipp>
> 
> >> >> If nobody complains about the 4.10 breakage, You'll have plenty of time
> >> >> to remove it for 4.12    
> >> > 
> >> > I'm fine with that, but I haven't put much effort into keeping it
> >> > alive lately. If Hans-Christian agrees, I'm willing to post a patch to
> >> > remove it, or ack someone else's patch.    
> >> 
> >> Then lets plan this for 4.12, either you Håvard whip up a patch or I can
> >> eventually do it.
> >> 
> >> I can push it through the linux-avr32 git tree on kernel.org.
> >>   
> > 
> > Can you do that just after 4.11-rc1 is released and provide a topic
> > branch I can pull in my nand/next branch, so that I can rework this
> > patch and drop all the pdata-compat code (as suggested by Andy).  
> 
> OK, I will try to prepare it during the weekend.
> 
> Any reason to wait for 4.11-rc1? AFAIK Linus prefers the larger changes
> before he starts tagging rc's.
> 

Oh, so you want to queue it for 4.11, that's even better.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
