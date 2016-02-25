From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: fix usb digital voltage levels
Date: Thu, 25 Feb 2016 11:21:56 +0000
Message-ID: <56CEE3D4.3030407@linaro.org>
References: <1456246153-18087-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1456246236-18341-1-git-send-email-srinivas.kandagatla@linaro.org>
 <56CE3780.5060408@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <56CE3780.5060408@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 24/02/16 23:06, Stephen Boyd wrote:
> On 02/23/2016 08:50 AM, Srinivas Kandagatla wrote:
>> This patch updates the digital voltage levels from corner values to
>> microvolts as we are going to use s1 regulator directly for vddcx
>> instead of s1_corner.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>
> What's the plan for corners? Maybe we should remove the voltage setting
> from the usb driver or drop the usb node entirely on msm8916 until we
> resolve how we're going to handle corners. I'd like to avoid getting
> stuck into some DT binding ABI mess here.

Andy/Bjorn, any comments on plans on corner regulators?

Please note, that this is a patch to fix what is already in the 
mainline. Without this patch the regulator would be configured with 1uV 
or 5uV or 7uV which would obviously fail.

THB, it does not make sense to drop feature which is functional, and I 
also agree that we should cleanup some of this mess at some point in 
time once we all the bits and pieces ready.

I was surprised to see these usb bindings(qcom,vdd-levels) existed even 
before we had concept of corner regulators in mainline kernel. Which 
also suggests that this driver needs a proper relook once again.

Thanks,
srini
