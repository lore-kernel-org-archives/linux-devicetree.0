From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv6_input/next 0/5]  Add spi support for CMA3000 driver
Date: Wed,  9 Nov 2011 22:37:27 +0100
Message-ID: <1320874652-18371-1-git-send-email-ricardo.ribalda__21191.7347660803$1320874688$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, aghayal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, peter.ujfalusi@ti
List-Id: devicetree@vger.kernel.org

The following set of patches add spi and device tree support for the cma3000 driver.

v6 of the set.

Changelog:

  v6: -Rebase to input/next
  v5: -Changes propossed by Grant Likely
      -Remove crm300 driver from the set
  v4: -Changes propossed by Dmitry Torokhov
  v3: -Support for device tree
      -Separate read/write spi
  v2: -Changes propossed by Jonathan Cameron
      -More fixes for the cma3000 driver

Ricardo Ribalda Delgado (5):
  input/cma3000_d0x: Support devices without pdata
  input/cma3000_d0x: Check silicon version
  input/cma3000_d0x: Keep configuration on poweroff
  input/cma3000_d0x: Add CMA3000 spi support
  input/cma3000_d0x: Match comment to name of struct



Ricardo Ribalda Delgado (5):
  input/cma3000_d0x: Support devices without pdata
  input/cma3000_d0x: Check silicon version
  input/cma3000_d0x: Keep configuration on poweroff
  input/cma3000_d0x: Add CMA3000 spi support
  input/cma3000_d0x: Match comment to name of struct

 .../devicetree/bindings/input/cma3000_d0x.txt      |   71 +++++++++
 drivers/input/misc/Kconfig                         |   14 ++-
 drivers/input/misc/Makefile                        |    1 +
 drivers/input/misc/cma3000_d0x.c                   |  100 +++++++++++--
 drivers/input/misc/cma3000_d0x_i2c.c               |    7 +
 drivers/input/misc/cma3000_d0x_spi.c               |  153 ++++++++++++++++++++
 include/linux/input/cma3000.h                      |    2 +-
 7 files changed, 332 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/cma3000_d0x.txt
 create mode 100644 drivers/input/misc/cma3000_d0x_spi.c

-- 
1.7.7.2
