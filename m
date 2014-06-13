MIME-Version: 1.0
In-Reply-To: <3915682.bldtqrJ6U5@avalon>
References: <1397042790-10636-1-git-send-email-s.nawrocki@samsung.com>
	<CAL_JsqKDJ_yFxFYnrTtmzMPoxO2rmypiujybwbhUh35y1LS-Mw@mail.gmail.com>
	<5347DF4D.5000005@samsung.com>
	<3915682.bldtqrJ6U5@avalon>
Date: Fri, 13 Jun 2014 09:34:47 -0500
Message-ID: <CAL_Jsq+G9M9OWmb4n5m3iL1SPh=jCyGFtm5Zyqd5J3ekhKE34Q@mail.gmail.com>
Subject: Re: [PATCH RFC v5 2/2] clk: Add handling of clk parent and rate
 assigned from DT
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mike Turquette <mturquette@linaro.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Sascha Hauer <s.hauer@pengutronix.de>, Ben Dooks <ben.dooks@codethink.co.uk>, Peter De Schrijver <pdeschrijver@nvidia.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tero Kristo <t-kristo@ti.com>, sw0312.kim@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <t.figa@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 11, 2014 at 8:08 AM, Laurent Pinchart <laurent.pinchart@ideason=
board.com> wrote:
> On Friday 11 April 2014 14:25:49 Sylwester Nawrocki wrote:
>> On 10/04/14 18:04, Rob Herring wrote:
>> > On Wed, Apr 9, 2014 at 6:26 AM, Sylwester Nawrocki wrote:
>> >> This patch adds a helper function to configure clock parents and
>> >> rates as specified in clock-parents, clock-rates DT properties
>> >> for a consumer device and a call to it before driver is bound to
>> >> a device.
>> >>
>> >> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> >> ---
>>
>> [...]
>>
>> >> ---
>> >>
>> >>  .../devicetree/bindings/clock/clock-bindings.txt   |   44 ++++++++++
>> >>  drivers/base/platform.c                            |    5 ++
>> >>  drivers/clk/Makefile                               |    3 +
>> >>  drivers/clk/clk-conf.c                             |   85 ++++++++++=
++++
>> >>  drivers/clk/clk.c                                  |   12 ++-
>> >>  include/linux/clk/clk-conf.h                       |   19 +++++
>> >>  6 files changed, 167 insertions(+), 1 deletion(-)
>> >>  create mode 100644 drivers/clk/clk-conf.c
>> >>  create mode 100644 include/linux/clk/clk-conf.h
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.t=
xt
>> >> b/Documentation/devicetree/bindings/clock/clock-bindings.txt index
>> >> 700e7aa..93513fc 100644
>> >> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> >> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> >> @@ -132,3 +132,47 @@ clock signal, and a UART.
>> >>    ("pll" and "pll-switched").
>> >>  * The UART has its baud clock connected the external oscillator and =
its
>> >>    register clock connected to the PLL clock (the "pll-switched" sign=
al)
>> >> +
>> >> +=3D=3DAssigned clock parents and rates=3D=3D
>> >> +
>> >> +Some platforms require static initial configuration of parts of the
>> >> clocks
>> >> +controller. Such a configuration can be specified in a clock consume=
r
>> >> node
>> >> +through clock-parents and clock-rates DT properties. The former shou=
ld
>> >> +contain a list of parent clocks in form of phandle and clock specifi=
er
>> >> pairs,
>> >> +the latter the list of assigned clock frequency values (one cell eac=
h).
>> >> +To skip setting parent or rate of a clock its corresponding entry sh=
ould
>> >> be
>> >> +set to 0, or can be omitted if it is not followed by any non-zero en=
try.
>> >> +
>> >> +    uart@a000 {
>> >> +        compatible =3D "fsl,imx-uart";
>> >> +        reg =3D <0xa000 0x1000>;
>> >> +        ...
>> >> +        clocks =3D <&clkcon 0>, <&clkcon 3>;
>> >> +        clock-names =3D "baud", "mux";
>> >> +
>> >> +        clock-parents =3D <0>, <&pll 1>;
>> >> +        clock-rates =3D <460800>;
>> >
>> > Is this the input frequency or serial baud rate? Looks like a baud
>> > rate, but the clock framework needs input (to the uart) frequency. I
>> > would say this should be clock-frequency and specify the max baud rate
>> > as is being done with i2c bindings. The uart driver should know how to
>> > convert between input clock freq and baud rate.
>>
>> This UART example is not quite representative for the issues I have been
>> trying to address with this patch set. There is a need to set (an initia=
l)
>> input clock frequency. E.g. in case of multimedia devices there may be
>> a need to set clock parent and frequency of an input clock to multiple I=
P
>> blocks, so they are clocked synchronously and data is carried properly
>> across a whole processing chain. Thus there may not be even clock output
>> in an IP block, but still input clock needs to be set. IIUC there is
>> similar issue with audio, where it is difficult to calculate the clock
>> frequencies/determine parent clocks in individual drivers algorithmicall=
y.
>
> Just to be used as an example, this is how the SMIA++ sensor driver compu=
tes
> the PLL parameters automatically based on the input frequency, desired ou=
tput
> frequency and various hardware limits.
>
> http://lxr.free-electrons.com/source/drivers/media/i2c/smiapp-pll.c
>
> See the code complexity and keep in mind that it only handles a single de=
vice
> with a single set of constraints and a single parent. If we add several
> devices to the mix, as well as selectable parents, there would indeed pro=
bably
> be no sane way to configure the clocks algorithmically.

How much of this complexity is PLL/clock constraints vs. consumer constrain=
ts. From the consumer side, is it not just a problem of for a given resolut=
ion and frame rate you need a minimum frequency of X and the maximum freque=
ncy of Y that a sensor can handle? clk_round_rate has long needed to be ext=
ended to be able to specify rounding criteria.

How many clocks really need to be configured? I would think it is only a ha=
ndful (audio, display, camera). Trying to solve this generically may not be=
 worth it in terms of binding complexity. Both trying to configure things d=
ynamically or parsing DT to get the configuration add a lot of complexity f=
or what is going to boil down to a few clock controller register writes. Yo=
u could just do all that in the bootloaders and be done with it. Perhaps it=
 would be simpler to just define clock controller node specific properties =
which have enough information to do the configuration.


Rob
