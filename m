From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 1/5] dt-bindings: Add vendor prefix for Rakuten Kobo, Inc.
Date: Tue, 19 Mar 2019 16:24:16 +0100
Message-ID: <20190319152421.16179-2-j.neuschaefer@gmx.net>
References: <20190319152421.16179-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319152421.16179-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: devicetree@vger.kernel.org

Rakuten Kobo, Inc. (formerly Kobo, Inc.) is a company that sells e-book
readers and related products. More information is available at:

- https://en.wikipedia.org/wiki/Kobo_Inc.
- https://www.kobo.com/

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docum=
entation/devicetree/bindings/vendor-prefixes.txt
index 8162b0eb4b50..6cc50f1fac1c 100644
=2D-- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -210,6 +210,7 @@ kiebackpeter    Kieback & Peter GmbH
 kinetic Kinetic Technologies
 kingdisplay	King & Display Technology Co., Ltd.
 kingnovel	Kingnovel Technology Co., Ltd.
+kobo	Rakuten Kobo Inc.
 koe	Kaohsiung Opto-Electronics Inc.
 kosagi	Sutajio Ko-Usagi PTE Ltd.
 kyo	Kyocera Corporation
=2D-
2.20.1
