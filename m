From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/8] dt-bindings: display: add data-enable polarity
 property
Date: Wed, 26 Sep 2018 16:01:00 -0500
Message-ID: <20180926210100.GA31471@bogus>
References: <20180912183222.25414-1-stefan@agner.ch>
 <20180912183222.25414-6-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180912183222.25414-6-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linus.walleij@linaro.org, Laurent.pinchart@ideasonboard.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, p.zabel@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, architt@codeaurora.org, a.hajda@samsung.com, gustavo@padovan.org, maarten.lankhorst@linux.intel.com, sean@poorly.run, marcel.ziswiler@toradex.com, max.krummenacher@toradex.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

On Wed, 12 Sep 2018 11:32:19 -0700, Stefan Agner wrote:
> Allow to specify the data-enable polarity required by a dumb VGA
> DAC converting parallel RGB to VGA.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  .../devicetree/bindings/display/bridge/dumb-vga-dac.txt         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
