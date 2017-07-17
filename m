From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Subject: [PATCH v8 1/2] media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver documentation
Date: Mon, 17 Jul 2017 19:03:55 +0200
Message-ID: <20170717170356.25568-2-niklas.soderlund+renesas@ragnatech.se>
References: <20170717170356.25568-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170717170356.25568-1-niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tomoharu.fukawa.eb-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Documentation for Renesas R-Car MIPI CSI-2 receiver. The CSI-2 receivers
are located between the video sources (CSI-2 transmitters) and the video
grabbers (VIN) on Gen3 of Renesas R-Car SoC.

Each CSI-2 device is connected to more then one VIN device which
simultaneously can receive video from the same CSI-2 device. Each VIN
device can also be connected to more then one CSI-2 device. The routing
of which link are used are controlled by the VIN devices. There are only
a few possible routes which are set by hardware limitations, which are
different for each SoC in the Gen3 family.

To work with the limitations of routing possibilities it is necessary
for the DT bindings to describe which VIN device is connected to which
CSI-2 device. This is why port 1 needs to to assign reg numbers for each
VIN device that be connected to it. To setup and to know which links are
valid for each SoC is the responsibility of the VIN driver since the
register to configure it belongs to the VIN hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
---
 .../devicetree/bindings/media/rcar-csi2.txt        | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rcar-csi2.txt

diff --git a/Documentation/devicetree/bindings/media/rcar-csi2.txt b/Documentation/devicetree/bindings/media/rcar-csi2.txt
new file mode 100644
index 0000000000000000..c298a7d821153219
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rcar-csi2.txt
@@ -0,0 +1,118 @@
+Renesas R-Car MIPI CSI-2
+------------------------
+
+The rcar-csi2 device provides MIPI CSI-2 capabilities for the Renesas R-Car
+family of devices. It is to be used in conjunction with the R-Car VIN module,
+which provides the video capture capabilities.
+
+Mandatory properties
+--------------------
+ - compatible: Must be one or more of the following
+   - "renesas,r8a7795-csi2" for the R8A7795 device.
+   - "renesas,r8a7796-csi2" for the R8A7796 device.
+   - "renesas,rcar-gen3-csi2" for a generic R-Car Gen3 compatible device.
+
+   When compatible with a generic version nodes must list the
+   SoC-specific version corresponding to the platform first
+   followed by the generic version.
+
+ - reg: the register base and size for the device registers
+ - interrupts: the interrupt for the device
+ - clocks: Reference to the parent clock
+
+The device node shall contain two 'port' child nodes according to the
+bindings defined in Documentation/devicetree/bindings/media/
+video-interfaces.txt. Port 0 shall connect the node that is the video
+source for to the CSI-2. Port 1 shall connect all the R-Car VIN
+modules, which can make use of the CSI-2 module.
+
+- Port 0 - Video source (Mandatory)
+	- Reg 0 - sub-node describing the endpoint that is the video source
+
+- Port 1 - VIN instances (Mandatory for all VIN present in the SoC)
+	- Reg 0 - sub-node describing the endpoint that is VIN0
+	- Reg 1 - sub-node describing the endpoint that is VIN1
+	- Reg 2 - sub-node describing the endpoint that is VIN2
+	- Reg 3 - sub-node describing the endpoint that is VIN3
+	- Reg 4 - sub-node describing the endpoint that is VIN4
+	- Reg 5 - sub-node describing the endpoint that is VIN5
+	- Reg 6 - sub-node describing the endpoint that is VIN6
+	- Reg 7 - sub-node describing the endpoint that is VIN7
+
+Example:
+
+/* SoC properties */
+
+	 csi20: csi2@fea80000 {
+		 compatible = "renesas,r8a7796-csi2";
+		 reg = <0 0xfea80000 0 0x10000>;
+		 interrupts = <0 184 IRQ_TYPE_LEVEL_HIGH>;
+		 clocks = <&cpg CPG_MOD 714>;
+		 power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+		 status = "disabled";
+
+		 ports {
+			 #address-cells = <1>;
+			 #size-cells = <0>;
+
+			 port@1 {
+				 #address-cells = <1>;
+				 #size-cells = <0>;
+
+				 reg = <1>;
+
+				 csi20vin0: endpoint@0 {
+					 reg = <0>;
+					 remote-endpoint = <&vin0csi20>;
+				 };
+				 csi20vin1: endpoint@1 {
+					 reg = <1>;
+					 remote-endpoint = <&vin1csi20>;
+				 };
+				 csi20vin2: endpoint@2 {
+					 reg = <2>;
+					 remote-endpoint = <&vin2csi20>;
+				 };
+				 csi20vin3: endpoint@3 {
+					 reg = <3>;
+					 remote-endpoint = <&vin3csi20>;
+				 };
+				 csi20vin4: endpoint@4 {
+					 reg = <4>;
+					 remote-endpoint = <&vin4csi20>;
+				 };
+				 csi20vin5: endpoint@5 {
+					 reg = <5>;
+					 remote-endpoint = <&vin5csi20>;
+				 };
+				 csi20vin6: endpoint@6 {
+					 reg = <6>;
+					 remote-endpoint = <&vin6csi20>;
+				 };
+				 csi20vin7: endpoint@7 {
+					 reg = <7>;
+					 remote-endpoint = <&vin7csi20>;
+				 };
+			 };
+		 };
+	 };
+
+/* Board properties */
+
+	&csi20 {
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				csi20_in: endpoint@0 {
+					clock-lanes = <0>;
+					data-lanes = <1>;
+					remote-endpoint = <&adv7482_txb>;
+				};
+			};
+		};
+	};
-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
