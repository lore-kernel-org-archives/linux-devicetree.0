From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 1/6] fieldbus_dev: add Fieldbus Device subsystem.
Date: Tue, 4 Dec 2018 17:01:07 -0800
Message-ID: <54b830ec-4968-3dd0-af2f-5559059b6e4c@infradead.org>
References: <20181204220224.27324-1-TheSven73@googlemail.com>
 <20181204220224.27324-2-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204220224.27324-2-TheSven73@googlemail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>, svendev@arcx.com, robh+dt@kernel.org, linus.walleij@linaro.org
Cc: lee.jones@linaro.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/4/18 2:02 PM, Sven Van Asbroeck wrote:
> diff --git a/drivers/fieldbus/Kconfig b/drivers/fieldbus/Kconfig
> new file mode 100644
> index 000000000000..1d1929ba7e27
> --- /dev/null
> +++ b/drivers/fieldbus/Kconfig
> @@ -0,0 +1,19 @@
> +menuconfig FIELDBUS_DEV
> +        bool "Fieldbus Device Support"
> +        help
> +          Support for Fieldbus Device Adapters.
> +
> +	  Fieldbus device (client) adapters allow data exchange with a PLC aka.
> +	  "Fieldbus Controller" over a fieldbus (Profinet, FLNet, etc.)
> +
> +	  They are typically used when a Linux device wants to expose itself
> +	  as an actuator, motor, console light, switch, etc. over the fieldbus.
> +
> +          This framework is designed to provide a generic interface to Fieldbus
> +          Devices from both the Linux Kernel and the userspace.
> +
> +          If unsure, say no.
> +
> +if FIELDBUS_DEV
> +
> +endif

Hi,
Please consistently use one tab + 2 spaces to indent Kconfig help text,
as documented in Documentation/process/coding-style.rst.

-- 
~Randy
