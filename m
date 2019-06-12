From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx7ulp: add crypto support
Date: Wed, 12 Jun 2019 21:06:05 +0800
Message-ID: <20190612130602.GH11086@dragon>
References: <20190606080255.25504-1-horia.geanta@nxp.com>
 <20190612103926.GE11086@dragon>
 <VI1PR0402MB3485A573518D60A573BA55C298EC0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <VI1PR0402MB3485A573518D60A573BA55C298EC0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Horia Geanta <horia.geanta@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Aymen Sghaier <aymen.sghaier@nxp.com>, Herbert Xu <herbert@gondor.apana.org.au>, Iuliana Prodan <iuliana.prodan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Franck Lenormand <franck.lenormand@nxp.com>, Rob Herring <robh+dt@kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "David S. Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6NDU6MThBTSArMDAwMCwgSG9yaWEgR2VhbnRhIHdy
b3RlOgo+IE9uIDYvMTIvMjAxOSAxOjQwIFBNLCBTaGF3biBHdW8gd3JvdGU6Cj4gPiBPbiBUaHUs
IEp1biAwNiwgMjAxOSBhdCAxMTowMjo1NUFNICswMzAwLCBIb3JpYSBHZWFudMSDIHdyb3RlOgo+
ID4+IEZyb206IEl1bGlhbmEgUHJvZGFuIDxpdWxpYW5hLnByb2RhbkBueHAuY29tPgo+ID4+Cj4g
Pj4gQWRkIGNyeXB0byBub2RlIGluIGRldmljZSB0cmVlIGZvciBDQUFNIHN1cHBvcnQuCj4gPj4K
PiA+PiBOb3Rld29ydGh5IGlzIHRoYXQgb24gN3VscCB0aGUgaW50ZXJydXB0IGxpbmUgaXMgc2hh
cmVkCj4gPj4gYmV0d2VlbiB0aGUgdHdvIGpvYiByaW5ncy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYt
Ynk6IEl1bGlhbmEgUHJvZGFuIDxpdWxpYW5hLnByb2RhbkBueHAuY29tPgo+ID4+IFNpZ25lZC1v
ZmYtYnk6IEZyYW5jayBMRU5PUk1BTkQgPGZyYW5jay5sZW5vcm1hbmRAbnhwLmNvbT4KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBIb3JpYSBHZWFudMSDIDxob3JpYS5nZWFudGFAbnhwLmNvbT4KPiA+PiAt
LS0KPiA+Pgo+ID4+IEkndmUganVzdCByZWFsaXplZCB0aGF0IHRoaXMgcGF0Y2ggc2hvdWxkIGJl
IG1lcmdlZCB0aHJvdWdoIHRoZSBjcnlwdG8gdHJlZSwKPiA+PiBlbHNlIGJpc2VjdGFiaWxpdHkg
Y291bGQgYmUgYWZmZWN0ZWQgZHVlIHRvIGNyeXB0b2Rldi0yLjYKPiA+PiBjb21taXQgMzg1Y2Zj
ODRhNWE4ICgiY3J5cHRvOiBjYWFtIC0gZGlzYWJsZSBzb21lIGNsb2NrIGNoZWNrcyBmb3IgaU1Y
N1VMUCIpCj4gPj4gKCBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwOTcwMDE3
LyApCj4gPj4gd2hpY2ggc2hvdWxkIGNvbWUgZmlyc3QuCj4gPiAKPiA+IEknbSBub3Qgc3VyZSBJ
IGZvbGxvdyBpdC4gIFRoaXMgaXMgYSBuZXcgZGV2aWNlIGFkZGVkIHRvIGlteDd1bHAgRFQuCj4g
PiBJdCdzIG5ldmVyIHdvcmtlZCBiZWZvcmUgb24gaW14N3VscC4gIEhvdyB3b3VsZCBpdCBhZmZl
Y3QgZ2l0IGJpc2VjdD8KPiA+IAo+IERyaXZlciBjb3JyZXNwb25kaW5nIHRvIHRoaXMgZGV2aWNl
IChkcml2ZXJzL2NyeXB0by9jYWFtKSBoYXMgdG8gYmUgdXBkYXRlZAo+IGJlZm9yZSBhZGRpbmcg
dGhlIG5vZGUgaW4gRFQuCj4gSXMgdGhlcmUgYW55IGd1YXJhbnRlZSB3cnQuIG1lcmdlIG9yZGVy
IG9mIHRoZSBjcnlwdG8gYW5kIERUIHRyZWVzPwoKRG8gbm90IG1lcmdlIERUIGNoYW5nZXMgdW50
aWwgZHJpdmVyIHBhcnQgaGl0cyBtYWlubGluZS4KClNoYXduCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
