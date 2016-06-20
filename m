From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Auto-detecting touchscreen controller and dealing
 with hw configuration differences on q8 tablets
Date: Mon, 20 Jun 2016 19:22:57 +0800
Message-ID: <314411466421777@web20m.yandex.ru>
References: <bc978925-46a4-c069-8793-903a87ec70b8@redhat.com>
	 <5E70AD96-4E8E-4430-AF99-0AA0FCF5F8E7@konsulko.com> <17e69e9e-06be-dc4f-cd47-152f6290d2ec@redhat.com>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBF5ET65QKGQEYNH2MXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <17e69e9e-06be-dc4f-cd47-152f6290d2ec-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>, "u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org" <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I'm also a user of an A33 Q8 tablet with GSL1680.

However, I think a devicetree-per-device structure is not unacceptable...

We can still have sun{5,8}i-q8.common.dtsi, and write most of the q8 codes =
there.

Then the device dt can only contain wifi, touchscreen, accelerometer. (afte=
r including sun{5,8}i-q8-common.dtsi)

(On my tablet,
wifi(esp8089) should use "broken-cd" instead of "non-removable".
Touchscreen have a weird chip/firmware that cannot even set a correct STATU=
S.
And mma8452 iio driver will refuse to work if the chip number in dt is the =
same as the real chip, even the chip id can be probed)


20.06.2016, 19:07, "Hans de Goede" <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>:
> Hi,
>
> On 20-06-16 11:27, Pantelis Antoniou wrote:
>> =C2=A0Hi Hans,
>>
>> =C2=A0I=E2=80=99m going to commend only on the overlay related parts sin=
ce I=E2=80=99m not I
>> =C2=A0get all the nuances right.
>
> No problem and thanks for the answer anyways!
>
>>> =C2=A0On Jun 19, 2016, at 14:06 , Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> w=
rote:
>
> <snip>
>
>>> =C2=A02) Give the user some way to override the dts settings.
>>>
>>> =C2=A0Which after a somewhat long intro brings me to the actual purpose=
 of this thread, discuss
>>> =C2=A0how to best deal with this. I again see 2 options:
>>>
>>> =C2=A01) Put a disabled gsl1680 node in the dts file, have a q8_autodet=
ect.c in u-boot
>>> =C2=A0which probes i2c and if it finds the gsl1680 nodes enables it, an=
d patches in a best-effort
>>> =C2=A0default for which fw file to use. Allow the user to set a touchsc=
reen_fw u-boot env
>>> =C2=A0variable which will override this. Also allow the user to set a t=
ouchscreen_inverted_x env
>>> =C2=A0variable to add inverted-x to the dt node for the gsl1680.
>>
>> =C2=A0That can work. The problem is that having anything requiring smart=
s in u-boot always
>> =C2=A0leads to trouble with users. It all depends on your user=E2=80=99s=
 technical proficiency, if
>> =C2=A0they are comfortable tweaking things in u-boot it=E2=80=99s fine. =
If it=E2=80=99s not, expect lots of
>> =C2=A0bricked boards when they mess up.
>>
>>> =C2=A02) Write an in kernel overlay manager which does auto-detect as d=
escribed by 1, and
>>> =C2=A0loads an overlay for the detected touchscreen controller, with mo=
dule options to allow
>>> =C2=A0specifying the fw-file, x-inversion, etc.
>>>
>>> =C2=A0One things which worries me about 2. is that we would need to hav=
e 2 overlay files
>>> =C2=A0per fw-file, one regular config, one inverted-x, or is it possibl=
e for the overlay
>>> =C2=A0manager to modify an overlay before applying it ?
>>
>> =C2=A0Yes, it=E2=80=99s quite possible. You can even have stacked overla=
ys.
>
> Ok, is there any example code how to change an overlay before applying it=
 out there,
> or if not can you point to the functions to use to do this ?
>
> Specifically my plan is to:
>
> 1) Have a single overlay for q8 tablets with gsl1680 tablets
>
> 2) Write an in kernel overlay manager which when it detects a gsl1680 tou=
chscreen
> will pick a best-default firmware-file + matching resolution + swap-x-y b=
ased on
> which SoC (A13/A23/A33) the tablet is based on as well as the gsl1680's c=
hip-id
> and will then "patch" this info into the overlay before applying it. This
> means being able to set / modify several string, int and bool dt properti=
es.
>
> 3) Offer a kernel-module option for the overlaymanager which will allows
> overriding the defaults for the firmware-filename, etc. This is also
> why I want to go with the patch approach instead of having multiple
> dt-overlay files.
>
> Thanks & Regards,
>
> Hans
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
