From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v7 4/6] dt-bindings: mailbox: imx-mu: add i.MX6SX and
 i.MX7S SoCs.
Date: Thu, 26 Jul 2018 12:41:31 +0200
Message-ID: <1532601691.32306.28.camel@pengutronix.de>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-5-o.rempel@pengutronix.de>
 <CABb+yY32vBy5qVYsQ6u45=rV6gEggqKy3Jqn1B4oWHaGfTyQ8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY32vBy5qVYsQ6u45=rV6gEggqKy3Jqn1B4oWHaGfTyQ8Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, ",
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

SGkgSmFzc2ksCgpBbSBEb25uZXJzdGFnLCBkZW4gMjYuMDcuMjAxOCwgMTU6MjUgKzA1MzAgc2No
cmllYiBKYXNzaSBCcmFyOgo+IE9uIFRodSwgSnVsIDI2LCAyMDE4IGF0IDEyOjIzIFBNLCBPbGVr
c2lqIFJlbXBlbAo+ID4gPG8ucmVtcGVsQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiA+IFRoaXMg
YXJlIGN1cnJlbnRseSB0ZXN0ZWQgU29DcyB3aXRoIGlteC1tYWlsYm94IGRyaXZlci4KPiA+IAo+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWogUmVtcGVsIDxvLnJlbXBlbEBwZW5ndXRyb25p
eC5kZT4KPiA+IC0tLQo+ID4gwqBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFp
bGJveC9mc2wsbXUudHh0IHwgMiArLQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L2ZzbCxtdS50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWFpbGJveC9mc2wsbXUudHh0Cj4gPiBpbmRleCAxMTNkNmFiOTMxZWYu
LjU2MTZkMmFmY2E0NSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tYWlsYm94L2ZzbCxtdS50eHQKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tYWlsYm94L2ZzbCxtdS50eHQKPiA+IEBAIC0xOCw3ICsxOCw3IEBAIE1l
c3NhZ2luZyBVbml0IERldmljZSBOb2RlOgo+ID4gwqBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4g
wqAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiDCoC0gY29tcGF0aWJsZSA6IHNob3VsZCBiZSAiZnNs
LDxjaGlwPi1tdSIsIHRoZSBzdXBwb3J0ZWQgY2hpcHMgaW5jbHVkZQo+ID4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlteDhxeHAsIGlteDhxbS4KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpbXg2c3gsIGlteDdzLCBpbXg4cXhwLCBpbXg4cW0uCj4gPiAKPiAKPiBU
aGlzIGlzIG5vdCBzY2FsYWJsZS4gRG8gd2UgYWRkIGV2ZXJ5IG5ldyBTb0MgdGhhdCBjb250YWlu
cyB0aGUgc2FtZSBjb250cm9sbGVyPwoKWWVzLCB3ZSBkby4gVGhpcyBpcyBhIHBvbGljeSBkaXJl
Y3Rpb24gZnJvbSB0aGUgRFQgbWFpbnRhaW5lcnMuIElmIHdlCmV2ZXIgZ29pbmcgdG8gd2FudCB0
byB2YWxpZGF0ZSBEVHMgYWdhaW5zdCB0aGUgYmluZGluZywgYWxsIGNvbXBhdGlibGVzCnVzZWQg
aW4gdGhlIERUcyBtdXN0IGJlIHNwZWNpZmllZCBpbiB0aGUgYmluZGluZy4KCkFzIHdlIGNhbid0
IHJlYWxseSB0ZWxsIGlmIHRoZSBjb250cm9sbGVyIGlzIGV4YWN0bHkgdGhlIHNhbWUgb3IgZXZl
bgpoYXMgc29tZSBTb0MgaW50ZWdyYXRpb24gYnVncywgd2UgZ2VuZXJhbGx5IGFkZCBhIG5ldyBj
b21wYXRpYmxlIGZvcgplYWNoIFNvQyB0byBrZXkgb2ZmIGFueSB3b3JrYXJvdW5kcyBuZWNlc3Nh
cnkgaW4gdGhlIGRyaXZlciB3aXRob3V0IHRoZQpuZWVkIHRvIGNoYW5nZSB0aGUgRFRzLCBicmVh
a2luZyBjb21wYXRpYmlsaXR5LgoKUmVnYXJkcywKTHVjYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0
CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
