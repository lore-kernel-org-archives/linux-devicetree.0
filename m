From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/9] irqchip/ls-scfg-msi: fix typo of MSI compatible
 strings
Date: Tue, 3 Jan 2017 11:11:32 -0600
Message-ID: <20170103171132.xz5jjeovzfohi2xk@rob-hp-laptop>
References: <1482829985-24421-1-git-send-email-Minghuan.Lian@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1482829985-24421-1-git-send-email-Minghuan.Lian@nxp.com>
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

On Tue, Dec 27, 2016 at 05:12:57PM +0800, Minghuan Lian wrote:
> The patch is to fix typo of the Layerscape SCFG MSI dts compatible
> strings. "1" is replaced by "l".
> 
> Signed-off-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> ---
>  .../devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt    | 6 +++---
>  drivers/irqchip/irq-ls-scfg-msi.c                                   | 6 ++++--
>  2 files changed, 7 insertions(+), 5 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
