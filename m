From: boris brezillon <b.brezillon@overkiz.com>
Subject: Re: [RFC PATCH] gpio: add GPIO hogging mechanism
Date: Thu, 19 Dec 2013 18:18:40 +0100
Message-ID: <52B32A70.1080700@overkiz.com>
References: <1387463671-1164-1-git-send-email-b.brezillon@overkiz.com> <1387463671-1164-2-git-send-email-b.brezillon@overkiz.com> <20131219164109.GB27409@kroah.com> <20131219164737.GA4536@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20131219164737.GA4536@saruman.home>
Sender: linux-gpio-owner@vger.kernel.org
To: balbi@ti.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Landley <rob@landley.net>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, Ben Gamari <bgamari.foss@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Felipe,

On 19/12/2013 17:47, Felipe Balbi wrote:
> On Thu, Dec 19, 2013 at 08:41:09AM -0800, Greg Kroah-Hartman wrote:
>> On Thu, Dec 19, 2013 at 03:34:31PM +0100, Boris BREZILLON wrote:
>>> GPIO hogging is a way to request and configure specific GPIO without
>>> explicitly requesting it in the device driver.
>>>
>>> The request and configuration procedure is handled in the core device
>>> driver code before the driver probe function is called.
>>>
>>> It allows specific GPIOs to be configured without any driver specific code.
>>>
>>> Particularly usefull when a external device is connected to a bus and the
>>> bus connections depends on an external switch controlled by a GPIO pin.
> for external switches, you probably need a pinctrl-gpio driver.
>
Do you mean using pinctrl pinconf to configure the PIN as output-high or
output-low ?

This was my first proposal
(see https://www.mail-archive.com/devicetree@vger.kernel.org/msg05829.html).


Best Regards,

Boris
