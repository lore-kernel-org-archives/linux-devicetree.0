From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 0/2] Set the Raspberry Pi Ethernet MAC address
Date: Wed,  3 Feb 2016 16:02:37 +0100
Message-ID: <1454511759-24827-1-git-send-email-lkundrak@v3.sk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, Lee Jones <lee@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Peter Chen <peter.chen@freescale.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Hello,

Looks like Peter Chen has submitted a patch that associates the USB device with 
the device-tree node. This is nice; we could use it to propagate the MAC address
from firmware with minimal changes now, something that Arnd Bergmann suggested
back in 2011 [2].

[1] USB: core: let USB device know device node
    https://patchwork.ozlabs.org/patch/572621/

[2] Re: RFC: Platform data for onboard USB assets
    https://lkml.org/lkml/2011/3/17/416

Tested to work fine on the B+ board with Peter's patch and a trivial change to
u-boot so that the board code sets $ethaddr in addition to $usbethaddr for the
dt fixup code.

Lubo
