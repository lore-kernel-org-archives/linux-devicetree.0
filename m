From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2] iio:lps331ap: Add support for DT
Date: Fri, 19 Jul 2013 15:36:20 +0200
Message-ID: <1374240981-13560-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: denis.ciocca-qxv4g6HH51o@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is the second version of the patch from the series (1).

It includes following improvements:
  - added vendor prefix to the driver DT identifier
  - resigned from using LPS331AP_PRESS_DEV_NAME macro
    in few places in favour of clear text
  - fixed description of the interrupt-map elements
    in the DT binding documentation file

(1) http://www.spinics.net/lists/linux-iio/msg08883.html

Thanks,
Jacek

Jacek Anaszewski (1):
  iio: lps331ap: Add support for DT

 .../devicetree/bindings/iio/pressure/lps331ap.txt  |   41 ++++++++++++++++++++
 drivers/iio/pressure/st_pressure_i2c.c             |   11 +++++-
 drivers/iio/pressure/st_pressure_spi.c             |   11 +++++-
 3 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/pressure/lps331ap.txt

-- 
1.7.5.4
