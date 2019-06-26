Return-Path: <SRS0=pffi=UZ=ti.com=jjhiblot@kernel.org>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: devicetree bindings for a generic led-based backlight driver
Message-ID: <69f3a300-9e37-448d-e6fa-49c1c9ca0dd6@ti.com>
Date: Wed, 26 Jun 2019 17:34:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: devicetree@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-leds@vger.kernel.org, robh@kernel.org, Valkeinen
List-ID: <devicetree@vger.kernel.org>

Hi,

A few years ago (2015), Tomi Valkeinen posted a series implementing a 
backlight driver on top of a LED device.

https://patchwork.kernel.org/patch/7293991/
https://patchwork.kernel.org/patch/7294001/
https://patchwork.kernel.org/patch/7293981/

The discussion stopped  because he lacked the time to work on it.

I will be taking over the task and, before heading in the wrong 
direction, wanted a confirmation that the binding Tomi last proposed in 
hist last email was indeed the preferred option.

It will probably require some modifications in the LED core to create 
the right kind of led-device (normal, flash or backlight) based on the 
compatible option.

Thanks for your feedback

JJ
