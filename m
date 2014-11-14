From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH v10 05/11] drm: bridge/dw_hdmi:split some phy configuration
 to platform driver
Date: Fri, 14 Nov 2014 10:19:40 +0000
Message-ID: <5465D73C.9030507@imgtec.com>
References: <1415934583-16290-1-git-send-email-andy.yan@rock-chips.com>
 <1415935631-16826-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415935631-16826-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andy Yan <andy.yan@rock-chips.com>, airlied@linux.ie, heiko@sntech.de, fabio.estevam@freescale.com, rmk+kernel@arm.linux.org.uk
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Andy,

Nice work on this patch series. Its getting better and better :).

On 14/11/14 03:27, Andy Yan wrote:
> hdmi phy clock symbol and transmission termination value
> can adjust platform specific to get the best SI

						^Is this signal integrity?

Are these two disjoint features in separate patches?

> 
> also add mode_valid interface for some platform may not support
> all the display mode

Sounds like another separate patch to me. :)

Also, This series is becoming quite large. With major changes and fixes mixed together.

Patch 3 splits imx-drm.
Patch 4 moves dw-drm out of imx-drm folder.
Patch 7 adds binding
Patch 9 converts to drm bridge.

Can these be placed together easily?
And in the start. i.e. patch 1, 2, 3, 4, 

Then all fixes etc can come afterwards?

It helps when checking histories later as to how a driver was made and how fixes happened.

Especially when file moves happen..

Cheers,
ZubairLK

> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v10:
> - split generic dw_hdmi.c improvements from patch#11 (add rk3288 support)
> 
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/gpu/drm/bridge/dw_hdmi.c      | 29 +++++++++++++++++++++++++++--
>  drivers/staging/imx-drm/dw_hdmi-imx.c | 10 +++++++++-
>  include/drm/bridge/dw_hdmi.h          |  7 +++++++
>  3 files changed, 43 insertions(+), 3 deletions(-)
> 
