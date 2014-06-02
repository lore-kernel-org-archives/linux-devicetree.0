From: Georgi Djakov <gdjakov@mm-sol.com>
Subject: Re: [PATCH v2 2/4] clk: qcom: Add APQ8084 Global Clock Controller
 support
Date: Mon, 02 Jun 2014 22:47:38 +0300
Message-ID: <538CD4DA.10403@mm-sol.com>
References: <1401551134-28485-1-git-send-email-gdjakov@mm-sol.com> <1401551134-28485-3-git-send-email-gdjakov@mm-sol.com> <20140602193603.GM20486@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140602193603.GM20486@codeaurora.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@linaro.org, linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02.06.14, 22:36, Stephen Boyd wrote:
> On 05/31, Georgi Djakov wrote:
>> +
>> +static const struct qcom_reset_map gcc_apq8084_resets[] = {
> 
>> +	[GCC_VENUS0_BCR] = { 0x1020 },
> 
>> +	[GCC_VPU_BCR] = { 0x1400 },
> 
>> +	[GCC_MDSS_BCR] = { 0x2300 },
>> +	[GCC_AVSYNC_BCR] = { 0x2400 },
>> +	[GCC_OXILI_BCR] = { 0x4020 },
>> +	[GCC_OXILICX_BCR] = { 0x4030 },
>> +	[GCC_OCMEMCX_BCR] = { 0x4050 },
> 
> These aren't in global clock control (looks like mmcc).
> 

Will remove it!

>> +#define GCC_VENUS0_BCR			56
> 
>> +#define GCC_VPU_BCR			76
> 
> 
>> +#define GCC_MDSS_BCR			93
>> +#define GCC_AVSYNC_BCR			94
>> +#define GCC_OXILI_BCR			95
>> +#define GCC_OXILICX_BCR			96
>> +#define GCC_OCMEMCX_BCR			97
> 
> Ditto
> 

Thank you for reviewing the patches!
