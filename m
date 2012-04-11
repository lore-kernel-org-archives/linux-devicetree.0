From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1 0/2] istaging: iio: add isl29028 driver
Date: Wed, 11 Apr 2012 22:57:07 +0530
Message-ID: <1334165229-11285-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, jbrenner-yYKgigLBUwlBDgjK7y7TUQ@public.gmane.org, rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, max-U9r9yeDMy7A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

ISL29028 is concurrent Ambient light and proximity sensor from intersil.
Adding driver for supporting this device.

Also adding details of interface roximity_sampling_period in documentation.

Laxman Dewangan (2):
  staging: iio: add driver for isl29028
  staging: Documentation: add proximity_sampling_period as sysfs
    details

 .../staging/iio/Documentation/sysfs-bus-iio-light  |    7 +
 drivers/staging/iio/light/Kconfig                  |   10 +
 drivers/staging/iio/light/Makefile                 |    1 +
 drivers/staging/iio/light/isl29028.c               |  538 ++++++++++++++++++++
 4 files changed, 556 insertions(+), 0 deletions(-)
 create mode 100644 drivers/staging/iio/light/isl29028.c
