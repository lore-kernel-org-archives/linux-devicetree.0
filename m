From: Phil Elwell <phil@raspberrypi.org>
Subject: Re: [PATCH 4/4] dt-bindings: Document the DT bindings for lan78xx
Date: Thu, 12 Apr 2018 15:33:54 +0100
Message-ID: <fd303b96-b01b-3fef-c36a-e7ae25c2ad30@raspberrypi.org>
References: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
 <1523541336-145953-5-git-send-email-phil@raspberrypi.org>
 <20180412143007.GP28963@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180412143007.GP28963@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 12/04/2018 15:30, Andrew Lunn wrote:
> On Thu, Apr 12, 2018 at 02:55:36PM +0100, Phil Elwell wrote:
>> The Microchip LAN78XX family of devices are Ethernet controllers with
>> a USB interface. Despite being discoverable devices it can be useful to
>> be able to configure them from Device Tree, particularly in low-cost
>> applications without an EEPROM or programmed OTP.
> 
> It would be good to document what happens when there is an EEPROM. Is
> OF used in preference to the EEPROM?

Yes it is. I'll mention it in V2.

Phil
