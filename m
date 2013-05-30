From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v7] reset: Add driver for gpio-controlled reset pins
Date: Thu, 30 May 2013 15:16:21 +0200
Message-ID: <201305301516.22111.arnd@arndb.de>
References: <1369753575-9818-1-git-send-email-p.zabel@pengutronix.de>
 <51A68CF8.7000303@wwwdotorg.org> <20130530103843.GB24712@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130530103843.GB24712-tWAi6jLit6GreWDznjuHag@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Len Brown <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 30 May 2013, Pavel Machek wrote:
> On Wed 2013-05-29 17:19:20, Stephen Warren wrote:
> > On 05/28/2013 09:06 AM, Philipp Zabel wrote:
> > > This driver implements a reset controller device that toggle a gpio
> > > connected to a reset pin of a peripheral IC. The delay between assertion
> > > and de-assertion of the reset signal can be configured via device tree.
> > 
> > > diff --git a/drivers/reset/gpio-reset.c b/drivers/reset/gpio-reset.c
> > 
> > > +static void __gpio_reset_set(struct reset_controller_dev *rcdev, int asserted)
> > 
> > Nit: Technically I think __ is a reserved name-space, so you shouldn't
> > prefix "user-level" (rather than libc/similar) symbols with it, but it's
> > not a big deal.
> 
> Well.. this is kernel :-). We don't have libc around... and this
> standard is normally ignored here. __ is normally used as a prefix for
> "simpler" function.

We're not really consistent in the kernel, but I agree the most common
use is where you have a wrapper calling the __foo function and normal
drivers are supposed to call foo instead. My reading is usually that
by calling __foo, the caller says "I know exactly what I'm doing so
I can optimize this".

	Arnd
