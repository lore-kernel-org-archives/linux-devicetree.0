From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 2/3] ARM: dts: da850-evm: enable cpufreq
Date: Fri, 12 Apr 2019 16:23:04 +0200
Message-ID: <CAMRc=MfTytX=8L8BrNKXGhiutxWj8i84wX-5agh=EWA-AZe1Pw@mail.gmail.com>
References: <20190408075924.2284-1-brgl@bgdev.pl>
 <20190408075924.2284-3-brgl@bgdev.pl>
 <57fe079c-fd69-45ef-b4fb-a2c792218c21@ti.com>
 <CAHCN7x+BpuuNnV+wteD=JBwuYF3z7EDD4kig26Kj4rOdJcW+LA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAHCN7x+BpuuNnV+wteD=JBwuYF3z7EDD4kig26Kj4rOdJcW+LA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Adam Ford <aford173@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

cHQuLCAxMiBrd2kgMjAxOSBvIDE1OjU5IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPiBu
YXBpc2HFgihhKToKPgo+IE9uIEZyaSwgQXByIDEyLCAyMDE5IGF0IDg6MDYgQU0gU2VraGFyIE5v
cmkgPG5zZWtoYXJAdGkuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiAwOC8wNC8xOSAxOjI5IFBNLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+ID4gPgo+ID4gPiBFbmFibGUgY3B1ZnJlcS1k
dCBzdXBwb3J0IGZvciBkYTg1MC1ldm0uIFRoZSBjdmRkIGlzIHN1cHBsaWVkIGJ5IHRoZQo+ID4g
PiB0cHM2NTA3IHBtaWMgd2l0aCBjb25maWd1cmFibGUgb3V0cHV0IHZvbHRhZ2UsIHNvIGFsbCBv
cGVyYXRpbmcgcG9pbnRzCj4gPiA+IGNhbiBiZSBlbmFibGVkLgo+ID4gPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+
ID4KPiA+IEFkYW0sIGNhbiB5b3UgcGxlYXNlIGFjaz8gTG9va3MgZ29vZCB0byBtZS4KPgo+IFNl
a2hhciwKPiBCYXNlZCBvbiB3aGF0IEkgcmVhZCBpbiB0aGUgdGhyZWFkIGFib3V0IHRoZSBMQ0RL
LCBJIHdhbnQgdG8gZG8gc29tZQo+IHRlc3RzIG9uIHRoZSBkYTg1MC1ldm0gYmVmb3JlIHB1dCBt
eSBuYW1lIG9uIGl0LiAgSSBsaWtlIHdoYXQgSSBzZWUgaW4KPiBnZW5lcmFsLCBzbyBJIGFtIGV4
Y2l0ZWQgdG8gdGhpcyB0aGlzIGhlcmUuCj4KPiBCYXJ0b3N6IC0gd2hpY2gga2VybmVsIGJyYW5j
aCBzaG91bGQgSSB1c2UgYXMgYSBzdGFydGluZyBwb2ludCB0byBhcHBseSB0aGVzZT8KPgoKVXBz
dHJlYW0gdjUuMS1yYzQuCgpCYXJ0b3N6Cgo+IGFkYW0KPiA+Cj4gPiBUaGFua3MsCj4gPiBTZWto
YXIKPiA+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtZXZtLmR0cyB8
IDEzICsrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCsp
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9kYTg1MC1ldm0uZHRz
IGIvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtZXZtLmR0cwo+ID4gPiBpbmRleCBmMDRiYzNlMTUz
MzIuLmY5NGJiMzhmZGFkOSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZGE4
NTAtZXZtLmR0cwo+ID4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9kYTg1MC1ldm0uZHRzCj4g
PiA+IEBAIC0xOTEsNiArMTkxLDE5IEBACj4gPiA+ICAgICAgIH07Cj4gPiA+ICB9Owo+ID4gPgo+
ID4gPiArJmNwdSB7Cj4gPiA+ICsgICAgIGNwdS1zdXBwbHkgPSA8JnZkY2RjM19yZWc+Owo+ID4g
PiArfTsKPiA+ID4gKwo+ID4gPiArLyoKPiA+ID4gKyAqIFRoZSBzdGFuZGFyZCBkYTg1MC1ldm0g
a2l0cyBhbmQgU09NJ3MgYXJlIDM3NU1IeiBzbyBlbmFibGUgdGhpcyBvcGVyYXRpbmcKPiA+ID4g
KyAqIHBvaW50IGJ5IGRlZmF1bHQuIEhpZ2hlciBmcmVxdWVuY2llcyBtdXN0IGJlIGVuYWJsZWQg
Zm9yIGN1c3RvbSBib2FyZHMgd2l0aAo+ID4gPiArICogb3RoZXIgdmFyaWFudHMgb2YgdGhlIFNv
Qy4KPiA+ID4gKyAqLwo+ID4gPiArJm9wcF8zNzUgewo+ID4gPiArICAgICBzdGF0dXMgPSAib2th
eSI7Cj4gPiA+ICt9Owo+ID4gPiArCj4gPiA+ICAmc2F0YSB7Cj4gPiA+ICAgICAgIHN0YXR1cyA9
ICJva2F5IjsKPiA+ID4gIH07Cj4gPiA+IC0tCj4gPiA+IDIuMjEuMAo+ID4gPgo+ID4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
