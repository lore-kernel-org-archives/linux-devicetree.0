Return-Path: <SRS0=Kve8=UZ=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: devicetree bindings for a generic led-based backlight driver
References: <69f3a300-9e37-448d-e6fa-49c1c9ca0dd6@ti.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <400ac00b-d3c7-b58f-52fa-8b18b6c7e4a2@gmail.com>
Date: Wed, 26 Jun 2019 20:55:37 +0200
MIME-Version: 1.0
In-Reply-To: <69f3a300-9e37-448d-e6fa-49c1c9ca0dd6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, devicetree@vger.kernel.org, pavel@ucw.cz, linux-leds@vger.kernel.org, robh@kernel.org, "Valkeinen, Tomi" <tomi.valkeinen@ti.com>
List-ID: <devicetree@vger.kernel.org>

Hi Jean,

On 6/26/19 5:34 PM, Jean-Jacques Hiblot wrote:
> Hi,
> 
> A few years ago (2015), Tomi Valkeinen posted a series implementing a
> backlight driver on top of a LED device.
> 
> https://patchwork.kernel.org/patch/7293991/
> https://patchwork.kernel.org/patch/7294001/
> https://patchwork.kernel.org/patch/7293981/
> 
> The discussion stopped  because he lacked the time to work on it.
> 
> I will be taking over the task and, before heading in the wrong
> direction, wanted a confirmation that the binding Tomi last proposed in
> hist last email was indeed the preferred option.
> 
> It will probably require some modifications in the LED core to create
> the right kind of led-device (normal, flash or backlight) based on the
> compatible option.

I recall that discussion. I gave my ack for the LED changes but
now we have more LED people that might want to look into that.

Regarding the bindings we have pending LED naming patch set,
that deprecates DT label property [0] and introduces standardized
LED functions.

[0] https://lkml.org/lkml/2019/6/9/728

-- 
Best regards,
Jacek Anaszewski
