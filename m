From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH V10 0/3] mtd: read partitions compatible prop for "ofpart"
 type
Date: Mon, 26 Mar 2018 13:30:15 +0200
Message-ID: <1844604.Hq7LKkU3xk@blindfold>
References: <20180130201059.4424-1-zajec5@gmail.com>
 <20180314121044.12033-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180314121044.12033-1-zajec5@gmail.com>
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

QW0gTWl0dHdvY2gsIDE0LiBNw6RyeiAyMDE4LCAxMzoxMDo0MSBDRVNUIHNjaHJpZWIgUmFmYcWC
IE1pxYJlY2tpOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAK
PiBUaGlzIHBhdGNoc2V0IHByb3ZpZGVzIGEgcHJvcGVyIHN1cHBvcnQgZm9yIGZsYXNoIGRldmlj
ZSBEVCBub2RlIHdpdGgKPiAicGFydGl0aW9ucyIgc3Vibm9kZSB1c2luZyAiY29tcGF0aWJsZSIg
cHJvcGVydHkuIEl0J3MgYWxyZWFkeQo+IGRvY3VtZW50ZWQgaW4gdGhlOiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbi50eHQKPiAKPiBXZSBiZWxpZXZlZCB0
aGF0IHZlcnNpb24gNyB3YXMgcmVhZHkgdG8gZ28sIGJ1dCBzb29uIGFmdGVyIGxhbmRpbmcgaW4K
PiB0aGUgbGludXgtbmV4dCB3ZSBnb3QgYSByZWdyZXNzaW9uIHJlcG9ydCBmcm9tIFBldGVyLiBM
YXRlciB2ZXJzaW9ucwo+IHRha2VzIGEgc2FmZSBwYXRoIGJ5Ogo+IDEpIFJlc3BlY3RpbmcgcGFy
c2VycyBvcmRlciBhcyBzcGVjaWZpZWQgaW4gdGhlIGRlZmF1bHQvZHJpdmVyLXByb3ZpZGVkCj4g
ICAgbGlzdC4KPiAyKSBMb29raW5nIGF0ICJjb21wYXRpYmxlIiBwcm9wZXJ0eSBvbmx5IHdoZW4g
Im9mcGFydCIgdHlwZSBnZXRzCj4gICAgc3BlY2lpZWQuCj4gCj4gVmVyc2lvbiA5IHdhcyBzdWNj
ZXNzZnVsbHkgdGVzdGVkIGJ5IFBldGVyIGFuZCB2ZXJzaW9uIDEwIGp1c3Qgc3F1YXNoZXMKPiB0
d28gY29tbWl0cyBpbnRvIGEgb25lLgo+IAo+IEkgZG91YmxlLWNoZWNrZWQgdGhlIGNvZGUgYW5k
IGNhbm5vdCB0aGluayBvZiBhbnkgcmVncmVzc2lvbiB0aGlzIGNvdWxkCj4gY2F1c2UuIEkgYWxz
byBob3BlIHRoaXMgZGVzaWduIChyb3VnaGx5IGRpc2N1c3NlZCB3aXRoIEJvcmlzKSBjYW4gYmUK
PiBhY2NlcHRhYmxlIGZvciB0aGUgbXRkIHN1YnN5c3RlbS4KPiAKPiBUaGUgbW9zdCBpbXBvcnRh
bnQgcGF0Y2ggZnJvbSB0aGlzIHBhdGNoc2V0ICgxLzMpIHdhcyByZXZpZXdlZCBieSBSb2IgaW4K
PiB0aGUKPiBbUEFUQ0ggVjYgMS8yXSBtdGQ6IHBhcnRpdGlvbnM6IGFkZCBvZl9tYXRjaF90YWJs
ZSBwYXJzZXIgbWF0Y2hpbmcKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL2NvbW1lbnQv
MTgzMTU1MS8KPiAKPiBJZiBwb3NzaWJsZSB0aGlzIGlzIGEgNC4xNyBtYXRlcmlhbC4KPiAKPiBS
YWZhxYIgTWnFgmVja2kgKDMpOgo+ICAgbXRkOiBwYXJ0aXRpb25zOiBhZGQgb2ZfbWF0Y2hfdGFi
bGUgcGFyc2VyIG1hdGNoaW5nIGZvciB0aGUgIm9mcGFydCIKPiAgICAgdHlwZQo+ICAgbXRkOiBy
ZW5hbWUgIm9mcGFydCIgcGFyc2VyIHRvICJmaXhlZC1wYXJ0aXRpb25zIiBhcyBpdCBmaXRzIGl0
IGJldHRlcgo+ICAgbXRkOiBvZnBhcnQ6IGFkZCBvZl9tYXRjaF90YWJsZSB3aXRoICJmaXhlZC1w
YXJ0aXRpb25zIgo+IAo+ICBkcml2ZXJzL210ZC9tdGRwYXJ0LmMgICAgICAgICAgfCAxMTYKPiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLSBkcml2ZXJzL210ZC9vZnBh
cnQuYyAgICAgICAgICAgfCAKPiAxOCArKysrKy0tCj4gIGluY2x1ZGUvbGludXgvbXRkL3BhcnRp
dGlvbnMuaCB8ICAgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTIxIGluc2VydGlvbnMoKyksIDE0
IGRlbGV0aW9ucygtKQoKU2VyaWVzIGxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogUmlj
aGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
