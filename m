Return-Path: <devicetree-owner@vger.kernel.org>
Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]:1177
	"EHLO co1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754212Ab3G2WLD convert rfc822-to-8bit
	(ORCPT <rfc822;devicetree@vger.kernel.org>);
	Mon, 29 Jul 2013 18:11:03 -0400
Date: Mon, 29 Jul 2013 17:10:52 -0500
From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v7 2/3] DMA: Freescale: Add new 8-channel DMA engine
 device tree nodes
References: <1375094944-3343-1-git-send-email-hongbo.zhang@freescale.com>
	<1375094944-3343-3-git-send-email-hongbo.zhang@freescale.com>
In-Reply-To: <1375094944-3343-3-git-send-email-hongbo.zhang@freescale.com>
	(from hongbo.zhang@freescale.com on Mon Jul 29 05:49:03 2013)
Message-ID: <1375135852.30721.60@snotra>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; delsp=Yes; format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: hongbo.zhang@freescale.com
Cc: vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 07/29/2013 05:49:03 AM, hongbo.zhang@freescale.com wrote:
> From: Hongbo Zhang <hongbo.zhang@freescale.com>
> 
> Freescale QorIQ T4 and B4 introduce new 8-channel DMA engines, this  
> patch adds
> the device tree nodes for them.
> 
> Signed-off-by: Hongbo Zhang <hongbo.zhang@freescale.com>
> ---
>  .../devicetree/bindings/powerpc/fsl/dma.txt        |   66  
> ++++++++++++++++
>  arch/powerpc/boot/dts/fsl/b4si-post.dtsi           |    4 +-
>  arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi          |   81  
> ++++++++++++++++++++
>  arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi          |   81  
> ++++++++++++++++++++
>  arch/powerpc/boot/dts/fsl/t4240si-post.dtsi        |    4 +-
>  5 files changed, 232 insertions(+), 4 deletions(-)
>  create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi
>  create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi

ACK

-Scott
