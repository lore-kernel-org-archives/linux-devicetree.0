From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 03/25] dt-bindings: timer: Document Owl timer
Date: Tue, 28 Feb 2017 12:39:08 +0000
Message-ID: <20170228123908.GG3691@leverpostej>
References: <20170228063535.32069-1-afaerber@suse.de>
 <20170228063535.32069-4-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170228063535.32069-4-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: support@lemaker.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, arm@kernel.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBGZWIgMjgsIDIwMTcgYXQgMDc6MzU6MTNBTSArMDEwMCwgQW5kcmVhcyBGw6RyYmVy
IHdyb3RlOgo+IFRoZSBBY3Rpb25zIFNlbWkgUzUwMCBTb0MgY29udGFpbnMgYSB0aW1lciBibG9j
ayB3aXRoIHR3byAyIEh6IGFuZCB0d28KPiAzMi1iaXQgdGltZXJzLiBUaGUgUzkwMCBTb0MgdGlt
ZXIgYmxvY2sgaGFzIGZvdXIgMzItYml0IHRpbWVycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4gLS0tCj4gIHYyIC0+IHYzOgo+ICAqIEFk
b3B0ZWQgaW50ZXJydXB0LW5hbWVzCj4gICogQ2hhbmdlZCBjb21wYXRpYmxlIGZvciBTNTAwCj4g
ICogQWRkZWQgUzkwMCBjb21wYXRpYmxlIGFuZCBpbnRlcnJ1cHQgbmFtZXMKPiAgCj4gIHYyOiBu
ZXcKPiAgCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL2FjdGlvbnMsb3dsLXRpbWVy
LnR4dCAgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5z
ZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3RpbWVyL2FjdGlvbnMsb3dsLXRpbWVyLnR4dAo+IAo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvYWN0aW9ucyxvd2wtdGltZXIu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL2FjdGlvbnMsb3ds
LXRpbWVyLnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4uNWI0ODM0
ZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdGltZXIvYWN0aW9ucyxvd2wtdGltZXIudHh0Cj4gQEAgLTAsMCArMSwyMCBAQAo+ICtBY3Rp
b25zIFNlbWkgT3dsIFRpbWVyCj4gKwo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICstIGNvbXBh
dGlibGUgICAgICA6ICAiYWN0aW9ucyxzNTAwLXRpbWVyIiBmb3IgUzUwMAo+ICsgICAgICAgICAg
ICAgICAgICAgICAiYWN0aW9ucyxzOTAwLXRpbWVyIiBmb3IgUzkwMAo+ICstIHJlZyAgICAgICAg
ICAgICA6ICBPZmZzZXQgYW5kIGxlbmd0aCBvZiB0aGUgcmVnaXN0ZXIgc2V0IGZvciB0aGUgZGV2
aWNlLgo+ICstIGludGVycnVwdHMgICAgICA6ICBTaG91bGQgY29udGFpbiB0aGUgaW50ZXJydXB0
cy4KPiArLSBpbnRlcnJ1cHQtbmFtZXMgOiAgVmFsaWQgbmFtZXMgYXJlOiAiMkh6MCIsICIySHox
IiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiVGltZXIwIiwgIlRp
bWVyMSIsICJUaW1lcjIiLCAiVGltZXIzIgoKU3RpY2tpbmcgdG8gbG93ZXIgY2FzZSBmb3IgdGhl
IG5hbWVzIHdvdWxkIGJlIHByZWZlcmFibGUuCgpPdGhlcndpc2UsIHRoaXMgbG9va3MgZmluZS4K
Ck1hcmssLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYXJtLWtlcm5lbAo=
