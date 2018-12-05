From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 6/6] fieldbus_dev: support HMS Profinet IRT industrial
 controller
Date: Tue, 4 Dec 2018 17:03:47 -0800
Message-ID: <1d941b95-3580-46c9-1148-4333898d88d6@infradead.org>
References: <20181204220224.27324-1-TheSven73@googlemail.com>
 <20181204220224.27324-7-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204220224.27324-7-TheSven73@googlemail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>, svendev@arcx.com, robh+dt@kernel.org, linus.walleij@linaro.org
Cc: lee.jones@linaro.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/4/18 2:02 PM, Sven Van Asbroeck wrote:
> diff --git a/drivers/fieldbus/anybuss/Kconfig b/drivers/fieldbus/anybuss/Kconfig
> index 7e563a78be13..1d0e7516b18e 100644
> --- a/drivers/fieldbus/anybuss/Kconfig
> +++ b/drivers/fieldbus/anybuss/Kconfig
> @@ -20,4 +20,20 @@ config ARCX_ANYBUS_CONTROLLER
>  	  There is also a CAN power readout, unrelated to the Anybus,
>  	  modelled as a regulator.
>  
> +config HMS_PROFINET
> +	tristate "HMS Profinet IRT Controller (Anybus-S)"
> +	depends on FIELDBUS_DEV && HMS_ANYBUSS_BUS
> +	help
> +	 If you say yes here you get support for the HMS Industrial
> +	 Networks Profinet IRT Controller.
> +
> +	 It will be registered with the kernel as a fieldbus_dev,
> +	 so userspace can interact with it via the fieldbus_dev userspace
> +	 interface(s).
> +
> +	 This driver can also be built as a module. If so, the module
> +	 will be called hms-profinet.
> +
> +	 If unsure, say N.
> +
>  endif

Indent with tab + 2 spaces.

-- 
~Randy
