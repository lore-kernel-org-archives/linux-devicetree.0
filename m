From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: move rk3288-veryon display
 settings into a separate file
Date: Wed, 26 Jun 2019 15:56:24 -0700
Message-ID: <20190626225624.GC137143@google.com>
References: <20190625222629.154619-1-mka@chromium.org>
 <2418036.tTYI8lUvN5@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <2418036.tTYI8lUvN5@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, enric.balletbo@collabora.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 27, 2019 at 12:19:27AM +0200, Heiko Stuebner wrote:
> Hi Matthias,
> 
> Am Mittwoch, 26. Juni 2019, 00:26:28 CEST schrieb Matthias Kaehlcke:
> > The chromebook .dtsi file contains common settings for veyron
> > Chromebooks with eDP displays. Some veyron devices with a display
> > aren't Chromebooks (e.g. 'tiger' aka 'AOpen Chromebase Mini'), move
> > display related bits from the chromebook .dtsi into a separate file
> > to avoid redundant DT settings.
> > 
> > The new file is included from the chromebook .dtsi and can be
> > included by non-Chromebook devices with a display.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > This series is based on v5.3-armsoc/dts32 (f497ab6b4bb8 "ARM:
> > dts: rockchip: Configure BT_HOST_WAKE as wake-up signal on
> > veyron") plus the display timing patches from Doug:
> 
> the display-timing patches are still stuck on panel-review.
> 
> But while we wait for that to get resolved, you could also check if
> the veyron panels could use Enric's fanzy new automatic calculation
> of brightness-leves in the pwm-backlight driver, so that we possibly
> could get rid of the long table of levels.

We could get rid of the tables after "backlight: pwm_bl: Fix heuristic
to determine number of brightness levels"
(https://lore.kernel.org/patchwork/patch/1087809/) lands.

Ideally we would also have something like this series
https://lore.kernel.org/patchwork/project/lkml/list/?series=399607 ,
to provide userspace information about the brightness scale. Currently
Chrome OS would interpret Enric's table as being linear and adjust the
brightness slider incorrectly.
