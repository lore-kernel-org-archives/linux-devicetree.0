Return-Path: <SRS0=Pkj0=WX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from anchovy3.45ru.net.au ([203.30.46.155]:43839 "EHLO
        anchovy3.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728999AbfH0DxW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 26 Aug 2019 23:53:22 -0400
From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 0/2] iio: core: Add optional symbolic label to device attributes
Date: Tue, 27 Aug 2019 11:35:22 +0800
Message-Id: <1566876924-63608-1-git-send-email-preid@electromag.com.au>
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, preid@electromag.com.au, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, michal.simek@xilinx.com
List-ID: <devicetree@vger.kernel.org>

If a label is defined in the device tree for this device add that
to the device specific attributes. This is useful for userspace to
be able to identify an individual device when multiple identical
chips are present in the system.

Similar to leds, display labels etc.

Phil Reid (2):
  dt-binding: iio: Add optional label property
  iio: core: Add optional symbolic label to device attributes

 Documentation/devicetree/bindings/iio/iio-bindings.txt |  5 +++++
 drivers/iio/industrialio-core.c                        | 17 +++++++++++++++++
 include/linux/iio/iio.h                                |  1 +
 3 files changed, 23 insertions(+)

-- 
1.8.3.1
