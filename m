From: <linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/2] Add CX9020 device tree
Date: Thu, 13 Jul 2017 13:13:37 +0200
Message-ID: <20170713111340.13862-1-linux-kernel-dev@beckhoff.com>
References: <20170712090408.12212-1-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170712090408.12212-1-linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>

Add device tree for Beckhoff CX9020 Embedded PC.

The CX9020 differs from i.MX53 Quick Start Board by:
- use uart2 instead of uart1
- DVI-D connector instead of VGA
- no audio
- CCAT FPGA connected to emi
- enable rtc

v3: add missing changelog, sorry about the noise
v2:
- include simple ddc-only panel patch
- keep alphabetic order of dts/Makefile
- configure uart2 with 'fsl,dte-mode'
- use display-0 and panel-0 as node names
- remove unnecessary "simple-bus" for fixed regulators


Patrick Bruenn (2):
  ARM: dts: imx: add CX9020 Embedded PC device tree
  drm/panel: simple: Add support for ddc-only panel

 arch/arm/boot/dts/Makefile           |   1 +
 arch/arm/boot/dts/imx53-cx9020.dts   | 370 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c |   6 +
 3 files changed, 377 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx53-cx9020.dts

-- 
2.11.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
