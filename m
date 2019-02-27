From: Jyri Sarha <jsarha@ti.com>
Subject: [PATCH v2 4/5] drm/bridge: sii902x: Select I2C_MUX
Date: Wed, 27 Feb 2019 23:54:22 +0200
Message-ID: <077964b92af5c0fdf6a8e6767ef8dfccfe4c008f.1551303673.git.jsarha@ti.com>
References: <cover.1551303673.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1551303673.git.jsarha@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: fabrizio.castro@bp.renesas.com, Songjun.Wu@atmel.com, tony@atomide.com, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com, voice.shen@atmel.com
List-Id: devicetree@vger.kernel.org

ImRybS9icmlkZ2Uvc2lpOTAyeDogRml4IEVESUQgcmVhZGJhY2siLWNvbW1pdCBhZGRlZCBhIGRl
cGVuZGVuY3kgdG8KSTJDX01VWCwgYnV0IG5vdCBpbmRpY2F0ZSBpdCBpbiB0aGUgS2NvbmZpZyBl
bnRyeS4gRml4IGl0IGJ5IHNlbGVjdGluZwpJMkNfTVVYIGZvciBEUk1fU0lJOTAyWCBjb25maWcg
b3B0aW9uLgoKRml4ZXM6IDg4NjY0Njc1MjM5ICgiZHJtL2JyaWRnZS9zaWk5MDJ4OiBGaXggRURJ
RCByZWFkYmFjayIpClNpZ25lZC1vZmYtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25m
aWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKaW5kZXggZmIwYjM3OTE4MzgyLi5h
NmY2ZmY4ZjA2YjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKQEAgLTk1LDYgKzk1LDcgQEAgY29u
ZmlnIERSTV9TSUk5MDJYCiAJZGVwZW5kcyBvbiBPRgogCXNlbGVjdCBEUk1fS01TX0hFTFBFUgog
CXNlbGVjdCBSRUdNQVBfSTJDCisJc2VsZWN0IEkyQ19NVVgKIAktLS1oZWxwLS0tCiAJICBTaWxp
Y29uIEltYWdlIHNpaTkwMnggYnJpZGdlIGNoaXAgZHJpdmVyLgogCi0tIApUZXhhcyBJbnN0cnVt
ZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4gWS10dW5u
dXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
