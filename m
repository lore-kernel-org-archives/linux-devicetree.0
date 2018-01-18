From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Add R-Car V3M (R8A77970) support to the DU driver
Date: Fri, 19 Jan 2018 00:05:57 +0300
Message-ID: <20180118210557.091065338@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hello!

Here's the set of 2 patches against the 'drm-next' branch of David Airlie's
'linux.git' repo. The purpose of these patches is to add the R-Car V3M
(R8A77970) support to the DU driver; the LVDS driver patches will be posted
separately...

[1/2] DT: display: renesas,du: document R8A77970 bindings
[2/2] drm: rcar-du: add R8A77970 support

MBR, Sergei
