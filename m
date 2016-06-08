From: Scott Wood <scott.wood@nxp.com>
Subject: Re: [PATCH] arm64: dts: ls1043a: Add 'dma-coherent' for ls1043a PCI
 nodes
Date: Wed, 8 Jun 2016 20:31:18 +0000
Message-ID: <DB5PR0401MB192810622C64C85F08C281D9915E0@DB5PR0401MB1928.eurprd04.prod.outlook.com>
References: <1465282546-28256-1-git-send-email-Gang.Liu@nxp.com>
 <1465282546-28256-2-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gang Liu <gang.liu@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh@kernel.org" <robh@kernel.org>
Cc: Minghuan Lian <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

On 06/07/2016 02:06 AM, Liu Gang wrote:
> The 'dma-coherent' indicates that the hardware IP block can ensure
> the coherency of the data transferred from/to the IP block. This
> can avoid the software cache flush/invalid actions, and improve
> the performance significantly.
> 
> The PCI IP block of ls1043a has this capability, so adding this
> feature to improve the PCI performance.
> 
> Signed-off-by: Liu Gang <Gang.Liu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 3 +++
>  1 file changed, 3 insertions(+)

Why not ls2080a as well?
What about non-PCI devices?

Pretty much everything on these chips should be coherent as long as it's
properly configured.

-Scott
