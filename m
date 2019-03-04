From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 0/5] dt-bindings: improve the Armada DRM bindings
Date: Mon,  4 Mar 2019 21:20:01 +0100
Message-ID: <20190304202006.3863-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

this is the second spin of a patch set that aims to complete the Armada
DRM binding documentation. Compared to the first version it omits the
display-subsystem node and thus is somewhat simpler. Also, the
reserved-mem property has been moved to a separate documentation file.

The he individual patches are accompanied by more detailed change logs.

What is documented corresponds to the armada-devel branch of
git://git.armlinux.org.uk/~rmk/linux-arm.git with these differencies:

* Documentation of the bus-width property of the LCDC
* The MMP2 compatible strings.

Patches to the driver for the above were sent out separately.

Lubo
