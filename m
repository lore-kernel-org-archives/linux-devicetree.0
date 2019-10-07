From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [RFCv1 5/5] arm64/ARM: configs: Change CONFIG_PWM_MESON from m to y
Date: Mon, 07 Oct 2019 15:57:59 -0700
Message-ID: <7hsgo4cgeg.fsf@baylibre.com>
References: <20191007131649.1768-1-linux.amoon@gmail.com> <20191007131649.1768-6-linux.amoon@gmail.com> <CAFBinCAoJLZj9Kh+SfF4Q+0OCzac2+huon_BU=Q3yE7Fu38U3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCAoJLZj9Kh+SfF4Q+0OCzac2+huon_BU=Q3yE7Fu38U3w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> On Mon, Oct 7, 2019 at 3:17 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index c9a867ac32d4..72f6a7dca0d6 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -774,7 +774,7 @@ CONFIG_MPL3115=m
>>  CONFIG_PWM=y
>>  CONFIG_PWM_BCM2835=m
>>  CONFIG_PWM_CROS_EC=m
>> -CONFIG_PWM_MESON=m
>> +CONFIG_PWM_MESON=y
>
> some time ago I submitted a similar patch for the 32-bit SoCs
> it turned that that pwm-meson can be built as module because the
> kernel will run without CPU DVFS as long as the clock and regulator
> drivers are returning -EPROBE_DEFER (-517)

On 64-bit SoCs, the kernel boots with PWM as a module also, but DVFS
only works sometimes, and making it built-in fixes the problem.
Actually, it doesn't fix, it just hides the problem, which is likely a
race or timeout happening during deferred probing.

> did you check whether there's some other problem like some unused
> clock which is being disabled at that moment?
> I've been hunting weird problems in the past where it turned out that
> changing kernel config bits changed the boot timing - that masked the
> original problem

Right, I would definitely prefer to not make this built-in without a lot
more information to *why* this is needed.  In figuring that out, we'll
probably find the race/timeout that's the root cause.

Kevin
