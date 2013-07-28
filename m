Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:33435 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753689Ab3G1OaJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Sun, 28 Jul 2013 10:30:09 -0400
Date: Sun, 28 Jul 2013 19:21:17 +0530
From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v6 3/3] DMA: Freescale: update driver to support
 8-channel DMA engine
Message-ID: <20130728135117.GG1986@intel.com>
References: <1374834436-7149-1-git-send-email-hongbo.zhang@freescale.com>
 <1374834436-7149-4-git-send-email-hongbo.zhang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1374834436-7149-4-git-send-email-hongbo.zhang@freescale.com>
Sender: devicetree-owner@vger.kernel.org
To: hongbo.zhang@freescale.com
Cc: djbw@fb.com, leoli@freescale.com, scottwood@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 26, 2013 at 06:27:16PM +0800, hongbo.zhang@freescale.com wrote:
> From: Hongbo Zhang <hongbo.zhang@freescale.com>
> 
> This patch adds support to 8-channel DMA engine, thus the driver works for both
> the new 8-channel and the legacy 4-channel DMA engines.
> 
> Signed-off-by: Hongbo Zhang <hongbo.zhang@freescale.com>
This looks fine. I need someone to ACK the DT bindings for the series to go in

~Vinod
