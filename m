From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v7] reset: Add driver for gpio-controlled reset pins
Date: Thu, 30 May 2013 12:38:44 +0200
Message-ID: <20130530103843.GB24712@amd.pavel.ucw.cz>
References: <1369753575-9818-1-git-send-email-p.zabel@pengutronix.de>
 <51A68CF8.7000303@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <51A68CF8.7000303@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <fabio.estevam@freescale.com>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Len Brown <len.brown@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, Philipp Zabel <p.zabel@pengutronix.de>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawn.guo@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed 2013-05-29 17:19:20, Stephen Warren wrote:
> On 05/28/2013 09:06 AM, Philipp Zabel wrote:
> > This driver implements a reset controller device that toggle a gpio
> > connected to a reset pin of a peripheral IC. The delay between assertion
> > and de-assertion of the reset signal can be configured via device tree.
> 
> > diff --git a/drivers/reset/gpio-reset.c b/drivers/reset/gpio-reset.c
> 
> > +static void __gpio_reset_set(struct reset_controller_dev *rcdev, int asserted)
> 
> Nit: Technically I think __ is a reserved name-space, so you shouldn't
> prefix "user-level" (rather than libc/similar) symbols with it, but it's
> not a big deal.

Well.. this is kernel :-). We don't have libc around... and this
standard is normally ignored here. __ is normally used as a prefix for
"simpler" function.

								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
