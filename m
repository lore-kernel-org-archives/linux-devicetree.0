From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/6] Introduce Juniper CBC FPGA
Date: Fri, 7 Oct 2016 17:39:44 +0200
Message-ID: <20161007153944.GA13519@kroah.com>
References: <1475853614-22409-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1475853614-22409-1-git-send-email-pantelis.antoniou@konsulko.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Debjit Ghosh <dghosh@juniper.net>, Mohammad Kamil <mkamil@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Lee Jones <lee.jones@linaro.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 07, 2016 at 06:20:08PM +0300, Pantelis Antoniou wrote:
> Add Juniper's PTX1K CBC FPGA driver. Those FPGAs
> are present in Juniper's PTX series of routers.
> 
> The MFD driver provices a gpio device and a special
> driver for Juniper's board infrastucture.
> The FPGA infrastucture driver is providing an interface
> for user-space handling of the FPGA in those platforms.
> 
> There are full device tree binding documents for the
> master mfd driver and for the slave driver.
> 
> This patchset is against mainline as of today: v4.8-9431-g3477d16
> and is dependent on the "Juniper prerequisites" and
> "Juniper infrastructure" patchsets sent earlier.
> 
> Georgi Vlaev (5):
>   mfd: Add support for the PTX1K CBC FPGA
>   gpio: Add support for PTX1K CBC FPGA spare GPIOs
>   gpio: gpio-cbc: Document bindings of CBC FPGA GPIO block
>   gpio: cbc-presence: Add CBC presence detect as GPIO driver
>   gpio: gpio-cbc-presense: Document bindings of CBC FPGA presence
> 
> Tom Kavanagh (1):
>   staging: jnx: CBD-FPGA infrastructure
> 
>  .../bindings/gpio/jnx,gpio-cbc-presense.txt        |  31 +
>  .../devicetree/bindings/gpio/jnx,gpio-cbc.txt      |  30 +
>  drivers/gpio/Kconfig                               |  23 +
>  drivers/gpio/Makefile                              |   2 +
>  drivers/gpio/gpio-cbc-presence.c                   | 460 ++++++++++
>  drivers/gpio/gpio-cbc.c                            | 236 +++++
>  drivers/mfd/Kconfig                                |  16 +
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/cbc-core.c                             | 971 +++++++++++++++++++++
>  drivers/staging/jnx/Kconfig                        |  34 +
>  drivers/staging/jnx/Makefile                       |   5 +
>  drivers/staging/jnx/jnx-cbc-ptx1k.c                | 242 +++++
>  drivers/staging/jnx/jnx-cbd-fpga-common.c          | 332 +++++++
>  drivers/staging/jnx/jnx-cbd-fpga-common.h          |  27 +
>  drivers/staging/jnx/jnx-cbd-fpga-core.c            | 540 ++++++++++++
>  drivers/staging/jnx/jnx-cbd-fpga-core.h            |  68 ++
>  drivers/staging/jnx/jnx-cbd-fpga-platdata.h        |  51 ++
>  drivers/staging/jnx/jnx-cbd-fpga-ptx1k.c           | 134 +++
>  drivers/staging/jnx/jnx-cbd-fpga-ptx21k.c          | 143 +++
>  drivers/staging/jnx/jnx-cbd-fpga-ptx3k.c           | 111 +++
>  drivers/staging/jnx/jnx-cbd-fpga-ptx5k.c           | 107 +++
>  include/linux/mfd/cbc-core.h                       | 181 ++++
>  22 files changed, 3745 insertions(+)

Please don't mix driver submissions like this.  Staging stuff needs to
go to the staging maintainer, gpio to that one, mfd to that one, and so
on.

there's almost nothing anyone can do with this series as-is, sorry.

please split it up.

thanks,

greg k-h
