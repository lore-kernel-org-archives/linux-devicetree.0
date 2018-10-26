From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH anybus v1 1/4] mfd: support the Arcx anybus bridge.
Date: Fri, 26 Oct 2018 09:34:10 +0100
Message-ID: <20181026083410.GO4870@dell>
References: <20181024142456.10084-1-svendev@arcx.com>
 <20181024142456.10084-2-svendev@arcx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181024142456.10084-2-svendev@arcx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <svendev@arcx.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, andriy.shevchenko@linux.intel.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, yuanzhichang@hisilicon.com, stuyoder@gmail.com, linus.walleij@linaro.org, maxime.ripard@bootlin.com, bogdan.purcareata@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 24 Oct 2018, Sven Van Asbroeck wrote:

> Add a driver for the Arcx anybus bridge.
> 
> This chip embeds up to two Anybus-S application connectors
> (slots), and connects to the SoC via the i.MX parallel WEIM bus.
> There is also a CAN power readout, unrelated to the anybus.
> 
> Signed-off-by: Sven Van Asbroeck <svendev@arcx.com>
> ---
>  drivers/mfd/Kconfig          |  11 +
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/anybus-bridge.c  | 441 +++++++++++++++++++++++++++++++++++
>  include/linux/anybuss-host.h |  28 +++
>  4 files changed, 481 insertions(+)
>  create mode 100644 drivers/mfd/anybus-bridge.c
>  create mode 100644 include/linux/anybuss-host.h

Wow, this driver is going to need a lot of work.

But before we get going, how many sub-devices does this have?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
