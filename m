Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:54075 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752864Ab3HUWdV (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2013 18:33:21 -0400
Message-ID: <5215402E.70007@wwwdotorg.org>
Date: Wed, 21 Aug 2013 16:33:18 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 1/3] DMA: Freescale: revise device tree binding document
References: <1375094944-3343-1-git-send-email-hongbo.zhang@freescale.com> <1375094944-3343-2-git-send-email-hongbo.zhang@freescale.com>
In-Reply-To: <1375094944-3343-2-git-send-email-hongbo.zhang@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: hongbo.zhang@freescale.com
Cc: vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, scottwood@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 07/29/2013 04:49 AM, hongbo.zhang@freescale.com wrote:
> From: Hongbo Zhang <hongbo.zhang@freescale.com>
> 
> This patch updates the discription of each type of DMA controller and its
> channels, it is preparation for adding another new DMA controller binding, it
> also fixes some defects of indent for text alignment at the same time.

> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/dma.txt b/Documentation/devicetree/bindings/powerpc/fsl/dma.txt

> -- compatible        : compatible list, contains 2 entries, first is
> -		 "fsl,CHIP-dma", where CHIP is the processor
> -		 (mpc8349, mpc8360, etc.) and the second is
> -		 "fsl,elo-dma"
> +- compatible        : must include "fsl,elo-dma"

Why remove the list of supported compatible values. Lately it seems that
we're moving towards listing more/all the values rather than removing
their documentation...

> -- ranges		: Should be defined as specified in 1) to describe the
> -		  DMA controller channels.
> +- ranges            : describes the mapping between the address space of the
> +                      DMA channels and the address space of the DMA controller

What is "the address space of the DMA controller". Perhaps this should
say "the CPU-visible address space" instead?
