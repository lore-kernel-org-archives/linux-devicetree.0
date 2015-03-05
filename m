From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: Kconfig: Let OF_UNITTEST depend on "I2C=y" and "I2C_MUX=y"
Date: Thu, 5 Mar 2015 14:01:31 -0600
Message-ID: <CAL_JsqLerNgRsmHPCedtfNSO9fZj=cBpe8PF4uZPkVF-Urcxaw@mail.gmail.com>
References: <BLU437-SMTP82811F6F904D6C74EE62E3B91E0@phx.gbl>
 <CAMuHMdXPONxoNm+stn5sx579kzWo6auVP7hrRv26VSGySr7K2A@mail.gmail.com>
 <2530315.qdy5ZZGCEr@wuerfel> <4A33443D-FD39-41F5-B474-33B68C69DC56@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4A33443D-FD39-41F5-B474-33B68C69DC56@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Chen Gang <xili_gchen_5257@hotmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 4, 2015 at 1:58 PM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:
> Hi Arnd,
>
>> On Mar 4, 2015, at 21:49 , Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Wednesday 04 March 2015 16:04:23 Geert Uytterhoeven wrote:
>>>> -       depends on OF_IRQ && OF_EARLY_FLATTREE
>>>> +       depends on OF_IRQ && OF_EARLY_FLATTREE && I2C=3Dy && I2C_M=
UX=3Dy
>>>
>>> ... I think it would be better to replace "#if IS_ENABLED(CONFIG_XX=
X)" by
>>> "#ifdef CONFIG_XXX" in drivers/of/unittest.c instead.
>>>
>>
>> Agreed. I came across the same bug and came to the same conclusion a=
s you.
>>
>> How about this:
>>
>> 8<----
>> Subject: of: unittest: fix I2C dependency

[...]

>> -#if IS_ENABLED(CONFIG_I2C)
>> +#if IS_BUILTIN(CONFIG_I2C)
>>       if (selftest(of_selftest_overlay_i2c_init() =3D=3D 0, "i2c ini=
t failed\n"))
>>               goto out;
>>
>>
>
> Patch is fine. I=E2=80=99ll pick it up for the next batch of overlay =
patches.

Do you have other things that need to go into 4.0? If not I'll pick thi=
s up.

Rob
