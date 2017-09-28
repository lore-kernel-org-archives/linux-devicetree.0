From: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: [PATCH v4 00/11] dmaengine: sun6i: Fixes for H3/A83T,
 enable A64
Date: Thu, 28 Sep 2017 03:49:17 +0200
Message-ID: <3c78e966-2ece-4e67-94de-801aa569089f@rwthex-w2-a.rwth-ad.de>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRBN5KWHHAKGQE6ZPZ26Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Commit 3a03ea763a67 ("dmaengine: sun6i: Add support for Allwinner A83T
(sun8i) variant") and commit f008db8c00c1 ("dmaengine: sun6i: Add support f=
or
Allwinner H3 (sun8i) variant") added support for the A83T resp. H3, but mis=
sed
some differences between the original A31 and A83T/H3.

The first patch adds a callback to the controller config to set the clock
autogating register of different SoC generations, i.e. A31, A23+A83T, H3+la=
ter,
and uses it to for the correct clock autogating setting.

The second patch adds a callback for the burst length setting in the channe=
l
config register, which has different field offsets and new burst widths/len=
gths,
which differs between H3 and earlier generations

The third patch restructures some code required for the fourth patch and ad=
ds the
burst lengths to the controller config.

The fourth patch adds the burst widths to the config and adds the handling =
of the
H3 specific burst widths.

Patch 5 restructures the code to decouple some controller details (e.g. cha=
nnel
count) from the compatible string/the config.

Patches 6, 7 and 8 introduce and use the "dma-chans" property for the A64. =
Although
register compatible to the H3, the channel count differs and thus it requir=
es a
new compatible. To avoid introduction of new compatibles for each minor var=
iation,
anything but the register model is moved to devicetree properties. There
is at least one SoC (R40) which can then reuse the A64 compatible, the same
would have worked for A83T+V3s.

Patches 9 and 10 add the DMA controller node to the devicetree and add the =
DMA
controller reference to the SPI nodes.

Patch 11 fixes a small error in the devicetree binding example.

Changes in v4:
- Correct callback function signature, pass pointer to controller
- sun6i_dma_dev refers to sun6i_dma_config and vice versa, add forward decl=
aration
- Pass reference to config instead of config itself
- Fix config initialization
- remove range checks for dma-channels/dma-requests DT properties
- Split minor fix in devicetree example from patch 6/10

Changes in v3:
- Check for callback instead of using a no-op callback
- Drop leading 0 from unit name in DT example
- Omit default values from sun50i_a64_dma_cfg definition
- Drop leading 0 from dma controller unit name

Changes in v2:
- Use callback for autogating instead of variable for different SoC generat=
ions
- Use controller specific callback for burst length setting
- Store burst lengths in config instead of device structure
- Store burst widths in config
- Set default number of dma-request if not provided in config or devicetree

Stefan Br=C3=BCns (11):
  dmaengine: sun6i: Correct setting of clock autogating register for
    A83T/H3
  dmaengine: sun6i: Correct burst length field offsets for H3
  dmaengine: sun6i: Restructure code to allow extension for new SoCs
  dmaengine: sun6i: Enable additional burst lengths/widths on H3
  dmaengine: sun6i: Move number of pchans/vchans/request to device
    struct
  arm64: allwinner: a64: Add devicetree binding for DMA controller
  dmaengine: sun6i: Retrieve channel count/max request from devicetree
  dmaengine: sun6i: Add support for Allwinner A64 and compatibles
  arm64: allwinner: a64: Add device node for DMA controller
  arm64: allwinner: a64: add dma controller references to spi nodes
  arm: allwinner: Correct unit name in devicetree binding example

 .../devicetree/bindings/dma/sun6i-dma.txt          |  28 ++-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |  15 ++
 drivers/dma/sun6i-dma.c                            | 251 ++++++++++++++++-=
----
 3 files changed, 235 insertions(+), 59 deletions(-)

--=20
2.14.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
