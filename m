From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 0/3] Enable myphy28lp support
Date: Fri, 16 Jan 2015 16:04:54 +0100
Message-ID: <54B92896.5020607@st.com>
References: <1421229299-8206-1-git-send-email-gabriel.fernandez@linaro.org> <54B8FC56.8080400@st.com> <54B904C3.1080002@st.com> <54B90FC4.2020604@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B90FC4.2020604-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 01/16/2015 02:19 PM, Kishon Vijay Abraham I wrote:
> Hi,
>
> On Friday 16 January 2015 06:02 PM, Maxime Coquelin wrote:
>> On 01/16/2015 12:56 PM, Maxime Coquelin wrote:
>>> Hi Gabriel,
>>>
>>>      For the series:
>>> Acked-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
>>>
>>>      Kishon, could you take care of adding PHY driver patch for v3.20?
>> Hi Kishon,
>>
>>      Don't apply the patch, since we have 2 other PHY driver patches, I will
>> send you a pull request.
> Send me as patches if that is okay.
Ok. Just sent the patches.

Thanks,
Maxime
>
> Thanks
> Kishon
>
>> Best regards,
>> Maxime
>>
>>
>>> Thanks,
>>> Maxime
>>> On 01/14/2015 10:54 AM, Gabriel FERNANDEZ wrote:
>>>> The goal of this series is to enable the support of MiPHY28lp Generic PHY.
>>>>
>>>> The first patch is to update miphy28lp phy driver to access sysconfig register
>>>> offsets via syscfg dt property. It's based on Arnds review comments here
>>>> https://lkml.org/lkml/2014/11/13/161
>>>> I have updated the miphy28lp phy driver same way as Peter's implementation.
>>>>
>>>> Gabriel Fernandez (3):
>>>>     phy: miphy28lp: Pass sysconfig register offsets via syscfg dt
>>>>       property.
>>>>     ARM: DT: STi: STiH407: Add DT node for MiPHY28lp
>>>>     ARM: multi_v7_defconfig: Enable MiPHY28lp - ST's Generic (SATA, PCIe &
>>>>       USB3) PHY
>>>>
>>>>    .../devicetree/bindings/phy/phy-miphy28lp.txt      | 43 ++++++---------
>>>>    arch/arm/boot/dts/stih407-family.dtsi              | 53 +++++++++++++++++++
>>>>    arch/arm/boot/dts/stihxxx-b2120.dtsi               | 11 ++++
>>>>    arch/arm/configs/multi_v7_defconfig                |  1 +
>>>>    drivers/phy/phy-miphy28lp.c                        | 61
>>>> ++++++++++++----------
>>>>    5 files changed, 113 insertions(+), 56 deletions(-)
>>>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
