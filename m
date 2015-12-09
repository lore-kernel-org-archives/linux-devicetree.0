From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: add Silicon Image SiI8620 bridge bindings
Date: Wed, 9 Dec 2015 15:54:19 -0600
Message-ID: <CAL_JsqLuzztHao753f44cE4MDc_6HAhsKpqrmoyhCqf13AYjpA@mail.gmail.com>
References: <1449582546-18667-1-git-send-email-a.hajda@samsung.com>
 <1449582546-18667-3-git-send-email-a.hajda@samsung.com>
 <20151209034747.GA19896@rob-hp-laptop>
 <5667FB4F.4000006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5667FB4F.4000006@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <treding@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBEZWMgOSwgMjAxNSBhdCAzOjU4IEFNLCBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPiB3cm90ZToKPiBIaSBSb2IsCj4KPiBUaGFua3MgZm9yIHJldmlldy4KPgo+Cj4g
T24gMTIvMDkvMjAxNSAwNDo0NyBBTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+IE9uIFR1ZSwgRGVj
IDA4LCAyMDE1IGF0IDAyOjQ5OjA1UE0gKzAxMDAsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4+PiBT
aUk4NjIwIHRyYW5zbWl0dGVyIGNvbnZlcnRzIGVUTURTL0hETUkgc2lnbmFsIHRvIE1ITCAzLjAu
IEl0IGlzIGNvbnRyb2xsZWQKPj4+IHZpYSBJMkMgYnVzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4+PiAtLS0KPj4+ICAuLi4vYmlu
ZGluZ3MvdmlkZW8vYnJpZGdlL3NpbC1zaWk4NjIwLnR4dCAgICAgICAgICB8IDM0ICsrKysrKysr
KysrKysrKysrKysrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+Pj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvdmlk
ZW8vYnJpZGdlL3NpbC1zaWk4NjIwLnR4dAo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmlkZW8vYnJpZGdlL3NpbC1zaWk4NjIwLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92aWRlby9icmlkZ2Uvc2lsLXNpaTg2MjAu
dHh0CgpbLi4uXQoKPj4+ICsgICAgICAgICAgICBwb3J0IHsKPj4+ICsgICAgICAgICAgICAgICAg
ICAgIG1obF90b19oZG1pOiBlbmRwb2ludCB7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmaGRtaV90b19taGw+Owo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgfTsKPj4+ICsgICAgICAgICAgICB9Owo+PiBJJ2QgbGlrZSB0byBzZWUgdGhpcyBoYXZl
IGEgcG9ydCB0byBhIGNvbm5lY3RvciBub2RlLCB0b28uIFBvc3NpYmx5Cj4+IHRoYXQgY2FuIGNv
bWUgbGF0ZXIuCj4KPiBNSEwgc3RhbmRhcmQgaXMgY29ubmVjdG9yIGFnbm9zdGljLCB1c3VhbGx5
IE1ITCB3aXJlcyBhcmUgcm91dGVkCj4gdmlhIG11bHRpLWZ1bmN0aW9uIG1pY3JvVVNCIGNvbm5l
Y3Rvciwgd2hpY2ggY2FuIHNlcnZlIGFsc28gZm9yCj4gVVNCL2NoYXJnaW5nL1VBUlQuLi4uCj4g
VGhlcmUgaXMgYWRkaXRpb25hbCBsb2dpYyB0byBkZXRlcm1pbmUgd2hpY2ggY2FibGUgaXMgY3Vy
cmVudGx5Cj4gY29ubmVjdGVkLCB1c3VhbGx5Cj4gaW1wbGVtZW50ZWQgYnkgZXh0Y29uIGRyaXZl
ci4KPiBJIGFtIG5vdCBzdXJlIGlmL2hvdyBpdCBzaG91bGQgYmUgcmVwcmVzZW50ZWQgaW4gRFQu
IFdoYXQgZG8geW91IHRoaW5rCj4gYWJvdXQgaXQ/CgpQcm9iYWJseSBhbGwgdGhlIG1vcmUgcmVh
c29uIHRvIGhhdmUgYSBjb25uZWN0b3IgZGVmaW5lZCwgYnV0IGZvcgptdXhlZCBjb25uZWN0b3Jz
IEknbSBub3Qgc3VyZSBob3cgd2Ugc2hvdWxkIGhhbmRsZSB0aGVtIGFuZCBoYXZpbmcKYm90aCBk
cm0gY29ubmVjdG9ycyBhbmQgZXh0Y29uIGNvbm5lY3RvcnMgaXMgYSBwcm9ibGVtLiBMaWtlIEkg
c2FpZCwKaXQgY2FuIGNvbWUgbGF0ZXIuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
