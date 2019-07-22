From: Neal Liu <neal.liu@mediatek.com>
Subject: Re: [PATCH v4 0/3] MediaTek Security random number generator support
Date: Mon, 22 Jul 2019 17:50:42 +0800
Message-ID: <1563789042.14676.3.camel@mtkswgap22>
References: <1561361052-13072-1-git-send-email-neal.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1561361052-13072-1-git-send-email-neal.liu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matt Mackall <mpm@selenic.com>, Rob Herring <robh+dt@kernel.org>, Herbert
 Xu <herbert@gondor.apana.org.au>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, wsd_upstream <wsd_upstream@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Crystal Guo =?UTF-8?Q?=28=E9=83=AD=E6=99=B6=29?= <Crystal.Guo@mediatek.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Neal Liu <neal.liu@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Dear Matthias, Rob, Mark,
	Just gentle ping.
	Thanks


On Mon, 2019-06-24 at 15:24 +0800, Neal Liu wrote:
> These patch series introduce a generic rng driver for Trustzone
> based kernel driver which would like to communicate with ATF
> SIP services.
> 
> Patch #1 initials SMC fid table for Mediatek SIP interfaces and
> adds HWRNG related SMC call.
> 
> Patch #2..3 adds mtk-sec-rng kernel driver for Trustzone based SoCs.
> For MediaTek SoCs on ARMv8 with TrustZone enabled, peripherals like
> entropy sources is not accessible from normal world (linux) and
> rather accessible from secure world (ATF/TEE) only. This driver aims
> to provide a generic interface to ATF rng service.
> 
> 
> changes since v1:
> - rename mt67xx-rng to mtk-sec-rng since all MediaTek ARMv8 SoCs
> can reuse this driver.
> - refine coding style and unnecessary check.
> 
> changes since v2:
> - remove unused comments.
> - remove redundant variable.
> 
> changes since v3:
> - add dt-bindings for MediaTek rng with TrustZone enabled
> - revise HWRNG SMC call fid
> 
> 
> Neal Liu (3):
>   soc: mediatek: add SMC fid table for SIP interface
>   dt-bindings: rng: add bindings for MediaTek ARMv8 SoCs
>   hwrng: add mtk-sec-rng driver
> 
>  .../devicetree/bindings/rng/mtk-sec-rng.txt   | 10 ++
>  drivers/char/hw_random/Kconfig                | 16 +++
>  drivers/char/hw_random/Makefile               |  1 +
>  drivers/char/hw_random/mtk-sec-rng.c          | 97 +++++++++++++++++++
>  include/linux/soc/mediatek/mtk_sip_svc.h      | 33 +++++++
>  5 files changed, 157 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/mtk-sec-rng.txt
>  create mode 100644 drivers/char/hw_random/mtk-sec-rng.c
>  create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h
> 
