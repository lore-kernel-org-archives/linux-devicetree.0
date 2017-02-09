From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH v3 0/2] Add a "label" property to the mtd device
Date: Thu, 9 Feb 2017 21:25:32 +0100
Message-ID: <ceb3ad29-a5fc-86d5-a2f3-dd2c1620fc57@gmail.com>
References: <1486632068-14894-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1486632068-14894-1-git-send-email-clg@kaod.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMDIvMDkvMjAxNyAxMDoyMSBBTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4gSGVsbG8s
Cj4gCj4gSGVyZXIgYXJlIGEgY291cGxlIG9mIHBhdGNoZXMgYWRkaW5nIGEgImxhYmVsIiBwcm9w
ZXJ0eSB0byB0aGUgbXRkCj4gZGV2aWNlLCB3aGljaCBjYW4gYmUgdXNlZCB0byBpZGVudGlmeSBh
IHNwZWNpZmljIGNoaXAgb24gYSBzeXN0ZW0gd2l0aAo+IG11bHRpcGxlIGNoaXBzLiBUaGlzIGlz
IGNvbW1vbiBvbiB0aGUgT3BlblBvd2VyIGJvYXJkcywgdGhlcmUgY2FuIGJlCj4gZm91ciBjaGlw
cyBob2xkaW5nIHRoZSBmaXJtd2FyZSBmb3IgdGhlIEJNQyBhbmQgdGhlIGZpcm13YXJlIGZvciB0
aGUKPiBob3N0LCBwbHVzIGNoaXBzIHdpdGggZ29sZGVuIGltYWdlcyBmb3IgcmVjb3ZlcnkuCgpT
ZXJpZXMgaXMKUmV2aWV3ZWQtYnk6IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBnbWFpbC5jb20+
Cgo+IFRoYW5rcywKPiAKPiBDLgo+IAo+ICBDaGFuZ2VzIHNpbmNlIHYyOgo+IAo+ICAtIG9ubHkg
YXNzaWduIGRldmljZSBuYW1lIGZyb20gbGFiZWwgaWYgbXRkLT5uYW1lIGlzIHVuZGVmaW5lZAo+
IAo+ICBDaGFuZ2VzIHNpbmNlIHYxOgo+IAo+ICAtIG1vdmVkIHRoZSB1c2Ugb2YgdGhlICJsYWJl
bCIgcHJvcGVydHkgZnJvbSBtdGRfc2V0X2Rldl9kZWZhdWx0cygpCj4gICAgdG8gbXRkX3NldF9v
Zl9ub2RlKCkgdG8gbGV0IGRyaXZlcnMga2VlcCBjb250cm9sIG9uIGhvdyBtdGQtPm5hbWUKPiAg
ICBpcyBzZXQgYW5kIGFsbG9jYXRlZC4KPiAKPiBDw6lkcmljIExlIEdvYXRlciAoMik6Cj4gICBt
dGQ6IG5hbWUgdGhlIG10ZCBkZXZpY2Ugd2l0aCBhbiBvcHRpb25hbCBsYWJlbCBwcm9wZXJ0eQo+
ICAgZHQtYmluZGluZ3M6IG10ZDogYWRkIGEgY29tbW9uIGxhYmVsIHByb3BlcnR5IHRvIGFsbCBt
dGQgZGV2aWNlcwo+IAo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2Nv
bW1vbi50eHQgfCAxNSArKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9saW51eC9tdGQvbXRkLmgg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTgg
aW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9jb21tb24udHh0Cj4gCgoKLS0gCkJlc3QgcmVnYXJkcywKTWFyZWsg
VmFzdXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
