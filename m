Return-Path: <devicetree-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:54475 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S966334Ab3HHUS7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Thu, 8 Aug 2013 16:18:59 -0400
From: Darren Etheridge <detheridge@ti.com>
Subject: [RFC 0/1] Adding DT support to video/da8xx-fb.c
Date: Thu, 8 Aug 2013 15:15:35 -0500
Message-ID: <1375992936-16755-1-git-send-email-detheridge@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org, tomi.valkeinen@ti.com, plagnioj@jcrosoft.com, linux-fbdev@vger.kernel.org, detheridge@ti.com
Cc: afzal@ti.com
List-ID: <devicetree@vger.kernel.org>

This is part of a larger series of patches to upgrade the da8xx-fb.c driver
to support the Texas Instruments AM335x device.  As part of this upgrade
we also want to add devicetree support for both the original da8xx and the
am335x.  Tomi Valkeinen has reviewed the fbdev changes but he suggested
that it was prudent to extract the dt pieces and run it through the
devicetree mailing list for review.

Thanks,
Darren

Darren Etheridge (1):
  video: da8xx-fb: adding dt support

 .../devicetree/bindings/video/fb-da8xx.txt         |   37 +++++++++++
 drivers/video/da8xx-fb.c                           |   67 +++++++++++++++++++-
 2 files changed, 101 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/video/fb-da8xx.txt

