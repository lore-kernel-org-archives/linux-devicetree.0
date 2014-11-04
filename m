From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v4 2/8] phy: miphy28lp: Add PHY header file for DT x Driver
 defines
Date: Tue, 4 Nov 2014 15:31:47 +0530
Message-ID: <5458A40B.7080603@ti.com>
References: <1413962067-25557-1-git-send-email-gabriel.fernandez@linaro.org>	<1413962067-25557-3-git-send-email-gabriel.fernandez@linaro.org>	<54589B78.3040104@ti.com> <CAG374jDfd24odPXMGC1=1ckaeukk=8Pix1j_bspH5prNpJWhQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAG374jDfd24odPXMGC1=1ckaeukk=8Pix1j_bspH5prNpJWhQw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@stlinux.com" <kernel@stlinux.com>, Lee Jones <lee.jones@linaro.org>, gregory.clement@free-electrons.com, jason@lakedaemon.net, andrew@lunn.ch, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org



On Tuesday 04 November 2014 03:28 PM, Gabriel Fernandez wrote:
> Hi Kishon,
> 
> Sure, I'll update my patch set and sent to you soon as possible.

cool, thanks.

-Kishon
> 
> Best Regards
> 
> Gabriel
> 
> On 4 November 2014 10:25, Kishon Vijay Abraham I <kishon@ti.com> wrote:
>> Hi Gabriel,
>>
>> On Wednesday 22 October 2014 12:44 PM, Gabriel FERNANDEZ wrote:
>>> This provides the shared header file which will be reference from both
>>> PHY driver and its associated Device Tree node(s).
>>>
>>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
>>> ---
>>>  include/dt-bindings/phy/phy.h | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>  create mode 100644 include/dt-bindings/phy/phy.h
>>>
>>> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
>>> new file mode 100644
>>> index 0000000..a142c69
>>> --- /dev/null
>>> +++ b/include/dt-bindings/phy/phy.h
>>> @@ -0,0 +1,17 @@
>>> +/*
>>> + *
>>> + * This header provides constants for the phy framework
>>> + *
>>> + * Copyright (C) 2014 STMicroelectronics
>>> + * Author: Gabriel Fernandez <gabriel.fernandez@st.com>
>>> + * License terms:  GNU General Public License (GPL), version 2
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_PHY
>>> +#define _DT_BINDINGS_PHY
>>> +
>>> +#define PHY_TYPE_SATA                1
>>> +#define PHY_TYPE_PCIE                2
>>> +#define PHY_TYPE_USB         3
>>
>> Can we have a separate #define for USB2 and USB3? Looks like Gregory will need
>> it for Armada 375 SoC.
>>
>> Thanks
>> Kishon
