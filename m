Return-Path: <SRS0=YCj9=JH=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH v3 2/5] leds: lt3593: merge functions and clean up code
References: <20180620201303.6272-1-daniel@zonque.org>
 <20180620201303.6272-3-daniel@zonque.org>
 <e9a09314-1fcf-1ac3-1b34-b062e197ac6b@gmail.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <c4c47a3c-7115-cd25-4002-af81c64a6ed5@zonque.org>
Date: Thu, 21 Jun 2018 22:16:41 +0200
MIME-Version: 1.0
In-Reply-To: <e9a09314-1fcf-1ac3-1b34-b062e197ac6b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

HI Jacek,

On Thursday, June 21, 2018 09:23 PM, Jacek Anaszewski wrote:
> You switched to using kcalloc, but apparently without compile-testing
> it:
> 
> drivers/leds/leds-lt3593.c: In function ‘lt3593_led_probe_pdata’:
> drivers/leds/leds-lt3593.c:88:13: error: too few arguments to function
> ‘devm_kcalloc’
>     led_data = devm_kcalloc(dev, sizeof(*led_data), GFP_KERNEL);

How embarrassing. I didn't mean to switch to kcalloc as I'm not 
allocation an array anymore. I forgot to stage a hunk when rebasing 
though. Oh well.

> Once you'll be resending the patch set please also remove
> empty line at the end of DT bindings.
> 
> Also you could think of switching to using SPDX license identifier
> at the occasion of updating the email address.

Will do. Sorry for the trouble. I'm sure v4 will be good finally :)



Thanks,
Daniel
