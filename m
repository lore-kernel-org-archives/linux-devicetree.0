From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/3] drm: bridge: dw-hdmi: check the cec-disable property
Date: Mon, 19 Mar 2018 14:11:39 +0100
Message-ID: <7ec5ea06-92ab-59e6-898c-57b3e5cdf83d@baylibre.com>
References: <20180319114345.29837-1-hverkuil@xs4all.nl>
 <20180319114345.29837-3-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180319114345.29837-3-hverkuil@xs4all.nl>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Hans Verkuil <hans.verkuil@cisco.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gMTkvMDMvMjAxOCAxMjo0MywgSGFucyBWZXJrdWlsIHdyb3RlOgo+IEZyb206IEhhbnMgVmVy
a3VpbCA8aGFucy52ZXJrdWlsQGNpc2NvLmNvbT4KPiAKPiBJZiB0aGUgY2VjLWRpc2FibGUgcHJv
cGVydHkgd2FzIHNldCwgdGhlbiBkaXNhYmxlIHRoZSBEVyBDRUMKPiBjb250cm9sbGVyLiBUaGlz
IGlzIG5lZWRlZCBmb3IgYm9hcmRzIHRoYXQgaGF2ZSB0aGVpciBvd24KPiBDRUMgY29udHJvbGxl
ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGhhbnMudmVya3VpbEBjaXNjby5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwg
MyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gaW5kZXggYTM4
ZGI0MGNlOTkwLi41OTcyMjBlNDA1NDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuYwo+IEBAIC0yNTA4LDcgKzI1MDgsOCBAQCBfX2R3X2hkbWlfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiAgCQloZG1pLT5hdWRpbyA9IHBsYXRmb3Jt
X2RldmljZV9yZWdpc3Rlcl9mdWxsKCZwZGV2aW5mbyk7Cj4gIAl9Cj4gIAo+IC0JaWYgKGNvbmZp
ZzAgJiBIRE1JX0NPTkZJRzBfQ0VDKSB7Cj4gKwlpZiAoKGNvbmZpZzAgJiBIRE1JX0NPTkZJRzBf
Q0VDKSAmJgo+ICsJICAgICFvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJjZWMtZGlzYWJsZSIp
KSB7Cj4gIAkJY2VjLmhkbWkgPSBoZG1pOwo+ICAJCWNlYy5vcHMgPSAmZHdfaGRtaV9jZWNfb3Bz
Owo+ICAJCWNlYy5pcnEgPSBpcnE7Cj4gCgpJIHN1c3BlY3RlZCB0aGUgYml0IHdhcyBvZmYgZm9y
IHRoZSBBbWxvZ2ljIEdYIFNvQ3MsIEkgd2FzIHdyb25nLi4uCgpSZXZpZXdlZC1ieTogTmVpbCBB
cm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
