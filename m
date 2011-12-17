From: Aneesh V <aneesh-l0cyMroinI0@public.gmane.org>
Subject: [RFC PATCH 0/3] dt: device tree bindigs and data for EMIF and DDR
Date: Sat, 17 Dec 2011 18:50:49 +0530
Message-ID: <1324128052-11220-1-git-send-email-aneesh@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-patch-review-uAqBSO/uNfhBDgjK7y7TUQ@public.gmane.org
Cc: Aneesh V <aneesh-l0cyMroinI0@public.gmane.org>, santosh.shilimkar-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an RFC to add new device tree bindings for DDR memories and
EMIF - TI's DDR SDRAM controller. 

The first patch adds bindings for DDR memories. Currently,
we have added properties for only DDR3 and LPDDR2 memories.
However, the binding can be easily extended to describe
other types such as DDR2 in the future.

The second patch provides the bindings for the EMIF controller.

The final patch provides DT data for EMIF controller instances
in OMAP4 and LPDDR2 memories attached to them on various boards.

Thanks to Rajendra for answering my numerous queries on device tree.

Aneesh V (3):
  dt: device tree bindings for DDR memories
  dt: device tree bindings for TI's EMIF sdram controller
  dt: EMIF and lpddr2 device tree data for OMAP4 boards

 Documentation/devicetree/bindings/ddr/ddr.txt      |  113 ++++++++++++++++++++
 .../devicetree/bindings/ddr/ddr_timings.txt        |   60 +++++++++++
 .../bindings/memory-controllers/ti/emif.txt        |   64 +++++++++++
 arch/arm/boot/dts/omap-common-devices.dtsi         |   64 +++++++++++
 arch/arm/boot/dts/omap4-panda.dts                  |   13 +++
 arch/arm/boot/dts/omap4-sdp.dts                    |   13 +++
 arch/arm/boot/dts/omap4.dtsi                       |   18 +++
 7 files changed, 345 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ddr/ddr.txt
 create mode 100644 Documentation/devicetree/bindings/ddr/ddr_timings.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti/emif.txt
 create mode 100644 arch/arm/boot/dts/omap-common-devices.dtsi
