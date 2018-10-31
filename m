From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 0/3] drm: tinydrm driver for adafruit PiTFT 3.5"
 touchscreen
Date: Wed, 31 Oct 2018 17:27:57 +0100
Message-ID: <0566ac0e-6060-6b46-b75a-32c63ef9dbe2@tronnes.org>
References: <20181024184313.2967-1-eric@anholt.net>
 <87h8harnv4.fsf@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87h8harnv4.fsf@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org


Den 25.10.2018 18.29, skrev Eric Anholt:
> Eric Anholt <eric@anholt.net> writes:
>
>> I was going to start working on making the vc4 driver work with
>> tinydrm panels, but it turned out tinydrm didn't have the panel I had
>> previously bought.  So, last night I ported the fbtft staging
>> driver over to DRM.
>>
>> It seems to work (with DT at
>> https://github.com/anholt/linux/commits/drm-misc-next-hx8357d) --
>> fbdev works great including rotated, and so does modetest.  However,
>> when X11 comes up at 16bpp, I get:
>>
>> https://photos.app.goo.gl/8tuhzPFFoDGamEfk8
>>
>> If I have tinydrm set a preferred bpp of 24, X looks great.  Noralf,
>> any ideas?
> Also, with these patches and the format modifier patch I just sent, mesa
> with vc4 is now working with this driver on this branch:
>
> https://gitlab.freedesktop.org/anholt/mesa/commits/kmsro
>
> Now I wonder how we can improve performance of the SPI updates.

I just remembered that tinydrm does a full flush on page flips. And if
the dirtyfb ioctl is also used you end up with two flushes. This could
explain bad performance. I have been waiting for the dirtyfb through
atomic work to come to fruition, but nothing merged yet. That would give
dirty tracking on page flips.

Noralf.
