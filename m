From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: add Gru Scarlet devicetrees
Date: Wed, 7 Nov 2018 17:13:02 -0800
Message-ID: <CA+ASDXO_G9NhmNUh_DVdJ+2S8GsKmHPS4YQwe3H9_SW-a-q6+w@mail.gmail.com>
References: <20181101123639.15560-1-heiko@sntech.de>
 <20181101123639.15560-2-heiko@sntech.de> <55055985.ydjp5xQfPl@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <55055985.ydjp5xQfPl@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 6, 2018 at 3:31 AM Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
> Am Donnerstag, 1. November 2018, 13:36:39 CET schrieb Heiko Stuebner:
> > Gru-Scarlet is a tablet device using ChomeOS, dual-dsi display
> > and Wacom touchscreen with stylus.
> >
> > There exist two variants in the market using different displays
> > that are differentiated via their sku-id.
> > The bootloader on them also determines the correct devicetree to
> > load via the sku-id.
> >
> > So add a common scarlet dtsi and two minimal board devicetrees
> > for the two display variants.
> >
> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>
> looks like I already applied patch1 in time for 4.20
> (and forgot about it), but have now also applied this patch2
> for 4.21 with Rob's review.

Thanks, by the way! This worked well for me today, testing 4.20-rc1.
Well, except for this silly bit, but that bug has been around (and
more or less untested) for several releases:

https://lore.kernel.org/patchwork/patch/1008074/
[PATCH] input: cros_ec_keyb: fix button/switch capability reports

And this silly one that slipped into this merge window:

https://lore.kernel.org/patchwork/patch/1008098/
[PATCH 4.20] ath10k: don't assume 'vif' is non-NULL in flush()

*Grumble*: one would think people would test their changes before
submitting them, but apparently that's too much to ask.
