From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 2/2] Add documentation for tca6507 devicetree bindings.
Date: Wed, 07 Nov 2012 16:14:33 -0700
Message-ID: <509AEB59.7010504@wwwdotorg.org>
References: <1352321726-21284-1-git-send-email-marek.belisko@open-nandra.com> <1352321726-21284-2-git-send-email-marek.belisko@open-nandra.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1352321726-21284-2-git-send-email-marek.belisko@open-nandra.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Belisko <marek.belisko@open-nandra.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 11/07/2012 01:55 PM, Marek Belisko wrote:

> diff --git a/Documentation/devicetree/bindings/leds/tca6507.txt b/Documentation/devicetree/bindings/leds/tca6507.txt

> +LEDs conected to tca6507
> +
> +Required properties:
> +- compatible : should be : "leds-tca6507".

"ti,tca6507" would be more typical.

> +Each led is represented as a sub-node of the leds-tca6507 device.
> +
> +LED sub-node properties:
> +- label : label for this LED
> +- reg : number of LED line (could be from 0 to 6)
> +- linux,default-trigger : led default trigger

You probably want to mention which binding document defines the valid
values for that property; ../gpio/led.txt I think.

I wonder if we need to think about representing the blinking/fading/...
capabilities of the chip too? Should that be encoded into the DT, or
should it be controlled at run-time via some LED subsystem?
