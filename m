From: Murali Karicheri <m-karicheri2@ti.com>
Subject: [v4.0: PATCH 0/3] ARM: dts: keystone: dt fixes for netcp driver
Date: Mon, 11 May 2015 14:05:27 -0400
Message-ID: <1431367530-4924-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, ssantosh@kernel.org
Cc: Murali Karicheri <m-karicheri2@ti.com>
List-Id: devicetree@vger.kernel.org

There are few fixes required in the dt bindings for netcp driver to
make the reg and range sizes to match with data sheet. Also fix the
typical size error (last bit 1 instead of 0). Please apply this for
to next branch for v4.2.

Thanks

Murali Karicheri (3):
  ARM: dts: k2hk: fix the netcp range size
  ARM: dts: k2e: fix the netcp range size
  ARM: dts: k2l: fix the netcp range size

 arch/arm/boot/dts/k2e-netcp.dtsi  | 4 ++--
 arch/arm/boot/dts/k2hk-netcp.dtsi | 2 +-
 arch/arm/boot/dts/k2l-netcp.dtsi  | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.9.1
