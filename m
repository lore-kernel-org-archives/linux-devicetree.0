From: "David R. Piegdon" <lkml@p23q.org>
Subject: [RFC PATCH 0/2] USB: DTS: allow suggesting busnumber for platform
 USB bus via DTS alias
Date: Tue, 27 Nov 2018 16:57:05 +0000
Message-ID: <20181127165705.GA13460@lagavulin.indurad.x>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Alan Stern <stern@rowland.harvard.edu>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Kay Sievers <kay@vrfy.org>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, systemd-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Hi,

on our embedded systems we rely on systemd's persistent netdev names.
Those currently do not work for USB netdevs that are connected to a
platform USB bus.

In https://github.com/systemd/systemd/pull/7273 a systemd patch was
suggested that would allow exactly this, but it was (rightfully) said
that numbering of theses busses is not guaranteed. Internally we used
the patch for a while now, but exactly that has happened with one of our
platforms across different kernel revisions.

The following kernel patches allow suggesting a USB busnumber for each
USB platform bus via a DTS alias, as can be done similarly for many
other devices.
In combination with above systemd patch, these changes allow use of
persistent netdev names also on platform USB busses.

NOTE: this patch might change ordering of busses on devices that use
platform-busses, if aliases for these busses have already been defined!
In the current master there are a few platforms that contain such
aliases, e.g. am33xx, dm814x or imx6qdl

Yours,

David

David R. Piegdon (2):
  usb core: dts: allow suggesting usb bus number for platform busses
  dt-bindings: allow suggesting usb bus number for usb platform busses

 Documentation/devicetree/bindings/usb/usb-hcd.txt |  9 +++++++
 drivers/usb/core/hcd.c                            | 30 ++++++++++++++++++-----
 2 files changed, 33 insertions(+), 6 deletions(-)

-- 
2.11.0
