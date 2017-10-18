From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v6 2/5] clocksource: stm32: convert driver to timer_of
Date: Wed, 18 Oct 2017 21:32:09 +0200
Message-ID: <CA+M3ks4Eg2-S8yDZuMd-jqZ6g2efvveU_WwQEh0rPZW0fGDt3w@mail.gmail.com>
References: <1508331506-23782-1-git-send-email-benjamin.gaignard@linaro.org>
 <1508331506-23782-3-git-send-email-benjamin.gaignard@linaro.org> <alpine.DEB.2.20.1710182028080.2477@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1710182028080.2477@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Ludovic Barre <ludovic.barre@st.com>, Julien Thierry <julien.thierry@arm.com>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2017-10-18 20:31 GMT+02:00 Thomas Gleixner <tglx@linutronix.de>:
> On Wed, 18 Oct 2017, Benjamin Gaignard wrote:
>
>> Convert driver to use timer_of helpers. This allow to remove
>> custom proprietary structure.
>>
>> Increase min delta value because if it is too small it could
>> generate too much interrupts and the system will not be able
>> to catch them all.
>
> This does two completely independent changes at once. What the heck has
> increasing min delta to do with converting it to timer_of() helpers?
>
> Nothing at all. So please split this into two distinct patches. Each doin=
g
> ONE thing.

I will do that.

>
> See Documentation/process/submitting-patches.rst:
>
>   3) Separate your changes
>   ------------------------
>
>   Separate each **logical change** into a separate patch.
>
> Reading, understanding and complying with that document is not optional.
>
> Thanks,
>
>         tglx



--=20
Benjamin Gaignard

Graphic Study Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

Follow Linaro: Facebook | Twitter | Blog
