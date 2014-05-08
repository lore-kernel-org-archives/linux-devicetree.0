From: "Shimoda, Yoshihiro" <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCHv4 08/20] usb: host: xhci-plat: add support for the Armada
 375/38x XHCI controllers
Date: Thu, 8 May 2014 11:44:48 +0900
Message-ID: <536AEFA0.3070806@renesas.com>
References: <1399470746-2948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1399470746-2948-9-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1399470746-2948-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Grant Likely <grant.likely@secretlab.ca>, Tawfik Bayouk <tawfik@marvell.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

(2014/05/07 22:52), Thomas Petazzoni wrote:
> diff --git a/drivers/usb/host/xhci-mvebu.h b/drivers/usb/host/xhci-mvebu.h
> new file mode 100644
> index 0000000..61d09b6
> --- /dev/null
> +++ b/drivers/usb/host/xhci-mvebu.h
> @@ -0,0 +1,21 @@
> +/*
> + * Copyright (C) 2014 Marvell
> + *
> + * Gregory Clement <gregory.clement@free-electrons.com>
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2.  This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#ifndef __LINUX_XHCI_MVEBU_H
> +#define __LINUX_XHCI_MVEBU_H
> +#if IS_ENABLED(CONFIG_USB_XHCI_MVEBU)
> +int xhci_mvebu_mbus_init_quirk(struct platform_device *pdev);
> +#else
> +static inline int xhci_mvebu_mbus_init_quirk(struct device dev)

I could not compile this code when I disabled CONFIG_USB_XHCI_MVEBU:
	incompatible type for argument 1 of 'xhci_mvebu_mbus_init_quirk'.

So, the "struct device dev" should be changed to "struct platform_device *pdev".

Best regards,
Yoshihiro Shimoda
