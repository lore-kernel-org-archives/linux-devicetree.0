From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH V9 0/4] mtd: read partitions compatible prop for "ofpart"
 type
Date: Sun, 11 Mar 2018 23:35:06 +0100
Message-ID: <1849709.LgWgpBxLnY@blindfold>
References: <20180130201059.4424-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180130201059.4424-1-zajec5@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Florian Fainelli <f.fainelli@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, John Crispin <john@phrozen.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Peter Rosin <peda@axentia.se>
List-Id: devicetree@vger.kernel.org

UmFmYcWCLAoKQW0gRGllbnN0YWcsIDMwLiBKYW51YXIgMjAxOCwgMjE6MTA6NTUgQ0VUIHNjaHJp
ZWIgUmFmYcWCIE1pxYJlY2tpOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNr
aS5wbD4KPiAKPiBUaGlzIHBhdGNoc2V0IHByb3ZpZGVzIGEgcHJvcGVyIHN1cHBvcnQgZm9yIGZs
YXNoIGRldmljZSBEVCBub2RlIHdpdGgKPiAicGFydGl0aW9ucyIgc3Vibm9kZSB1c2luZyAiY29t
cGF0aWJsZSIgcHJvcGVydHkuIEl0J3MgYWxyZWFkeQo+IGRvY3VtZW50ZWQgaW4gdGhlOiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbi50eHQKPiAKPiBXZSBi
ZWxpZXZlZCBhIHByZXZpb3VzIHZlcnNpb24gOCB3YXMgcmVhZHkgdG8gZ28sIGJ1dCBzb29uIGFm
dGVyIGxhbmRpbmcKPiBpbiB0aGUgbGludXgtbmV4dCB3ZSBnb3QgYSByZWdyZXNzaW9uIHJlcG9y
dCBmcm9tIFBldGVyLgo+IAo+IFRoaXMgdmVyc2lvbiB0YWtlcyBhIHNhZmUgcGF0aCBieToKPiAx
KSBSZXNwZWN0aW5nIHBhcnNlcnMgb3JkZXIgYXMgc3BlY2lmaWVkIGluIHRoZSBkZWZhdWx0L2Ry
aXZlci1wcm92aWRlZAo+ICAgIGxpc3QuCj4gMikgTG9va2luZyBhdCAiY29tcGF0aWJsZSIgcHJv
cGVydHkgb25seSB3aGVuICJvZnBhcnQiIHR5cGUgZ2V0cwo+ICAgIHNwZWNpaWVkLgo+IAo+IEkg
ZG91YmxlLWNoZWNrZWQgdGhlIGNvZGUgYW5kIGNhbm5vdCB0aGluayBvZiBhbnkgcmVncmVzc2lv
biB0aGlzIGNvdWxkCj4gY2F1c2UuIEkgYWxzbyBob3BlIHRoaXMgZGVzaWduIChyb3VnaGx5IGRp
c2N1c3NlZCB3aXRoIEJvcmlzKSBjYW4gYmUKPiBhY2NlcHRhYmxlIGZvciB0aGUgbXRkIHN1YnN5
c3RlbS4KPiAKPiBUaGlzIGlzIG9mIGNvdXJzZSA0LjE3IG1hdGVyaWFsIGF0IGJlc3QuCj4gCj4g
QnJpYW4gTm9ycmlzICgxKToKPiAgIG10ZDogcGFydGl0aW9uczogYWRkIG9mX21hdGNoX3RhYmxl
IHBhcnNlciBtYXRjaGluZwo+IAo+IFJhZmHFgiBNacWCZWNraSAoMyk6Cj4gICBtdGQ6IHBhcnRp
dGlvbnM6IGFkZCBzcGVjaWFsIHRyZWF0aW5nIGZvciB0aGUgIm9mcGFydCIgcGFyc2VyIHR5cGUK
PiAgIG10ZDogcmVuYW1lICJvZnBhcnQiIHBhcnNlciB0byAiZml4ZWQtcGFydGl0aW9ucyIgYXMg
aXQgZml0cyBpdCBiZXR0ZXIKPiAgIG10ZDogb2ZwYXJ0OiBhZGQgb2ZfbWF0Y2hfdGFibGUgd2l0
aCAiZml4ZWQtcGFydGl0aW9ucyIKPiAKPiAgZHJpdmVycy9tdGQvbXRkcGFydC5jICAgICAgICAg
IHwgMTE2Cj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0gZHJpdmVy
cy9tdGQvb2ZwYXJ0LmMgICAgICAgICAgIHwgCj4gMTggKysrKystLQo+ICBpbmNsdWRlL2xpbnV4
L210ZC9wYXJ0aXRpb25zLmggfCAgIDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDEyMSBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkKCkFzIGRpc2N1c3NlZCBvbiBJUkMsIDEvNCBjb25mdXNl
ZCBtZS4gSXQgc2hvdWxkIGJlIHNxdWFzaGVkIGludG8gMy80IHRvIG1ha2UgCnNlbnNlLgpPdGhl
ciB0aGFuIHRoYXQgSSB0aGluayB3ZSBjYW4gbWVyZ2UgdGhpcyBwYXRjaCBzZXJpZXMuCk5vdCB0
aGF0IEknbSBhIHN1cGVyIGZhbiBvZiBpdCwgYnV0IEkgY2FuIHNlZSB0aGUgdXNlLWNhc2UgYnV0
IGRvbid0IGhhdmUgYW4gCmlkZWEgaG93IHRvIHNvbHZlIHRoZSBwcm9ibGVtIGluIGEgbGVzcyBo
YWNreSB3YXkuIDstXAoKSnVzdCB0byBiZSBzdXJlLCBEVCBndXlzIGFyZSBhbHNvIGhhcHB5IHdp
dGggaXQsIHJpZ2h0PwoKVGhhbmtzLAovL3JpY2hhcmQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
