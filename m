From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 08/13] ARM: dts: rv1108: Fix the PMU interrupt number
Date: Mon, 26 Nov 2018 14:46:22 +0100
Message-ID: <6269571.AAM3N1jVdY@phil>
References: <20181125211907.9895-1-otavio@ossystems.com.br> <3361921.c4PKPBIJKP@phil> <CAP9ODKrX__KXo-XEdoaL=qwALFAxyzKV4-xu_t5baMqN1kQH4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP9ODKrX__KXo-XEdoaL=qwALFAxyzKV4-xu_t5baMqN1kQH4g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fabio Berton <fabio.berton@ossystems.com.br>, Kernel development list <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Montag, 26. November 2018, 14:36:01 CET schrieb Otavio Salvador:
> Hello Heiko,
> 
> On Mon, Nov 26, 2018 at 3:59 AM Heiko Stuebner <heiko@sntech.de> wrote:
> > Am Sonntag, 25. November 2018, 22:19:02 CET schrieb Otavio Salvador:
> > > According to the Rockchip vendor tree the PMU interrupt number is
> > > 76, so fix it accordingly.
> > >
> > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> >
> > looks ok, especially as the TRM I have doesn't list neither irqs :-)
> > But please explain the second Signed-off by Fabio?
> >
> > If Fabio is the original author, the patch From should reflect that
> > and the Signed-off-by lines should be swapped. As it is now
> > I would expect Fabio being the one sending the patches.
> > Or is it supposed to be a "Co-developed-by:"?
> > See Documentation/process/5.Posting.rst.
> 
> He works with me and he applied and tested it in our internal tree for
> our customer. He reviewed and tested this with me, so I'd like to
> provide him credit as well.

Reviewed-by:
Tested-by:

perhaps then? :-)


Heiko
