From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 02/10] media: rc: sunxi: Add A31 compatible
Date: Sat, 25 May 2019 20:09:15 +0200
Message-ID: <20190525180923.6105-3-peron.clem@gmail.com>
References: <20190525180923.6105-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190525180923.6105-1-peron.clem@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

QTMxIGhhdmUgYSBkaWZmZXJlbnQgbWVtb3J5IG1hcHBpbmcgc28gYWRkIHRoZSBjb21wYXRpYmxl
CndlIHdpbGwgbmVlZCBpdCBsYXRlci4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8
cGVyb24uY2xlbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9tZWRpYS9yYy9zdW54aS1jaXIuYyB8
IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tZWRpYS9yYy9zdW54aS1jaXIuYyBiL2RyaXZlcnMvbWVkaWEvcmMvc3VueGktY2lyLmMKaW5k
ZXggMzA3ZTQ0NzE0ZWEwLi4yOWFjMzNiNjg1OTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEv
cmMvc3VueGktY2lyLmMKKysrIGIvZHJpdmVycy9tZWRpYS9yYy9zdW54aS1jaXIuYwpAQCAtMzE5
LDYgKzMxOSw3IEBAIHN0YXRpYyBpbnQgc3VueGlfaXJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdW54aV9pcl9t
YXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjRpLWExMC1pciIsIH0s
CiAJeyAuY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNWktYTEzLWlyIiwgfSwKKwl7IC5jb21w
YXRpYmxlID0gImFsbHdpbm5lcixzdW42aS1hMzEtaXIiLCB9LAogCXt9LAogfTsKIE1PRFVMRV9E
RVZJQ0VfVEFCTEUob2YsIHN1bnhpX2lyX21hdGNoKTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
