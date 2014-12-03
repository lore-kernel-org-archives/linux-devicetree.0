From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v16 03/12] drm: imx: imx-hdmi: convert imx-hdmi to
 drm_bridge mode
Date: Wed, 3 Dec 2014 16:30:10 +0000
Message-ID: <20141203163009.GG11285@n2100.arm.linux.org.uk>
References: <1417620408-30354-1-git-send-email-andy.yan@rock-chips.com>
 <1417620566-30496-1-git-send-email-andy.yan@rock-chips.com>
 <20141203153847.GC11285@n2100.arm.linux.org.uk>
 <547F3495.9070206@rock-chips.com>
 <1417623615.5124.19.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1417623615.5124.19.camel@pengutronix.de>
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

On Wed, Dec 03, 2014 at 05:20:15PM +0100, Philipp Zabel wrote:
> Hi Andy,
> 
> It would be better if the bind function would not have to care about
> platform resources, that should be handled in the probe function. I had
> a patch to move them:
> 
> http://lists.freedesktop.org/archives/dri-devel/2014-May/059630.html
> 
> Maybe you could incorporate something like this?

Personally, I hate this idea.  Having a two-layered setup means that
the when the bind() method is called, the state of struct imx_hdmi is
indeterminant.

If it's called immediately from probe, most of the structure will be
zeroed, and only those members initialised by the probe function will
be set to non-zero values.

However, if the HDMI interface has been previously bound, and is
subsequently re-bound, then the structure will most definitely no
longer be in a known state on the second bind() call.

This is fragile.

Now, people have tried to tell me that this isn't fragile, but, I now
have proof that it is as fragile as I fear.  The component helper
doesn't yet have that many users, and already we have one user (okay,
it's not part of the mainline kernel - it's etnaviv) which contained
exactly this kind of bug: it expected its private structures to be
zeroed on the bind() call.

So, I /really/ hate this idea.  If you really want to do this, then
please ensure that the bind() call explicitly zeros the bits of the
struct which aren't initialised by the probe() call, so we know that
the driver will always start off with a known initial state.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
