From: Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: reset: add bindings for the Meson-A1
 SoC Reset Controller
Date: Thu, 26 Sep 2019 11:40:36 +0800
Message-ID: <5d2af18b-1b0a-0b35-9855-b27bbae3a71b@amlogic.com>
References: <1569227661-4261-1-git-send-email-xingyu.chen@amlogic.com>
 <1569227661-4261-3-git-send-email-xingyu.chen@amlogic.com>
 <7htv90rnp2.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7htv90rnp2.fsf@baylibre.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi, Kevin
Thanks for your review

On 2019/9/26 6:55, Kevin Hilman wrote:
> Xingyu Chen <xingyu.chen@amlogic.com> writes:
> 
>> Add DT bindings for the Meson-A1 SoC Reset Controller include file,
>> and also slightly update documentation.
>>
>> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> 
> The order here doesn't look right.  As the sender, your sign-off should
> be last.  Is Jianxin the author or are you?  If Jianxin, there should be
> a "From:" line at the beginning of the changelog to indicate authorship
> that's different from the sender.
I am an author for this patchset, i will reorder Signed-off in next version.
> 
>> ---
>>   .../bindings/reset/amlogic,meson-reset.yaml        |  1 +
>>   include/dt-bindings/reset/amlogic,meson-a1-reset.h | 59 ++++++++++++++++++++++
>>   2 files changed, 60 insertions(+)
>>   create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-reset.h
>>
>> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>> index 00917d8..b3f57d8 100644
>> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>> @@ -16,6 +16,7 @@ properties:
>>         - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
>>         - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
>>         - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
>> +      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
>>   
>>     reg:
>>       maxItems: 1
>> diff --git a/include/dt-bindings/reset/amlogic,meson-a1-reset.h b/include/dt-bindings/reset/amlogic,meson-a1-reset.h
>> new file mode 100644
>> index 00000000..8d76a47
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/amlogic,meson-a1-reset.h
>> @@ -0,0 +1,59 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> + *
>> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
>> + * Author: Xingyu Chen <xingyu.chen@amlogic.com>
>> + *
>> + */
>> +
>> +#ifndef _DT_BINDINGS_AMLOGIC_MESON_A1_RESET_H
>> +#define _DT_BINDINGS_AMLOGIC_MESON_A1_RESET_H
>> +
>> +/* RESET0 */
>> +#define RESET_AM2AXI_VAD		1
> 
> minor nit: can you use comments/whitespace here to indicate holes?
> Please see the other amlogic files in this dir for examples.
I will fix it in next version.
> 
> Kevin
> 
> .
> 
