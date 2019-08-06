From: Krupnik <ronenk@amazon.com>
Subject: Re: [PATCH 2/2] arm64: dts: amazon: add Amazon Annapurna Labs Alpine
 v3 support
Date: Tue, 6 Aug 2019 13:02:03 +0300
Message-ID: <b1a4611f-2169-7657-bdc8-82f9525492ce@amazon.com>
References: <20190728195135.12661-1-ronenk@amazon.com>
 <20190728195135.12661-3-ronenk@amazon.com> <20190729101250.GA831@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729101250.GA831@e107155-lin>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, barakw@amazon.com, dwmw@amazon.co.uk, benh@amazon.com, jonnyc@amazon.com, talel@amazon.com, hhhawa@amazon.com, hanochu@amazon.com
List-Id: devicetree@vger.kernel.org


On 7/29/19 13:12, Sudeep Holla wrote:
> On Sun, Jul 28, 2019 at 10:51:35PM +0300, Ronen Krupnik wrote:
>> This patch adds the initial support for the Amazon Annapurna Labs Alpine v3
>> Soc and Evaluation Platform (EVP).
> [...]
>
>> +
>> +		pmu {
>> +			compatible = "arm,armv8-pmuv3";
> Please use "arm,cortex-a72-pmu" as we know it's Cortex-A72 cores
ack. will be part of v2
>
> --
> Regards,
> Sudeep
