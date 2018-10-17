From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] misc: hx8837: add a HiMax HX8837 display controller
 driver
Date: Wed, 17 Oct 2018 09:07:44 -0500
Message-ID: <20181017140744.GA21328@bogus>
References: <20181008202321.128937-1-lkundrak@v3.sk>
 <20181008202321.128937-2-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181008202321.128937-2-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

On Mon,  8 Oct 2018 22:23:21 +0200, Lubomir Rintel wrote:
> HiMax HX8837 is a display controller used on OLPC platforms. It controlls
> backlight and is able to capture and freeze a frame when the LCD controller
> (and the rest of the plaform) is powered off.
> 
> This driver is based on the same code as drivers/staging/olpc_dcon.
> I modernized it to use managed GPIO, device-tree bindings, sysfs attribtue
> groups, essentially fixing the staging driver's TODO.
> 
> Why I am not removing the staging driver now is because I've hobbled off
> some functionality too (with an intent to bring add it back eventually):
> 
> * I've removed parts that talk directly to the OLPC EC to turn off/on the
>   power. A separate patch will make the EC expose a regulator interface
>   that should be used instead.
> 
> * Some work is likely needed to make XO 1 and XO 1.5 work. Both platforms
>   are DT-based and could use the same bindings, but I haven't checked
>   whether the cs5535 and vx855 GPIO drivers are good enough.
> 
> What is there is the backlight control and the sysfs attributes to control
> the freeze/unfreeze..
> 
> I've also renamed the driver to use the actual chip name instead of the
> original name that I found too generic. This way the staging driver can be
> used on XO 1 and XO 1.5 for the time being, while my XO 1.75 can utilize
> this one.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
> Changes since v1:
> - Use interrupt bindings instead of gpio for the IRQ
> - Update the statement on XO 1/1.5 support in the commit message
> 
>  drivers/misc/Kconfig  |  16 +
>  drivers/misc/Makefile |   1 +
>  drivers/misc/hx8837.c | 741 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 758 insertions(+)
>  create mode 100644 drivers/misc/hx8837.c
> 

Reviewed-by: Rob Herring <robh@kernel.org>
