From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Add reset controllers for STiH407 SoC
Date: Thu, 3 Jul 2014 10:06:21 +0200
Message-ID: <53B50EFD.2070007@st.com>
References: <1404310129-14667-1-git-send-email-peter.griffin@linaro.org> <1404317194.4109.13.camel@paszta.hi.pengutronix.de> <20140702165924.GB17665@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140702165924.GB17665@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 07/02/2014 06:59 PM, Lee Jones wrote:
> On Wed, 02 Jul 2014, Philipp Zabel wrote:
>
>> Hi Peter,
>>
>> Am Mittwoch, den 02.07.2014, 15:08 +0100 schrieb Peter Griffin:
>>> This series adds reset controller support for the STiH407 SoC.
>>>
>>> Changes since v1
>>>   - Update copyright to 2014
>>>   - Add const qualifier
>>>   - Fix various whitespace issues
>>>   - Remove THIS_OWNER
>>>   - Move DT documentation into separate patch
>>>
>>> Peter Griffin (4):
>>>    reset: stih407: Add softreset, powerdown and picophy controllers
>>>    reset: sti: Document sti-picophyreset controllers bindings.
>>>    ARM: sti: Add STiH407 Kconfig entry to select STIH407_RESET
>>>    ARM: sti: Add STiH407 reset controller support.
>>>
>>>   .../bindings/reset/st,sti-picophyreset.txt         |  42 ++++++
>>>   arch/arm/boot/dts/stih407.dtsi                     |  16 +++
>>>   arch/arm/mach-sti/Kconfig                          |  10 ++
>>>   drivers/reset/sti/Kconfig                          |   4 +
>>>   drivers/reset/sti/Makefile                         |   1 +
>>>   drivers/reset/sti/reset-stih407.c                  | 158 +++++++++++++++++++++
>>>   .../dt-bindings/reset-controller/stih407-resets.h  |  61 ++++++++
>>>   7 files changed, 292 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/reset/st,sti-picophyreset.txt
>>>   create mode 100644 drivers/reset/sti/reset-stih407.c
>>>   create mode 100644 include/dt-bindings/reset-controller/stih407-resets.h
>>
>> Looks good to me now.
>>
>> Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>
> Do you have a tree for Reset?  If not, which route do these patches
> normally follow?
>

I will queue patch 4 to STi DT branch for v3.17.
For now, no nodes uses reset for STiH407, so we don't need the 
dt-bindings header file in the STi tree.

If we have a DT node using a reset line before my pull-request, I might 
have to integrate the series in the STi DT branch.
Philipp, does that sound reasonable?

Regards,
Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
