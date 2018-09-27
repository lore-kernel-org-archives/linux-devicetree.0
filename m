From: Li Yang <leoyang.li@nxp.com>
Subject: drivers binding to device node with multiple compatible strings
Date: Thu, 27 Sep 2018 17:25:42 -0500
Message-ID: <CADRPPNT0QiBkJtJnxjW95Yf-mirL5OzRrvqj8rC-O8fiz17VnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Hi Rob and Grant,

Various device tree specs are recommending to include all the
potential compatible strings in the device node, with the order from
most specific to most general.  But it looks like Linux kernel doesn't
provide a way to bind the device to the most specific driver, however,
the first registered compatible driver will be bound.

As more and more generic drivers are added to the Linux kernel, they
are competing with the more specific vendor drivers and causes problem
when both are built into the kernel.  I'm wondering if there is a
generic solution (or in plan) to make the most specific driver bound
to the device.   Or we have to disable the more general driver or
remove the more general compatible string from the device tree?

Regards,
Leo
