From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 05/11] drm/bridge: analogix-anx78xx: correct value of TX_P0
Date: Thu, 15 Aug 2019 10:24:05 +0200
Message-ID: <CACRpkdbZ09+pS+AchWLcxyA9MHgQ2ytL2qN77V3_gKmtw9yFog@mail.gmail.com>
References: <20190815004854.19860-1-masneyb@onstation.org> <20190815004854.19860-6-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190815004854.19860-6-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>M
List-Id: devicetree@vger.kernel.org

On Thu, Aug 15, 2019 at 2:49 AM Brian Masney <masneyb@onstation.org> wrote:

> When attempting to configure this driver on a Nexus 5 phone (msm8974),
> setting up the dummy i2c bus for TX_P0 would fail due to an -EBUSY
> error. The downstream MSM kernel sources [1] shows that the proper value
> for TX_P0 is 0x78, not 0x70, so correct the value to allow device
> probing to succeed.
>
> [1] https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/drivers/video/slimport/slimport_tx_reg.h
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
