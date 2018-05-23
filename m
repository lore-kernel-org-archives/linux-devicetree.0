From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC 02/24] dt-bindings: add switch-delay property for
 mali-utgard
Date: Wed, 23 May 2018 12:04:20 -0500
Message-ID: <20180523170420.GA17409@rob-hp-laptop>
References: <20180518092815.25280-1-yuq825@gmail.com>
 <20180518092815.25280-3-yuq825@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180518092815.25280-3-yuq825@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Qiang Yu <yuq825@gmail.com>
Cc: Simon Shields <simon@lineageos.org>, devicetree@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>, Andrei Paulau <7134956@gmail.com>, dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBNYXkgMTgsIDIwMTggYXQgMDU6Mjc6NTNQTSArMDgwMCwgUWlhbmcgWXUgd3JvdGU6
Cj4gU2lnbmVkLW9mZi1ieTogUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+Cj4gLS0tCj4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktdXRnYXJkLnR4dCB8
IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktdXRnYXJk
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktdXRn
YXJkLnR4dAo+IGluZGV4IGMxZjY1ZDFkYWMxZC4uMDYyZDRiZWUyMTZhIDEwMDY0NAo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktdXRnYXJkLnR4
dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGkt
dXRnYXJkLnR4dAo+IEBAIC01OCw2ICs1OCwxMCBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICAg
ICAgQSBwb3dlciBkb21haW4gY29uc3VtZXIgc3BlY2lmaWVyIGFzIGRlZmluZWQgaW4KPiAgICAg
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9wb3dlcl9kb21haW4udHh0
Cj4gIAo+ICsgIC0gc3dpdGNoLWRlbGF5Ogo+ICsgICAgVGhpcyB2YWx1ZSBpcyB0aGUgbnVtYmVy
IG9mIE1hbGkgY2xvY2sgY3ljbGVzIGl0IHRha2VzIHRvCj4gKyAgICBlbmFibGUgdGhlIHBvd2Vy
IGdhdGVzIGFuZCB0dXJuIG9uIHRoZSBwb3dlciBtZXNoLgoKVGhpcyBzaG91bGQgYmUgaW1wbGll
ZCBieSB0aGUgU29DIHNwZWNpZmljIGNvbXBhdGlibGUgc3RyaW5nLgoKQWx0ZXJuYXRpdmVseSwg
Y2FuJ3QgdGhlIGRyaXZlciBqdXN0IHBpY2sgYSB2YWx1ZSBsb25nIGVub3VnaCBmb3IgCmV2ZXJ5
b25lPyBEb2VzIGl0IHJlYWxseSB2YXJ5IHRoYXQgbXVjaCwgYW5kIGlzIGl0IHRpbWluZyBjcml0
aWNhbD8KClJvYgoKUC5TLiBLZWVwIHVwIHRoZSBncmVhdCB3b3JrIG9uIHRoaXMhCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
