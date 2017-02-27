From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] hwmon: (sht15) Add device tree support
Date: Mon, 27 Feb 2017 11:31:36 -0600
Message-ID: <CAL_JsqLakV0yjXe+WumN0XiEKDXYZHR+vnrbFh=wMbBTpBQ5Xg@mail.gmail.com>
References: <1487247824-10005-1-git-send-email-marco.franchi@nxp.com>
 <20170227155752.b6yshpowa4ioty6a@rob-hp-laptop> <CAOMZO5D9UyKpxRB_bLrDFohyofTBu=sZArVynu--Fao6PewcKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5D9UyKpxRB_bLrDFohyofTBu=sZArVynu--Fao6PewcKg@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Marco Franchi <marco.franchi@nxp.com>, Guenter Roeck <linux@roeck-us.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org, Marco Antonio Franchi <marcofrk@gmail.com>, FoxPeter@kabelbw.de
List-Id: devicetree@vger.kernel.org

On Mon, Feb 27, 2017 at 10:46 AM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Rob,
>
> On Mon, Feb 27, 2017 at 12:57 PM, Rob Herring <robh@kernel.org> wrote:
>
>>> +Required properties:
>>> +
>>> + - "compatible": must be "sensirion,sht15".
>>> + - "data-gpios": GPIO connected to the data line.
>>> + - "clk-gpios": GPIO connected to the clock line.
>>
>> Looks like this device is I2C perhaps? Though I'm not sure the waveforms
>> before and after transactions are compliant.
>
> No, the SHT15 datasheet is very clear that the device does not operate
> in I2C mode:
> "The sensor cannot be addressed by I2C protocol".

I missed that since it is under "Power Pins" section... As our "great"
leader says: Sad.

Acked-by: Rob Herring <robh@kernel.org>

BTW, looks like they fixed that with the SHT20.

Rob
