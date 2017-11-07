From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 1/2] drm/bridge: Add Cadence DSI driver
Date: Tue, 7 Nov 2017 13:06:13 +0200
Message-ID: <2eed6de6-af9d-3873-1dd7-866a3df380c3@ti.com>
References: <20171020074922.14239-1-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20171020074922.14239-1-boris.brezillon@free-electrons.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "Menon,
 Nishanth" <nm@ti.com>, Cyprian Wronka <cwronka@cadence.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Simon Hatliff <hatliff@cadence.com>, Mark Rutland <mark.rutland@arm.com>, Jyri Sarha <jsarha@ti.com>, Alan Douglas <adouglas@cadence.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Richard Sproul <sproul@cadence.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gMjAvMTAvMTcgMTA6NDksIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiBBZGQgYSBkcml2ZXIg
Zm9yIENhZGVuY2UgRFBJIC0+IERTSSBicmlkZ2UuCj4gCj4gVGhpcyBkcml2ZXIgb25seSBzdXBw
b3J0IGEgc3Vic2V0IG9mIENhZGVuY2UgRFNJIGJyaWRnZSBjYXBhYmlsaXRpZXMuCj4gCj4gSGVy
ZSBpcyBhIG5vbi1leGhhdXN0aXZlIGxpc3Qgb2YgbWlzc2luZyBmZWF0dXJlczoKPiAgKiBidXJz
dCBtb2RlCj4gICogZHluYW1pYyBjb25maWd1cmF0aW9uIG9mIHRoZSBEUEhZIGJhc2VkIG9uIHRo
ZQo+ICAqIHN1cHBvcnQgZm9yIGFkZGl0aW9uYWwgaW5wdXQgaW50ZXJmYWNlcyAoU0RJIGlucHV0
KQoKQW5kIHJ1bnRpbWUgUE0uCgpBZGRpbmcgdGhvc2UgZmVhdHVyZXMgd2lsbCBjaGFuZ2UgdGhl
IGRyaXZlciBxdWl0ZSBhIGJpdCwgSSBpbWFnaW5lLiBJCndvbmRlciBpZiB0aGVyZSdzIG11Y2gg
YmVuZWZpdCBpbiByZXZpZXdpbmcgdGhlIGRyaXZlciBiZWZvcmUgdGhlCmZlYXR1cmVzIGhhdmUg
YmVlbiBhZGRlZC4uLiBBdCBsZWFzdCBEUEhZIGFuZCBydW50aW1lIFBNIGFyZSBjcml0aWNhbApm
ZWF0dXJlcy4KCkFueSByZXZpZXdlZC1ieSBmb3IgdGhpcyB2ZXJzaW9uIHdvbid0IGJlIHJlYWxs
eSB2YWxpZCB3aGVuIHRob3NlCmZlYXR1cmVzIGhhdmUgYmVlbiBhZGRlZC4KCi0tIApUZXhhcyBJ
bnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4K
WS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVs
c2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
