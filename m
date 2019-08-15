From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] CP115 pinctrl support
Date: Thu, 15 Aug 2019 10:10:46 +0200
Message-ID: <CACRpkdY-AtaS67u4s58PifFtP5C7xp4P15J+hW_Dba=Gb4rhSQ@mail.gmail.com>
References: <20190805101607.29811-1-miquel.raynal@bootlin.com>
 <CACRpkdar5jE116CcywYxLR9JKWunRusJjNw7f3C0SFK4-4+dNQ@mail.gmail.com>
 <CACRpkdbEw5eCKb=nTCK4wuMsPEadEQdGx62cGRhk7F78p5X2CA@mail.gmail.com>
 <20190814143457.664b04c8@windsurf.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190814143457.664b04c8@windsurf.home>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Yan Markman <ymarkman@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Chulski <stefanc@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 14, 2019 at 2:35 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Wed, 14 Aug 2019 10:12:36 +0200
> Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > On Wed, Aug 7, 2019 at 2:47 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Mon, Aug 5, 2019 at 12:16 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >
> > > > This is the second batch of changes (out of three) to support the brand
> > > > new Marvell CN9130 SoCs which are made of one AP807 and one CP115.
> > > >
> > > > We add a new compatible (and the relevant support in the pinctrl
> > > > driver) before the addition in batch 3/3 of CN9130 SoCs DT using it.
> > >
> > > Waiting for review from the Mvebu maintainers.
> > >
> > > If it takes too long just nudge me, it looks good to me.
> >
> > So if the other MVEBU maintainers don't really look much at MVEBU
> > patches anymore while Miquel is working a lot on the platform,
> > what about listing Miquel as maintainer under the SoC entry, hm?
>
> Miquel sent his series on August 5, i.e 9 days ago. We're in August, in
> the middle of the summer vacations for many people. While it is nice to
> see subsystem maintainers who want to get code merged in a timely
> fashion, I think it is probably wise to give it some more time for
> review in this period of the year.

OK then maybe I am a bit impatient.

Yours,
Linus Walleij
