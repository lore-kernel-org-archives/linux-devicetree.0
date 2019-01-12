From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 0/2] powerpc: wii.dts: GPIO interrupt and button support
Date: Sat, 12 Jan 2019 17:21:22 +0100
Message-ID: <20190112162124.3341-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: devicetree@vger.kernel.org

This patchset adds the necessary bits to wii.dts to enable interrupt
support in the GPIO controller, and defines two GPIO-based buttons,
the POWER button and the EJECT button.

I will send another patchset which will implement interrupt support in
the GPIO driver (gpio-hlwd.c).

Jonathan Neuschäfer (2):
  powerpc: wii.dts: Add interrupt-related properties to GPIO node
  powerpc: wii.dts: Add GPIO keys

 arch/powerpc/boot/dts/wii.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
2.20.1
