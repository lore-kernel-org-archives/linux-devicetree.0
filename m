From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 0/4] Add RZ/G2N DU support
Date: Fri, 4 Oct 2019 06:30:52 +0000
Message-ID: <OSBPR01MB2103458EC171151BF8C05D9FB89E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
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
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

SGkgTGF1cmVudCwKCkFyZSB5b3UgaGFwcHkgd2l0aCB0aGlzIHBhdGNoPyBQbGVhc2UgbGV0IG1l
IGtub3cuCgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmVuZXNh
cy1zb2MvbGlzdC8/c2VyaWVzPTE4MDI3MQoKcmVnYXJkcywKQmlqdQoKPiBTdWJqZWN0OiBbUEFU
Q0ggMC80XSBBZGQgUlovRzJOIERVIHN1cHBvcnQKPiAKPiBUaGlzIHBhdGNoIHNlcmllcyBhaW1z
IHRvIGFkZCBiaW5kaW5nL2RyaXZlciBzdXBwb3J0IGZvciBSOEE3NzRCMShhLmsuYQo+IFJaL0cy
TikgRFUgKHdoaWNoIGlzIHZlcnkgc2ltaWxhciB0byB0aGUgUjhBNzc5NjUgRFUpOyBpdCBoYXMg
b25lIFJHQgo+IG91dHB1dCwgb25lIExWRFMgb3V0cHV0IGFuZCBvbmUgSERNSSBvdXRwdXQuCj4g
Cj4gQmlqdSBEYXMgKDQpOgo+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJlbmVzYXM6IGR1OiBE
b2N1bWVudCB0aGUgcjhhNzc0YjEgYmluZGluZ3MKPiAgIGRybTogcmNhci1kdTogQWRkIFI4QTc3
NEIxIHN1cHBvcnQKPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByZW5lc2FzOiBsdmRzOiBEb2N1
bWVudCByOGE3NzRiMSBiaW5kaW5ncwo+ICAgZHJtOiByY2FyLWR1OiBsdmRzOiBBZGQgcjhhNzc0
YjEgc3VwcG9ydAo+IAo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRz
LnR4dCAgICAgICB8ICAxICsKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5l
c2FzLGR1LnR4dCAgICAgfCAgMiArKwo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1
X2Rydi5jICAgICAgICAgICAgICB8IDMwCj4gKysrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyAgICAgICAgICAgICAgICB8ICAxICsKPiAg
NCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCj4gCj4gLS0KPiAyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
