From: Arkadiusz Lis <areklis909@gmail.com>
Subject: emxx_udc device tree bindings
Date: Thu, 20 Sep 2018 20:35:52 +0200
Message-ID: <1537468552-2533-1-git-send-email-areklis909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: devicetree@vger.kernel.org
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, chrisadr@gentoo.org, dan.carpenter@oracle.com
List-Id: devicetree@vger.kernel.org

Hi all,
I would like to help getting emxx_udc driver out of staging.
One of the things to do is to adjust it to using device tree.
The bindings are not defined yet. I have a blurred idea what properties are needed
however I've never done it and your support and comments will be really appreciated.

So, the drivers usually need the 'compatible' property with the manufacturer and device name,
so it is probably needed here as well.

According to Documentation/driver-api/gpio/board.rst,
to use gpio consumer interface (also on TODO list), '<function>-gpios'
property will be required. '<function>' is the name that is referenced in the driver
to obtain the gpio via gpiod_get(). Linus Walleij proposed 'vbus-gpios'.

IRQs are also used in this driver: USB_UDC_IRQ_1 and INT_VBUS,
it seems that 'interrupts' property will also be required.

Also memory region is mapped in the probe function.
	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	mmio_base = devm_ioremap_resource(&pdev->dev, r);

Maybe 'reg' property can be used to describe physical base address and size of register map?
What are your suggestions?

Thanks for help,
Arek
