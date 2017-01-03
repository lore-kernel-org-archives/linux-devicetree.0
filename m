From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/9] arm64: dts: ls1046a: add MSI dts node
Date: Tue, 3 Jan 2017 11:12:58 -0600
Message-ID: <20170103171258.h5djzsarokjjldjx@rob-hp-laptop>
References: <1482829985-24421-1-git-send-email-Minghuan.Lian@nxp.com>
 <1482829985-24421-6-git-send-email-Minghuan.Lian@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1482829985-24421-6-git-send-email-Minghuan.Lian@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Minghuan Lian <Minghuan.Lian@nxp.com>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Roy Zang <roy.zang@nxp.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, Stuart Yoder <stuart.yoder@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Scott Wood <scott.wood@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 27, 2016 at 05:13:02PM +0800, Minghuan Lian wrote:
> LS1046a includes 3 MSI controllers.
> Each controller supports 128 interrupts.
> 
> Signed-off-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> ---
>  .../interrupt-controller/fsl,ls-scfg-msi.txt       |  1 +
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     | 31 ++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt
> index 2755cd1..54597b0 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt
> @@ -6,6 +6,7 @@ Required properties:
>  	      Layerscape PCIe MSI controller block such as:
>                "fsl,ls1021a-msi"
>                "fsl,ls1043a-msi"
> +	      "fsl,ls1046a-msi"

Differing whitespace.

Otherwise,

Acked-by: Rob Herring <robh@kernel.org> 
