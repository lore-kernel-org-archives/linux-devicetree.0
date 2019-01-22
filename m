From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 0/2] rtc: Add a driver for Cadence RTC
Date: Tue, 22 Jan 2019 19:18:57 +0100
Message-ID: <20190122181857.GH16702@piout.net>
References: <20190122104216.12077-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190122104216.12077-1-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kotas <jank@cadence.com>
Cc: a.zummo@towertech.it, robh+dt@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 22/01/2019 10:42:14+0000, Jan Kotas wrote:
> This patchset adds a driver support for Cadence RTC IP.
> It supports time, date and wakeups from sleep.
> 
> Changes since v2:
> 	Fixed a typo in the bindings documentation.
> 
> Changes since v1:
> 	Added devm_rtc_allocate_device before requesting an IRQ
> 	Added range_min, range_max values
> 	Return -EINVAL for read_time() if RTC is disabled
> 	Fixed some typos
> 
> Jan Kotas (2):
>  dt-bindings: rtc: Add bindings for Cadence RTC
>  rtc: Add Cadence RTC driver
> 
> Jan Kotas (2):
>   dt-bindings: rtc: Add bindings for Cadence RTC
>   rtc: Add Cadence RTC driver
> 
Both applied, thanks (only once ;))

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
