From: Alban Bedel <albeu@free.fr>
Subject: [PATH] MIPS: ath79: Add OF support and DTS for TL-WR1043ND
Date: Fri, 17 Apr 2015 16:24:15 +0200
Message-ID: <1429280669-2986-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Alban Bedel <albeu@free.fr>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series add OF bindings and code support for the interrupt
controllers, clocks and GPIOs. However it was only tested on a
TL-WR1043ND with an AR9132, others SoCs are untested, and a few are
not supported at all.

Most code changes base on the previous bug fix series:
[PATH] MIPS: ath79: Various small fix to prepare OF support
