From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: [PATCH 0/4] Qualcomm Shared Memory State Machines
Date: Thu, 27 Aug 2015 10:37:54 -0700
Message-ID: <1440697078-4106-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series implements the two different mechanisms for propagating single bit
state information, used on the various Qualcomm platforms.

The system was traditionally used by the modem and application processor to
convey information about boot progress, power states, error handling and so on.
This was implemented as SMSM, with status bits representing a single local
state.

As the complexity of the SoC grew the state bits array grew and the need for
targeting specific state information at specific remote processors appeared.
SMP2P solves this by having separate shared memory regions per processor-pair.

This state information is e.g. used to convey progress and status of remote
firmware loading. Individual bits maps to various stages of the boot and error
states.

As some of these states on some platforms are passed as physical signals
instead, the two drivers are modelled as gpio- and interrupt-controllers -
providing a nice abstraction both in device tree sense and Linux implementation
sense.

Bjorn Andersson (4):
  dt-binding: gpio: Add Qualcomm SMSM device tree documentation
  gpio: qcom-smsm: Add driver for Qualcomm SMSM
  dt-binding: gpio: Introduce qcom,smp2p binding documentation
  gpio: qcom-smp2p: Qualcomm Shared Memory Point to Point

 .../devicetree/bindings/gpio/qcom,smp2p.txt        | 112 ++++
 .../devicetree/bindings/gpio/qcom,smsm.txt         | 114 ++++
 drivers/gpio/Kconfig                               |  15 +
 drivers/gpio/Makefile                              |   2 +
 drivers/gpio/gpio-qcom-smp2p.c                     | 601 ++++++++++++++++++++
 drivers/gpio/gpio-qcom-smsm.c                      | 631 +++++++++++++++++++++
 6 files changed, 1475 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/qcom,smp2p.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/qcom,smsm.txt
 create mode 100644 drivers/gpio/gpio-qcom-smp2p.c
 create mode 100644 drivers/gpio/gpio-qcom-smsm.c

-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
