From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Subject: [PATCH v2 3/3] media: dt-bindings: imx7-csi: add i.MX6UL/L support
Date: Thu,  6 Jun 2019 17:38:25 +0200
Message-ID: <20190606153825.8183-3-sebastien.szymanski@armadeus.com>
References: <20190606153825.8183-1-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20190606153825.8183-1-sebastien.szymanski@armadeus.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
List-Id: devicetree@vger.kernel.org

RG9jdW1lbnQgImZzbCxpbXg2dWwtY3NpIiBlbnRyeS4KClNpZ25lZC1vZmYtYnk6IFPDqWJhc3Rp
ZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0tCgpDaGFu
Z2VzIGZvciB2MjoKIC0gTmV3IHBhdGNoIHRvIGRvY3VtZW50IG5ldyAiZnNsLGlteDZ1bC1jc2ki
IGVudHJ5LgoKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pbXg3LWNz
aS50eHQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
aW14Ny1jc2kudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2lt
eDctY3NpLnR4dAppbmRleCAzYzA3YmM2NzZiYzMuLjQ5ZTlhZjE5YjNlYSAxMDA2NDQKLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2lteDctY3NpLnR4dAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaW14Ny1jc2kudHh0CkBA
IC05LDcgKzksNyBAQCB0byBjb25uZWN0IGRpcmVjdGx5IHRvIGV4dGVybmFsIENNT1MgaW1hZ2Ug
c2Vuc29ycy4KIAogUmVxdWlyZWQgcHJvcGVydGllczoKIAotLSBjb21wYXRpYmxlICAgIDogImZz
bCxpbXg3LWNzaSI7CistIGNvbXBhdGlibGUgICAgOiAiZnNsLGlteDctY3NpIiBvciAiZnNsLGlt
eDZ1bC1jc2kiOwogLSByZWcgICAgICAgICAgIDogYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2Yg
dGhlIHJlZ2lzdGVyIHNldCBmb3IgdGhlIGRldmljZTsKIC0gaW50ZXJydXB0cyAgICA6IHNob3Vs
ZCBjb250YWluIENTSSBpbnRlcnJ1cHQ7CiAtIGNsb2NrcyAgICAgICAgOiBsaXN0IG9mIGNsb2Nr
IHNwZWNpZmllcnMsIHNlZQotLSAKMi4xOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkZXZlbCBtYWlsaW5nIGxpc3QKZGV2ZWxAbGludXhkcml2ZXJw
cm9qZWN0Lm9yZwpodHRwOi8vZHJpdmVyZGV2LmxpbnV4ZHJpdmVycHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcml2ZXJkZXYtZGV2ZWwK
