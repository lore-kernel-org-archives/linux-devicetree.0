From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH RFC v2 0/2] max77693-led driver
Date: Tue, 19 Feb 2013 16:36:15 +0100
Message-ID: <1361288177-14452-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: Samuel Ortiz <sameo@linux.intel.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

Those two patches add max77693-led driver with device tree support.
Driver is exposed to user space as a V4L2 flash subdevice.
This subdevice should be registered by V4L2 driver of the camera device.

Changes for v2 are described in patch 2/2, thanks for review to Sylwester.
Additionally I have inserted missing description of the patch 1/2.
I have also added e-mail recipients according to MAINTENANCE file.

Regards
Andrzej
