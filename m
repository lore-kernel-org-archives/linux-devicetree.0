From: "Philip, Avinash" <avinashphilip@ti.com>
Subject: RE: [PATCH] pwm_backlight: Add device tree support for Low
 Threshold Brightness
Date: Fri, 21 Sep 2012 04:51:19 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E9A676E@DBDE01.ent.ti.com>
References: <1343219042-4371-1-git-send-email-avinashphilip@ti.com>
 <20120730065805.GB15245@avionic-0098.mockup.avionic-design.de>
 <518397C60809E147AF5323E0420B992E3E97C4C9@DBDE01.ent.ti.com>
 <20120919064425.GA1506@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120919064425.GA1506@avionic-0098.mockup.avionic-design.de>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Nori, Sekhar" <nsekhar@ti.com>, "Hebbar, Gururaja" <gururaja.hebbar@ti.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 19, 2012 at 12:14:25, Thierry Reding wrote:
> On Wed, Aug 01, 2012 at 06:51:21AM +0000, Philip, Avinash wrote:
> > On Mon, Jul 30, 2012 at 12:28:05, Thierry Reding wrote:
> > > On Wed, Jul 25, 2012 at 05:54:02PM +0530, Philip, Avinash wrote:
> > > > Low Threshold Brightness should be configured to have a linear relation
> > > > in brightness scale. This patch adds device tree support for low
> > > > threshold brightness as optional one for pwm_backlight.
> > > 
> > > I think this should be more explicit as to why this is required, perhaps
> > > something like this:
> > > 
> > > 	Some backlights perform poorly when driven by a PWM with a short
> > > 	duty-cycle. For such devices, the low threshold can be used to
> > > 	specify a lower bound for the duty-cycle and should be chosen to
> > > 	exclude the problematic range.
> > > 
> > > 	This patch adds support for an optional low-threshold-brightness
> > > 	property.
[snip]
> 
> I think you never sent an updated patch or maybe I missed it. But I
> noticed that this patch has now ended up in Andrew's tree without the
> comments being addressed. Can you please follow up?

I will send a revised patch.

Thanks
Avinash

