From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 6/9] mtd: rawnand: ingenic: Separate top-level and
 SoC specific code
Date: Mon, 4 Mar 2019 20:04:25 +0100
Message-ID: <20190304200129.4eefabba@xps13>
References: <20190209192305.4434-1-paul@crapouillou.net>
        <20190209192305.4434-6-paul@crapouillou.net>
        <20190304112058.67cd5194@xps13>
        <1551723968.4932.4@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551723968.4932.4@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

Paul Cercueil <paul@crapouillou.net> wrote on Mon, 04 Mar 2019 19:26:08
+0100:

> On Mon, Mar 4, 2019 at 11:20 AM, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > Hi Paul,
> > 
> > Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>> > wrote on Sat,  9 Feb 2019 16:23:02
> > -0300:
> >   
> >>  The ingenic-nand driver uses an API provided by the jz4780-bch >> driver.
> >>  This makes it difficult to support other SoCs in the jz4780-bch >> driver.
> >>  To work around this, we separate the API functions from the >> SoC-specific
> >>  code, so that these API functions are SoC-agnostic.  
> >> >   
> > I like the idea, actually I am working on this separation (see
> > [1]) and I would really appreciate that you try to implement the
> > interface when it will be available (v2 is coming this week, I think > v3
> > will be the one to test when raw NAND devices will be properly
> > supported). I will add you in Cc: if you want to follow/review.
> > 
> > [1] > <http://lists.infradead.org/pipermail/linux-mtd/2019-February/087815.html
> >  
> 
> Do you think this will be ready for 5.2?

Maybe, but I can't tell for sure. It will depend on how invasive the
raw NAND conversion is. I don't want to delay your work but maybe once
the interface will be ready to be implemented it would be a great
opportunity to do it with the Ingenic driver.

> 
> You can add me in Cc:.

Thanks!
Miquèl
