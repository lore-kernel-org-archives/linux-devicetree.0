From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v4 2/5] dt-bindings: clock: Add S700 support for Actions
 Semi Soc's
Date: Sun, 15 Jul 2018 20:36:46 +0200
Message-ID: <0d52c569-bd9a-2a17-c1ef-13e0d1fe4495@suse.de>
References: <20180715123145.16975-1-sravanhome@gmail.com>
 <20180715123145.16975-3-sravanhome@gmail.com>
 <20180715143849.GC9980@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180715143849.GC9980@Mani-XPS-13-9360>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Saravanan Sekar <sravanhome@gmail.com>
Cc: sboyd@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@cubietech.com, support@cubietech.com, catalin.marinas@arm.com, mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, darren@cubietech.com, robh+dt@kernel.org, jeff.chen@actions-semi.com, pn@denx.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com
List-Id: devicetree@vger.kernel.org

Hi,

Am 15.07.2018 um 16:38 schrieb Manivannan Sadhasivam:
> On Sun, Jul 15, 2018 at 02:31:42PM +0200, Saravanan Sekar wrote:
>> diff --git a/include/dt-bindings/clock/actions,s700-cmu.h b/include/dt-bindings/clock/actions,s700-cmu.h
>> new file mode 100644
>> index 000000000000..905808bf335b
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/actions,s700-cmu.h
>> @@ -0,0 +1,118 @@
>> +/* SPDX-License-Identifier: GPL-2.0+

"GPL-2.0-or-later OR MIT" please for bindings and DT.

Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
