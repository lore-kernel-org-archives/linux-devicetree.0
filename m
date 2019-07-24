Return-Path: <SRS0=liIr=VV=mess.org=sean@kernel.org>
Date: Wed, 24 Jul 2019 06:39:37 +0100
From: Sean Young <sean@mess.org>
Subject: Re: [PATCH v5 04/13] media: rc: sunxi: Add RXSTA bits definition
Message-ID: <20190724053937.4ic5n35xtw2chjdy@gofer.mess.org>
References: <20190607231100.5894-1-peron.clem@gmail.com>
 <20190607231100.5894-5-peron.clem@gmail.com>
 <20190610095243.7xwp4xhauds22qzw@flea>
 <CAJiuCcfyjGTBbsjZQYj2p3KD6O-WaXhFe5NZrnKQwJYACmatUw@mail.gmail.com>
 <20190715121244.2vrsw6qa4fgp72fn@gofer.mess.org>
 <20190723062557.hnbi6hgrg4ecawkn@gofer.mess.org>
 <20190723070440.nfmhbrfykumxayjj@flea>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190723070440.nfmhbrfykumxayjj@flea>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 23, 2019 at 09:04:40AM +0200, Maxime Ripard wrote:
> Hi Sean,
> 
> On Tue, Jul 23, 2019 at 07:25:57AM +0100, Sean Young wrote:
> > On Mon, Jul 15, 2019 at 01:12:45PM +0100, Sean Young wrote:
> > > On Sun, Jul 14, 2019 at 04:32:22PM +0200, Cl�ment P�ron wrote:
> > > > Hi Sean,
> > > >
> > > > You acked the whole v3 series but this patch has been introduced in v5
> > > > could you ack this one too?
> > >
> > > Acked-by: Sean Young <sean@mess.org>
> >
> > So who's tree should this series go through? It seems mostly device tree.
> > Alternatively I'm happy to try it get merged via the media tree.
> 
> Ideally the media bits should go through the media tree, the DT bits
> will go through arm-soc
> 
> So you can apply the patches 1-4, 7 and 10, I'll apply the rest.
> 
> Does that work for you?

Works for me, I'll add them to my next pull request to Mauro.

Thanks,

Sean
