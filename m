Return-Path: <devicetree-owner@vger.kernel.org>
Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]:9633
	"EHLO co1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752116Ab3HUXdz (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Wed, 21 Aug 2013 19:33:55 -0400
Message-ID: <1377128031.5029.75.camel@snotra.buserror.net>
Subject: Re: [PATCH v7 1/3] DMA: Freescale: revise device tree binding
 document
From: Scott Wood <scottwood@freescale.com>
Date: Wed, 21 Aug 2013 18:33:51 -0500
In-Reply-To: <52154976.2010204@wwwdotorg.org>
References: <1375094944-3343-1-git-send-email-hongbo.zhang@freescale.com>
	  <1375094944-3343-2-git-send-email-hongbo.zhang@freescale.com>
	  <5215402E.70007@wwwdotorg.org>
	 <1377125156.5029.40.camel@snotra.buserror.net>
	 <52154976.2010204@wwwdotorg.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: hongbo.zhang@freescale.com, vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, 2013-08-21 at 17:12 -0600, Stephen Warren wrote:
> OK, if there's some alternative run-time way of enabling chip-specific
> quirking, it's probably fine to remove the extra compatible values.
> 
> Now, that does rather assume that this DMA IP block will only ever be
> used within SoCs that have that SVR concept, but perhaps if that's ever
> not the case, we can simply go back to requiring extra compatible values
> in those specific cases?

The only situation I can see where SVR would be absent is if we were to
integrate this device into an ARM chip, in which case I'd expect there
to be some equivalent way to find the SoC identification.  If the driver
knows what SoC version it expects, it will know the way that that SoC
advertises its version.

-Scott



