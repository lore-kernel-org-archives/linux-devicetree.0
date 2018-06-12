Return-Path: <SRS0=PpTD=I6=grandegger.com=wg@kernel.org>
From: Wolfgang Grandegger <wg@grandegger.com>
Subject: [PATCH V4 0/3] Microchip mcp25xxfd can controller driver
References: <20180514160313.29597-1-kernel@martin.sperl.org>
 <6C9DAC2E-F20A-4FCE-A585-6DBCEEF97D08@martin.sperl.org>
Message-ID: <4682a3b2-a924-0231-673c-566373cca412@grandegger.com>
Date: Tue, 12 Jun 2018 16:38:08 +0200
MIME-Version: 1.0
In-Reply-To: <6C9DAC2E-F20A-4FCE-A585-6DBCEEF97D08@martin.sperl.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
To: kernel@martin.sperl.org, linux-can@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Marcel Birthelmer <Marcel.Birthelmer@microchip.com>, Sukkin Pang <skp@skpang.co.uk>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>
List-ID: <devicetree@vger.kernel.org>

Hello Martin,

this driver is huge... more than 4300 lines of code. That's maybe one
reason why it has not yet been reviewed. The driver includes a debugfs
interface and is also very verbose in general. I'm not sure if the
debugging code is really useful for the end user, but well, debugfs is
exactly for that purpose. What about splitting up the driver in a
subdirectory "mcp2517fd" into core, spi, debugfs, etc. Other opinions?

I hope to find some time end of this week for a review.

Thanks for your patience.

Wolfgang.

Am 06.06.2018 um 19:32 schrieb kernel@martin.sperl.org:
> Hi!
> 
> Any updates/feedback on this driver?
> 
> It has been sitting here almost unchanged for the last 4 month without any feedback (except for Rob).
> 
> What is still needed to get it included?
> 
> As far as I see all the comments from end of November have been addressed already in V2 of this patch series…
> 
> Note also that:
> Tested-by: Gerhard Bertelsmann <info@gerhard-bertelsmann.de>
> (from January)




> Thanks,
> 	Martin
> 
> 
> 
>> On 14.05.2018, at 18:03, kernel@martin.sperl.org wrote:
>>
>> From: Martin Sperl <kernel@martin.sperl.org>
>>
>> This patchset adds a driver for the mcp25xxfd CanFD controller.
>>
>> Most of the features of the controller are supported by this
>> driver release.
>>
>> The controller includes a few features that the current core Can(FD)
>> implementation does not support:
>> * Transmit Bandwidth Sharing bits
>>  - this waits for a configurable number of syncronization bits before
>>    atempting to transmit the next frame - for the moment controllable
>>    via a module parameter
>> * SID11 with CanFD frames
>>  - at this moment not supported by driver
>> * 3 transmit attempts in addition to ONE_SHOT
>> * transmitter delay compensation configurations
>> * micro second exact transmission and reception timestamps
>>  - used internally by driver
>> * variable number of tx-fifos
>>  - exposed via module parameter at this moment
>>
>> The driver has been heavily optimized so that it can handle
>> a 100% utilized 1MHz Can-bus (with 11 bit can frames with DLC=0)
>> even on less powerful SOCs like the raspberry pi 1 without
>> dropping frames due to driver/spi latencies (still dropps
>> are observed in the can/network stack).
>>
>> To achive this the driver includes several code optimization
>> Two of which prefers continuous long spi transfers over multiple
>> small individual spi transfers of variable length.
>> This is an optimization that would favour spi dma transfers instead
>> of more expensive PIO in typical SPI controllers.
>> Both of them can get explicitly enabled by the use of a module parameter.
>> One of those is automatically used in the case of Can2.0 only bus
>> configurations.
>>
>> Finer details of the implementation and rational is included with
>> the driver code it self for future reference.
>>
>> The driver has also been tested for basic CanFD transfers with
>> BRS up to 5.7Mhz data bitrates - the available transceiver did
>> not allow for faster rates...
>>
>> The driver itself exposes lots of internal data/statistics via
>> debugfs.
>>
>> The driver implements a lock-less design for transmissions
>> making use instead of prepared spi messages submitted via spi_async
>> for transmission in the start_xmit_start code without requireing
>> an extra workqueue and the corresponding latencies.
>>
>> Note that there is an extra patch in the pipeline to implement pinctrl
>> but this still shows some issues, so it is not included in this patchset.
>>
>> Changelog:
>>  V1 -> V2: new more generic name based on feedback from microchip
>>            cleanup of code (checkpatch)
>>            address all feedback on code
>>            handle (HW) systemerrors in a much better/reliable way
>>            cleanup of dt custom properties removing (most) gpio 
>>              related properties
>>            implemented GPIOLIB support as per feedback
>>  V2 -> V3: added vendor-prefix for gpio-opendrain to dt-binding
>>            added gpio-controller to dt-binding
>> 	    added feedback by Rob Herring
>> 	    waited for other feedback regarding the code
>>  V3 -> V4: resend
>>            Patch-1 (dt) added: Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> Martin Sperl (3):
>>  dt-binding: can: mcp25xxfd: document device tree bindings
>>  can: mcp25xxfd: Add Microchip mcp25xxfd CAN FD driver
>>  can: mcp25xxfd: add gpiolib support for GPIO0/1 (aka. INT0/INT1)
>>
>> .../bindings/net/can/microchip,mcp25xxfd.txt       |   32 +
>> drivers/net/can/spi/Kconfig                        |    6 +
>> drivers/net/can/spi/Makefile                       |    1 +
>> drivers/net/can/spi/mcp25xxfd.c                    | 4509 ++++++++++++++++++++
>> 4 files changed, 4548 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/net/can/microchip,mcp25xxfd.txt
>> create mode 100644 drivers/net/can/spi/mcp25xxfd.c
>>
>> --
>> 2.11.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-can" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
