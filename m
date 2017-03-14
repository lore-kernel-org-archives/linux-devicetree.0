From: Nathan Sullivan <nathan.sullivan@ni.com>
Subject: [PATCH v4] NI 169445 board support
Date: Tue, 14 Mar 2017 11:13:21 -0500
Message-ID: <1489508003-25288-1-git-send-email-nathan.sullivan@ni.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, ralf@linux-mips.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Add support for the National Instruments 169445 board

----
Changes from v3:

- Remove unused ngpios DT property from documentation for the NAND GPIO
bindings and the actual board device tree.
- Add no-output property to the same, for the GPIO controller that is only
used for input signals from NAND.
