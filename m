From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/4] drm/panel: simple: Add AUO G101EVN010 panel
 support
Date: Tue, 30 Oct 2018 18:05:19 -0500
Message-ID: <20181030230519.GA13247@bogus>
References: <1540480173-12009-1-git-send-email-alex.gonzalez@digi.com>
 <1540480173-12009-2-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1540480173-12009-2-git-send-email-alex.gonzalez@digi.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: thierry.reding@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alex.gonzalez@digi.com
List-Id: devicetree@vger.kernel.org

On Thu, 25 Oct 2018 17:09:30 +0200, Alex Gonzalez wrote:
> The change adds support for the AU Optronics G101EVN010 10.1" TFT LCD
> panel.
> 
> Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
> ---
>  .../bindings/display/panel/auo,g101evn010          | 12 ++++++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/auo,g101evn010
> 

Reviewed-by: Rob Herring <robh@kernel.org>
