From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH V2 1/2] DMA: Freescale: Add new 8-channel DMA engine
 device tree nodes
Date: Mon, 15 Jul 2013 08:31:53 -0500
Message-ID: <2E51FB91-1C34-4911-AF77-F68D292F8DDC@kernel.crashing.org>
References: <1373005626-20726-1-git-send-email-hongbo.zhang@freescale.com>
 <1373005626-20726-2-git-send-email-hongbo.zhang@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373005626-20726-2-git-send-email-hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: "<hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>" <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vakul-KZfg59tc24xl57MIdRCFDg@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Jul 5, 2013, at 1:27 AM, <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org> <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> From: Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Freescale QorIQ T4 and B4 introduce new 8-channel DMA engines, this patch add
> the device tree nodes for them.
> 
> Signed-off-by: Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi   |   90 +++++++++++++++++++++++++++
> arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi   |   90 +++++++++++++++++++++++++++
> arch/powerpc/boot/dts/fsl/t4240si-post.dtsi |    4 +-
> 3 files changed, 182 insertions(+), 2 deletions(-)
> create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi
> create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi

Why didn't you update b4si-post.dtsi as well?

- k
