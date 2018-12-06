From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: [PATCH v3 0/3] bus: imx-weim
Date: Thu,  6 Dec 2018 14:26:30 -0500
Message-ID: <20181206192633.25319-1-TheSven73@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: TheSven73@googlemail.com, Shawn Guo <shawnguo@kernel.org>, Kees Cook <keescook@chromium.org>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Support multiple address ranges per child node on imx-weim.
While we're at it, insert some code which guards against common config
conflicts.

v3:
	added devicetree binding docs

v2:
	corrected acme@... in commit message example

Sven Van Asbroeck (3):
  bus: imx-weim: support multiple address ranges per child node
  dt-bindings: bus: imx-weim: document multiple address ranges per child
    node
  bus: imx-weim: guard against timing configuration conflicts

 .../devicetree/bindings/bus/imx-weim.txt      | 32 ++++++++-
 drivers/bus/imx-weim.c                        | 69 +++++++++++++++----
 2 files changed, 84 insertions(+), 17 deletions(-)

-- 
2.17.1
