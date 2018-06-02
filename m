From: kbuild test robot <fengguang.wu@intel.com>
Subject: [RFC PATCH] gnss: ubx_gserial_ops can be static
Date: Sat, 2 Jun 2018 14:07:58 +0800
Message-ID: <20180602060757.GA24149@lkp-ne02>
References: <20180530103242.20773-6-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180530103242.20773-6-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, Marcel Holtmann <marcel@holtmann.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org


Fixes: 45cad4b6d339 ("gnss: add driver for u-blox receivers")
Signed-off-by: kbuild test robot <fengguang.wu@intel.com>
---
 ubx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gnss/ubx.c b/drivers/gnss/ubx.c
index ecddfb3..c7dcfdc 100644
--- a/drivers/gnss/ubx.c
+++ b/drivers/gnss/ubx.c
@@ -59,7 +59,7 @@ static int ubx_set_power(struct gnss_serial *gserial,
 	return -EINVAL;
 }
 
-const struct gnss_serial_ops ubx_gserial_ops = {
+static const struct gnss_serial_ops ubx_gserial_ops = {
 	.set_power = ubx_set_power,
 };
 
