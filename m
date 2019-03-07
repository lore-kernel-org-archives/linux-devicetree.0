From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH 0/6] Allwinner H6 DMA support
Date: Thu,  7 Mar 2019 17:58:23 +0100
Message-ID: <20190307165829.9086-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBPM3QXSAKGQEQQTB2GQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org
List-Id: devicetree@vger.kernel.org

DMA engine on H6 is almost the same as on older SoCs. The biggest
difference is that it has slightly rearranged bits in registers and
it needs additional clock, probably due to iommu.

These patches were tested with I2S connected to HDMI. I2S needs
additional patches which will be sent later.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (6):
  dt-bindings: arm64: allwinner: h6: Add binding for DMA controller
  dmaengine: sun6i: Add a quirk for additional mbus clock
  dmaengine: sun6i: Add a quirk for setting DRQ fields
  dmaengine: sun6i: Add a quirk for setting mode fields
  dmaengine: sun6i: Add support for H6 DMA
  arm64: dts: allwinner: h6: Add DMA node

 .../devicetree/bindings/dma/sun6i-dma.txt     |   9 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  12 ++
 drivers/dma/sun6i-dma.c                       | 147 +++++++++++++-----
 3 files changed, 131 insertions(+), 37 deletions(-)

-- 
2.21.0
