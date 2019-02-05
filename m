From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: imx6q-pcie: Add description of
 imx7d pcie phy
Date: Tue, 05 Feb 2019 10:43:56 +0100
Message-ID: <1549359836.2544.33.camel@pengutronix.de>
References: <20190205001721.18639-1-tpiepho@impinj.com>
 <20190205001721.18639-2-tpiepho@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190205001721.18639-2-tpiepho@impinj.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Trent Piepho <tpiepho@impinj.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

QW0gRGllbnN0YWcsIGRlbiAwNS4wMi4yMDE5LCAwMDoxNyArMDAwMCBzY2hyaWViIFRyZW50IFBp
ZXBobzoKPiBUaGVyZSBpcyBhIHNlcGFyYXRlIFBIWSBkZXZpY2Ugd2l0aCBpdHMgb3duIHJlZ2lz
dGVycyBvbiBpbXg3ZC7CoMKgSXQncwo+IGN1cnJlbnRseSB1bnVzZWQsIGJ1dCBhIFBDSWUgZXJy
YXR1bSBvbiBpbXg3ZCB3aWxsIHJlcXVpcmUgaXQgZm9yIHRoZQo+IHdvcmthcm91bmQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogVHJlbnQgUGllcGhvIDx0cGllcGhvQGltcGluai5jb20+CgpJJ20gZ2Vu
ZXJhbGx5IGZpbmUgd2l0aCB0aGlzLCBidXQgcmVhbGx5IHdhbnQgdG8gc2VlIGFuIEFjayBmcm9t
IHRoZSBEVApmb2xrcyAoQ0MnZWQpIG9uIHRoaXMuCgpBY2tlZC1ieTogTHVjYXMgU3RhY2ggPGwu
c3RhY2hAcGVuZ3V0cm9uaXguZGU+CgpSZWdhcmRzLApMdWNhcwoKPiAtLS0KPiDCoERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLGlteDZxLXBjaWUudHh0IHwgMTEgKysr
KysrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLGlteDZxLXBj
aWUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9mc2wsaW14NnEt
cGNpZS50eHQKPiBpbmRleCBkNTE0YzFmMjM2NWYuLmY0OTMzYzg5NTFiYyAxMDA2NDQKPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxpbXg2cS1wY2llLnR4
dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLGlteDZx
LXBjaWUudHh0Cj4gQEAgLTUzLDYgKzUzLDcgQEAgQWRkaXRpb25hbCByZXF1aXJlZCBwcm9wZXJ0
aWVzIGZvciBpbXg3ZC1wY2llOgo+ID4gwqAJwqDCoMKgwqDCoMKgwqAtICJwY2llcGh5Igo+ID4g
wqAJwqDCoMKgwqDCoMKgwqAtICJhcHBzIgo+ID4gwqAJwqDCoMKgwqDCoMKgwqAtICJ0dXJub2Zm
Igo+ICstIGZzbCxpbXg3ZC1wY2llLXBoeTogQSBwaGFuZGxlIHRvIGFuIGZzbCxpbXg3ZC1wY2ll
LXBoeSBub2RlLgo+IMKgCj4gwqBFeGFtcGxlOgo+IMKgCj4gQEAgLTc5LDMgKzgwLDEzIEBAIEV4
YW1wbGU6Cj4gPiDCoAkJY2xvY2tzID0gPCZjbGtzIDE0ND4sIDwmY2xrcyAyMDY+LCA8JmNsa3Mg
MTg5PjsKPiA+IMKgCQljbG9jay1uYW1lcyA9ICJwY2llIiwgInBjaWVfYnVzIiwgInBjaWVfcGh5
IjsKPiA+IMKgCX07Cj4gKwo+ICsqIEZyZWVzY2FsZSBpLk1YN2QgUENJZSBQSFkKPiArCj4gK1Ro
aXMgaXMgdGhlIFBIWSBhc3NvY2lhdGVkIHdpdGggdGhlIElNWDdkIFBDSWUgY29udHJvbGxlci7C
oMKgSXQncyB1c2VkIGJ5IHRoZQo+ICtQQ0ktZSBjb250cm9sbGVyIHZpYSB0aGUgZnNsLGlteDdk
LXBjaWUtcGh5IHBoYW5kbGUuCj4gKwo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICstIGNvbXBh
dGlibGU6Cj4gPiArCS0gImZzbCxpbXg3ZC1wY2llLXBoeSIKPiArLSByZWc6IGJhc2UgYWRkcmVz
cyBhbmQgbGVuZ3RoIG9mIHRoZSBQQ0llIFBIWSBjb250cm9sbGVyCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcg
bGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
