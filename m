From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v5 1/7] dt-bindings: interconnect: Add a dma interconnect name
Date: Mon,  1 Apr 2019 10:56:41 +0200
Message-ID: <09e5e29a4c54ec7337e4e62e5d6001b69d92b103.1554108995.git-series.maxime.ripard@bootlin.com>
References: <cover.f8909884585996f28d97f4ef95efbcab19527dc4.1554108995.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.f8909884585996f28d97f4ef95efbcab19527dc4.1554108995.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Yong Deng <yong.deng@magewell.com>, Robin Murphy <robin.murphy@arm.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIGN1cnJlbnQgRFQgYmluZGluZ3MgYXNzdW1lIHRoYXQgdGhlIERNQSB3aWxsIGJlIHBlcmZv
cm1lZCBieSB0aGUKZGV2aWNlcyB0aHJvdWdoIHRoZWlyIHBhcmVudCBEVCBub2RlLCBhbmQgcmVs
eSBvbiB0aGF0IGFzc3VtcHRpb24gZm9yIHRoZQphZGRyZXNzIHRyYW5zbGF0aW9uIHVzaW5nIGRt
YS1yYW5nZXMuCgpIb3dldmVyLCBzb21lIFNvQ3MgaGF2ZSBkZXZpY2VzIHRoYXQgd2lsbCBwZXJm
b3JtIERNQSB0aHJvdWdoIGFub3RoZXIgYnVzLAp3aXRoIHNlcGFyYXRlIGFkZHJlc3MgdHJhbnNs
YXRpb24gcnVsZXMuIFdlIHRoZXJlZm9yZSBuZWVkIHRvIGV4cHJlc3MgdGhhdApyZWxhdGlvbnNo
aXAsIHRocm91Z2ggdGhlIHNwZWNpYWwgaW50ZXJjb25uZWN0IG5hbWUgImRtYS1tZW0iLgoKQWNr
ZWQtYnk6IEdlb3JnaSBEamFrb3YgPGdlb3JnaS5kamFrb3ZAbGluYXJvLm9yZz4KU2lnbmVkLW9m
Zi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KLS0tCiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJjb25uZWN0L2ludGVyY29ubmVjdC50
eHQgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJjb25uZWN0L2ludGVyY29u
bmVjdC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJjb25uZWN0
L2ludGVyY29ubmVjdC50eHQKaW5kZXggNWEzYzU3NWIzODdhLi42ZjVkMjNhNjA1YjcgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcmNvbm5lY3QvaW50
ZXJjb25uZWN0LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50
ZXJjb25uZWN0L2ludGVyY29ubmVjdC50eHQKQEAgLTUxLDYgKzUxLDEwIEBAIGludGVyY29ubmVj
dC1uYW1lcyA6IExpc3Qgb2YgaW50ZXJjb25uZWN0IHBhdGggbmFtZSBzdHJpbmdzIHNvcnRlZCBp
biB0aGUgc2FtZQogCQkgICAgIGludGVyY29ubmVjdC1uYW1lcyB0byBtYXRjaCBpbnRlcmNvbm5l
Y3QgcGF0aHMgd2l0aCBpbnRlcmNvbm5lY3QKIAkJICAgICBzcGVjaWZpZXIgcGFpcnMuCiAKKyAg
ICAgICAgICAgICAgICAgICAgIFJlc2VydmVkIGludGVyY29ubmVjdCBuYW1lczoKKwkJCSAqIGRt
YS1tZW06IFBhdGggZnJvbSB0aGUgZGV2aWNlIHRvIHRoZSBtYWluIG1lbW9yeSBvZgorCQkJICAg
ICAgICAgICAgdGhlIHN5c3RlbQorCiBFeGFtcGxlOgogCiAJc2RoY2lANzg2NDAwMCB7Ci0tIApn
aXQtc2VyaWVzIDAuOS4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
