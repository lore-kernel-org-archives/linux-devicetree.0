From: Sarangdhar Joshi <spjoshi@codeaurora.org>
Subject: Re: [PATCH 1/1] dt-binding: remoteproc: Fixup ADSP loader bindings
Date: Fri, 11 Nov 2016 14:19:06 -0800
Message-ID: <2a645c80-a5dc-0123-241b-b12a8daffe05@codeaurora.org>
References: <1478122689-5117-1-git-send-email-spjoshi@codeaurora.org>
 <20161110005227.7zammvklgscdo2lu@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161110005227.7zammvklgscdo2lu@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Trilok Soni <tsoni@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 11/09/2016 04:52 PM, Rob Herring wrote:
> On Wed, Nov 02, 2016 at 02:38:09PM -0700, Sarangdhar Joshi wrote:
>> Fixup "dt-binding: remoteproc: Introduce ADSP loader binding"
>> patch to include XO clock required for booting up Qualcomm ADSP
>> Processor.
>
> I don't think this is accepted yet, so please squash this into the ADSP
> binding.

Sure. I see that Bjorn has already sent a patch that includes this. Thanks.

Regards,
Sarang

>
>>
>> Signed-off-by: Sarangdhar Joshi <spjoshi@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
