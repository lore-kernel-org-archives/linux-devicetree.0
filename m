From: Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH] leds: Add DT support for leds-pca9532
Date: Wed, 10 Sep 2014 17:22:42 +0200
Message-ID: <54106CC2.5080606@antcom.de>
References: <1410269280-8761-1-git-send-email-stigge@antcom.de> <17734612.3IvPuVrruO@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
In-Reply-To: <17734612.3IvPuVrruO@wuerfel>
Sender: linux-leds-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: robh+dt@kernel.org, riku.voipio@iki.fi, cooloney@gmail.com, rpurdie@rpsys.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/09/2014 08:08 PM, Arnd Bergmann wrote:
> Is this a full PWM controller? If it is, it would be better to also
> provide a #pwm-cells property and register the device with the PWM
> subsystem to allow arbitrary users.
> 
> If the PWM is only really usable for LED, it's probably enough to
> leave this used by the LED subsystem.

Right, this PWM is really only intended for LED use (as already done w/o
DT).

Sending the updated patch.

Roland
