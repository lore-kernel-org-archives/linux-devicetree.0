From: Phil Elwell <phil@raspberrypi.org>
Subject: Re: [PATCH 1/4] lan78xx: Read MAC address from DT if present
Date: Thu, 12 Apr 2018 15:18:43 +0100
Message-ID: <4f95f1bc-412f-6926-0a61-f00e3abe7ecf@raspberrypi.org>
References: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
 <1523541336-145953-2-git-send-email-phil@raspberrypi.org>
 <20180412140640.GL28963@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180412140640.GL28963@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 12/04/2018 15:06, Andrew Lunn wrote:
> Hi Phil
> 
>> -			ret = lan78xx_write_reg(dev, RX_ADDRL, addr_lo);
>> -			ret = lan78xx_write_reg(dev, RX_ADDRH, addr_hi);
>> +		mac_addr = of_get_mac_address(dev->udev->dev.of_node);
> 
> It might be better to use the higher level eth_platform_get_mac_address().

OK - I'll take your word for it.

Phil
