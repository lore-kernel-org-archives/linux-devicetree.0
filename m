From: Maxime Bizon <mbizon@freebox.fr>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Thu, 19 Feb 2015 19:22:54 +0100
Message-ID: <1424370174.13604.18.camel@sakura.staff.proxad.net>
References: <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com>
	 <20150218154106.GC29429@leverpostej>
	 <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com>
	 <20150218173115.GG29429@leverpostej>
	 <76BD1B22-BAED-4205-9B34-186907CE0217@konsulko.com>
	 <54E613E7.2020405@gmail.com>
	 <670D0881-DBF0-45E8-A502-A6DB2B77A750@konsulko.com>
	 <54E61DD2.3060002@gmail.com>
	 <53F2F94C-0C43-4A54-B8CD-EEC454A0AC19@konsulko.com>
	 <1424368919.13604.9.camel@sakura.staff.proxad.net>
	 <20150219181218.GA5048@gradator.net>
Reply-To: mbizon@freebox.fr
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150219181218.GA5048@gradator.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylvain Rochet <gradator@gradator.net>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Koen Kooi <koen@dominion.thruhere.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Ludovic Desroches <ludovic.desroches@atmel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Matt Porter <matt.porter@linaro.org>, frowand.list@gmail.com, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org


On Thu, 2015-02-19 at 19:12 +0100, Sylvain Rochet wrote:

> Or use a 1-wire or I2C EEPROM to store your board information.

no, you don't reduce the human error probability.

eeprom needs to be preprogrammed, factory will at some point have a lot
of eeprom with different version, and will potentially equip the wrong
one.

much more error prone than them putting the resistor at the wrong place.

> Or, even better, if you have an I2C device, just chose a different 
> address on each board for this device and then probe I2C devices in your 
> boot loader until you found one you are looking for, this way, you don't 
> need spare GPIO at all. You don't even need to populate the same I2C 
> device on all boards, you can actually probe anything.

I'm not a fan of schemes where not probing something is not a definitive
sign of hardware failure.

-- 
Maxime
