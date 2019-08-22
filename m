From: "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: rtc: Add optional status property
Date: Thu, 22 Aug 2019 17:38:38 +0800
Message-ID: <5b90de84-5531-b8f3-65a7-0009c4a4f8f1@linux.intel.com>
References: <cover.1566458029.git.rahul.tanwar@linux.intel.com>
 <1b01287241d49638c43222d32f3ece5a38c95ddf.1566458029.git.rahul.tanwar@linux.intel.com>
 <20190822085659.GI30120@smile.fi.intel.com>
 <20190822090948.GQ27031@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822090948.GQ27031@piout.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tony.luck@intel.com, x86@kernel.org, a.zummo@towertech.it, robh+dt@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, alan@linux.intel.com, linux-kernel@vger.kernel.org, qi-ming.wu@intel.com, cheol.yong.kim@intel.com, rahul.tanwar@intel.com
List-Id: devicetree@vger.kernel.org


On 22/8/2019 5:09 PM, Alexandre Belloni wrote:
> On 22/08/2019 11:56:59+0300, Andy Shevchenko wrote:
>> On Thu, Aug 22, 2019 at 03:44:04PM +0800, Rahul Tanwar wrote:
>>> Some products may not support MC146818 RTC CMOS device. Introduce a optional
>>> 'status' standard property for RTC-CMOS to indicate if the MC146818 RTC device
>>> is available (status="okay") or not (status="disabled")
>> This needs to be converted to YAML
>>
> Well, I think the status property doesn't even need to be documented
> because it is simply the generic behaviour.

Thanks for your comments. I now realize it. I will omit posting this again.


Regards,

Rahul
