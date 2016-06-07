From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v5 1/2] drm/bridge: Add sii902x driver
Date: Tue, 7 Jun 2016 07:31:59 +0200
Message-ID: <20160607073159.20541da1@bbrezillon>
References: <1464879601-30569-1-git-send-email-boris.brezillon@free-electrons.com>
 <CACvgo51VRL=Ewbvx-sbwfLoPm00rDUEJ3mvk8Rc0T4WKC=UThA@mail.gmail.com>
 <20160603120238.76dc9380@bbrezillon>
 <HE1PR04MB10516B0A27EEBFDA8019C1A1EC5D0@HE1PR04MB1051.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <HE1PR04MB10516B0A27EEBFDA8019C1A1EC5D0@HE1PR04MB1051.eurprd04.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Meng Yi <meng.yi@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Xiubo Li <lixiubo@cmss.chinamobile.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, Huan Wang <alison.wang@nxp.com>, Emil Velikov <emil.l.velikov@gmail.com>, ML dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jianwei Wang <jianwei.wang.chn@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgTWVuZywKCk9uIFR1ZSwgNyBKdW4gMjAxNiAwMjo0MDo1NiArMDAwMApNZW5nIFlpIDxtZW5n
LnlpQG54cC5jb20+IHdyb3RlOgoKPiBIaSBCb3JpcywKPiAKPiBTb3JyeSBmb3IgcmVwbHkgbGF0
ZSwgSSB3YXMgb24gUFRPLiBBbmQgYW5vdGhlciBQVE8gb24gIEp1bmUgOX4xMSwgMjAxNi5VVEMr
OAo+IAo+ID4gIAo+ID4gPiA+ICsgICAgICAgZ3Bpb2Rfc2V0X3ZhbHVlKHNpaTkwMngtPnJlc2V0
X2dwaW8sIDEpOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgIG1zbGVlcCgxMDApOyAgCj4gPiA+
IE91Y2ggdGhhdCBpcyBzb21lIGp1aWN5IG51bWJlci4gQ2FuIHdlIGdldCBhIGNvbW1lbnQgd2l0
aAo+ID4gPiByZWFzb25pbmcvb3JpZ2luIG9mIGl0ID8gIAo+ID4gCj4gPiBBcyBhbHJlYWR5IGV4
cGxhaW5lZCB0byBNYXhpbWUsIEkganVzdCBkb24ndCBrbm93IHdoeSB0aGlzIGlzIG5lZWRlZCwg
c2ltcGx5Cj4gPiBiZWNhdXNlIEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhlIGRhdGFzaGVldCBh
bmQgSSBqdXN0IGJhc2VkIG15Cj4gPiBpbXBsZW1lbnRhdGlvbiBvbiBhbm90aGVyIGRyaXZlci4K
PiA+IEkgY2FuIGFkZCBhIGNvbW1lbnQgc3RhdGluZyB0aGF0IHRoaXMgd2FzIGV4dHJhY3RlZCBm
cm9tIGFub3RoZXIKPiA+IGltcGxlbWVudGF0aW9uLCBidXQgd2l0aCBubyBleHBsYW5hdGlvbiBv
biB3aHkgdGhpcyBpcyBuZWVkZWQuCj4gPiAKPiA+IE1lbmcsIGRvIHlvdSBoYXZlIGFueSBpbmZv
cm1hdGlvbiBhYm91dCBzdGFydHVwLXRpbWUsIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQ/Cj4gPiAg
IAo+IAo+IEkgaGFkIGNoZWNrZWQgdGhlIGRhdGFzaGVldCBvZiBzaWk5MDIyYSwgd2hpY2ggc2Fp
ZCB0aGUgTWluIG9mIFRSRVNFVCBpcyAxMDAgzrxzLCBhbmQgTWF4IGlzIG5vdCBzcGVjaWZpZWQu
CgpPaCwgdGhhbmtzIGEgbG90LiB0cmVzZXQtbWluIGlzIGV4YWN0bHkgd2hhdCBJIG5lZWRlZC4K
ClJlZ2FyZHMsCgpCb3JpcwoKLS0gCkJvcmlzIEJyZXppbGxvbiwgRnJlZSBFbGVjdHJvbnMKRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwOi8vZnJlZS1lbGVjdHJvbnMu
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
