From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v4 0/5] dt-bindings: improve the Armada DRM bindings
Date: Wed, 28 Aug 2019 09:59:33 +0200
Message-ID: <20190828075938.318028-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

this is the fourth spin of a patch set that aims to complete the Armada
DRM binding documentation. The only change from the last version is the
addition of Reviewed-by tags.

What is documented corresponds to the armada-devel branch of
git://git.armlinux.org.uk/~rmk/linux-arm.git with these differencies:

* Documentation of the bus-width property of the LCDC
* The MMP2 compatible strings.

Patches to the driver for the above were sent out separately.

Lubo
