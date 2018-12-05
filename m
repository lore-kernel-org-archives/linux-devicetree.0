From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: dts: meson: Fix IRQ trigger type for macirq
Date: Tue, 04 Dec 2018 17:12:19 -0800
Message-ID: <7hin08bwuk.fsf@baylibre.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
 <20181204160447.27869-2-ccaione@baylibre.com> <5C06DB0D.3010306@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5C06DB0D.3010306@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com
List-Id: devicetree@vger.kernel.org

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IEhpIENh
cmxvLAo+Cj4gTGUgMDQvMTIvMjAxOCAxNzowNCwgQ2FybG8gQ2Fpb25lIGEgw6ljcml0IDoKPj4g
QSBsb25nIHJ1bm5pbmcgc3RyZXNzIHRlc3Qgb24gYSBjdXN0b20gYm9hcmQgc2hpcHBpbmcgYW4g
QVhHIFNvQ3MgYW5kIGEKPj4gUmVhbHRlayBSVEw4MjExRiBQSFkgcmV2ZWFsZWQgdGhhdCBhZnRl
ciBhIGZldyBob3VycyB0aGUgY29ubmVjdGlvbgo+PiBzcGVlZCB3b3VsZCBkcm9wIGRyYXN0aWNh
bGx5LCBmcm9tIH4xMDAwTWJwcyB0byB+M01icHMuIEF0IHRoZSBzYW1lIHRpbWUKPj4gdGhlICdt
YWNpcnEnIChldGgwKSBJUlEgd291bGQgc3RvcCBiZWluZyB0cmlnZ2VyZWQgYXQgYWxsIGFuZCBh
cwo+PiBjb25zZXF1ZW5jZSB0aGUgR01BQyBJUlFzIG5ldmVyIEFDS2VkLgo+PiAKPj4gQWZ0ZXIg
YSBwYWluZnVsIGludmVzdGlnYXRpb24gdGhlIHByb2JsZW0gc2VlbWVkIHRvIGJlIGR1ZSB0byBh
IHdyb25nCj4+IGRlZmluZWQgSVJRIHR5cGUgZm9yIHRoZSBHTUFDIElSUSB0aGF0IHNob3VsZCBi
ZSBMRVZFTF9ISUdIIGluc3RlYWQgb2YKPj4gRURHRV9SSVNJTkcuCj4KPiBUaGlzIGlzIGEgZ29v
ZCBuZXdzICEKPgo+IEtldmluLAo+IFdoYXQncyB0aGUgYmVzdCBwcm9jZWR1cmUgaGVyZSB0byBt
YWtlIGl0IGFwcGx5IG9uIHRoZSA0LjE5LCA0LjE0IGFuZCA0Ljkgc3RhYmxlCj4gdHJlZXMgPyBm
b3IgNC4xNCBhbmQgNC45IGl0IHdpbGwgbmVlZCB0byBiZSByZXdvcmtlZCB0byBhcHBseSBjb3Jy
ZWN0bHkuCgpBZGRpbmcgYSBGaXhlczogdGFnIHdoZXJlIHRoZSBvcmlnaW5hbCBidWcgd2FzIGlu
dHJvZHVjZSBpcyB0aGUgYmVzdCB3YXkKZm9yIGl0IHRvIGF1dG9tYXRpY2FsbHkgZ2V0IGFwcGxp
ZWQuCgpIb3dldmVyLCBpZiByZXdvcmsgaXMgcmVxdWlyZWQsIHRoYXQgd2lsbCBoYXZlIHRvIGJl
IG1hbnVhbGx5IGRvbmUgYW5kCnNlbnQgdG8gdGhlIHN0YWJsZSBsaXN0LgoKS2V2aW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
