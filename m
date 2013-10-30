From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 4/6] edac: Document Krait L1/L2 EDAC driver binding
Date: Wed, 30 Oct 2013 14:58:48 -0700
Message-ID: <52718118.1020009@codeaurora.org>
References: <1383164736-1849-1-git-send-email-sboyd@codeaurora.org> <1383164736-1849-5-git-send-email-sboyd@codeaurora.org> <872F86E8-85CE-472B-9546-CDCC96F6F08B@codeaurora.org> <52717EA5.6030208@codeaurora.org> <F38814D8-723E-4A41-839D-DEE351738017@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <F38814D8-723E-4A41-839D-DEE351738017@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/30/13 14:56, Kumar Gala wrote:
> On Oct 30, 2013, at 4:48 PM, Stephen Boyd wrote:
>
>> On 10/30/13 14:45, Kumar Gala wrote:
>>> On Oct 30, 2013, at 3:25 PM, Stephen Boyd wrote:
>>>> +l2-cache node containing the following properties:
>>> Is the L1 interrupt not per core L1 cache (even if they are OR together at PIC)?
>> Yes it is per CPU. That is what the 0xf part of the cpus interrupts
>> property is showing.
> Than why not have it in each cpu node?

Because that duplicates things unnecessarily? The cpus node can hold
things that are common to all CPUs to avoid duplication. If it was a
different PPI for each CPU then I would agree that we need to put it in
each cpu node.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
