From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM53573: Add Broadcom BCM947189ACDBMR board
 support
Date: Mon, 7 Aug 2017 10:42:20 -0700
Message-ID: <700204eb-e28c-be4b-0647-901960f74500@gmail.com>
References: <20170718193740.8610-1-f.fainelli@gmail.com>
 <bb5387cf-5d31-3a03-1bb9-1327768271ec@gmail.com>
 <247dcd4e1becdaa5f947f59f525c9d90@milecki.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <247dcd4e1becdaa5f947f59f525c9d90@milecki.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 07/31/2017 06:46 AM, Rafał Miłecki wrote:
> On 2017-07-24 19:39, Florian Fainelli wrote:
>> On 07/18/2017 12:37 PM, Florian Fainelli wrote:
>>> Adds support for the Broadcom reference board BCM947189ACDMBR which
>>> features the following:
>>>
>>> * 128MB of DRAM
>>> * External MoCA support through a Broadcom BCM6802 chip
>>> * 1x external Gigabit PHY through the external BCM6802
>>> * 1x USB 2.0 port
>>> * 1x PCIE slot
>>> * Few configurable buttons and LEDs
>>>
>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>
>> Rafal, any feedback on this?
> 
> Looks good :)

Applied, thanks!
-- 
Florian
