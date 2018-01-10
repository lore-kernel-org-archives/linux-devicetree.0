From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 0/7] ARM: dts: STi: Fix DT dtc warnings
Date: Wed, 10 Jan 2018 21:52:22 +0100
Message-ID: <CAK8P3a0MTfmNZNnXQcgDWo8dhGAQkkKVdTJhjRvpRi_0L_wXTA@mail.gmail.com>
References: <1515572469-19276-1-git-send-email-patrice.chotard@st.com>
 <CAK8P3a2qgyJ8Hgr6fLnn6jVRhHVtcc1kxzyD2N7Bb7gzPe1xfg@mail.gmail.com> <20f04806-2f33-3c16-d790-4a93c4c7187a@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20f04806-2f33-3c16-d790-4a93c4c7187a-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 10, 2018 at 6:17 PM, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org> wrote:
> Hi Arnd
>
> On 01/10/2018 04:52 PM, Arnd Bergmann wrote:
>> On Wed, Jan 10, 2018 at 9:21 AM,  <patrice.chotard-qxv4g6HH51o@public.gmane.org> wrote:
>>> From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
>>>
>>> This series fixes all dtc warnings related to STi platforms dt files.
>>> It has been triggered by Rob Herring [1]
>>>
>>> [1] https://www.spinics.net/lists/devicetree/msg206209.html
>>>
>>> For most of implicated node, a simple move outside the soc node
>>> solves the warnings.
>>>
>>> Patrice Chotard (7):
>>>    ARM: dts: STi: fix bindings notation
>>>    ARM: dts: STi: Add gpio polarity for "hdmi,hpd-gpio" property
>>>    ARM: dts: STi: Move clocks without reg outside soc
>>>    ARM: dts: STi: Move leds node outside soc node
>>>    ARM: dts: STi: Move usb2_picophyX nodes without reg out of soc
>>>    ARM: dts: STi: Move sound related nodes without reg out of soc
>>>    ARM: dts: STi: Add fake reg property for sti-display-subsystem
>>
>> Thanks a lot for addressing these!
>>
>> As far as I can tell, there is one patch in particular that addresses a warning
>> we get at the default warning level: "ARM: dts: STi: Add gpio polarity for
>> "hdmi,hpd-gpio" property". Should we merge that one for 4.15 to get closer
>> to a clean build again? I'm not sure whether we can address the other
>
> How do you want to proceed with this particular patch ?
> Do you want me to send a pull-request with this patch ?
>
> Patrice

I'd just pick it up directly into the arm-soc fixes branch if that
works for you.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
