From: Nathan Sullivan <nathan.sullivan@ni.com>
Subject: [PATCH v2] MIPS: NI 169445 board support
Date: Mon, 6 Mar 2017 14:05:59 -0600
Message-ID: <1488830761-681-1-git-send-email-nathan.sullivan@ni.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linus.walleij@linaro.org, gnurou@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, ralf@linux-mips.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

This adds support for the National Instruments 169445 MIPS system.

----

Changes from v1:

- Add GPIO patch and board support patch to one set
- Address Rob Herring's device tree feedback
- Convert the 169445 to a generic MIPS board
- Switch to the newer stmmac driver for the board's ethernet core
