From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] hwmon: Remove ads1015 driver
Date: Mon, 22 Jul 2019 16:39:44 -0600
Message-ID: <20190722223944.GA9166@bogus>
References: <1562004758-13025-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1562004758-13025-1-git-send-email-linux@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Cameron <jic23@kernel.org>, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, Dirk Eibach <eibach@gdsys.de>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 01, 2019 at 11:12:38AM -0700, Guenter Roeck wrote:
> A driver for ADS1015 with more functionality is available in the iio
> subsystem.
> 
> Remove the hwmon driver as duplicate. If the chip is used for hardware
> monitoring, the iio->hwmon bridge should be used.
> 
> Cc: Dirk Eibach <eibach@gdsys.de>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> Current plan is to queue this removal for v5.4 (not v5.3) in the hwmon
> tree.
> 
>  .../devicetree/bindings/hwmon/ads1015.txt          |  73 -----
>  .../devicetree/bindings/iio/adc/ads1015.txt        |  73 +++++

I assume no change or I should review it again?

Acked-by: Rob Herring <robh@kernel.org>

>  Documentation/hwmon/ads1015.rst                    |  90 ------
>  Documentation/hwmon/index.rst                      |   1 -
>  MAINTAINERS                                        |   8 -
>  drivers/hwmon/Kconfig                              |  10 -
>  drivers/hwmon/Makefile                             |   1 -
>  drivers/hwmon/ads1015.c                            | 324 ---------------------
>  drivers/iio/adc/Kconfig                            |   2 +-
>  9 files changed, 74 insertions(+), 508 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/ads1015.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ads1015.txt
>  delete mode 100644 Documentation/hwmon/ads1015.rst
>  delete mode 100644 drivers/hwmon/ads1015.c
