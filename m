From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Wed, 24 Sep 2014 10:30:41 +0200
Message-ID: <2923729.dtX0WmHSV0@wuerfel>
References: <1411468088-5702-1-git-send-email-antoine.tenart@free-electrons.com> <20140924022736.GA5307@peterchendt> <2990737.4KzKXPZhaB@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2990737.4KzKXPZhaB@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, Antoine Tenart <antoine.tenart@free-electrons.com>, linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com, p.zabel@pengutronix.de, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com
List-Id: devicetree@vger.kernel.org

On Wednesday 24 September 2014 09:44:19 Arnd Bergmann wrote:
> 
> We can also gradually move in some of the other glue drivers into
> the main driver if the differences are small enough.
> 

FWIW, I've just looked at the other glue drivers that already
exist:

- zevio can just get merged into the common driver, all that seems
  to be needed for that is the additional compatible string, and
  keying off the ci_default_zevio_platdata on the .data field of
  the of_device_id table.

- msm has a custom notifier, which justifies leaving it in a separate
  driver, but it's also small enough that it wouldn't hurt to have
  that merged into the main driver too.

- imx requires a lot of other things, in particular the dependency
  on the usbmisc driver means we don't want to have that in the
  core anyway, so we can't really merge that in.

- the proposed ar933x driver again looks almost trivial, so no reason
  for a separate glue driver for that.

	Arnd
