Return-Path: <devicetree-owner@vger.kernel.org>
Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]:23358 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754177Ab3G2WJg convert rfc822-to-8bit
	(ORCPT <rfc822;devicetree@vger.kernel.org>);
	Mon, 29 Jul 2013 18:09:36 -0400
Date: Mon, 29 Jul 2013 17:09:32 -0500
From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v7 1/3] DMA: Freescale: revise device tree binding
 document
References: <1375094944-3343-1-git-send-email-hongbo.zhang@freescale.com>
	<1375094944-3343-2-git-send-email-hongbo.zhang@freescale.com>
In-Reply-To: <1375094944-3343-2-git-send-email-hongbo.zhang@freescale.com>
	(from hongbo.zhang@freescale.com on Mon Jul 29 05:49:02 2013)
Message-ID: <1375135772.30721.59@snotra>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; delsp=Yes; format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: hongbo.zhang@freescale.com
Cc: vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 07/29/2013 05:49:02 AM, hongbo.zhang@freescale.com wrote:
> From: Hongbo Zhang <hongbo.zhang@freescale.com>
> 
> This patch updates the discription of each type of DMA controller and  
> its
> channels, it is preparation for adding another new DMA controller  
> binding, it
> also fixes some defects of indent for text alignment at the same time.
> 
> Signed-off-by: Hongbo Zhang <hongbo.zhang@freescale.com>

ACK, but next time please do the whitespace fixes as a separate patch  
so that it's easier to see what's actually changing.

-Scott
