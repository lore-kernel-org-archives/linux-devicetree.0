From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v2 03/10] dt-bindings: msm/mdp: Fix up clock related
 bindings
Date: Thu, 16 Jun 2016 10:38:25 +0530
Message-ID: <57623449.1090808@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-4-git-send-email-architt@codeaurora.org>
 <20160613190331.GA27237@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160613190331.GA27237@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: robdclark@gmail.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, heiko@sntech.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 06/14/2016 12:33 AM, Rob Herring wrote:
> On Fri, Jun 10, 2016 at 04:16:33PM +0530, Archit Taneja wrote:
>> MDP5:
>> - Don't ask for source clock
>>
>> MDP4:
>> - Give a better name for MDP_TV_CLK
>> - Remove TV_SRC
>> - Add MDP_AXI_CLK
>
> This could use the explanation in the commit msg why it is okay you are
> breaking compatibility.

Sure, I'll do that. Thanks for the reviews.

Archit

>
> With that,
>
> Acked-by: Rob Herring <robh@kernel.org>
>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, hosted by The Linux Foundation
