From: Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 3/8] doc: dt-binding: ci-hdrc-usb2: add compatible string
 for imx7ulp
Date: Tue, 14 May 2019 07:38:08 +0000
Message-ID: <20190514073529.29505-4-peter.chen@nxp.com>
References: <20190514073529.29505-1-peter.chen@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190514073529.29505-1-peter.chen@nxp.com>
Content-Language: en-US
Content-ID: <B5C16A8E34231748A8F5FA1AB91077A9@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "balbi@kernel.org" <balbi@kernel.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Add compatible string for imx7ulp.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index a254386a91ad..cfc9f40ab641 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -10,6 +10,7 @@ Required properties:
 	"fsl,imx6sx-usb"
 	"fsl,imx6ul-usb"
 	"fsl,imx7d-usb"
+	"fsl,imx7ulp-usb"
 	"lsi,zevio-usb"
 	"qcom,ci-hdrc"
 	"chipidea,usb2"
-- 
2.14.1
