From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/8] drm/bridge: add bus flag support
Date: Fri, 14 Sep 2018 11:07:03 +0200
Message-ID: <CACRpkdZdxLMkECq8BBJHDqKszHPMt2uUPFbwbPVNKXyxu-SWGQ@mail.gmail.com>
References: <20180912183222.25414-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180912183222.25414-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Dave Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, sean@poorly.run, Marcel Ziswiler <marcel.ziswiler@toradex.com>, max.krummenacher@toradex.com, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, open list:OPEN FIRMWARE AND FLATTENED DEVICE TR
List-Id: devicetree@vger.kernel.org

On Wed, Sep 12, 2018 at 8:32 PM Stefan Agner <stefan@agner.ch> wrote:

> @Linus Walleij, Laurent Pinchart: Since you have been involved in
> the initial bus timings discussion, I would like to have your Ack
> on at least patch 2/3... If we want to keep the setup/hold timings,
> the patchset should also work without those two patches.

AFAICT this ends up with the PL111 code identical to what I
proposed in my first patch set to support the latching properly,
so I am pretty much happy as long as my hardware does not
flicker. (Rough consensus and running code.) I'm not very invested
in either idea to represent these timings, so
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
