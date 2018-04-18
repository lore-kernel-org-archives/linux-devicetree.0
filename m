From: Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH v2 0/2] ARM: dts: da850: fix warnings related to memory node
Date: Wed, 18 Apr 2018 14:54:06 +0530
Message-ID: <20180418092408.2077-1-nsekhar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

Here are fixes to W=1 warnings related to memory nodes in
DA850 device-tree files.

v2:
- Address David's comments
- Add devicetree mailing list to recipients.

Sekhar Nori (2):
  ARM: dts: da850: get rid of skeleton.dtsi
  ARM: dts: da850-lcdk: add unit name for memory node

 arch/arm/boot/dts/da850-lcdk.dts |  4 ++--
 arch/arm/boot/dts/da850.dtsi     | 11 ++++++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.16.2
