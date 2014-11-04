From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH 2/2] move imx-hdmi to bridge/dw-hdmi
Date: Tue, 4 Nov 2014 13:50:49 +0000
Message-ID: <5458D9B9.5030606@imgtec.com>
References: <1415108398-34376-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415108398-34376-1-git-send-email-andy.yan@rock-chips.com>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, ykk@rock-chips.com, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, Shawn Guo <shawn.guo@linaro.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi,

On 04/11/14 13:39, Andy Yan wrote:
> From: Andy yan <andy.yan@rock-chips.com>
> 
> the original imx hdmi driver is under staging/imx-drm,
> which depends on imx-drm, so move the imx hdmi drvier out
> to drm/bridge and rename imx-hdmi to dw-hdmi
> 
> Change-Id: I5f417372f256aa26cd00a3cd0160741680afd39d
> ---
>  drivers/gpu/drm/bridge/Kconfig        |    5 +
>  drivers/gpu/drm/bridge/Makefile       |    1 +
>  drivers/gpu/drm/bridge/dw_hdmi.c      | 1651 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/bridge/dw_hdmi.h      | 1032 +++++++++++++++++++++
>  drivers/staging/imx-drm/Kconfig       |    1 +
>  drivers/staging/imx-drm/Makefile      |    2 +-
>  drivers/staging/imx-drm/dw_hdmi-imx.c |   66 +-
>  drivers/staging/imx-drm/imx-hdmi.c    | 1651 ---------------------------------
>  drivers/staging/imx-drm/imx-hdmi.h    | 1032 ---------------------
>  include/drm/bridge/dw_hdmi.h          |   26 +-
>  10 files changed, 2737 insertions(+), 2730 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/dw_hdmi.c
>  create mode 100644 drivers/gpu/drm/bridge/dw_hdmi.h
>  delete mode 100644 drivers/staging/imx-drm/imx-hdmi.c
>  delete mode 100644 drivers/staging/imx-drm/imx-hdmi.h
> 


Could you try generating this patch with the -M option?

git format-patch should then understand its a rename.
Then it should generate a smaller patch that is possible to review easily.

Thanks
ZubairLK
