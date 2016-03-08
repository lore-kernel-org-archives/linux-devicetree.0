From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/5] regulator: pwm: Add supports for multiple instance and voltage linear steps
Date: Tue, 8 Mar 2016 16:23:20 +0530
Message-ID: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series fix the equation for calculating the ducty cycle for PWM,
add supports for multiple instances, prints the error numbers if it fails,
and add Linear Equal Step mode for voltage setting.

For the context: NVIDIA's Tegra210 platform Jetson-TX1 uses the two
Open Voltage Regulators (OVR i.e. uP1665P) regulators for CPU and
GPU rails. These regulators are controlled by the PWM controller.

Laxman Dewangan (5):
  regulator: pwm: Fix calculation of voltage-to-duty cycle
  regulator: pwm: Add support to have multiple instance of pwm regulator
  regulator: pwm: Prints error number when it fails
  regulator: pwm: Add support for voltage linear steps
  regulator: pwm: Add DT binding details for Linear Equal Step Mode

 .../bindings/regulator/pwm-regulator.txt           |  32 +++++-
 drivers/regulator/pwm-regulator.c                  | 109 +++++++++++++++++----
 2 files changed, 120 insertions(+), 21 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
