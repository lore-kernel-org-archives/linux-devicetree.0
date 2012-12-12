From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v4 0/7] leds: leds-pwm: Device tree support
Date: Wed, 12 Dec 2012 10:04:45 +0100
Message-ID: <1355303092-15523-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

Changes since v3:
Addressed comments from Thierry Redding:
- DT binding documentation for leds-pwm updated
- of_pwm_request() renamed as of_pwm_get()
- introduction of devm_of_pwm_get()
- Commit message updates
- Other comments has been also addressed
- Acked-by from Grant is not added to the patches since they were modified since
  v3

Changes since v2:
- rebased on top of linux-next
- DT bindings now alligned with Grant's request
- exporting of_pwm_request() from PWM core to allow clean DT bindings
- DT binding documentation changed to reflect the changes

Changes since v1:
- As suggested by Bryan Wu: the legacy pwm_request() has been removed from
  patch 1
- Device tree bindings added for leds-pwm driver.

When we boot with Device tree we handle one LED per device to be more aligned
with PWM core's DT implementation.
An example of the DT usage is provided in the new DT binding documentation for
leds-pwm.

Tested on OMAP4 Blaze (SDP), BeagleBoard with legacy and DT boot. On Zoom2 with
legacy boot.

Regards,
Peter
---
Peter Ujfalusi (7):
  leds: leds-pwm: Convert to use devm_get_pwm
  leds: leds-pwm: Preparing the driver for device tree support
  pwm: Correct parameter name in header for *pwm_get() functions
  pwm: core: Rename of_pwm_request() to of_pwm_get() and export it
  pwm: Add devm_of_pwm_get() as exported API for users
  leds: leds-pwm: Simplify cleanup code
  leds: leds-pwm: Add device tree bindings

 .../devicetree/bindings/leds/leds-pwm.txt          |  48 +++++++
 drivers/leds/leds-pwm.c                            | 152 +++++++++++++++------
 drivers/pwm/core.c                                 |  38 +++++-
 include/linux/leds_pwm.h                           |   2 +-
 include/linux/pwm.h                                |  20 ++-
 5 files changed, 212 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt

-- 
1.8.0
