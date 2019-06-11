From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/3] Documentation: dt-bindings: add the Amlogic Meson
 Temperature Sensor
Date: Tue, 11 Jun 2019 19:57:59 +0200
Message-ID: <CAFBinCBCUxZjnrRxFHApp4iwPUCQQ+PU54V6zJew8Sr8La3u7w@mail.gmail.com>
References: <20190604144714.2009-1-glaroque@baylibre.com> <20190604144714.2009-2-glaroque@baylibre.com>
 <CAFBinCBN4QC2tPDEQmTW_c+PP5yu2qoK5M1eSye=SmvpieKWQg@mail.gmail.com> <d68aae23-f877-1f65-94a4-79e909ae111a@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d68aae23-f877-1f65-94a4-79e909ae111a@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, khilman@baylibre.com, linux-kernel@vger.kernel.org, jic23@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Tue, Jun 11, 2019 at 1:01 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 06/06/2019 21:16, Martin Blumenstingl wrote:
> > Hi Guillaume,
> >
> > thank you for working on this!
> >
> > On Tue, Jun 4, 2019 at 4:47 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
> >>
> >> This adds the devicetree binding documentation for the Temperature
> >> Sensor found in the Amlogic Meson G12 SoCs.
> >> Currently only the G12A SoCs are supported.
> > so G12B is not supported (yet)?
>
> G12B is 95% similar as G12A, it will certainly use slighly different values.
OK, thank you for clarifying this
as far as I can tell Guillaume's code is already prepared for that (as
there's a per-instance specific struct with settings for the specific
instance) which is good to know

> >
> >> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> >> ---
> >>  .../iio/temperature/amlogic,meson-tsensor.txt | 31 +++++++++++++++++++
> >>  1 file changed, 31 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt b/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
> >> new file mode 100644
> >> index 000000000000..d064db0e9cac
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
> >> @@ -0,0 +1,31 @@
> >> +* Amlogic Meson Temperature Sensor
> >> +
> >> +Required properties:
> >> +- compatible:  depending on the SoC and the position of the sensor,
> >> +               this should be one of:
> >> +               - "amlogic,meson-g12a-cpu-tsensor" for the CPU G12A SoC sensor
> >> +               - "amlogic,meson-g12a-ddr-tsensor" for the DDR G12A SoC sensor
> >> +               followed by the common :
> >> +               - "amlogic,meson-g12a-tsensor" for G12A SoC family
> >> +- reg:         the physical base address and length of the registers
> >> +- interrupts:  the interrupt indicating end of sampling
> >> +- clocks:      phandle identifier for the reference clock of temperature sensor
> >> +- #io-channel-cells: must be 1, see ../iio-bindings.txt
> > have you considered using the thermal framework [0] instead of the iio
> > framework (see below)?
>
> Question: why thermal, and not hwmon ? what's the main difference ?
this is what came to my mind why the thermal framework fits best (at
least based on my current knowledge):
a) the thermal-zones (see meson-gxm-khadas-vim2.dts for example) a
"thermal-sensors" property. so for active (with a fan) or passive (by
limiting the maximum frequency and thus the supply voltage) cooling we
need a thermal device anyways
b) the thermal bindings support multiple trip points. we can map them
to one of the four interrupts which the IP block can generate
c) defining a temperature where the chip will power off sounds like a
use-case which may be implemented by other thermal IP blocks (in other
words: maybe the thermal frameworks provides some generic property to
replace the "amlogic,critical-temperature" property)
d) as far as I know you can tell the thermal framework to create a
hwmon device with only a couple (5?) lines of code

as Guillaume has already shown we can implement c) with a custom
property, but that's not limited to the underlying framework (IIO,
hwmon, thermal, ...)

use-case d) is not a strong one because I'm using iio-hwmon to create
a hwmon device on the 32-bit SoCs.
however, together with case a) using an IIO driver is going to be more
difficult because currently there's "only" a "generic-adc-thermal"
binding (but not a "generic-iio-temperature-thermal" binding)

the initial driver version doesn't have to support everything I listed above.
however, I believe with the thermal framework we don't limit ourselves
to one use-case and can extend the driver in the future


Martin
