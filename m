From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 3/3] ARM: imx6q: switch to use pinctrl driver
Date: Fri, 20 Apr 2012 03:08:45 +0200
Message-ID: <20120420010845.GV16641@game.jcrosoft.org>
References: <1334333915-1174-1-git-send-email-b29396@freescale.com>
 <1334333915-1174-3-git-send-email-b29396@freescale.com>
 <20120414135331.GB3852@pengutronix.de>
 <CAA+hA=QhSUZg0bWTss_4ROwZ--OOQfcP=mpt+MP7-ZKPkEwXyA@mail.gmail.com>
 <20120415073751.GF24997@S2101-09.ap.freescale.net>
 <20120416033519.GA17173@shlinux2.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20120416033519.GA17173@shlinux2.ap.freescale.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <aisheng.dong@freescale.com>
Cc: Dong Aisheng <dongas86@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com
List-Id: devicetree@vger.kernel.org

On 11:35 Mon 16 Apr     , Dong Aisheng wrote:
> On Sun, Apr 15, 2012 at 03:37:54PM +0800, Shawn Guo wrote:
> > On Sun, Apr 15, 2012 at 12:03:16PM +0800, Dong Aisheng wrote:
> > ...
> > > For MX3 and MX5, before their pinctrl driver are available, user may
> > > need to define a dummy in dt to avoid such an error.
> > > 
> > That is insane, and will not work.
> > 
> > 1) We do not have device tree support for MX3 yet.
> > 2) It's not practical to add dummy entries in dt to avoid the error.
> > 3) There are still so many non-dt board files support in the tree.
> > How will they work with that?
> > 
> > My suggestion is to not make it an error but a dev_dbg, assuming that
> > the pins are already set up by platform code if we do not find the
> > entry from pinctrl system.  We can take it as a transition solution,
> > and turn the dev_dbg back to error when all the users of the device
> > driver are converted to device tree.
> > 
> My thinking is let pinctrl core handle dummy state as regulator subsystem
> and does not depend on dt.
> Linus, Stephen, any comment?
agreed with Shawn

this is insane if you can an error you do need to report it

I get the same issue on at91 and I'm going to make the pinctrl mandatory for DT
only

Best Regards,
J.
