From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH 0/2] iio: mxs-lradc: check ranges of ts properties
Date: Mon, 22 Dec 2014 12:14:34 +0000
Message-ID: <1419250476-2393-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kristina.martsenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These patch series fixes off-by-one issues of the touchscreen DT properties
and finally adds a range check during probe.

Only the range check has been tested by myself, because i don't have a
touchscreen. So a functional test is very welcome.

Changes since RFC:
- add fix for off-by-one issues
- first check DT properties and then assign a value
- adapt range check to better represent DT binding
- add important note from the reference manual as comment

Stefan Wahren (2):
  DT: mxs-lradc: fix ranges of ts properties
  iio: mxs-lradc: check ranges of ts properties

 .../bindings/staging/iio/adc/mxs-lradc.txt         |    4 +-
 drivers/staging/iio/adc/mxs-lradc.c                |   44 +++++++++++++++-----
 2 files changed, 36 insertions(+), 12 deletions(-)

-- 
1.7.9.5
