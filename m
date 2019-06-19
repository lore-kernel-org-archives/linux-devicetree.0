From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: Add support for Raydium RM67191 panel driver
Date: Wed, 19 Jun 2019 10:28:05 -0300
Message-ID: <CAOMZO5C_4QxioSx4JEAV+1dDxYJgdTCzmBLZyUCB4dWeRqLFng@mail.gmail.com>
References: <1560864646-1468-1-git-send-email-robert.chiras@nxp.com> <1560864646-1468-3-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560864646-1468-3-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Chiras <robert.chiras@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Robert,

On Tue, Jun 18, 2019 at 10:31 AM Robert Chiras <robert.chiras@nxp.com> wrote:

> +static const struct display_timing rad_default_timing = {
> +       .pixelclock = { 66000000, 132000000, 132000000 },
> +       .hactive = { 1080, 1080, 1080 },
> +       .hfront_porch = { 20, 20, 20 },
> +       .hsync_len = { 2, 2, 2 },
> +       .hback_porch = { 34, 34, 34 },
> +       .vactive = { 1920, 1920, 1920 },
> +       .vfront_porch = { 10, 10, 10 },
> +       .vsync_len = { 2, 2, 2 },
> +       .vback_porch = { 4, 4, 4 },

Are you sure that the sync_len and porch parameters are the same for
both 66MHz and 132MHz?
