From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 03/11] platform: make support for early platform devices
 conditional
Date: Tue, 24 Apr 2018 12:31:50 -0700
Message-ID: <aa459c94-bfc2-5cf8-0197-6487ea9152a8@infradead.org>
References: <20180424173051.15099-1-brgl@bgdev.pl>
 <20180424173051.15099-4-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424173051.15099-4-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Frank Rowand <frowand.list@gmail.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arend van Spriel <aspriel@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Michal Suchanek <msuchanek@suse.de>, Jan
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 04/24/2018 10:30 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  arch/sh/Kconfig                 |  1 +
>  drivers/base/Kconfig            |  4 ++++
>  drivers/base/platform.c         |  3 +++
>  include/linux/platform_device.h | 32 ++++++++++++++++++++++++++++++++
>  4 files changed, 40 insertions(+)

> index 29b0eb452b3a..37de5e1d6217 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -205,6 +205,10 @@ config DEBUG_TEST_DRIVER_REMOVE
>  	  unusable. You should say N here unless you are explicitly looking to
>  	  test this functionality.
>  
> +config EARLY_PLATFORM_DEVICES
> +	bool
> +	default n

The default value is already 'n', so we usually ask people to omit that
value.  OTOH, you could combine those 2 lines into:

	def_bool n


> +
>  source "drivers/base/test/Kconfig"
>  
>  config SYS_HYPERVISOR


-- 
~Randy
