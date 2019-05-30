From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 2/2] net: macb: Add support for SiFive FU540-C000
Date: Wed, 29 May 2019 19:42:32 -0700 (PDT)
Message-ID: <mhng-c7fba225-8035-4808-bdd6-bc05da5d2674@palmer-si-x1e>
References: <20190524134847.GF2979@lunn.ch>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190524134847.GF2979@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: andrew@lunn.ch
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, Sachin Ghadi <sachin.ghadi@sifive.com>, yash.shah@sifive.com, robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, ynezz@true.cz, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAyNCBNYXkgMjAxOSAwNjo0ODo0NyBQRFQgKC0wNzAwKSwgYW5kcmV3QGx1bm4uY2gg
d3JvdGU6Cj4gT24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMTA6MjI6MDZBTSArMDUzMCwgWWFzaCBT
aGFoIHdyb3RlOgo+PiBPbiBUaHUsIE1heSAyMywgMjAxOSBhdCA4OjI0IFBNIEFuZHJldyBMdW5u
IDxhbmRyZXdAbHVubi5jaD4gd3JvdGU6Cj4+ID4KPj4gPiA+ICtzdGF0aWMgaW50IGZ1NTQwX21h
Y2JfdHhfc2V0X3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBwYXJlbnRf
cmF0ZSkKPj4gPiA+ICt7Cj4+ID4gPiArICAgICByYXRlID0gZnU1NDBfbWFjYl90eF9yb3VuZF9y
YXRlKGh3LCByYXRlLCAmcGFyZW50X3JhdGUpOwo+PiA+ID4gKyAgICAgaW93cml0ZTMyKHJhdGUg
IT0gMTI1MDAwMDAwLCBtZ210LT5yZWcpOwo+PiA+Cj4+ID4gVGhhdCBsb29rcyBvZGQuIFdyaXRp
bmcgdGhlIHJlc3VsdCBvZiBhIGNvbXBhcmlzb24gdG8gYSByZWdpc3Rlcj8KPj4KPj4gVGhlIGlk
ZWEgd2FzIHRvIHdyaXRlICIxIiB0byB0aGUgcmVnaXN0ZXIgaWYgdGhlIHZhbHVlIG9mIHJhdGUg
aXMKPj4gYW55dGhpbmcgZWxzZSB0aGFuIDEyNTAwMDAwMC4KPgo+IEknbSBub3QgYSBsYW5ndWFn
ZSBsYXd5ZXIuIElzIGl0IGd1YXJhbnRlZWQgdGhhdCBhbiBleHByZXNzaW9uIGxpa2UKPiB0aGlz
IHJldHVybnMgMT8gQW55IHZhbHVlICEwIGlzIHRydWUsIHNvIG1heWJlIGl0IGFjdHVhbGx5IHJl
dHVybnMgNDI/CgpGcm9tIFN0YWNrIE92ZXJmbG93OiBodHRwczovL3N0YWNrb3ZlcmZsb3cuY29t
L3F1ZXN0aW9ucy8xODA5NzkyMi9yZXR1cm4tdmFsdWUtb2Ytb3BlcmF0b3ItaW4tYwoKIkMxMShJ
U08vSUVDIDk4OTk6MjAxeCkgwqc2LjUuOCBSZWxhdGlvbmFsIG9wZXJhdG9ycwoKRWFjaCBvZiB0
aGUgb3BlcmF0b3JzIDwgKGxlc3MgdGhhbiksID4gKGdyZWF0ZXIgdGhhbiksIDw9IChsZXNzIHRo
YW4gb3IgZXF1YWwKdG8pLCBhbmQgPj0gKGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0bykgc2hhbGwg
eWllbGQgMSBpZiB0aGUgc3BlY2lmaWVkIHJlbGF0aW9uCmlzIHRydWUgYW5kIDAgaWYgaXQgaXMg
ZmFsc2UuIFRoZSByZXN1bHQgaGFzIHR5cGUgaW50LiIKCj4+IFRvIG1ha2UgaXQgZWFzaWVyIHRv
IHJlYWQsIEkgd2lsbCBjaGFuZ2UgdGhpcyB0byBiZWxvdzoKPj4gICAgIC0gaW93cml0ZTMyKHJh
dGUgIT0gMTI1MDAwMDAwLCBtZ210LT5yZWcpOwo+PiAgICAgKyBpZiAocmF0ZSAhPSAxMjUwMDAw
MDApCj4+ICAgICArICAgICBpb3dyaXRlMzIoMSwgbWdtdC0+cmVnKTsKPj4gICAgICsgZWxzZQo+
PiAgICAgKyAgICAgaW93cml0ZTMyKDAsIG1nbXQtPnJlZyk7Cj4+Cj4+IEhvcGUgdGhhdCdzIGZp
bmUuIFRoYW5rcyBmb3IgeW91ciBjb21tZW50Cj4KPiBZZXMsIHRoYXQgaXMgZ29vZC4KPgo+ICAg
ICAgQW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
