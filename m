From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v9 4/6] clocksource: stm32: add clocksource support
Date: Fri, 8 Dec 2017 15:04:42 +0100
Message-ID: <CA+M3ks6uWUQqD-c_FWETDLp097AfUEVs1srpH_C7kK-X8ADQ1Q@mail.gmail.com>
References: <20171208113250.359-1-benjamin.gaignard@st.com>
 <20171208113250.359-5-benjamin.gaignard@st.com> <ac396fdb-1658-d2f3-bd92-b2b9fe04f201@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ac396fdb-1658-d2f3-bd92-b2b9fe04f201@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

2017-12-08 14:46 GMT+01:00 Daniel Lezcano <daniel.lezcano@linaro.org>:
> On 08/12/2017 12:32, Benjamin Gaignard wrote:
>> The stm32 timer hardware is currently only used as a clock event device,
>> but it can be utilized as a clocksource as well.
>>
>> Implement this by enabling the free running counter in the hardware bloc=
k
>> and converting the clock event part from a count down event timer to a
>> comparator based timer.
>
>
> Split this patch in two:
>  - periodic support
>  - clocksource support

No because the way of implementing periodic support depend of how clocksour=
ce
part is implemented on the hardware.
I don't want to code functions that I will completely remove just after

>
>
>
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
