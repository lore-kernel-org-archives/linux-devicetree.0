From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v6 00/8] Renesas RZ/A1 pin and gpio controller
Date: Mon, 26 Jun 2017 19:42:40 +0200
Message-ID: <20170626174239.GF26156@verge.net.au>
References: <1498143276-7976-1-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdWWSD8BD3xqd+OnWGzmEQO39d8Fg8zWXEP3j=te3axZ8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWWSD8BD3xqd+OnWGzmEQO39d8Fg8zWXEP3j=te3axZ8Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Dong Aisheng <aisheng.dong@nxp.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 26, 2017 at 10:45:22AM +0200, Geert Uytterhoeven wrote:
> Hi Linus,
> 
> On Thu, Jun 22, 2017 at 4:54 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> >    this is 6th round of RZ/A1 pin controller patch series.
> >
> > Where did we stop: discussion from pin controller driver shifted toward two
> > new generic pin configuration properties I added to the previous series
> > (bi-directional and output-enable).
> >
> > After a really long discussion, we decided to go for handling internally all
> > bi-directional use cases, making the generic property not a requirement for the
> > series. Interestingly, we recently found out the number of pins actually
> > requiring this flag is less (~half) than what reported by the processor manual,
> > so we could have handled these internally from day one :(
> >
> > We also now manage internally pins requiring IO direction specified in software
> > even when configured in alternate function mode (SWIO mode). Most of them are
> > handled by the driver, some of them have to come from DTS as the user can freely
> > select if they have to be inputs or outputs. For those pins, and after another
> > discussion involving NXP developers, we decided to use input-enable and
> > output-enable properties. I have just sent a patch to add output-enable to the
> > generic pin configuration properties, but it is currently under discussion.
> >
> > However, none of the pins currently configured by mainline DTS require those
> > properties to be specified, so I have dropped in this driver any dependency on
> > output-enable property, and I'm using instead the already in place
> > PIN_CONFIG_OUTPUT one. Once output-enable will eventually be accepted, we can
> > update the driver to make use of it, but since there are no use cases for that
> > at the moment, it makes not too much sense holding this series back for that.
> >
> > The total memory occupation we were so worried about of bi-directional and swio
> > pin tables is now around 100 bytes, because of how the number of pins actually
> > needing those flags has  reduced and because of how we have arranged the
> > tables using bitfield structures (credits to Geert here).
> >
> > Having cleared out dependencies on new pin configuration properties and having
> > made configuration flags a driver specific issue, I hope this version can be
> > accepted and land in forthcoming pull request for Renesas PFC updates from
> > Geert, pending some feedback from the linux-gpio community.
> 
> If this is OK for you, I'd like to include the first 3 patches (plus a small
> fix I received offline from Chris Brandt[*]) in my final pull request of
> sh-pfc for v4.13 (which I have been postponing in anticipation of this driver).
> 
> After v4.13-rc1, Simon can queue up the DTS patches in his tree for v4.14.

Fine by me.

I have marked the dts patches as Deferred.
Jacopo, please repost or ping me once the driver changes have shown
up in an rc release - v4.13-rc1 sounds likely.
