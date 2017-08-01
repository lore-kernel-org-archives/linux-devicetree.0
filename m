From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 0/3] add the reset controller to the Meson8b clkc
Date: Tue, 01 Aug 2017 12:34:30 -0700
Message-ID: <7ha83jytdl.fsf@baylibre.com>
References: <20170728211313.10603-1-martin.blumenstingl@googlemail.com>
        <1501489667.6834.1.camel@baylibre.com>
        <655f0326-df03-a810-9010-13148aee2db5@baylibre.com>
        <CAFBinCDSTzOj-jZ3du2=+DXOLhn-qM0QxvTq_TKOE8yR0LbT3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAFBinCDSTzOj-jZ3du2=+DXOLhn-qM0QxvTq_TKOE8yR0LbT3w@mail.gmail.com>
        (Martin Blumenstingl's message of "Tue, 1 Aug 2017 20:53:08 +0200")
Sender: linux-clk-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, carlo@caione.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Neil,
>
> On Mon, Jul 31, 2017 at 1:59 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> On 07/31/2017 10:27 AM, Jerome Brunet wrote:
>>> On Fri, 2017-07-28 at 23:13 +0200, Martin Blumenstingl wrote:
>>>> This registers the known (soft) reset lines provided by the clock
>>>> controller's registers.
>>>>
>>>> This is the first preparation step for SMP and CPU hotplug support on
>>>> Meson8/Meson8b/Meson8m2. Booting the secondary cores on these SoCs
>>>> requires asserting and de-asserting a reset line (one for each CPU
>>>> core). These reset lines are provided by the clock controller.
>>>>
>>>> The reset controller part of the meson8b clock controller has to be
>>>> registered early (which I did through CLK_OF_DECLARE_DRIVER), because
>>>> the secondary cores are started *very* early in the boot process (and
>>>> meson8b_clkc_probe is invoked long after we need the reset controller
>>>> to be available for booting the secondary CPU cores).
>>>>
>>>> The user of the reset-controller (= the patches which enable SMP and
>>>> CPU hotplug support) will follow in the next days. I decided to split
>>>> this because the SMP series will probably consist of 6 patches alone
>>>> (and may need to go through two separate trees).
>>>>
>>>> Changes since v2 at [3]:
>>>> - move the reset line preprocessor defines into a separate file
>>>>   (affects patch #1 as this header file is part of the dt-binding)
>>>> - rename the reset line preprocessor macros from RESETID_ to
>>>>   CLKC_RESET_ to clearly indicate that these are provided by the
>>>>   clock controller (unlike the preprocessor macros for the reset
>>>>   lines in the standlone reset controller, which start with RESET_)
>>>> - updated patch #2 due to the changes mentioned above
>>>> - added Neil's Reviewed-by to all patches
>>>>
>>>> Changes since v1 at [0]:
>>>> - updated cover letter description as we are now registering more than
>>>>   four reset lines
>>>> - split patch #1 into a dt-binding and clk driver patch
>>>> - slightly reworded the dt-binding documentation so it's now clear that
>>>>   the reset identifiers are preprocessor macros in
>>>>   dt-bindings/clock/meson8b-clkc.h (v1 of this series didn't have these
>>>>   macros at all)
>>>> - patch #2 (previously part of patch #1) now registers all known reset
>>>>   lines (see [1] and [2] for the results of my detective work)
>>>> - patch #3 is untouched
>>>>
>>>>
>>>> [0] http://lists.infradead.org/pipermail/linux-amlogic/2017-July/004283.html
>>>> [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-July/004330.html
>>>> [2] http://lists.infradead.org/pipermail/linux-amlogic/2017-July/004347.html
>>>> [3] http://lists.infradead.org/pipermail/linux-amlogic/2017-July/004352.html
>>>>
>>>>
>>>> Martin Blumenstingl (3):
>>>>   dt-bindings: clock: meson8b: describe the embedded reset controller
>>>>   clk: meson: meson8b: register the built-in reset controller
>>>>   ARM: dts: meson: mark the clock controller also as reset controller
>>>>
>>>>  .../bindings/clock/amlogic,meson8b-clkc.txt        |   9 +-
>>>>  arch/arm/boot/dts/meson8.dtsi                      |   1 +
>>>>  arch/arm/boot/dts/meson8b.dtsi                     |   1 +
>>>>  drivers/clk/meson/Kconfig                          |   1 +
>>>>  drivers/clk/meson/meson8b.c                        | 159 +++++++++++++++++++-
>>>> -
>>>>  drivers/clk/meson/meson8b.h                        |   9 +-
>>>>  .../dt-bindings/reset/amlogic,meson8b-clkc-reset.h |  27 ++++
>>>>  7 files changed, 193 insertions(+), 14 deletions(-)
>>>>  create mode 100644 include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h
>>>>
>>>
>>> Series looks good to me overall.
>>>
>>> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
>>>
>>> Just one thing, which is not an issue really, I wonder if the dt-bindings
>>> documentation and the bindings them-self should be in separate patches ?
>>>
>>
>> Hi Martin,
>>
>> Anyway it's OK for me, I've applied patches 1 & 2 on the clk-meson's next branches.
> thank you!
> I'm also fine with either way - I chose to include it in the
> dt-bindings patch due to two reasons:
> - my SMP series depends on this header file
> - we typically send header updates with a dt-bindings patch (see your
> AO CEC clock for example)
> with these I thought it makes sense to combine the documentation and
> the header in the dt-bindings patch - if it's an issue I can simply
> change it
>
> may be the DT-maintainers can comment on this?

If it was a new binding, or significant change, it would be better to
send bindings as a separate patch, but in this case, it should be fine.

>> Kevin, patch 3 is all yours !

Applied to v4.14/dt,

Thanks,

Kevin
