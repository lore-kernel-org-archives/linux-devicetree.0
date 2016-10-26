From: Imran Khan <kimran@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: Add SoC info driver
Date: Wed, 26 Oct 2016 19:42:08 +0530
Message-ID: <2ae082c4-27c1-fbdd-cb7a-986716e15d18@codeaurora.org>
References: <1476972386-28655-1-git-send-email-kimran@codeaurora.org>
 <3567809.JctLPjIDdk@wuerfel>
 <aec67ab3-8e89-fe06-b385-988f8eea5f46@codeaurora.org>
 <3809309.oOnjdjqnN9@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <3809309.oOnjdjqnN9@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/26/2016 7:35 PM, Arnd Bergmann wrote:
>> > As we are talking about generic soc_device_attribute fields, I was hoping that
>> > having a vendor field would be helpful as along with family it would provide
>> > a more thorough information. Also as more than one foundries may be used for 
>> > a soc, can we have a field say foundry_id to provide this information.
> My first feeling is that this 'vendor' information can should be
> derived from the family. It's also not clear what would happen
> to this when a company gets bought. E.g. the Oxnas product family
> was subsequently owned by Oxford, PLX, Avago and Broadcom, and the
> mxs family was Sigmatel, Freescale, now NXP and might soon be
> Qualcomm. What would you put in there in this case?

Okay, not having vendor field is fine for me. Could you also suggest
something about the foundry_id field.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a\nmember of the Code Aurora Forum, hosted by The Linux Foundation
