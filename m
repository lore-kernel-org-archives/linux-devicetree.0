Return-Path: <SRS0=4JHJ=IY=martin.sperl.org=kernel@kernel.org>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH V4 0/3] Microchip mcp25xxfd can controller driver
From: kernel@martin.sperl.org
In-Reply-To: <20180514160313.29597-1-kernel@martin.sperl.org>
Date: Wed, 6 Jun 2018 19:32:29 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <6C9DAC2E-F20A-4FCE-A585-6DBCEEF97D08@martin.sperl.org>
References: <20180514160313.29597-1-kernel@martin.sperl.org>
To: linux-can@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Wolfgang Grandegger <wg@grandegger.com>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Marcel Birthelmer <Marcel.Birthelmer@microchip.com>, Sukkin Pang <skp@skpang.co.uk>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>
List-ID: <devicetree@vger.kernel.org>

Hi!

Any updates/feedback on this driver?

It has been sitting here almost unchanged for the last 4 month without =
any feedback (except for Rob).

What is still needed to get it included?

As far as I see all the comments from end of November have been =
addressed already in V2 of this patch series=E2=80=A6

Note also that:
Tested-by: Gerhard Bertelsmann <info@gerhard-bertelsmann.de>
(from January)

Thanks,
	Martin



> On 14.05.2018, at 18:03, kernel@martin.sperl.org wrote:
>=20
> From: Martin Sperl <kernel@martin.sperl.org>
>=20
> This patchset adds a driver for the mcp25xxfd CanFD controller.
>=20
> Most of the features of the controller are supported by this
> driver release.
>=20
> The controller includes a few features that the current core Can(FD)
> implementation does not support:
> * Transmit Bandwidth Sharing bits
>  - this waits for a configurable number of syncronization bits before
>    atempting to transmit the next frame - for the moment controllable
>    via a module parameter
> * SID11 with CanFD frames
>  - at this moment not supported by driver
> * 3 transmit attempts in addition to ONE_SHOT
> * transmitter delay compensation configurations
> * micro second exact transmission and reception timestamps
>  - used internally by driver
> * variable number of tx-fifos
>  - exposed via module parameter at this moment
>=20
> The driver has been heavily optimized so that it can handle
> a 100% utilized 1MHz Can-bus (with 11 bit can frames with DLC=3D0)
> even on less powerful SOCs like the raspberry pi 1 without
> dropping frames due to driver/spi latencies (still dropps
> are observed in the can/network stack).
>=20
> To achive this the driver includes several code optimization
> Two of which prefers continuous long spi transfers over multiple
> small individual spi transfers of variable length.
> This is an optimization that would favour spi dma transfers instead
> of more expensive PIO in typical SPI controllers.
> Both of them can get explicitly enabled by the use of a module =
parameter.
> One of those is automatically used in the case of Can2.0 only bus
> configurations.
>=20
> Finer details of the implementation and rational is included with
> the driver code it self for future reference.
>=20
> The driver has also been tested for basic CanFD transfers with
> BRS up to 5.7Mhz data bitrates - the available transceiver did
> not allow for faster rates...
>=20
> The driver itself exposes lots of internal data/statistics via
> debugfs.
>=20
> The driver implements a lock-less design for transmissions
> making use instead of prepared spi messages submitted via spi_async
> for transmission in the start_xmit_start code without requireing
> an extra workqueue and the corresponding latencies.
>=20
> Note that there is an extra patch in the pipeline to implement pinctrl
> but this still shows some issues, so it is not included in this =
patchset.
>=20
> Changelog:
>  V1 -> V2: new more generic name based on feedback from microchip
>            cleanup of code (checkpatch)
>            address all feedback on code
>            handle (HW) systemerrors in a much better/reliable way
>            cleanup of dt custom properties removing (most) gpio=20
>              related properties
>            implemented GPIOLIB support as per feedback
>  V2 -> V3: added vendor-prefix for gpio-opendrain to dt-binding
>            added gpio-controller to dt-binding
> 	    added feedback by Rob Herring
> 	    waited for other feedback regarding the code
>  V3 -> V4: resend
>            Patch-1 (dt) added: Reviewed-by: Rob Herring =
<robh@kernel.org>
>=20
> Martin Sperl (3):
>  dt-binding: can: mcp25xxfd: document device tree bindings
>  can: mcp25xxfd: Add Microchip mcp25xxfd CAN FD driver
>  can: mcp25xxfd: add gpiolib support for GPIO0/1 (aka. INT0/INT1)
>=20
> .../bindings/net/can/microchip,mcp25xxfd.txt       |   32 +
> drivers/net/can/spi/Kconfig                        |    6 +
> drivers/net/can/spi/Makefile                       |    1 +
> drivers/net/can/spi/mcp25xxfd.c                    | 4509 =
++++++++++++++++++++
> 4 files changed, 4548 insertions(+)
> create mode 100644 =
Documentation/devicetree/bindings/net/can/microchip,mcp25xxfd.txt
> create mode 100644 drivers/net/can/spi/mcp25xxfd.c
>=20
> --
> 2.11.0
