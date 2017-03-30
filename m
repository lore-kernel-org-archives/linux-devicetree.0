From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: mtd: document linux,part-probe property
Date: Fri, 31 Mar 2017 01:26:45 +0200
Message-ID: <74e3a663-2431-9b86-9d90-7f2fe6ce900f@gmail.com>
References: <20170330215332.32699-1-zajec5@gmail.com>
 <20170330215332.32699-2-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20170330215332.32699-2-zajec5@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gMDMvMzAvMjAxNyAxMTo1MyBQTSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEZyb206IFJh
ZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBTdXBwb3J0IGZvciB0aGlzIHBy
b3BlcnR5IGhhcyBiZWVuIGludHJvZHVjZWQgaW4gMjAxMCB3aXRoIGNvbW1pdAo+IDlkNWRhM2E5
Yjg0OSAoIm10ZDogZXh0ZW5kIHBoeXNtYXBfb2YgdG8gbGV0IHRoZSBkZXZpY2UgdHJlZSBzcGVj
aWZ5IHRoZQo+IHBhcml0aW9uIHByb2JlIikgYnV0IGl0IHdhcyBuZXZlciBkb2N1bWVudGVkLiBG
aXggdGhpcyBieSBhZGRpbmcgYQo+IHByb3BlciBkZXNjcmlwdGlvbiBhbmQgZXhhbXBsZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gLS0t
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvY29tbW9uLnR4dCB8IDcg
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvY29tbW9uLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvY29tbW9uLnR4dAo+IGluZGV4IGZj
MDY4YjkyM2Q3YS4uMWFkYTcwZTcxOGIyIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvY29tbW9uLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvY29tbW9uLnR4dAo+IEBAIC02LDEwICs2LDE3IEBAIE9wdGlv
bmFsIHByb3BlcnRpZXM6Cj4gICAgY29udHJvbGxlciBiYXNlZCBuYW1lKSBpbiBvcmRlciB0byBl
YXNlIGZsYXNoIGRldmljZSBpZGVudGlmaWNhdGlvbgo+ICAgIGFuZC9vciBkZXNjcmliZSB3aGF0
IHRoZXkgYXJlIHVzZWQgZm9yLgo+ICAKPiArLSBsaW51eCxwYXJ0LXByb2JlOiBpZiBwcmVzZW50
LCB0aGlzIHByb3BlcnR5IHNob3VsZCBjb250YWluIGEgbGlzdCBvZiBzdHJpbmdzCj4gKyAgd2l0
aCBwYXJ0aXRpb24gcHJvYmVzIHRvIGJlIHVzZWQgZm9yIHRoZSBmbGFzaCBkZXZpY2UuIEEgcm9s
ZSBvZiBwYXJ0aXRpb24KPiArICBwcm9iZSAocGFyc2VyKSBpcyB0byByZWFkL2NvbnN0cnVjdCBw
YXJ0aXRpb24gdGFibGUgYW5kIHJlZ2lzdGVyIGZvdW5kCj4gKyAgcGFydGl0aW9ucy4gR2V0dGlu
ZyBwYXJ0aXRpb24gdGFibGUgbWF5IGJlIHBsYXRmb3JtIG9yIGRldmljZSBzcGVjaWZpYyBzbwo+
ICsgIHZhcmlvdXMgZGV2aWNlcyBtYXkgdXNlIHZhcmlvdXMgTGludXggZHJpdmVycyBmb3IgdGhp
cyBwdXJwb3NlLgoKV2h5IGRvbid0IHlvdSBqdXN0IGhhdmUgcGFydGl0aW9uIG5vdCB3aXRoaW4g
cGFydGl0aW9uIG5vZGUgPyBUaGVuIHlvdQp3b24ndCBuZWVkIHRoaXMgbm9uc2Vuc2UgLi4uCgo+
ICBFeGFtcGxlOgo+ICAKPiAgCWZsYXNoQDAgewo+ICAJCWxhYmVsID0gIlN5c3RlbS1maXJtd2Fy
ZSI7Cj4gKwkJbGludXgscGFydC1wcm9iZSA9ICJjbWRsaW5lcGFydCIsICJvZnBhcnQiOwo+ICAK
PiAgCQkvKiBmbGFzaCB0eXBlIHNwZWNpZmljIHByb3BlcnRpZXMgKi8KPiAgCX07Cj4gCgoKLS0g
CkJlc3QgcmVnYXJkcywKTWFyZWsgVmFzdXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
