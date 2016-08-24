From: Vinay Simha <simhavcs@gmail.com>
Subject: Re: [RESEND] [PATCH v2 2/4] dt-bindings: Add jdi lt070me05000 panel bindings
Date: Wed, 24 Aug 2016 22:54:36 +0530
Message-ID: <CAGWqDJ7sOYW0E5-dUyRZu5A30bjaB3PiMbzVTuB+se76ehvzsQ@mail.gmail.com>
References: <1469978126-925-1-git-send-email-simhavcs@gmail.com>
 <1469978126-925-2-git-send-email-simhavcs@gmail.com> <20160824114534.GA3169@ulmo.ba.sec>
 <CAGWqDJ7L3DPKo9iHT4+FZvksO8hbwQ4Zfb5qVrTEwmYcXb_U2A@mail.gmail.com> <20160824123246.GA3714@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160824123246.GA3714@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Archit Taneja <archit.taneja@gmail.com>, John Stultz <john.stultz@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

 - dcdc-en-gpios: power IC supply enable

i cannot make this as gpios, since pm8921_lvs7 is a regulator.
We can make gpio as regulator, but not regulator as gpio.

other option i have to map pm8921_lvs7 to iovcc-supply and pm8921_gpio
23 to dcdc-en-gpios.

Since we do not have nx7 schematic not sure which pins are mapped in
hardware, other than the src code reference. Even in the 3.4 source
code gpio/pin/regulator mappings and naming are not proper in
board-flo-display.c

What is your suggestion?

On Wed, Aug 24, 2016 at 6:02 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Wed, Aug 24, 2016 at 05:34:55PM +0530, Vinay Simha wrote:
>> thierry,
>>
>> this is the reference pinouts of the panel
>> http://www.tonylabs.com/wp-content/uploads/LT070ME05000-pinouts.jpg
>
> I can't open that file.
>
>> as you suggest , i will change the vcc-supply,
>>
>>  - iovcc-supply: phandle of the regulator that supplies power to
>>           the IOVCC voltage input (1.8 V)
>>
>> will keep the other two(vddp-supply, dcdc_en-supply) remaining same.
>
> "dcdc_en" sounds to me like it should be a GPIO rather than a regulator.
>
> According to this datasheet:
>
>         http://kb.52solution.com/data/uploads/2016/04/07/3172846545705cc22d050e.pdf
>
> the input voltages are indeed VDD, VDDp and IOVCC, though with slightly
> larger tolerances than the previous datasheet. VDD and VDDp can both go
> from 3.0 V to 5.0 V. DCDC_EN is indeed an additional GPIO to enable the
> VDDp supply.
>
> I think you'd need something along these lines:
>
>         - vdd-supply: LED power supply (3.0-5.0 V)
>         - vddp-supply: power IC supply (3.0-5.0 V)
>         - iovcc-supply: LCM power supply (1.8 V)
>         - dcdc-en-gpios: power IC supply enable
>         - led-en-gpios: LED backlight enable
>
> Or perhaps your vddp-supply should be a regulator that's controlled by
> the GPIO that you'd put in dcdc-en-gpios. That might work better. That
> would leave only led-en-gpios as the only enable GPIOs property, so it
> would be okay to keep the name "enable-gpios", I guess.
>
> Thierry
>
>> On Wed, Aug 24, 2016 at 5:15 PM, Thierry Reding
>> <thierry.reding@gmail.com> wrote:
>> > On Sun, Jul 31, 2016 at 08:45:21PM +0530, Vinay Simha BN wrote:
>> >> Add documentation for lt070me05000 panel
>> >>
>> >> Cc: Archit Taneja <archit.taneja@gmail.com>
>> >> Cc: John Stultz <john.stultz@linaro.org>
>> >> Cc: Thierry Reding <thierry.reding@gmail.com>
>> >> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> >> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
>> >> Acked-by: Rob Herring <robh@kernel.org>
>> >>
>> >> ---
>> >> v2:
>> >>  * incorporated rob herring and thierry reviews
>> >>    gpio to gpios, gpio to regulator using fixed regulators
>> >>    and pwm backlight is removed, since it is controlled by
>> >>    dcs commands
>> >> ---
>> >>  .../bindings/display/panel/jdi,lt070me05000.txt    | 57 ++++++++++++++++++++++
>> >>  1 file changed, 57 insertions(+)
>> >>  create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
>> >> new file mode 100644
>> >> index 0000000..613b76f
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
>> >> @@ -0,0 +1,57 @@
>> >> +JDI model LT070ME05000 1200x1920 7" DSI Panel
>> >> +
>> >> +Required properties:
>> >> +- compatible: should be "jdi,lt070me05000"
>> >> +- vddp-supply: phandle of the regulator that provides the supply voltage
>> >> +  Power IC supply (3-5V)
>> >> +- dcdc_en-supply: phandle of the regulator that provides the supply voltage
>> >> +  Power IC supply enable, High active
>> >> +- vcc-supply: phandle of the regulator that provides the supply voltage
>> >> +  IOVCC , power supply for LCM (1.8V)
>> >
>> > I was just going to apply this and wanted to add some information about
>> > how many lanes the panel uses, so I looked at the datasheet linked to in
>> > patch 4/4:
>> >
>> >         http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datasheet
>> >
>> > and noticed that the power supplies in the binding here don't match the
>> > ones listed in the datasheet. Granted, the datasheet is somewhat meager,
>> > but it lists the following three input voltages:
>> >
>> >         - IOVCC at 1.8 V
>> >         - VDD at 3.0 V
>> >         - VDDP at 3.0 V
>> >
>> > This matches in part what the above binding describes, but it's not
>> > quite right, so I'm wondering if the name for dcdc_en-supply came from
>> > the board schematics and reflects the name of the rail on the board
>> > design that provides this rather than the input voltage on the panel.
>> >
>> > I think we should follow the names in the panel datasheet so that people
>> > can more easily reference the correct regulators when using this panel
>> > on a different board. I'd suggest:
>> >
>> >         - iovcc-supply: phandle of the regulator that supplies power to
>> >           the IOVCC voltage input (1.8 V)
>> >         - vdd-supply: phandle of the regulator that supplies power to
>> >           the VDD voltage input (3.0 V)
>> >         - vddp-supply: phandle of the regulator that supplies power to
>> >           the VDDP voltage input (3.0 V)
>> >
>> > Any objections?
>> >
>> > Thierry
>>
>>
>>
>> --
>> regards,
>> vinaysimha



-- 
regards,
vinaysimha
