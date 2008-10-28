From: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Subject: Re: GPIO - marking individual pins (not) available in device tree
Date: Tue, 28 Oct 2008 12:06:35 -0500
Message-ID: <4907469B.6030506@genesi-usa.com>
References: <7b6eafc46f644dea59fbf0af17dbc005@localhost>
	<fa686aa40810280715m3275a302jd43ab517d2d455fc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40810280715m3275a302jd43ab517d2d455fc-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Konstantinos Margaritis <markos-VYMTaqK72Q4@public.gmane.org>, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



Grant Likely wrote:
> 
> For Matt's purposes, I think he wants to describe which GPIO pins are
> available to be used, but are not yet connected to anything.  In such
> a case I think it does make sense to add a node for available GPIO
> pins and give it a gpios property with a list of the pins wired to the
> header.

Yes, the two problems I saw were there is only an implicit definition
of which gpios are available for use (GPIOLIB will happily give
you an unavailable pin if you ask for it, because there is no
definition except for "gpios" property as hooked up to a device).

I liked Mitch's idea about the available property and re-using already
existing standards and parsing to get it done.

(this allows some syntax/lint checking of a device tree too since if
you put a pin in a gpios property which you marked as unavailable,
you can flag it :)

The other problem was defining pins which most definitely ARE
connected to something (as GPIO) but could well be in an ill-defined
order or for no defined purpose with regards to the peripheral. A
lot of GPIO drivers right now (bitbang SPI, I2C) will just allocate
one pin as one thing and the other as another - if you say pin 15
and 16 for bitbang-i2c, then it may assumes pin 15 is clock and 16
is data. For SPI, you get another pin, which order is it (the
middle one may be correct but the outer ones could be swapped).

Is this even defined? Shouldn't it be? And therein lies the
question :)

Exposing it to userspace is a good idea. While grouping them up
would break the existing sysfs ABI there's no reason you can't
have all of the GPIOs dumped into sysfs as it is now, and then
new directories named after the gpio-group, which symlink back
to the sysfs pins in the parent directory? That would really
rock as it's bringing the abstraction and description of the
device tree back into userspace, where let's be honest, they do
not give a crap about device tree bindings, only what pin does
what action :D

-- 
Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Genesi, Manager, Developer Relations
