From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v2 2/2] leds: Add control of the voltage/current
 regulator to the LED core
Date: Tue, 16 Jul 2019 11:50:32 +0100
Message-ID: <20190716105032.thpcttko5do3u56n@holly.lan>
References: <20190715155657.22976-1-jjhiblot@ti.com>
 <20190715155657.22976-3-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190715155657.22976-3-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 15, 2019 at 05:56:57PM +0200, Jean-Jacques Hiblot wrote:
> A LED is usually powered by a voltage/current regulator. Let the LED core

This is almost certainly nitpicking but since there's enough other
review comments that you will have to respin anyway ;-)

Is an LED really "usually powered by a voltage/current regulator"? Some
LEDs have a software controlled power supply but I'm not sure it is
the usual case.

Likewise its a little confusing to be talking about LEDs with an
external current regulator since, although that is possible, it is also
one the main features provided by LED driver chips.


Daniel.
