From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 6/7] devicetree: bindings: Document Krait performance
 monitor units (PMU)
Date: Thu, 09 Jan 2014 11:57:27 -0800
Message-ID: <52CEFF27.2000509@codeaurora.org>
References: <1389221984-10973-1-git-send-email-sboyd@codeaurora.org> <1389221984-10973-7-git-send-email-sboyd@codeaurora.org> <20140109181404.GJ17838@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140109181404.GJ17838@mudshark.cambridge.arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 01/09/14 10:14, Will Deacon wrote:
> On Wed, Jan 08, 2014 at 10:59:43PM +0000, Stephen Boyd wrote:
>> Document the Krait PMU compatible string.
>>
>> Cc: <devicetree@vger.kernel.org>
>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/arm/pmu.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/pmu.txt b/Documentation/devicetree/bindings/arm/pmu.txt
>> index 3e1e498fea96..ce7cccb99d87 100644
>> --- a/Documentation/devicetree/bindings/arm/pmu.txt
>> +++ b/Documentation/devicetree/bindings/arm/pmu.txt
>> @@ -16,6 +16,7 @@ Required properties:
>>  	"arm,arm11mpcore-pmu"
>>  	"arm,arm1176-pmu"
>>  	"arm,arm1136-pmu"
>> +	"qcom,krait-pmu"
>>  - interrupts : 1 combined interrupt or 1 per core.
> Might be worth updating the part about interrupts too, given that you've
> added PPI support.

Done.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
