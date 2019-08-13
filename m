Return-Path: <SRS0=BPCO=WJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34545 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbfHMU2r (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 13 Aug 2019 16:28:47 -0400
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
Date: Tue, 13 Aug 2019 22:28:41 +0200
MIME-Version: 1.0
In-Reply-To: <20190808203204.8614-2-oleg@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Oleh,

Thank you for the patch set.

On 8/8/19 10:32 PM, Oleh Kravchenko wrote:
> This patch adds a LED class driver for the RGB LEDs found on
> the Crane Merchandising System EL15203000 LEDs board
> (aka RED LEDs board).
> 
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../testing/sysfs-class-led-driver-el15203000 |  22 +
>  drivers/leds/Kconfig                          |  13 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/leds-el15203000.c                | 478 ++++++++++++++++++
>  4 files changed, 514 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-el15203000
>  create mode 100644 drivers/leds/leds-el15203000.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-el15203000 b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
> new file mode 100644
> index 000000000000..91a483e493d9
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
> @@ -0,0 +1,22 @@
> +What:		/sys/class/leds/<led>/hw_pattern
> +Date:		August 2019
> +KernelVersion:	5.3
> +Description:
> +		Specify a hardware pattern for the EL15203000 LED.
> +		The LEDs board supports only predefined patterns by firmware
> +		for specific LEDs.
> +
> +		Breathing mode for Screen frame light tube:
> +		"0 4000 1 4000"
> +
> +		Cascade mode for Pipe LED:
> +		"1 800 2 800 4 800 8 800 16 800 1 800 2 800 4 800 8 800 16 800"

Why the sequence "1 800 2 800 4 800 8 800 16 800" is duplicated here?
It seems redundant. But aside of that - aren't the timings modifiable?
In other words - are these all patterns somehow configurable or they are
pre-programmed?

> +
> +		Inverted cascade mode for Pipe LED:
> +		"30 800 29 800 27 800 23 800 15 800 30 800 29 800 27 800 23 800 15 800"

Similar duplication here.

> +
> +		Bounce mode for Pipe LED:
> +		"1 800 2 800 4 800 8 800 16 800 16 800 8 800 4 800 2 800 1 800"

Instead of two repeating "16 800" you could provide "16 1600".
But here again is the question whether these values are configurable.
>From what I can see in your driver implementation you're expecting
exactly the values provided in these examples to enable given hardware
pattern (led_pattern_cmp()).

> +
> +		Inverted bounce mode for Pipe LED:
> +		"30 800 29 800 27 800 23 800 15 800 15 800 23 800 27 800 29 800 30 800"

-- 
Best regards,
Jacek Anaszewski
