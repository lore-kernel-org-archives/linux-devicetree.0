From: Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: How to select between different display timings?
Date: Fri, 14 Feb 2014 18:35:25 +0100
Message-ID: <52FE53DD.7040102@gmail.com>
References: <1375966287-6784-1-git-send-email-LW@KARO-electronics.de> <1375966287-6784-8-git-send-email-LW@KARO-electronics.de> <52FE1F2D.4010102@de.bosch.com> <20140214150208.12417b11@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140214150208.12417b11-VjFSrY7JcPWvSplVBqRQBQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 14.02.2014 15:02, schrieb Lothar Wa=C3=9Fmann:
> Hi,
>
> Dirk Behme wrote:
>> Hi Lothar and Shawn,
>>
>> On 08.08.2013 14:51, Lothar Wa=C3=9Fmann wrote:
>>> - add Copyright header
>>> - use label references for better readability
>>> - sort the entries alphabetically
>>> - add some aliases used by U-Boot to edit the DT data
>>>
>>> Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
>>> ---
>>>    arch/arm/boot/dts/imx28-tx28.dts |  693 ++++++++++++++++++++++++=
+++++++++-----
>>>    1 files changed, 611 insertions(+), 82 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/i=
mx28-tx28.dts
>>> index 37be532..866af60 100644
>>> --- a/arch/arm/boot/dts/imx28-tx28.dts
>>> +++ b/arch/arm/boot/dts/imx28-tx28.dts
>> ...
>>> +&lcdif {
>>> +       pinctrl-names =3D "default";
>>> +       pinctrl-0 =3D <&lcdif_24bit_pins_a &lcdif_sync_pins_a &lcdi=
f_ctrl_pins_a>;
>>> +       lcd-supply =3D <&reg_lcd>;
>>> +       display =3D <&display>;
>>> +       status =3D "okay";
>>> +
>>> +       display: display@0 {
>>> +               bits-per-pixel =3D <32>;
>>> +               bus-width =3D <24>;
>>> +
>>> +               display-timings {
>>> +                       native-mode =3D <&timing5>;
>                              ^^^^^^^^^^^^^^^^^^^^^^^^^
>>> +                       timing0: timing0 {
> [...]
>>> +                       };
>>> +               };
>>> +       };
>>> +};
>>
>> Being no graphics expert, looking at above device tree change, I'd l=
ike
>> to understand how this can be used to switch between different displ=
ay
>> timings?
>>
>> In the kernel, I've found the code which selects the default/native-=
mode
>> (of_display_timing.c). But, as here, if there is a native/default mo=
de,
>> there are alternative modes. I haven't understood how and who to sel=
ect
>> these other modes? In this case, how could the alternative modes
>> timing0/1/2/3/4 be selected in the kernel?
>>
>> Do you have any pointers regarding this?
>>
> You need to set the property 'native-mode' to the phandle of the
> display-timings entry like marked above.

Hmm, let's see if we talk about the same thing ;) Let me rephrase my=20
questions:

Using above example and booting a system with the resulting .dtb,=20
timing5 is selected at boot time, correct?

Assuming I want to use timing1 instead: who would set when the=20
property 'native-mode' to &timing1?

Can the switch to

native-mode =3D <&timing1>;

only be done at compile time of the dts -> dtb? Or can this be done at=20
boot/kernel run time, too?

In the end, I'm looking for a way to have several timings like above=20
in the device tree, and select one at kernel boot time based on the=20
display detected. Would this be possible?

Many thanks and best regards

Dirk


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
