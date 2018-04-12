From: Phil Elwell <phil@raspberrypi.org>
Subject: Re: [PATCH 3/4] lan78xx: Read LED modes from Device Tree
Date: Thu, 12 Apr 2018 15:30:28 +0100
Message-ID: <50bd418e-9f26-5d4f-f4bf-6355f08b22e1@raspberrypi.org>
References: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
 <1523541336-145953-4-git-send-email-phil@raspberrypi.org>
 <20180412142615.GO28963@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180412142615.GO28963@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 12/04/2018 15:26, Andrew Lunn wrote:
> On Thu, Apr 12, 2018 at 02:55:35PM +0100, Phil Elwell wrote:
>> Add support for DT property "microchip,led-modes", a vector of two
>> cells (u32s) in the range 0-15, each of which sets the mode for one
>> of the two LEDs. Some possible values are:
>>
>>     0=link/activity          1=link1000/activity
>>     2=link100/activity       3=link10/activity
>>     4=link100/1000/activity  5=link10/1000/activity
>>     6=link10/100/activity    14=off    15=on
>>
>> Also use the presence of the DT property to indicate that the
>> LEDs should be enabled - necessary in the event that no valid OTP
>> or EEPROM is available.
> 
> I'm not a fan of this, but at the moment, we don't have anything
> better.
> 
> Please follow what mscc does, add a header file for the LED settings.

Good idea.

> 
>>
>> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
>> ---
>>  drivers/net/usb/lan78xx.c | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
>> index d98397b..ffb483d 100644
>> --- a/drivers/net/usb/lan78xx.c
>> +++ b/drivers/net/usb/lan78xx.c
>> @@ -2008,6 +2008,7 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
>>  {
>>  	int ret;
>>  	u32 mii_adv;
>> +	u32 led_modes[2];
>>  	struct phy_device *phydev;
>>  
>>  	phydev = phy_find_first(dev->mdiobus);
>> @@ -2097,6 +2098,25 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
>>  		(void)lan78xx_set_eee(dev->net, &edata);
>>  	}
>>  
>> +	if (!of_property_read_u32_array(dev->udev->dev.of_node,
>> +					"microchip,led-modes",
>> +					led_modes, ARRAY_SIZE(led_modes))) {
>> +		u32 reg;
>> +		int i;
>> +
>> +		reg = phy_read(phydev, 0x1d);
>> +		for (i = 0; i < ARRAY_SIZE(led_modes); i++) {
>> +			reg &= ~(0xf << (i * 4));
>> +			reg |= (led_modes[i] & 0xf) << (i * 4);
>> +		}
> 
> Please add range checks for led_modes[i] and return -EINVAL if the
> check fails.

Will do.

Thanks,

Phil
