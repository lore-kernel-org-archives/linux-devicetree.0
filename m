From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: section mismatch in drivers/w1/masters/w1-gpio.c
Date: Sun, 27 Jan 2013 20:36:00 +0100
Message-ID: <510581A0.2080801@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: zbr@ioremap.net, panto@antoniou-consulting.com, Greg KH <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi,

when building 3.8-rc5 I get the following section mismatch:

WARNING: drivers/w1/masters/w1-gpio.o(.data+0x188): Section mismatch in
reference from the variable w1_gpio_driver to the function
.init.text:w1_gpio_probe()
The variable w1_gpio_driver references
the function __init w1_gpio_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console


The __init in front of w1_gpio_probe() should be removed.

Hauke
