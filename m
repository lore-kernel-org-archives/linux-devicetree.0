From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998: Disable coresight by default
Date: Thu, 03 Oct 2019 20:51:46 +0530
Message-ID: <89f5f76ae26682e902faa1b06379cc0f@codeaurora.org>
References: <20191003064449.2201-1-saiprakash.ranjan@codeaurora.org>
 <aecbc7a2-05fd-f30f-81c7-81947dc31c9f@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <aecbc7a2-05fd-f30f-81c7-81947dc31c9f@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, DT <devicetree@vger.kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, MSM <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 2019-10-03 18:23, Marc Gonzalez wrote:
> On 03/10/2019 08:44, Sai Prakash Ranjan wrote:
> 
>> Boot failure has been reported on MSM8998 based laptop when
>> coresight is enabled. This is most likely due to lack of
>> firmware support for coresight on production device when
>> compared to debug device like MTP where this issue is not
>> observed. So disable coresight by default for MSM8998 and
>> enable it only for MSM8998 MTP.
>> 
>> Reported-and-tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
>> Fixes: 783abfa2249a ("arm64: dts: qcom: msm8998: Add Coresight 
>> support")
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 68 
>> +++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/msm8998.dtsi     | 51 +++++++++++------
>>  2 files changed, 102 insertions(+), 17 deletions(-)
> 
> Just wanted to toss an alternative, based on Suzuki's suggestion
> (i.e. move the coresight nodes to a separate file)
> 
> 

I believe this is a better approach.
Initially I had coresight components in a separate file like this but 
Bjorn had some concerns about having 2 separate files. If he is OK with 
this,

Acked-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
