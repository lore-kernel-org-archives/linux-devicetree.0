From: Phil Elwell <phil@raspberrypi.org>
Subject: Re: [PATCH 2/4] lan78xx: Read initial EEE setting from Device Tree
Date: Thu, 12 Apr 2018 16:17:04 +0100
Message-ID: <27e04eb4-bf75-d5ad-c0dc-bc0153fd8769@raspberrypi.org>
References: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
 <1523541336-145953-3-git-send-email-phil@raspberrypi.org>
 <20180412141630.GM28963@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180412141630.GM28963@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Andrew,

On 12/04/2018 15:16, Andrew Lunn wrote:
> On Thu, Apr 12, 2018 at 02:55:34PM +0100, Phil Elwell wrote:
>> Add two new Device Tree properties:
>> * microchip,eee-enabled  - a boolean to enable EEE
>> * microchip,tx-lpi-timer - time in microseconds to wait after TX goes
>>                            idle before entering the low power state
>>                            (default 600)
> 
> Hi Phil
> 
> This looks wrong.
> 
> What should happen is that the MAC driver calls phy_init_eee() to find
> out if the PHY supports EEE. There should be no need to look in device
> tree.

If the driver should be calling phy_init_eee to initialise EEE operation then I'm fine
with that (although I notice that the TI cpsw calls phy_ethtool_set_eee but I don't see
it calling phy_init_eee). However, it sounds like I need to keep my DT toggle of the
EEE enablement and parameters downstream.

Phil
