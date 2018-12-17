From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: [PATCH v4 0/3] bus: imx-weim
Date: Mon, 17 Dec 2018 10:47:57 -0500
Message-ID: <20181217154800.7448-1-TheSven73@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: TheSven73@googlemail.com, Shawn Guo <shawnguo@kernel.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Support multiple address ranges per child node on imx-weim.
While we're at it, insert some code which guards against common config
conflicts.

v4:
	pick up patch after one-week delay
	Shawn Guo:
	changed devicetree patch position in the set
	clarified a confusing #define'd constant name
	minor coding style fixes

v3:
	added devicetree binding docs

v2:
	corrected acme@... in commit message example

Sven Van Asbroeck (3):
  dt-bindings: bus: imx-weim: document multiple address ranges per child
    node
  bus: imx-weim: support multiple address ranges per child node
  bus: imx-weim: guard against timing configuration conflicts

 .../devicetree/bindings/bus/imx-weim.txt      | 32 ++++++++-
 drivers/bus/imx-weim.c                        | 70 +++++++++++++++----
 2 files changed, 86 insertions(+), 16 deletions(-)

-- 
2.17.1
