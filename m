From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 0/6] Bindings for Armada display subsystem
Date: Sun, 20 Jan 2019 18:25:28 +0100
Message-ID: <20190120172534.24617-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

this patch set extends the bindings documentation of Armada LCDC to
cover the rest of the display subsystem.

It is based on what was implemented by Russel's patch set that
implements the dt bindings for armada-drm [1].

[1] https://lists.freedesktop.org/archives/dri-devel/2018-July/182893.htm=
l

There are some differencies though:

* Compatible strings for the MMP2 platform were added
* The compatible strings for the display-subsystem node and the
  framebuffer node include "marvell,armada-display-subsystem" and
  "marvell,armada-framebuffer" since they are hardware agnostic and
  supportable with the same driver code.
* The "bus-width property" was added.

More in the individual patches.

Thank you,
Lubo
