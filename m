From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 6/8] dt-bindings: power: Add Actions Semi S700 SPS
Date: Thu, 16 Nov 2017 14:42:36 +0100
Message-ID: <2342385f-b70c-6812-44e8-19c888bb5103@suse.de>
References: <20171113233427.5386-1-afaerber@suse.de>
 <20171113233427.5386-7-afaerber@suse.de>
 <20171116043529.hrrgiga4hpdsy2tc@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171116043529.hrrgiga4hpdsy2tc@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Thomas Liau <thomas.liau@actions-semi.com>, Jeff Chen <jeff.chen@actions-semi.com>, =?UTF-8?B?5byg5Lic6aOO?= <zhangdf@actions-semi.com>, =?UTF-8?B?5YiY54Kc?= <liuwei@actions-semi.com>, =?UTF-8?B?5byg5aSp55uK?= <tyzhang@actions-semi.com>, =?UTF-8?B?5qKF5Yip?= <harrymei@actions-semi.com>, support@cubietech.com, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am 16.11.2017 um 05:35 schrieb Rob Herring:
> On Tue, Nov 14, 2017 at 12:34:25AM +0100, Andreas Färber wrote:
>> Define power domains for Actions Semi S700 SoC Smart Power System (SPS).
>>
>> Signed-off-by: Andreas Färber <afaerber@suse.de>
>> ---
>>  v2: New
>>  
>>  .../devicetree/bindings/power/actions,owl-sps.txt    |  2 ++
>>  include/dt-bindings/power/owl-s700-powergate.h       | 20 ++++++++++++++++++++
>>  2 files changed, 22 insertions(+)
>>  create mode 100644 include/dt-bindings/power/owl-s700-powergate.h
>>
>> diff --git a/Documentation/devicetree/bindings/power/actions,owl-sps.txt b/Documentation/devicetree/bindings/power/actions,owl-sps.txt
>> index 007b9a7ae723..78edd63641e8 100644
>> --- a/Documentation/devicetree/bindings/power/actions,owl-sps.txt
>> +++ b/Documentation/devicetree/bindings/power/actions,owl-sps.txt
>> @@ -2,10 +2,12 @@ Actions Semi Owl Smart Power System (SPS)
>>  
>>  Required properties:
>>  - compatible          :  "actions,s500-sps" for S500
>> +                         "actions,s700-sps" for S700
>>  - reg                 :  Offset and length of the register set for the device.
>>  - #power-domain-cells :  Must be 1.
>>                           See macros in:
>>                            include/dt-bindings/power/owl-s500-powergate.h for S500
>> +                          include/dt-bindings/power/owl-s700-powergate.h for S700
>>  
>>  
>>  Example:
>> diff --git a/include/dt-bindings/power/owl-s700-powergate.h b/include/dt-bindings/power/owl-s700-powergate.h
>> new file mode 100644
>> index 000000000000..4ded16bc074f
>> --- /dev/null
>> +++ b/include/dt-bindings/power/owl-s700-powergate.h
>> @@ -0,0 +1,20 @@
>> +/*
>> + * Actions Semi S700 SPS
>> + *
>> + * Copyright (c) 2017 Andreas Färber
>> + *
>> + * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> 
> The decree now for SPDX tags is make this the first line using "//".

Thanks for noticing. Fixed:

diff --git a/include/dt-bindings/power/owl-s700-powergate.h
b/include/dt-bindings/power/owl-s700-powergate.h
index 4ded16bc074f..4cf1aefbf09c 100644
--- a/include/dt-bindings/power/owl-s700-powergate.h
+++ b/include/dt-bindings/power/owl-s700-powergate.h
@@ -1,9 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Actions Semi S700 SPS
  *
  * Copyright (c) 2017 Andreas Färber
- *
- * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
  */
 #ifndef DT_BINDINGS_POWER_OWL_S700_POWERGATE_H
 #define DT_BINDINGS_POWER_OWL_S700_POWERGATE_H

> 
> Otherwise, 
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, queued in v4.16/dt64:
https://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-actions.git/log/?h=v4.16/dt64

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
