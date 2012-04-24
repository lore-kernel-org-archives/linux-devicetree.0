From: Dong Aisheng <aisheng.dong@freescale.com>
Subject: Re: [PATCH 3/3] ARM: imx6q: switch to use pinctrl driver
Date: Tue, 24 Apr 2012 16:46:17 +0800
Message-ID: <20120424084616.GA24122@shlinux2.ap.freescale.net>
References: <1334333915-1174-1-git-send-email-b29396@freescale.com>
 <1334333915-1174-3-git-send-email-b29396@freescale.com>
 <20120414135331.GB3852@pengutronix.de>
 <CAA+hA=QhSUZg0bWTss_4ROwZ--OOQfcP=mpt+MP7-ZKPkEwXyA@mail.gmail.com>
 <20120415073751.GF24997@S2101-09.ap.freescale.net>
 <20120416033519.GA17173@shlinux2.ap.freescale.net>
 <CACRpkdZWNNz3+LbPtkV4rS4BJpqQdZio0qLkedLamSisgDkm6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZWNNz3+LbPtkV4rS4BJpqQdZio0qLkedLamSisgDkm6Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dong Aisheng <dongas86@gmail.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, Dong Aisheng-B29396 <B29396@freescale.com>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 24, 2012 at 04:23:34PM +0800, Linus Walleij wrote:
> On Mon, Apr 16, 2012 at 5:35 AM, Dong Aisheng
> <aisheng.dong@freescale.com> wrote:
> > On Sun, Apr 15, 2012 at 03:37:54PM +0800, Shawn Guo wrote:
> >> On Sun, Apr 15, 2012 at 12:03:16PM +0800, Dong Aisheng wrote:
> >> ...
> >> > For MX3 and MX5, before their pinctrl driver are available, user may
> >> > need to define a dummy in dt to avoid such an error.
> >> >
> >> That is insane, and will not work.
> >>
> >> 1) We do not have device tree support for MX3 yet.
> >> 2) It's not practical to add dummy entries in dt to avoid the error.
> >> 3) There are still so many non-dt board files support in the tree.
> >> How will they work with that?
> >>
> >> My suggestion is to not make it an error but a dev_dbg, assuming that
> >> the pins are already set up by platform code if we do not find the
> >> entry from pinctrl system. =A0We can take it as a transition solution,
> >> and turn the dev_dbg back to error when all the users of the device
> >> driver are converted to device tree.
> >>
> > My thinking is let pinctrl core handle dummy state as regulator subsyst=
em
> > and does not depend on dt.
> > Linus, Stephen, any comment?
> =

> I think this was discussed in another thread and Sascha agreed that
> wee need dummy pinctrl to copy with a smooth transition in i.MX.
> =

> So I'm happy with that, we just need to finalize a patch, poke
> me if I missed some patch...
> =

I'm revising that patch based on your suggestion,
will send out soon. :-)

Regards
Dong Aisheng
