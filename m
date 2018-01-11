From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/3] Add R-Car V3M (R8A77970) support to the DU driver
Date: Thu, 11 Jan 2018 19:54:32 +0300
Message-ID: <20180111165432.745995666@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hello!

Here's the set of 3 patches against the 'drm-next' branch of David Airlie's
'linux.git' repo plus the patch fixing LVDCR1 for R-Car gen3 posted recently.
The main purpose of these patches is to add the R-Car V3M (R8A77970) support
to the DU driver, we have to do some refactoring first to achieve this goal...

[1/3] drm: rcar-du: lvds: refactor LVDS startup
[2/3] drm: rcar-du: add 'model' field to 'struct rcar_du_device_info'
[3/3] drm: rcar-du: add R8A77970 support

MBR, Sergei
