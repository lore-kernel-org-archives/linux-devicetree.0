From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v6] DT: leds: Improve description of flash LEDs
 related properties
Date: Fri, 10 Apr 2015 12:14:53 +0300
Message-ID: <5527948D.1020603@linux.intel.com>
References: <1428655016-17752-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
In-Reply-To: <1428655016-17752-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Sylwester Nawrocki <s.nawrocki@samsung.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jacek,

Thank you for the quick update!

Jacek Anaszewski wrote:
> 1. Since max-microamp property has had no users so far, then rename
>    it to more descriptive led-max-microamp.
> 2. Since flash-timeout-us property has had no users so far, then rename
>    it to more accurate flash-max-timeout-us.
> 3. Describe led-max-microamp property as mandatory for specific board
>    configurations.
> 4. Make flash-max-microamp and flash-max-timeout-us properties mandatory
>    for devices with configurable flash current and flash timeout settings
>    respectively.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: devicetree@vger.kernel.org

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
