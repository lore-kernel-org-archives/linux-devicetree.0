From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: drm/bridge: adv7511: Add regulator
 bindings
Date: Sun, 18 Dec 2016 16:47:04 +0530
Message-ID: <247f085c-965c-d9c9-70c9-4109c4c1bd35@codeaurora.org>
References: <1480399662-8858-1-git-send-email-architt@codeaurora.org>
 <1480924435-20882-1-git-send-email-architt@codeaurora.org>
 <1480924435-20882-2-git-send-email-architt@codeaurora.org>
 <20161209221124.rkntcdbgj36hlgul@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161209221124.rkntcdbgj36hlgul@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 12/10/2016 3:41 AM, Rob Herring wrote:
> On Mon, Dec 05, 2016 at 01:23:54PM +0530, Archit Taneja wrote:
>> Add the regulator supply properties needed by ADV7511 and ADV7533.
>>
>> Cc: devicetree@vger.kernel.org
>> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>
> Didn't I ack this already? Anyway,

You had Acked it before. This set moved the regulator bindings from
optional to mandatory, so I thought it may need you review again.

Mark Brown insisted that we have a regulator supply per pin even if
the chip's specs recommend using a common supply for them, so I'm
going to bring that back again. I'll keep your Ack for the next
revision since that's something you'd originally recommended.

Thanks,
Archit

>
> Acked-by: Rob Herring <robh@kernel.org>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
