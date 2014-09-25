From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Thu, 25 Sep 2014 21:12:07 +0200
Message-ID: <201409252112.07513.arnd@arndb.de>
References: <1411468088-5702-1-git-send-email-antoine.tenart@free-electrons.com> <1411468088-5702-8-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411468088-5702-8-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, sebastian.hesselbarth@gmail.com, Peter.Chen@freescale.com, balbi@ti.com, p.zabel@pengutronix.de, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com
List-Id: devicetree@vger.kernel.org

On Tuesday 23 September 2014, Antoine Tenart wrote:
> +static int ci_hdrc_usb2_dt_probe(struct device *dev,
> +                                struct ci_hdrc_platform_data *ci_pdata)
> +{
> +       ci_pdata->phy = of_phy_get(dev->of_node, 0);

FWIW, I accidentally built a kernel with this driver enabled and got a warning
for this code. The problem is that ci_pdata->phy is a 'struct usb_phy' pointer,
while of_phy_get() returns a generic 'struct phy'. While the two have similar
behavior, they are not the same thing and this can't work.

	Arnd
