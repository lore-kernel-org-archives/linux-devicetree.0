From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH] mfd: Add driver for RAVE Supervisory Processor
Date: Mon, 12 Jun 2017 17:28:54 -0700
Message-ID: <CAHQ1cqE7hWxtxJQ5OEOyPrAR1af0aXQ128=AADQr7jq1QhxPjg@mail.gmail.com>
References: <20170606180643.14258-1-andrew.smirnov@gmail.com> <20170609134952.hocd6dpzixldzf72@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170609134952.hocd6dpzixldzf72@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 9, 2017 at 6:49 AM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Jun 06, 2017 at 11:06:43AM -0700, Andrey Smirnov wrote:
>> Add a driver for RAVE Supervisory Processor, an MCU implementing
>> varoius bits of housekeeping functionality (watchdoging, backlight
>> control, LED control, etc) on RAVE family of products by Zodiac
>> Inflight Innovations.
>>
>> This driver implementes core MFD/serdev device as well as
>> communication subroutines necessary for commanding the device.
>>
>> Cc: cphealy@gmail.com
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>
>> Note that the driver for "zii,rave-sp-watchdog" exists, but I haven't
>> submitted it yet, becuase I wanted to make sure that API exposed by
>> this MFD is acceptable and doesn't need drastic changes
>>
>>  .../devicetree/bindings/mfd/zii,rave-sp.txt        |   33 +
>>  drivers/mfd/Kconfig                                |    9 +
>>  drivers/mfd/Makefile                               |    1 +
>>  drivers/mfd/rave-sp.c                              | 1009 ++++++++++++++++++++
>>  include/linux/rave-sp.h                            |   54 ++
>>  5 files changed, 1106 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
>>  create mode 100644 drivers/mfd/rave-sp.c
>>  create mode 100644 include/linux/rave-sp.h
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
>> new file mode 100644
>> index 0000000..46a904c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
>> @@ -0,0 +1,33 @@
>> +Zodiac Inflight Innovations RAVE Supervisory Processor
>> +
>> +Required parent device properties:
>> +
>> + - compatible: Should be one of:
>> +     - "zii,rave-sp-niu"
>> +     - "zii,rave-sp-mezz"
>> +     - "zii,rave-sp-esb"
>> +     - "zii,rave-sp-rdu1"
>> +     - "zii,rave-sp-rdu2"
>> +
>> + - current-speed: Should be set to baud rate SP device is using
>> +
>
> Please clarify that this must be a child of a serial device node.

OK, will fix in v2.

>
>> +RAVE SP consists of the following sub-devices:
>> +
>> +Device                                Description
>> +------                                -----------
>> +rave-sp-wdt                  : Watchdog
>> +
>> +
>> +Example of usage:
>> +
>> +     rdu {
>> +             compatible = "zii,rave-sp-rdu2";
>> +             current-speed = <1000000>;
>> +             status = "okay";
>
> Don't show status in examples.
>

OK, will fix in v2.

Thanks,
Andrey Smirnov
