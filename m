Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-db8lp0188.outbound.messaging.microsoft.com ([213.199.154.188]:5546
	"EHLO db8outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752312Ab3HWDSK (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Thu, 22 Aug 2013 23:18:10 -0400
Message-ID: <5216D461.4010604@freescale.com>
Date: Fri, 23 Aug 2013 11:17:53 +0800
From: Hongbo Zhang <hongbo.zhang@freescale.com>
MIME-Version: 1.0
Subject: Re: [PATCH v7 2/3] DMA: Freescale: Add new 8-channel DMA engine device
 tree nodes
References: <1375094944-3343-1-git-send-email-hongbo.zhang@freescale.com>  <1375094944-3343-3-git-send-email-hongbo.zhang@freescale.com>  <521541EE.4010303@wwwdotorg.org> <1377126028.5029.52.camel@snotra.buserror.net> <52154A34.4020405@wwwdotorg.org>
In-Reply-To: <52154A34.4020405@wwwdotorg.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Scott Wood <scottwood@freescale.com>, vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 08/22/2013 07:16 AM, Stephen Warren wrote:
> On 08/21/2013 05:00 PM, Scott Wood wrote:
>> On Wed, 2013-08-21 at 16:40 -0600, Stephen Warren wrote:
>>> On 07/29/2013 04:49 AM, hongbo.zhang@freescale.com wrote:
>>>> +        - reg               : <registers mapping for channel>
>>>> +        - interrupts        : <interrupt mapping for DMA channel IRQ>
>>> s/interrupts/specifier/
>> Do you mean s/interrupt mapping/interrupt specifier/?
>>
>> And probably s/registers mapping/register specifier/ as well.
> Yup.
>
OK, I will update these descriptions.



