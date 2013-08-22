Return-Path: <devicetree-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:52468 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753902Ab3HVV0W (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 22 Aug 2013 17:26:22 -0400
From: Darren Etheridge <detheridge@ti.com>
Subject: [RFC v2 0/1] Adding DT support to video/da8xx-fb.c
Date: Thu, 22 Aug 2013 16:21:40 -0500
Message-ID: <1377206501-30519-1-git-send-email-detheridge@ti.com>
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

v2: incorporates -
	* review comment changes from Prabhakar Lad
	* changes the .compatible naming to match that of the exiting drm 
		driver for am335x devices.
	* Renames the devicetree bindings documentation file to match the
		actual driver filename

Thanks,
Darren

Darren Etheridge (1):
  video: da8xx-fb: adding dt support

 .../devicetree/bindings/video/da8xx-fb.txt         |   42 ++++++++++++
 drivers/video/da8xx-fb.c                           |   66 +++++++++++++++++++-
 2 files changed, 105 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/video/da8xx-fb.txt

