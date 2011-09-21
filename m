From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] devicetree: Add a registry of vendor prefixes
Date: Wed, 21 Sep 2011 09:23:25 -0600
Message-ID: <20110921152324.15993.96272.stgit@ponder>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

There is no centralized listing for the in-use vendor prefixes
used in compatible strings and property names.  This patch adds one.
New prefixes should get added to this list to reduce the likelyhood
of namespace collisions.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 .../devicetree/bindings/vendor-prefixes.txt        |   38 ++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/vendor-prefixes.txt

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
new file mode 100644
index 0000000..81465c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -0,0 +1,38 @@
+Device tree binding vendor prefix registry.  Keep list in alphabetical order.
+
+This isn't an exhaustive list, but you should add new prefixes to it before
+using them to avoid name-space collisions.
+
+adi	Analog Devices, Inc.
+amcc	Applied Micro Circuits Corporation (APM, formally AMCC)
+apm	Applied Micro Circuits Corporation (APM)
+arm	ARM Ltd.
+chrp	Common Hardware Reference Platform
+dallas	Maxim Integrated Products (formerly Dallas Semiconductor)
+denx	Denx Software Engineering
+epson	Seiko Epson Corp.
+est	ESTeem Wireless Modems
+fsl	Freescale Semiconductor
+GEFanuc	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
+gef	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
+hp	Hewlett Packard
+ibm	International Business Machines (IBM)
+idt	Integrated Device Technologies, Inc.
+intercontrol	Inter Control Group
+linux	Linux-specific binding
+marvell	Marvell Technology Group Ltd.
+maxim	Maxim Integrated Products
+mosaixtech	Mosaix Technologies, Inc.
+national	National Semiconductor
+nintendo	Nintendo
+nvidia	NVIDIA
+nxp	NXP Semiconductors
+powervr	Imagination Technologies
+ramtron	Ramtron International
+samsung	Samsung Semiconductor
+schindler	Schindler
+simtek
+sirf	SiRF Technology, Inc.
+stericsson	ST-Ericsson
+ti	Texas Instruments
+xlnx	Xilinx
