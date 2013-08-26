From: Hongbo Zhang <hongbo.zhang@freescale.com>
Subject: Re: [PATCH v7 2/3] DMA: Freescale: Add new 8-channel DMA engine device
 tree nodes
Date: Mon, 26 Aug 2013 18:33:27 +0800
Message-ID: <521B2EF7.2050805@freescale.com>
References: <1375094944-3343-1-git-send-email-hongbo.zhang@freescale.com>  <1375094944-3343-3-git-send-email-hongbo.zhang@freescale.com>  <521541EE.4010303@wwwdotorg.org> <1377126028.5029.52.camel@snotra.buserror.net> <52154A34.4020405@wwwdotorg.org> <5216D461.4010604@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5216D461.4010604@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Scott Wood <scottwood@freescale.com>, vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/23/2013 11:17 AM, Hongbo Zhang wrote:
> On 08/22/2013 07:16 AM, Stephen Warren wrote:
>> On 08/21/2013 05:00 PM, Scott Wood wrote:
>>> On Wed, 2013-08-21 at 16:40 -0600, Stephen Warren wrote:
>>>> On 07/29/2013 04:49 AM, hongbo.zhang@freescale.com wrote:
>>>>> +        - reg               : <registers mapping for channel>
>>>>> +        - interrupts        : <interrupt mapping for DMA channel 
>>>>> IRQ>
>>>> s/interrupts/specifier/
>>> Do you mean s/interrupt mapping/interrupt specifier/?
>>>
>>> And probably s/registers mapping/register specifier/ as well.
>> Yup.
>>
> OK, I will update these descriptions.
>
Since Scott has clarified all the doubts, and no further comment till 
now, so my next iteration will include this s/mapping/specifier only.
I will sent it out this Tuesday, if there is still any comment/doubt, 
please let me know.
