From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v2 0/4] drm/panel: jh057n0090: Add regulators and drop magic
 value in init
Date: Wed, 26 Jun 2019 12:37:47 +0200
Message-ID: <cover.1561542477.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>
List-Id: devicetree@vger.kernel.org

Rml4IHRoZSBvbWlzc2lvbiBvZiBhIHJlZ3VsYXRvcnMgZm9yIHRoZSByZWNlbnRseSBhZGRlZCBw
YW5lbCBhbmQgbWFrZSBzdXJlIGFsbApkc2kgY29tbWFuZHMgc3RhcnQgd2l0aCBhIGNvbW1hbmQg
aW5zdGVhZCBvZiBvbmUgaGF2aW5nIGEgbWFnaWMgY29uc3RhbnQgKHdoaWNoCmFscmVhZHkgY2F1
c2VkIGNvbmZ1c2lvbikuCgpBbHNvIGFkZHMgYSBtYWlsIGFsaWFzIHRvIHRoZSBwYW5lbCdzIE1B
SU5UQUlORVIgZW50cnkgdG8gcmVkdWNlIHRoZSBidXMKZmFjdG9yLgoKQ2hhbmdlcyBmcm9tIHYx
OgoqIEFzIHBlciByZXZpZXcgY29tbWVudHMgZnJvbSBTYW0gUmF2bmJvcmc6CiAgLSBQcmludCBl
cnJvciBvbiBkZXZtX3JlZ3VsYXRvcl9nZXQoKSBmYWlscmVzCiAgLSBGaXggdHlwb3MgaW4gY29t
bWl0IG1lc3NhZ2VzCiogUHJpbnQgYW4gZXJyb3Igb24gcmVndWxhdG9yX2VuYWJsZSgpCiogRGlz
YWJsZSB2Y2MgaWYgaW92Y2MgZmFpbHMgdG8gZW5hYmxlCgpHdWlkbyBHw7xudGhlciAoNCk6CiAg
TUFJTlRBSU5FUlM6IEFkZCBQdXJpc20gbWFpbCBhbGlhcyBhcyByZXZpZXdlciBmb3IgdGhlaXIg
ZGV2a2l0J3MKICAgIHBhbmVsCiAgZHJtL3BhbmVsOiBqaDA1N24wMDkwMDogRG9uJ3QgdXNlIG1h
Z2ljIGNvbnN0YW50CiAgZHQtYmluZGluZ3M6IGRpc3BsYXkvcGFuZWw6IGpoMDU3bjAwOTAwOiBE
b2N1bWVudCBwb3dlciBzdXBwbHkKICAgIHByb3BlcnRpZXMKICBkcm0vcGFuZWw6IGpoMDU3bjAw
OTAwOiBBZGQgcmVndWxhdG9yIHN1cHBvcnQKCiAuLi4vZGlzcGxheS9wYW5lbC9yb2NrdGVjaCxq
aDA1N24wMDkwMC50eHQgICAgfCAgNSArKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxICsKIC4uLi9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgw
NTduMDA5MDAuYyAgICB8IDQ0ICsrKysrKysrKysrKysrKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwg
NDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
