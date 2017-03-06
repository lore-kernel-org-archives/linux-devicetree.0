From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: ti-tfp410: support hpd via gpio
Date: Mon, 6 Mar 2017 18:46:24 -0300
Message-ID: <CAOMZO5C90EVY1oyhMu8Ahm++YeVq_qE1x6RwzB6hxKJZEuL10Q@mail.gmail.com>
References: <2e47786ab3d04078ae70d0c4064f7c4d@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2e47786ab3d04078ae70d0c4064f7c4d@rwthex-s1-b.rwth-ad.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Christopher Spinrath <christopher.spinrath@rwth-aachen.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, DRI mailing list <dri-devel@lists.freedesktop.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Igor Grinberg <grinberg@compulab.co.il>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgQ2hyaXN0b3BoZXIsCgpPbiBNb24sIE1hciA2LCAyMDE3IGF0IDY6NDAgUE0sICA8Y2hyaXN0
b3BoZXIuc3BpbnJhdGhAcnd0aC1hYWNoZW4uZGU+IHdyb3RlOgo+IEZyb206IENocmlzdG9waGVy
IFNwaW5yYXRoIDxjaHJpc3RvcGhlci5zcGlucmF0aEByd3RoLWFhY2hlbi5kZT4KPgo+IE9uIHNv
bWUgYm9hcmRzIHRoZSBocGQgcGluIG9mIGEgaGRtaSBjb25uZWN0b3IgaXMgd2lyZWQgdXAgdG8g
YSBncGlvCj4gcGluLiBTaW5jZSBpbiB0aGUgRFJNIHdvcmxkIHRoZSB0ZnA0MTAgZHJpdmVyIGlz
IHJlc3BvbnNpYmxlIGZvcgo+IGhhbmRsaW5nIHRoZSBjb25uZWN0b3IsIGFkZCBzdXBwb3J0IGZv
ciBocGQgZ3Bpb3MgaW4gdGhpcyB2ZXJ5IGRyaXZlci4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlz
dG9waGVyIFNwaW5yYXRoIDxjaHJpc3RvcGhlci5zcGlucmF0aEByd3RoLWFhY2hlbi5kZT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYyB8IDcyICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tCgpJdCB3b3VsZCBiZSBuaWNlIHRvIGFkZCAnaHBk
LWdwaW9zJyBwcm9wZXJ0eSBpbiB0aGUgYmluZGluZyBkb2MgYXMgd2VsbDoKRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLHRmcDQxMC50eHQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
