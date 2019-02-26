From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 0/2] Add and document the i.MX8MQ OTP controller
Date: Tue, 26 Feb 2019 10:03:47 +0100
Message-ID: <1551171827.2313.14.camel@pengutronix.de>
References: <20190202150638.13672-1-ccaione@baylibre.com>
 <20190225151127.elg2iuaxa4otdb46@fsr-ub1664-175>
 <e0af9818-86cf-c341-61a4-0a1406b07880@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e0af9818-86cf-c341-61a4-0a1406b07880@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>, Abel Vesa <abel.vesa@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

QW0gRGllbnN0YWcsIGRlbiAyNi4wMi4yMDE5LCAwODo1NyArMDAwMCBzY2hyaWViIENhcmxvIENh
aW9uZToKPiBPbiAyNS8wMi8yMDE5IDE1OjExLCBBYmVsIFZlc2Egd3JvdGU6Cj4gPiBPbiAxOS0w
Mi0wMiAxNTowNjozNiwgQ2FybG8gQ2Fpb25lIHdyb3RlOgo+ID4gPiBBZGQgYSBuZXcgbm9kZSB0
byBlbmFibGUgdGhlIE9uLUNoaXAgT1RQIGNvbnRyb2xsZXIgYW5kIGFkZCB0aGUKPiA+ID4gbmV3
Cj4gPiA+IGJpbmRpbmcgaW4gdGhlIGRvY3VtZW50YXRpb24uCj4gPiA+IAo+ID4gPiBDYXJsbyBD
YWlvbmUgKDIpOgo+ID4gPiDCoMKgwqBhcm02NDogZHRzOiBpbXg4bXE6IEFkZCBvbi1jaGlwIE9U
UCBjb250cm9sbGVyIG5vZGUKPiA+ID4gwqDCoMKgZHQtYmluZGluZ3M6IGlteC1vY290cDogQWRk
IGkuTVg4TVEgY29tcGF0aWJsZQo+ID4gPiAKPiA+ID4gwqAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL252bWVtL2lteC1vY290cC50eHQgfCAxICsKPiA+ID4gwqAgYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1xLmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHwgOAo+ID4gPiArKysrKysrKwo+ID4gPiDCoCAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKQo+ID4gPiAKPiA+ID4gLS3CoAo+ID4gPiAyLjE5LjEKPiA+ID4gCj4gPiAKPiA+IFdoYXQn
cyB0aGUgc3RhdHVzIG9mIHRoaXMgcGF0Y2hzZXJpZXMgPwo+ID4gCj4gPiBJdCB3b3VsZCBoZWxw
IGEgbG90IGlmIHdlIHdvdWxkIG1hbmFnZSB0byBnZXQgdGhpcyBpbi4KPiAKPiBVaCwgZm9yIHNv
bWUgcmVhc29uIEkgdGhvdWdodCBMdWNhcyB3YXMgZ29pbmcgdG8gdGFrZSBjYXJlIG9mIHRoaXMu
Cj4gSSdsbCBzdWJtaXQgYSB2MiBub3cuCgpIdWg/IEkndmUgc2VudCBvdXQgdGhlIGVudGlyZSBz
ZXJpZXMgWzFdLiBJdCdzIGp1c3Qgd2FpdGluZyBmb3IgdGhlCm52bWVtIG1haW50YWluZXJzIHRv
IHB1bGwgaXQgaW4gQUZBSUNTLiBUaGVyZSBzaG91bGQgYmUgbm8gbmVlZCB0bwpyZXNlbmQgYW55
dGhpbmcuCgpSZWdhcmRzLApMdWNhcwoKClsxXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3BhdGNoLzEwMzk5NTkvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hcm0ta2VybmVsCg==
