From: Dmitry Torokhov <dtor@google.com>
Subject: Re: [PATCH v1 1/3] phy: phy-core: allow specifying supply at port
 level
Date: Wed, 25 Mar 2015 16:48:05 -0700
Message-ID: <20150325234805.GA19455@dtor-ws>
References: <1426886727-537-1-git-send-email-arun.ramamurthy@broadcom.com>
 <1426886727-537-2-git-send-email-arun.ramamurthy@broadcom.com>
 <55133294.4040705@ti.com>
 <CAE_wzQ_8YzZwizyozU-0MPLX8-hT1Y1LnfYFg+iEvQgYX7zjFg@mail.gmail.com>
 <5513391B.2060505@ti.com>
 <20150325224921.GB16950@dtor-ws>
 <55134847.3060304@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55134847.3060304@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Arun Ramamurthy <arun.ramamurthy@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Anatol Pomazau <anatol@google.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 26, 2015 at 05:14:07AM +0530, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Thursday 26 March 2015 04:19 AM, Dmitry Torokhov wrote:
> > On Thu, Mar 26, 2015 at 04:09:23AM +0530, Kishon Vijay Abraham I wrote:
> >> Hi,
> >>
> >> On Thursday 26 March 2015 03:47 AM, Dmitry Torokhov wrote:
> >>> On Wed, Mar 25, 2015 at 3:11 PM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
> >>>> Hi,
> >>>>
> >>>> On Saturday 21 March 2015 02:55 AM, Arun Ramamurthy wrote:
> >>>>> Multi-port phy's may have per-port power supplies. Let's change phy core
> >>>>> to first attempt to look up the supply at the port level, and then, if
> >>>>> not found, check parent device.
> >>>>
> >>>> Why not just have every port provide the power supply if it needs?
> >>>> I don't think checking for parent device should be present in the phy-core at
> >>>> all.
> >>>
> >>> We need to do that if we want to keep compatibility with the current
> >>> DTSes: before this patch the supply would be always looked up on
> >>> device and not port level.
> >>
> >> ah okay.
> >> so just using regulator_get_optional(&phy->dev, "phy"); should be sufficient
> > 
> > This is for regulators specified at port level (&phy->dev represents
> > port).
> > 
> >> right? Why do we need regulator_get_optional(phy->dev.parent, "phy");?
> >>
> > 
> > This is for compatibility with old multi-port bindings where supply is
> > specified at parent device level and phy_create() is called with dev and
> > node that is not NULL and not the same as dev->of_node. I have no idea
> > if such bindings exist in wild, but wanted to keep them working given
> > stated DT stability rules.
> 
> Such a binding doesn't exist. So let's keep only the
> regulator_get_optional(&phy->dev, "phy"); part. Only TI SoCs and recently
> sun9i started using phy-supply and none of them use multi-phy PHY provider.

OK, fair enough.

Thanks.

-- 
Dmitry
