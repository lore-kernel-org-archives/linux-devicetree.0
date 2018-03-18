Return-Path: <SRS0=1wmS=GI=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH v3] leds: add LED driver for CR0014114 board
References: <20180312155829.12365-1-oleg@kaa.org.ua>
 <20180313124548.12074-1-oleg@kaa.org.ua>
 <20180318124925.i4yuxigkfu6spv26@rob-hp-laptop>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <fbe35381-45a6-7084-c1f9-5ede1eb88bab@gmail.com>
Date: Sun, 18 Mar 2018 21:03:55 +0100
MIME-Version: 1.0
In-Reply-To: <20180318124925.i4yuxigkfu6spv26@rob-hp-laptop>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh@kernel.org>, Oleh Kravchenko <oleg@kaa.org.ua>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 03/18/2018 01:49 PM, Rob Herring wrote:
> On Tue, Mar 13, 2018 at 02:45:48PM +0200, Oleh Kravchenko wrote:
>> This patch adds a LED class driver for the RGB LEDs found on
>> the Crane Merchandising System CR0014114 LEDs board.
>>
>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>> ---
>>  .../devicetree/bindings/leds/leds-cr0014114.txt    |  46 ++++
>>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
> 
> Please split to separate patch.
> 
>>  drivers/leds/Kconfig                               |  13 +
>>  drivers/leds/Makefile                              |   1 +
>>  drivers/leds/leds-cr0014114.c                      | 292 +++++++++++++++++++++
>>  5 files changed, 353 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>>  create mode 100644 drivers/leds/leds-cr0014114.c
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>> new file mode 100644
>> index 000000000000..977a9929b04f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>> @@ -0,0 +1,46 @@
>> +Crane Merchandising System - cr0014114 LED driver
>> +-------------------------------------------------
>> +
>> +This LED Board is widely used in vending machines produced
>> +by Crane Merchandising Systems.
>> +
>> +Required properties:
>> +- compatible: "cms,cr0014114"
>> +- reg: chip select address for the device
>> +- spi-cpha: shifted clock phase mode is required
>> +
>> +LED sub-node properties:
>> +- label : (optional)
>> +	see Documentation/devicetree/bindings/leds/common.txt
>> +- linux,default-trigger : (optional)
>> +	see Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Example
>> +-------
>> +
>> +cr0014114@0 {
> 
> leds@...

In [0] you required it to be led-controller and the rest like below:


led-controller@12 {
  reg = <12>;

  led@0 {
    reg = <0>;
  };
  led@1 {
    reg = <1>;
  };
};


Since that time I started to require adhering to this naming pattern
for LED controller node and led@address for child nodes, where
applicable.

I plan on submitting a patch for common LED bindings, that will
switch device names to led-controller in DT examples.

With this scheme another problem arises, because now we have:

- label: The label for this LED. If omitted, the label is taken from
         the node name (excluding the unit address).

With that DT child node name is useless, because it is "led" for
each sub-led. Therefore I propose to make label property required,
and avoid using child DT node name as a fallback.

>> +	compatible = "crane,cr0014114";
>> +	reg = <0>;
>> +	spi-max-frequency = <50000>;
>> +	spi-cpha;
>> +
>> +	led0 {
> 
> Is '0' meaningful to the controller as an address/channel. If so, use 
> reg.
> 
>> +		label = "cr0:red:";
>> +	};
>> +	led1 {
>> +		label = "cr0:green:";
>> +	};
>> +	led2 {
>> +		label = "cr0:blue:";
>> +	};
>> +	led3 {
>> +		label = "cr1:red:";
>> +	};
>> +	led4 {
>> +		label = "cr1:green:";
>> +	};
>> +	led5 {
>> +		label = "cr1:blue:";
>> +	};
>> +	...
>> +};
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> index ae850d6c0ad3..f17949c365f5 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -75,6 +75,7 @@ cnxt	Conexant Systems, Inc.
>>  compulab	CompuLab Ltd.
>>  cortina	Cortina Systems, Inc.
>>  cosmic	Cosmic Circuits
>> +crane	Crane Connectivity Solutions
>>  creative	Creative Technology Ltd
>>  crystalfontz	Crystalfontz America, Inc.
>>  cubietech	Cubietech, Ltd.
> 

[0] https://patchwork.kernel.org/patch/10093757/

-- 
Best regards,
Jacek Anaszewski
