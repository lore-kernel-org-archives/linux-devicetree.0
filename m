From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/5] regulator: add documentation for regulator modes
 and suspend states
Date: Wed, 12 Dec 2018 07:32:52 -0600
Message-ID: <CAL_JsqKk99GrQaqVyXSr_ZwQd_nnuMOWnz_0ehS1dHZoEmxDCw@mail.gmail.com>
References: <1543319801-19100-1-git-send-email-claudiu.beznea@microchip.com>
 <1543319801-19100-6-git-send-email-claudiu.beznea@microchip.com>
 <20181211221324.GA14658@bogus> <442be9e4-621f-c668-c627-264084ef975a@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <442be9e4-621f-c668-c627-264084ef975a@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Beznea <Claudiu.Beznea@microchip.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <Nicolas.Ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <Ludovic.Desroches@microchip.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 12, 2018 at 3:13 AM <Claudiu.Beznea@microchip.com> wrote:
>
>
>
> On 12.12.2018 00:13, Rob Herring wrote:
> > On Tue, Nov 27, 2018 at 11:57:25AM +0000, Claudiu.Beznea@microchip.com wrote:
> >> From: Claudiu Beznea <claudiu.beznea@microchip.com>
> >>
> >> Add documentation for regulator modes and suspend states.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> >> ---
> >>  .../bindings/regulator/act8945a-regulator.txt      | 34 ++++++++++++++++++++++
> >>  1 file changed, 34 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/regulator/act8945a-regulator.txt b/Documentation/devicetree/bindings/regulator/act8945a-regulator.txt
> >> index ac955dea00d1..4017527619ab 100644
> >> --- a/Documentation/devicetree/bindings/regulator/act8945a-regulator.txt
> >> +++ b/Documentation/devicetree/bindings/regulator/act8945a-regulator.txt
> >> @@ -15,11 +15,17 @@ Optional input supply properties:
> >>    - inl67-supply: The input supply for REG_LDO3 and REG_LDO4
> >>
> >>  Any standard regulator properties can be used to configure the single regulator.
> >> +regulator-initial-mode, regulator-allowed-modes and regulator-mode could be
> >> +specified using mode values from dt-bindings/regulator/active-semi,8945a-regulator.h
> >> +file.
> >>
> >>  The valid names for regulators are:
> >>      REG_DCDC1, REG_DCDC2, REG_DCDC3, REG_LDO1, REG_LDO2, REG_LDO3, REG_LDO4.
> >>
> >>  Example:
> >> +
> >> +#include <dt-bindings/regulator/active-semi,8945a-regulator.h>
> >
> > This file belongs in this patch.
>
> I'm using the defines in this file also in driver. I was thinking that if I
> would include this file in this patch the driver compilation would fail if
> the patches would be accepted via different trees.

They won't be.

> Would you like me to have different defines in driver and this new header
> or could happen that these patches to be included in the main tree via the
> same tree (e.g. regulator tree)?

No need for different defines. The subsystem maintainer will take
everything in this case.

Rob
