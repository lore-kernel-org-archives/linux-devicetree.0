From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
Date: Fri, 24 Feb 2017 10:28:41 +0100
Message-ID: <20170224092841.umpec3dsoabfoxwm@piout.net>
References: <20170221112641.6276c001@bbrezillon>
 <CAHp75Vcb9gtzF7LvH74JwL4dTUyQvKmg=dnTXKfjhVHuyK3WXg@mail.gmail.com>
 <20170221112720.ynehsryprhrhzjla@piout.net>
 <CAHp75VcKjYYAw8gw8yYXrd-vzZo50WOQ06AzPx+0g9Zakzjm-w@mail.gmail.com>
 <20170221162133.jch6yzpotj4s7zob@piout.net>
 <CAHp75VeB4eVuN5NMfAfQUtssuHezTyAM8FUswuR8FheUk1V-oA@mail.gmail.com>
 <CAHp75Vc54+GR99qM8vUDfQnehFx0g5q137k-w5XY3023UZyr5w@mail.gmail.com>
 <20170221171438.e5hvruoixafpcdps@piout.net>
 <CACiLriSdRM4ZfoDsxFhf6ZVwAtacJOJ28M8CvOg6kC_XN0T-Mw@mail.gmail.com>
 <20170224081430.GB19663@samfundet.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170224081430.GB19663-BrfabpQBY5qlHtIdYg32fQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans-Christian Noren Egtvedt <egtvedt-BrfabpQBY5qlHtIdYg32fQ@public.gmane.org>
Cc: =?iso-8859-1?Q?H=E5vard?= Skinnemoen <hskinnemoen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, "open list:MEMORY TECHNOLOGY..." <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland@arm.c>
List-Id: devicetree@vger.kernel.org

On 24/02/2017 at 09:14:30 +0100, Hans-Christian Noren Egtvedt wrote:
> Around Thu 23 Feb 2017 21:18:13 -0800 or thereabout, Håvard Skinnemoen wrote:
> > On Tue, Feb 21, 2017 at 9:14 AM, Alexandre Belloni
> > <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >> On 21/02/2017 at 18:43:35 +0200, Andy Shevchenko wrote:
> 
> <snipp>
> 
> >> A few weeks ago, I was telling Boris to let it not build for a while and
> >> then remove it. You already went out of your way to make it work. Again,
> >> feel free to send a patch removing avr32. I can only see a lot of
> >> benefits for the Atmel ARM SoCs and the many cleanups that will follow.
> > 
> > Agree, I can't help but feel that the AVR32 support is doing more harm
> > than good at this point.
> 
> I also agree on this, I can relate to Nicolas (and Atmel friends) having to
> always think about the less-maintained AVR32 parts when improving drivers.
> 
> >> If nobody complains about the 4.10 breakage, You'll have plenty of time
> >> to remove it for 4.12
> > 
> > I'm fine with that, but I haven't put much effort into keeping it
> > alive lately. If Hans-Christian agrees, I'm willing to post a patch to
> > remove it, or ack someone else's patch.
> 
> Then lets plan this for 4.12, either you Håvard whip up a patch or I can
> eventually do it.
> 
> I can push it through the linux-avr32 git tree on kernel.org.
> 

I think think it is fair to have one of you two prepare the patch. It is
definitively a sad decision :( but it will help us immensely! Thank you!

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
