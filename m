From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v4 1/7] dt-bindings: interconnect: Add a dma interconnect name
Date: Thu, 14 Mar 2019 21:26:00 +0100
Message-ID: <9512c3223c26c12b02376cf4ba4a74ca29de1132.1552595146.git-series.maxime.ripard@bootlin.com>
References: <cover.221220f2f28e14ef07cce84e753ac662085d84ff.1552595146.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.221220f2f28e14ef07cce84e753ac662085d84ff.1552595146.git-series.maxime.ripard@bootlin.com>
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
aXAsIHRocm91Z2ggdGhlIHNwZWNpYWwgaW50ZXJjb25uZWN0IG5hbWUgImRtYSIuCgpTaWduZWQt
b2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgotLS0KIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcmNvbm5lY3QvaW50ZXJjb25uZWN0
LnR4dCB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcmNvbm5lY3QvaW50ZXJj
b25uZWN0LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcmNvbm5l
Y3QvaW50ZXJjb25uZWN0LnR4dAppbmRleCA1YTNjNTc1YjM4N2EuLjZmNWQyM2E2MDViNyAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVyY29ubmVjdC9p
bnRlcmNvbm5lY3QudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
bnRlcmNvbm5lY3QvaW50ZXJjb25uZWN0LnR4dApAQCAtNTEsNiArNTEsMTAgQEAgaW50ZXJjb25u
ZWN0LW5hbWVzIDogTGlzdCBvZiBpbnRlcmNvbm5lY3QgcGF0aCBuYW1lIHN0cmluZ3Mgc29ydGVk
IGluIHRoZSBzYW1lCiAJCSAgICAgaW50ZXJjb25uZWN0LW5hbWVzIHRvIG1hdGNoIGludGVyY29u
bmVjdCBwYXRocyB3aXRoIGludGVyY29ubmVjdAogCQkgICAgIHNwZWNpZmllciBwYWlycy4KIAor
ICAgICAgICAgICAgICAgICAgICAgUmVzZXJ2ZWQgaW50ZXJjb25uZWN0IG5hbWVzOgorCQkJICog
ZG1hLW1lbTogUGF0aCBmcm9tIHRoZSBkZXZpY2UgdG8gdGhlIG1haW4gbWVtb3J5IG9mCisJCQkg
ICAgICAgICAgICB0aGUgc3lzdGVtCisKIEV4YW1wbGU6CiAKIAlzZGhjaUA3ODY0MDAwIHsKLS0g
CmdpdC1zZXJpZXMgMC45LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
