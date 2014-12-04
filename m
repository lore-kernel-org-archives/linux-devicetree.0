From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v16 03/12] drm: imx: imx-hdmi: convert imx-hdmi to
 drm_bridge mode
Date: Thu, 4 Dec 2014 10:09:27 +0000
Message-ID: <20141204100927.GL11285@n2100.arm.linux.org.uk>
References: <1417620408-30354-1-git-send-email-andy.yan@rock-chips.com>
 <1417620566-30496-1-git-send-email-andy.yan@rock-chips.com>
 <20141203153847.GC11285@n2100.arm.linux.org.uk>
 <547F3495.9070206@rock-chips.com>
 <1417623615.5124.19.camel@pengutronix.de>
 <20141203163009.GG11285@n2100.arm.linux.org.uk>
 <1417682410.3744.1.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1417682410.3744.1.camel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Andy Yan <andy.yan@rock-chips.com>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.com, Lucas
List-Id: devicetree@vger.kernel.org

On Thu, Dec 04, 2014 at 09:40:10AM +0100, Philipp Zabel wrote:
> You are right, no I don't want this. When I initially wrote this patch I
> was under the impression that the memory allocated by devm_kzalloc in
> bind() wouldn't be freed on unbind().

Resources claimed inside bind() will be freed in unbind().  Resources
claimed in the driver's probe() will be freed in driver's remove().

They nest, and each is properly dealt with at the appropriate time due
to...

> I remember I stopped pursuing this
> patch when I got aware of the devres_open/close/remove_group dance in
> the component framework code, but somehow forgot to drop it altogether
> locally.

... the use of devres grouping.

So, if you use devm_kzalloc() in the driver's probe() function, then
that memory will be freed after the driver's remove() function is
called.  That's fine.

The point I was making is:

probe()
  mem = devm_kzalloc();
  mem->mmio = ...;
...
bind()
  mem->mmio is set
  other members of mem are zero
...
unbind()
...
bind()
  mem->mmio is set
  other members of mem are indeterminant
...
unbind()
...
remove()
  mem will be freed automatically

That's where the problem happens - the second time the bind() function
gets called: you might as well not use devm_k*z*alloc() initially,
because having the structure initialised to zero _could_ very well
hide bugs.

When you consider that it's not just the driver code which you have
to audit, but also any code the driver calls (eg, because you've embedded
some subsystem's struct in your driver private data) it quickly becomes
very easy for a bug to creep in here.

If we want to go down the route of having the probe function deal with
resources etc, then I would recommend against using devm_kzalloc() to
allocate the private structure: use devm_kmalloc() instead, which will
leave the memory uninitialised.  That means you get the same condition
on each bind(), which means you have to think more about how to ensure
that the initial state of members is dealt with throughout your driver.

Alternatively, separate the struct into two sections: one which contains
everything initialised by the probe() function, and everything else, and
arrange for everything else to get memset() on entry to bind().

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
