From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 4/5] ARM: dts: Add support for emtrion emCON-MX6 series
Date: Fri, 22 Dec 2017 11:43:33 +0100
Message-ID: <b41bc779-28e8-5a87-6f66-f5874dba8d1e@suse.de>
References: <95F51F4B902CAC40AF459205F6322F01B7FDFECC3C@BMK019S01.emtrion.local>
 <20171222104028.GC18255@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171222104028.GC18255-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: =?UTF-8?Q?T=c3=bcrk=2c_Jan?= <Jan.Tuerk-BU0Y/NROKIiELgA04lAiVw@public.gmane.org>, 'Rob Herring' <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, SZ Lin <sz.lin-D4fb9hXD9d4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LinuxArmKernelMailingListe <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 22.12.2017 um 11:40 schrieb Alexandre Belloni:
> On 22/12/2017 at 11:34:31 +0100, Türk, Jan wrote:
>>>> diff --git a/arch/arm/boot/dts/imx6q-emcon.dtsi b/arch/arm/boot/dts/imx6q-
>>> emcon.dtsi
>>>> new file mode 100644
>>>> index 000000000000..64fc0cd74c05
>>>> --- /dev/null
>>>> +++ b/arch/arm/boot/dts/imx6q-emcon.dtsi
>>>> @@ -0,0 +1,37 @@
>>>> +/*
>>>> + * Copyright (C) 2017 emtrion GmbH
>>>> + * Author: Jan Tuerk  <jan.tuerk-BU0Y/NROKIhBDgjK7y7TUQ@public.gmane.org>
>>>> + *
>>>> + * The code contained herein is licensed under the GNU General Public
>>>> + * License. You may obtain a copy of the GNU General Public License
>>>> + * Version 2 or later at the following locations:
>>>> + *
>>>> + * http://www.opensource.org/licenses/gpl-license.html
>>>> + * http://www.gnu.org/copyleft/gpl.html
>>>
>>> You don't need this if...
>>
>> I've got a little different point of view on this since the OSS Europe 2017 - part of gpl2 following.
>>
>> GPLv2-Para1 (=>highlighted<=) :
>> 1. You may copy and distribute verbatim copies of the Program's source code as you receive it, in any medium,
>>  provided that you conspicuously and appropriately publish on each copy an 
>> => appropriate copyright notice and disclaimer of warranty; <=
>> keep intact all the notices that refer to this License and to the absence of any warranty;
>>  and give any other recipients of the Program a copy of this License along with the Program.
>>
>> After reviewing this I think apparently I should include the Warranty disclaimer as well.
>> Examples could be found  in:
>> arch/arm/boot/dts/imx6q-tbs2910.dts
>> and
>> arch/arm/boot/dts/imx6q-zii-rdu2.dts
>>
> 
> The license is already fully included in COPYING with the warranty
> disclaimer.
> 
>>>
>>>> + *
>>>> + * SPDX-License-Identifier: GPL-2.0
>>>
>>> You have this.
>>>
>>> Also, the rules around this are getting a bit stricter saying the SPDX
>>> tag should be the first line of the file using a C++ style comment.
>>>
>> I'll change it for v3 of this patch however it will end up like this:
>> //SPDX-License...
> 
> That should be /* SPDX-License */, // is for c files.

Got any reference for that? Since we're using the C preprocessor before
feeding them to dtc, we can use the same // style for both, builds fine.

Only for my private DT overlay files that I use directly with dtc I
couldn't adopt that style.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
