From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v8] reset: Add driver for gpio-controlled reset pins
Date: Fri, 26 Jul 2013 12:26:37 +0200
Message-ID: <1374834397.4013.15.camel@pizza.hi.pengutronix.de>
References: <1369904940-716-1-git-send-email-p.zabel@pengutronix.de>
 <20130716015038.GD28375@S2101-09.ap.freescale.net>
 <51E4BF98.8030604@wwwdotorg.org>
 <20130716041056.GA30067@S2101-09.ap.freescale.net>
 <51E56AA7.7020103@wwwdotorg.org>
 <20130717030246.GA4541@S2101-09.ap.freescale.net>
 <51E6CCE4.20705@wwwdotorg.org> <20130717213836.GA13324@amd.pavel.ucw.cz>
 <51E719A6.6070105@wwwdotorg.org> <20130718112555.GB1021@amd.pavel.ucw.cz>
 <CAOesGMgi0j_mPyeBLVHb_QW+DwtAPoFY697eQO3-yp9tnP1vmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOesGMgi0j_mPyeBLVHb_QW+DwtAPoFY697eQO3-yp9tnP1vmA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <fabio.estevam@freescale.com>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Len Brown <len.brown@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Pavel Machek <pavel@denx.de>, Sascha Hauer <s.hauer@pengutronix.de>, Grant Likely <grant.likely@secretlab.ca>, "Rafael J.
 Wysocki" <rjw@sisk.pl>, Shawn Guo <shawn.guo@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 18.07.2013, 11:45 -0700 schrieb Olof Johansson:
> Hi,
> 
> On Thu, Jul 18, 2013 at 4:25 AM, Pavel Machek <pavel@denx.de> wrote:
> 
> > It sound to me like keeping ammount of -EPROBE_DEFER to minimum is
> > still preferred.
> 
> Hand-crafting initcall level ordering of various drivers and subsystem
> is probably an even greater evil though. We've done it in the past,
> but now that we have deferred probe we have the option of not having
> to do it every time, such as this.
> 
> You're spending an awful lot of energy arguing over this, but nobody
> has actually shown data of how much deferral is happening -- and that
> it's a real problem. Until someone does so there's no reason to change
> it from the default module init level at all, I'd say.

Alright, I've backed out the arch_initcall change and resent the patch.
If you are fine with that, I'll send you a pull request for this and the
"reset: allow drivers to request probe deferral" patch.

regards
Philipp
