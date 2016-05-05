From: Grant Grundler <grundler@chromium.org>
Subject: Re: Input: add Atmel Atmegaxx captouch driver
Date: Thu, 5 May 2016 09:04:39 -0700
Message-ID: <CANEJEGt1Ri7Q-g25U8_KTAb9Z8MfVWH0N5QLaLcdnDuF_wwrtw@mail.gmail.com>
References: <1462295611-49684-1-git-send-email-grundler@chromium.org>
	<20160504135123.GA4567@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20160504135123.GA4567@rob-hp-laptop>
Sender: linux-input-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Grant Grundler <grundler@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input <linux-input@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Linux DeviceTree <devicetree@vger.kernel.org>, Hung-yu Wu <hywu@google.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 4, 2016 at 6:51 AM, Rob Herring <robh@kernel.org> wrote:
...
>> +Required properties:
>> +
>> +     compatible:     Must be "atmel,atmegaxx_captouch".
>
> No wildcards in the compatible strings. Use the specific devices.
>
> Also, use hyphen rather than underscore. However, if the device is only
> a touch controller, then '_captouch' is not needed. The part number is
> sufficient to identify the device.

The primary part used on the board is AtMega88PA. Details of that SoC
are public:
    http://www.atmel.com/devices/ATMEGA88PA.aspx

I don't see why the exact chip is relevant to the driver. The driver
is just talking to an I2C device that reports button events.  The
protocol across the I2C determines what this driver has to do and that
protocol is implemented by the on-board firmware (supplied by Atmel).
Any AVR CPU could implement this same protocol.

Can we call this "atmel,qtouch-buttons-v2" or something like that?

I personally don't have anything invested in any particular name. Feel
free to suggest a different one. I'm perfectly happy with any color
paint on the shed.

...
>> +Example:
>> +
>> +     atmegaxx_captouch@51 {
>
> atmegaxx@51 (with actual part number)

Is "qtouch-buttons@51" ok?

>
>> +             compatible = "atmel,atmegaxx_captouch";
>> +             reg = <0x51>;
>> +             interrupt-parent = <&tlmm>;
>> +             interrupts = <67 IRQ_TYPE_EDGE_FALLING>;
>> +             linux,keycodes = <BTN_0>, <BTN_1>,
>> +                     <BTN_2>, <BTN_3>,
>> +                     <BTN_4>, <BTN_5>,
>> +                     <BTN_6>, <BTN_7>;
>> +             autorepeat;
>> +     };

cheers,
grant
