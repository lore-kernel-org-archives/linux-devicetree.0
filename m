From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Subject: [PATCH v3 3/3] media: dt-bindings: imx7-csi: add i.MX6UL/L support
Date: Wed, 31 Jul 2019 18:33:58 +0200
Message-ID: <20190731163358.32622-1-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
To: Rui Miguel Silva <rmfrfs@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

RG9jdW1lbnQgImZzbCxpbXg2dWwtY3NpIiBlbnRyeS4KClJldmlld2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8
c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQoKQ2hhbmdlcyBmb3IgdjM6CiAt
IG5vbmUKCkNoYW5nZXMgZm9yIHYyOgogLSBOZXcgcGF0Y2ggdG8gZG9jdW1lbnQgbmV3ICJmc2ws
aW14NnVsLWNzaSIgZW50cnkuCgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL2lteDctY3NpLnR4dCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9pbXg3LWNzaS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVkaWEvaW14Ny1jc2kudHh0CmluZGV4IDQ0M2FlZjA3MzU2ZS4uZDgwY2VlZmEwYzAwIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaW14Ny1j
c2kudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pbXg3
LWNzaS50eHQKQEAgLTksNyArOSw3IEBAIHRvIGNvbm5lY3QgZGlyZWN0bHkgdG8gZXh0ZXJuYWwg
Q01PUyBpbWFnZSBzZW5zb3JzLgogCiBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogCi0tIGNvbXBhdGli
bGUgICAgOiAiZnNsLGlteDctY3NpIjsKKy0gY29tcGF0aWJsZSAgICA6ICJmc2wsaW14Ny1jc2ki
IG9yICJmc2wsaW14NnVsLWNzaSI7CiAtIHJlZyAgICAgICAgICAgOiBiYXNlIGFkZHJlc3MgYW5k
IGxlbmd0aCBvZiB0aGUgcmVnaXN0ZXIgc2V0IGZvciB0aGUgZGV2aWNlOwogLSBpbnRlcnJ1cHRz
ICAgIDogc2hvdWxkIGNvbnRhaW4gQ1NJIGludGVycnVwdDsKIC0gY2xvY2tzICAgICAgICA6IGxp
c3Qgb2YgY2xvY2sgc3BlY2lmaWVycywgc2VlCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcg
bGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
