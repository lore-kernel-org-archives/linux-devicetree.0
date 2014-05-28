MIME-Version: 1.0
Sender: robherring2@gmail.com
In-Reply-To: <5376959.IId6jNFDDg@wuerfel>
References: <1399586896-16906-1-git-send-email-linus.walleij@linaro.org>
	<CAL_JsqLN_f1uvrY6w7J7ZcR9pfM0_XKYMQ5YU8F4yAcMW+oDGw@mail.gmail.com>
	<CACRpkdaqsVUDA+6NC=EQmxcnDAnJEfPNYoptrEv=nq=eZEbA_g@mail.gmail.com>
	<5376959.IId6jNFDDg@wuerfel>
Date: Wed, 28 May 2014 17:47:03 -0500
Message-ID: <CAL_Jsq+R4w0FJzyHJu_cO7wOxWyHSXg-Oqz_yLnZwWd1sQ0GvA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: realview: basic device tree implementation
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Thomas Gleixner <tglx@linutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Thu, May 22, 2014 at 8:36 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday 22 May 2014 15:30:39 Linus Walleij wrote:
>> >> +       parent =3D soc_device_to_device(soc_dev);
>> >
>> > We really need to standardize this soc device stuff so that platforms
>> > always have a parent soc device or not.
>>
>> Arnds position is that the entire platform/board should not be
>> a "soc device" and that seems correct since the board is no SoC.
>>
>> So I will spin this off into a SoC driver and push under
>> drivers/soc and bind to the SoC node in the device tree.
>
> To be clear, this has nothing to do with whether this is strictly a SoC
> or not. I would still want to see all the internal components of the
> main chip under the soc node, and probably anything that is attached
> to one of its interfaces under those nodes. The parts that should not
> be under /soc are the ones that are not in the device hierarchy, such
> as external clock generators.

Pretty much everything is an SOC these days. And there is really no way to =
tell what is the SOC boundary in DT. Perhaps it is just all devices handled=
 by the top-level of_platform_populate call.

If this is the route we want to go, I don't think it should be left to the =
whim of the platforms. We should have some sort of default/generic SOC devi=
ce until a more specific device is added or SOCs just add data to the gener=
ic device instead of making their own. With Pawel's vexpress clean-up that =
just got pulled into arm-soc for 3.16, we can now call of_platform_populate=
 multiple times on the DT root. This means we can get rid of most of_platfo=
rm_populate calls in platforms.
