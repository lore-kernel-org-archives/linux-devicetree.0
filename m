Return-Path: <devicetree-owner@vger.kernel.org>
Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]:24423
	"EHLO co1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753118Ab3HUXAg (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Wed, 21 Aug 2013 19:00:36 -0400
Message-ID: <1377126028.5029.52.camel@snotra.buserror.net>
Subject: Re: [PATCH v7 2/3] DMA: Freescale: Add new 8-channel DMA engine
 device tree nodes
From: Scott Wood <scottwood@freescale.com>
Date: Wed, 21 Aug 2013 18:00:28 -0500
In-Reply-To: <521541EE.4010303@wwwdotorg.org>
References: <1375094944-3343-1-git-send-email-hongbo.zhang@freescale.com>
	 <1375094944-3343-3-git-send-email-hongbo.zhang@freescale.com>
	 <521541EE.4010303@wwwdotorg.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: hongbo.zhang@freescale.com, vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, 2013-08-21 at 16:40 -0600, Stephen Warren wrote:
> On 07/29/2013 04:49 AM, hongbo.zhang@freescale.com wrote:
> > +        - reg               : <registers mapping for channel>
> > +        - interrupts        : <interrupt mapping for DMA channel IRQ>
> 
> s/interrupts/specifier/

Do you mean s/interrupt mapping/interrupt specifier/?

And probably s/registers mapping/register specifier/ as well.

-Scott



