Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:41081 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752943Ab3HUXQH (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2013 19:16:07 -0400
Message-ID: <52154A34.4020405@wwwdotorg.org>
Date: Wed, 21 Aug 2013 17:16:04 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 2/3] DMA: Freescale: Add new 8-channel DMA engine device
 tree nodes
References: <1375094944-3343-1-git-send-email-hongbo.zhang@freescale.com>  <1375094944-3343-3-git-send-email-hongbo.zhang@freescale.com>  <521541EE.4010303@wwwdotorg.org> <1377126028.5029.52.camel@snotra.buserror.net>
In-Reply-To: <1377126028.5029.52.camel@snotra.buserror.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Scott Wood <scottwood@freescale.com>
Cc: hongbo.zhang@freescale.com, vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 08/21/2013 05:00 PM, Scott Wood wrote:
> On Wed, 2013-08-21 at 16:40 -0600, Stephen Warren wrote:
>> On 07/29/2013 04:49 AM, hongbo.zhang@freescale.com wrote:
>>> +        - reg               : <registers mapping for channel>
>>> +        - interrupts        : <interrupt mapping for DMA channel IRQ>
>>
>> s/interrupts/specifier/
> 
> Do you mean s/interrupt mapping/interrupt specifier/?
> 
> And probably s/registers mapping/register specifier/ as well.

Yup.

