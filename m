From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 4/6] drm/exynos: dsi: add support for Exynos5433 SoC
Date: Thu, 19 Mar 2015 10:32:10 +0100
Message-ID: <550A979A.6070102@samsung.com>
References: <1426666591-16103-1-git-send-email-human.hwang@samsung.com>
 <1426666591-16103-5-git-send-email-human.hwang@samsung.com>
 <CAPj87rPBZ7rG8BScFhp4tyKfOOJVCYoW8pgCMvHttT=NAbma9Q@mail.gmail.com>
 <20150319100252.03be7dda@hwh-ubuntu>
 <CAPj87rPeUS9h=GCBR7ccNhugaGoyHw3x6oZ3Spq6P8uEg4ZcUg@mail.gmail.com>
 <20150319101810.2244b509@hwh-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20150319101810.2244b509@hwh-ubuntu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hyungwon Hwang <human.hwang@samsung.com>, daniel@fooishbar.org
Cc: "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, =?UTF-8?B?7J2064+Z7ZmU?= <dh09.lee@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, =?UTF-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>
List-Id: devicetree@vger.kernel.org

T24gMDMvMTkvMjAxNSAwMjoxOCBBTSwgSHl1bmd3b24gSHdhbmcgd3JvdGU6Cj4gRGVhciBEYW5p
ZWwsCj4gCj4gT24gVGh1LCAxOSBNYXIgMjAxNSAwMToxMzoyMSArMDAwMAo+IERhbmllbCBTdG9u
ZSA8ZGFuaWVsLXJMdFk0YS84dEYxcm92VkNzL3VUbHdAcHVibGljLmdtYW5lLm9yZz4gd3JvdGU6
Cj4gCj4+IEhpIEh5dW5nd29uLAo+Pgo+PiBPbiAxOSBNYXJjaCAyMDE1IGF0IDAxOjAyLCBIeXVu
Z3dvbiBId2FuZyA8aHVtYW4uaHdhbmctU3plM08zVVUyMkpCRGdqSzd5N1RVUUBwdWJsaWMuZ21h
bmUub3JnPgo+PiB3cm90ZToKPj4+Pj4gKyAgICAgICAvKgo+Pj4+PiArICAgICAgICAqIFRoZSBp
bnB1dCBQTEwgY2xvY2sgZm9yIE1JUEkgRFNJIGluIEV4eW5vczU0MzMgc2VlbXMKPj4+Pj4gdG8g
YmUgZml4ZWQKPj4+Pj4gKyAgICAgICAgKiBieSBPU0MgQ0xLLgo+Pj4+PiArICAgICAgICAqLwo+
Pj4+PiArICAgICAgIGZpbiA9IDI0ICogTUhaOwo+Pj4+Cj4+Pj4gRXIsIGlzIHRoaXMgYWx3YXlz
IHRydWUgb24gb3RoZXIgcGxhdGZvcm1zIGFzIHdlbGw/IFNob3VsZG4ndCB0aGlzCj4+Pj4gYmUg
YSBwYXJ0IG9mIHRoZSBEZXZpY2VUcmVlIGRlc2NyaXB0aW9uPwo+Pj4KPj4+IEkgZm9yZ290IHRv
IGNoYW5nZSB0aGUgY29tbWVudCBpbiBkZXZlbG9wbWVudC4gRmluYWxseSBpdCBpcyBmb3VuZAo+
Pj4gdGhhdCBhbGwgZXh5bm9zIG1pcGkgZHNpJ3MgZmluIGlzIE9TQyBjbGsgd2hpY2ggaXMgMjQg
TUh6LiBTbyBJCj4+PiB3aWxsIHJlbW92ZSB0aGUgY29tbWVudCwgYnV0IHJlbWFpbiB0aGUgY29k
ZSBhcyBpdCBpcy4KPj4KPj4gRmFpciBlbm91Z2guIFNob3VsZCBwbGxfY2xrIGJlIHJlbW92ZWQg
ZnJvbSB0aGUgRFQgZGVzY3JpcHRpb24gdGhlbiwKPj4gaWYgaXQncyBmaXhlZCB0byB0aGUgb3Nj
aWxsYXRvcj8KPiAKPiBZZXMuIEl0IGlzIHJlZHVuZGFudCB0byByZXByZXNlbnQgcGxsX2NsayBp
biBEVCwgYW5kIGl0IHNob3VsZCBiZQo+IHJlbW92ZWQuCgpXaHkgZG8geW91IHRoaW5rIE9TQyBj
bGsgZGV0ZXJtaW5lcyB2YWx1ZSBvZiBwbGxfY2xrPwpwbGxfY2xrIGlzIG1hcHBlZCB0byBTQ0xL
X01JUElbMDFdIG9yIFNDTEtfRFNJTTAgZ2F0ZSB3aXRoIGZldyBkaXZpZGVycwphbmQgbXV4ZXMg
YWJvdmUuIFNvIGF0IGxlYXN0IGluIHRoZW9yeSBpdCBjYW4gZGlmZmVyIGZyb20gb3NjIGNsay4K
QWRkaXRpb25hbGx5IHRoaXMgZ2F0ZSBzaG91bGQgYmUgZW5hYmxlZCBzbyB5b3UgY2Fubm90IGp1
c3QgcmVtb3ZlIGl0CmZyb20gRFQuCgpSZWdhcmRzCkFuZHJ6ZWoKCj4gCj4+Cj4+PiBUaGFua3Mg
Zm9yIHlvdXIgcmV2aWV3LiBJIHdpbGwgc2VuZCBpdCBhZ2FpbiB3aXRoIHRoZSBjaGFuZ2VzIHlv
dQo+Pj4gc3VnZ2VzdGVkLgo+Pgo+PiBUaGFua3MgdmVyeSBtdWNoIQo+Pgo+PiBDaGVlcnMsCj4+
IERhbmllbAo+IAo+IEJlc3QgcmVnYXJkcywKPiBIeXVuZ3dvbiBId2FuZwo+IC0tCj4gVG8gdW5z
dWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGRldmlj
ZXRyZWUiIGluCj4gdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tby11Nzl1d1hMMjlU
WTc2WjJyTTVtSFhBQHB1YmxpYy5nbWFuZS5vcmcKPiBNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBo
dHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
