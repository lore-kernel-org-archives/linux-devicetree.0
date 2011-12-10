From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH 5/5] microblaze: Introduce IRQ_SW_OFFSET to help with
 sw IRQ
Date: Sat, 10 Dec 2011 11:41:42 +0100
Message-ID: <4EE33766.6060704@monstr.eu>
References: <1323431121-12780-1-git-send-email-monstr@monstr.eu> <1323431121-12780-2-git-send-email-monstr@monstr.eu> <1323431121-12780-3-git-send-email-monstr@monstr.eu> <1323431121-12780-4-git-send-email-monstr@monstr.eu> <1323431121-12780-5-git-send-email-monstr@monstr.eu> <4EE21753.8050501@gmail.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4EE21753.8050501@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, anton.vorontsov@linaro.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Rob Herring wrote:
> On 12/09/2011 05:45 AM, Michal Simek wrote:
>> If you setup IRQ_OFFSET > nr_irq you completely separate hardware
>> and software IRQs which help you with debugging.
>>
>> For example:
>> IRQ_SW_OFFSET = 32
>>
>>         DTS   HW(line)   LINUX
>> timer - 2     3          35
>> sysace  4     5          37
>> serial  5     6          38
>>
>> HW line is setup DTS + NO_IRQ_OFFSET to ensure that NO_IRQ is always 0.
>>
> 
> This is really confusing. DTS is the HW numbering. The last 2 columns
> are both Linux IRQ numbering. Just create a single define for an offset.
> Then I would combine this into the previous patch.
> 

DTS generator, which we used for DTS generator for more than 2 years,
generates for the first IRQ in the system this property "interrupts = < 0 2 >;"
Which is HW line 1 and linux irq_data->hwirq 0 (because of shift) and irq_data->irq = 1
for SW_OFFSET=0.

Anyway no problem to keep just NO_IRQ_OFFSET value.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
