From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH v7 6/7] drm: bridge/dw-hdmi: convert dw-hdmi to drm_bridge
 mode
Date: Tue, 11 Nov 2014 14:36:39 +0000
Message-ID: <54621EF7.4000300@imgtec.com>
References: <1415710229-11935-1-git-send-email-andy.yan@rock-chips.com>
 <1415710469-12213-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415710469-12213-1-git-send-email-andy.yan@rock-chips.com>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, ykk@rock-chips.com, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, Shawn Guo <shawn.guo@linaro.org>, jay.xu@rock-chips.com, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On 11/11/14 12:54, Andy Yan wrote:
> From: Yakir Yang <ykk@rock-chips.com>
> 
> keep the connector & birdge in dw_hdmi.c, handle encoder in dw_hdmi-imx.c

Is there a reason for this separation? Keeping encoder in platform files?
If yes, then the commit message should explain that.

> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> 
> ---
> 
> Changes in v7: None
> Changes in v6:
> - move some modification from patch#5
> 
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/gpu/drm/bridge/dw_hdmi.c      | 228 +++++++++++++++-------------------
>  drivers/staging/imx-drm/dw_hdmi-imx.c | 145 ++++++++++++++-------
>  include/drm/bridge/dw_hdmi.h          |  13 +-
>  3 files changed, 199 insertions(+), 187 deletions(-)


Regards
ZubairLK
