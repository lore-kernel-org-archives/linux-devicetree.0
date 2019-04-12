From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 2/3] ARM: dts: da850-evm: enable cpufreq
Date: Fri, 12 Apr 2019 15:09:08 +0200
Message-ID: <CAMRc=MepbkT06sJ39z726sRZWMfmgNk5CS_X5YVbk3T=G5Hjaw@mail.gmail.com>
References: <20190408075924.2284-1-brgl@bgdev.pl>
 <20190408075924.2284-3-brgl@bgdev.pl>
 <57fe079c-fd69-45ef-b4fb-a2c792218c21@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <57fe079c-fd69-45ef-b4fb-a2c792218c21@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

cHQuLCAxMiBrd2kgMjAxOSBvIDE1OjA2IFNla2hhciBOb3JpIDxuc2VraGFyQHRpLmNvbT4gbmFw
aXNhxYIoYSk6Cj4KPiBPbiAwOC8wNC8xOSAxOjI5IFBNLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJl
LmNvbT4KPiA+Cj4gPiBFbmFibGUgY3B1ZnJlcS1kdCBzdXBwb3J0IGZvciBkYTg1MC1ldm0uIFRo
ZSBjdmRkIGlzIHN1cHBsaWVkIGJ5IHRoZQo+ID4gdHBzNjUwNyBwbWljIHdpdGggY29uZmlndXJh
YmxlIG91dHB1dCB2b2x0YWdlLCBzbyBhbGwgb3BlcmF0aW5nIHBvaW50cwo+ID4gY2FuIGJlIGVu
YWJsZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFz
emV3c2tpQGJheWxpYnJlLmNvbT4KPgo+IEFkYW0sIGNhbiB5b3UgcGxlYXNlIGFjaz8gTG9va3Mg
Z29vZCB0byBtZS4KPgoKQWN0dWFsbHkgSSBqdXN0IG5vdGljZWQgdGhlIGNvbW1pdCBtZXNzYWdl
IGlzIG5vIGxvbmdlciBpbiBsaW5lIHdpdGgKdGhlIGNoYW5nZXNldC4gSSdsbCBmaXggaXQgaW4g
djQgc2hvcnRseS4KCkJhcnQKCj4gVGhhbmtzLAo+IFNla2hhcgo+Cj4gPiAtLS0KPiA+ICBhcmNo
L2FybS9ib290L2R0cy9kYTg1MC1ldm0uZHRzIHwgMTMgKysrKysrKysrKysrKwo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2RhODUwLWV2bS5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9kYTg1MC1ldm0uZHRz
Cj4gPiBpbmRleCBmMDRiYzNlMTUzMzIuLmY5NGJiMzhmZGFkOSAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2RhODUwLWV2bS5kdHMKPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2RhODUwLWV2bS5kdHMKPiA+IEBAIC0xOTEsNiArMTkxLDE5IEBACj4gPiAgICAgICB9Owo+ID4g
IH07Cj4gPgo+ID4gKyZjcHUgewo+ID4gKyAgICAgY3B1LXN1cHBseSA9IDwmdmRjZGMzX3JlZz47
Cj4gPiArfTsKPiA+ICsKPiA+ICsvKgo+ID4gKyAqIFRoZSBzdGFuZGFyZCBkYTg1MC1ldm0ga2l0
cyBhbmQgU09NJ3MgYXJlIDM3NU1IeiBzbyBlbmFibGUgdGhpcyBvcGVyYXRpbmcKPiA+ICsgKiBw
b2ludCBieSBkZWZhdWx0LiBIaWdoZXIgZnJlcXVlbmNpZXMgbXVzdCBiZSBlbmFibGVkIGZvciBj
dXN0b20gYm9hcmRzIHdpdGgKPiA+ICsgKiBvdGhlciB2YXJpYW50cyBvZiB0aGUgU29DLgo+ID4g
KyAqLwo+ID4gKyZvcHBfMzc1IHsKPiA+ICsgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICt9Owo+
ID4gKwo+ID4gICZzYXRhIHsKPiA+ICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICB9Owo+ID4g
LS0KPiA+IDIuMjEuMAo+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
