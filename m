From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH v2 0/3] power_supply: modelgauge_battery: Add Maxim ModelGauge
 ICs gauge
Date: Wed, 26 Feb 2014 14:21:07 +0400
Message-ID: <530DC013.9040908@cogentembedded.com>
References: <1391293385-27539-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1391293385-27539-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dbaryshkov@gmail.com
Cc: "anton@enomsg.org" <anton@enomsg.org>, dwmw2@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mk7.kang@samsung.com, k.kozlowski@samsung.com, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

Hello Dmitry,

In accordance to this change you've taken the responsibility for power 
supply maintainership.
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/MAINTAINERS?id=573189354b7c97cd2256b87cf083ee435584594e

It passed almost month and no answer from you.
Does it make sense to apply this patch series?

Regards,
Vladimir

On 02/02/2014 02:23 AM, Vladimir Barinov wrote:
> Hello.
>
> This adds the folowing:
> - Maxim ModelGauge ICs gauge driver for MAX17040/41/43/44/48/49/58/59 chips
> - Document DT bindings
> - Remove superseded Maxim MAX17040 gauge driver
>
> Vladimir Barinov (3):
>   [1/3] power_supply: modelgauge_battery: Maxim ModelGauge ICs gauge
>   [2/3] dt: Document ModelGauge gauge bindings
>   [3/3] power_supply: modelgauge_battery: Remove Maxim MAX17040 gauge
>
> ---
> This patchset is against the 'kernel/git/torvalds/linux.git' repo.
>
> Changes since v1:
> - switched to REGMAP API
> - replaced request_threaded_irq with devm_request_threaded_irq
> - replaced cancel_delayed_work with _sync version
> - moved "empty_alert_threshold, soc_change_alert, hibernate_threshold,
>    active_threshold, undervoltage, overvoltage, resetvoltage" parameters
>    out from platform_data and DT
> - removed unused parameters "empty_adjustment, empty_adjustment"
> - added return value checks for of_property_read_XX functions
> - removed irrelevant bindings
> - fixed dt properties naming in documentation
> - added binding size description in documentation
> - removed satelite include file include/linux/max17040_battery.h
>
>   Documentation/devicetree/bindings/power_supply/modelgauge_battery.txt |   61
>   drivers/power/Kconfig                                                 |   17
>   drivers/power/Makefile                                                |    2
>   drivers/power/max17040_battery.c                                      |  297 ---
>   drivers/power/modelgauge_battery.c                                    |  838 ++++++++++
>   include/linux/max17040_battery.h                                      |   19
>   include/linux/platform_data/battery-modelgauge.h                      |   31
>   7 files changed, 940 insertions(+), 325 deletions(-)
