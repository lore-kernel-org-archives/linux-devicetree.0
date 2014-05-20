From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [PATCH v4 6/6] ARM: dts: STiH407: Add B2120 board support
Date: Tue, 20 May 2014 10:27:10 +0200
Message-ID: <537B11DE.6040000@st.com>
References: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com>	<1394614210-15698-7-git-send-email-maxime.coquelin@st.com>
 <CAOesGMg5Jk_XB3zdfKz8VxRObYbFO8OMuRyo7Ba-kavANbci1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOesGMg5Jk_XB3zdfKz8VxRObYbFO8OMuRyo7Ba-kavANbci1w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, kernel@stlinux.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stuart Menefy <stuart.menefy@st.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Olof,

On 05/20/2014 08:18 AM, Olof Johansson wrote:
> Hi,
>
> Just a quick drive-by review since I was looking at these patches in
> the pull request you sent.
>
>
>

Thanks for the review.
I will send a new series taking your comments into account, except the 
one about reference-based syntax.

[...]

>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 12455cf..f760a88 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -317,7 +317,8 @@ dtb-$(CONFIG_ARCH_SPEAR6XX)+= spear600-evb.dtb
>>   dtb-$(CONFIG_ARCH_STI)+= stih415-b2000.dtb \
>>          stih416-b2000.dtb \
>>          stih415-b2020.dtb \
>> -       stih416-b2020.dtb
>> +       stih416-b2020.dtb \
>> +       stih407-b2120.dtb
>
> These should be in alphanumerical order. 407 comes before 415. You've
> been out of order with others as well.

Ok, it will be re-ordered in the next series.

>
>>   dtb-$(CONFIG_ARCH_SUNXI) += \
>>          sun4i-a10-a1000.dtb \
>>          sun4i-a10-cubieboard.dtb \
>> diff --git a/arch/arm/boot/dts/stih407-b2120.dts b/arch/arm/boot/dts/stih407-b2120.dts
>> new file mode 100644
>> index 0000000..9c97da4
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/stih407-b2120.dts
>> @@ -0,0 +1,78 @@
>> +/*
>> + * Copyright (C) 2014 STMicroelectronics (R&D) Limited.
>> + * Author: Giuseppe Cavallaro <peppe.cavallaro@st.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +/dts-v1/;
>> +#include "stih407.dtsi"
>> +/ {
>> +       model = "STiH407 B2120";
>> +       compatible = "st,stih407", "st,stih407-b2120";
>
> This should go from specific to generic, so the order needs to be the other way.
>
> Please check other dts files for the same (I didn't).
>

Ok, I will change that for this dts and also the other ones.
Thanks,
Maxime
