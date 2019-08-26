Return-Path: <SRS0=t5ez=WW=linux.intel.com=eswara.kota@kernel.org>
Subject: Re: [PATCH v2 2/2] reset: Reset controller driver for Intel LGM SoC
References: <42039170811f798b8edc66bf85166aefe7dbc903.1566531960.git.eswara.kota@linux.intel.com>
 <90cc600d6f7ded68f5a618b626bd9cffa5edf5c3.1566531960.git.eswara.kota@linux.intel.com>
 <1566549822.3023.2.camel@pengutronix.de>
 <15c538d7-1045-1a8c-4c8b-194a1de17a16@linux.intel.com>
 <1566554987.3023.8.camel@pengutronix.de>
From: Dilip Kota <eswara.kota@linux.intel.com>
Message-ID: <ccb18776-c9b4-e5e6-36aa-b1054f45e196@linux.intel.com>
Date: Mon, 26 Aug 2019 15:01:37 +0800
MIME-Version: 1.0
In-Reply-To: <1566554987.3023.8.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>, robh@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com
List-ID: <devicetree@vger.kernel.org>


On 8/23/2019 6:09 PM, Philipp Zabel wrote:
> On Fri, 2019-08-23 at 17:47 +0800, Dilip Kota wrote:
> [...]
>> Thanks for pointing it out.
>> Reset is not supported on LGM platform.
>> I will update the reset_device() definition to "return -EOPNOTSUPP"
> In that case you can just drop intel_reset_device() completely,
> the core checks whether ops->reset is set before trying to call it.

Agree, will do the same.

Regards,
Dilip

>
> regards
> Philipp
