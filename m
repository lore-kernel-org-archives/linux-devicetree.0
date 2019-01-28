From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH 0/6] H6 Cedrus support
Date: Mon, 28 Jan 2019 21:54:58 +0100
Message-ID: <20190128205504.11225-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBMWYXXRAKGQE5COVV4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series adds basic support for H6 VPU. VPU itself has some new
features like 10-bit HEVC decoding, support for AFBC output format when
decoding HEVC and IOMMU. However, none of that is currently implemented.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (6):
  dt-bindings: media: cedrus: Add H6 compatible
  media: cedrus: Add a quirk for not setting DMA offset
  media: cedrus: Add support for H6
  dt-bindings: sram: sunxi: Add compatible for the H6 SRAM C1
  arm64: dts: allwinner: h6: Add support for the SRAM C1 section
  arm64: dts: allwinner: h6: Add Video Engine node

 .../devicetree/bindings/media/cedrus.txt      |  1 +
 .../devicetree/bindings/sram/sunxi-sram.txt   |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 25 +++++++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  9 +++++++
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  3 +++
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  3 ++-
 6 files changed, 41 insertions(+), 1 deletion(-)

-- 
2.20.1
