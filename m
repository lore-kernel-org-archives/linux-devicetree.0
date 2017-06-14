From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: drm/bridge: Document Cadence DSI
 bridge bindings
Date: Wed, 14 Jun 2017 09:14:46 +0530
Message-ID: <327ae11b-8b10-1b80-625a-3d207435b5c1@codeaurora.org>
References: <1496405096-18275-1-git-send-email-boris.brezillon@free-electrons.com>
 <1496405096-18275-2-git-send-email-boris.brezillon@free-electrons.com>
 <60f8b8ec-c83b-0609-c5e5-44b3f9302808@codeaurora.org>
 <20170606113545.3a9ab2d0@bbrezillon>
 <902ba6cf-4125-fac6-62dd-6b6198f541f3@ti.com>
 <20170606144810.1efa0c79@bbrezillon>
 <9ca829e6-4696-7c3a-aed3-6a2af3161557@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <9ca829e6-4696-7c3a-aed3-6a2af3161557@ti.com>
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
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Cyprian Wronka <cwronka@cadence.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Simon Hatliff <hatliff@cadence.com>, dri-devel@lists.freedesktop.org, Richard Sproul <sproul@cadence.com>, Rob Herring <robh+dt@kernel.org>, Alan Douglas <adouglas@cadence.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Neil Webb <neilw@cadence.com>
List-Id: devicetree@vger.kernel.org

CgpPbiAwNi8wNi8yMDE3IDA2OjI4IFBNLCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPiBPbiAwNi8w
Ni8xNyAxNTo0OCwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IAo+PiBPa2F5LiBUaGFua3MgZm9y
IHRoZSBjbGFyaWZpY2F0aW9uLiBDYW4geW91IGNvbmZpcm0gdGhhdCB0aGlzIHZlcnNpb24KPj4g
aXMgY29ycmVjdD8KPj4KPj4gICAJZHNpQHh4eCB7Cj4+ICAgCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKPj4gICAJCSNzaXplLWNlbGxzID0gPDA+Owo+PiAgIAo+PiAgIAkJcG9ydHMgewo+PiAgIAkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiAgIAkJCSNzaXplLWNlbGxzID0gPDA+Owo+PiAJCQlk
cGlfaW46IHBvcnRAMCB7Cj4+ICAgCQkJCXJlZyA9IDwwPjsKPj4gICAJCQkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47Cj4+ICAgCQkJCSNzaXplLWNlbGxzID0gPDA+Owo+PiAgIAo+PiAgIAkJCQllbmRw
b2ludEAwIHsKPj4gICAJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHBpX291dD47Cj4+ICAgCQkJ
CX07Cj4+ICAgCQkJfTsKPj4gICAKPj4gICAJCQlkc2lfb3V0OiBwb3J0QDEgewo+PiAgIAkJCQly
ZWcgPSA8MT47Cj4+IAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPj4gICAJCQkJI3NpemUtY2Vs
bHMgPSA8MD47Cj4+ICAgCj4+ICAgCQkJCWRzaV9vdXRfdmMwOiBlbmRwb2ludEAwIHsKPj4gCQkJ
CQlyZWcgPSA8MD47Cj4+ICAgCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRzaV9wYW5lbDBfaW4+
Owo+PiAJCQkJfTsKPj4KPj4gICAJCQkJZHNpX291dF92YzE6IGVuZHBvaW50QDEgewo+PiAJCQkJ
CXJlZyA9IDwxPjsKPj4gICAJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpX3BhbmVsMV9pbj47
Cj4+ICAgCQkJCX07Cj4+ICAgCQkJfTsKPj4gICAJCX07Cj4+ICAgCj4+ICAgCQlwYW5lbEAwIHsK
Pj4gICAJCQljb21wYXRpYmxlID0gIi4uLiI7Cj4+ICAgCQkJcmVnID0gPDA+Owo+PiAgIAkJCSNh
ZGRyZXNzLWNlbGxzID0gPDE+Owo+PiAgIAkJCSNzaXplLWNlbGxzID0gPDA+Owo+PiAgIAo+PiAg
IAkJCXBvcnRAMCB7Cj4+ICAgCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiAgIAkJICAgICAg
ICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+PiAgIAkJCQlyZWcgPSA8MD47Cj4+ICAgCj4+
ICAgCQkJCWRzaV9wYW5lbDBfaW46IGVuZHBvaW50QDAgewo+PiAJCQkJCXJlZyA9IDwwPjsKPj4g
ICAJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpX291dF92YzA+Owo+PiAgIAkJCQl9Owo+PiAg
IAkJCX07Cj4+ICAgCQl9Owo+PiAgIAo+PiAgIAkJcGFuZWxAMSB7Cj4+ICAgCQkJY29tcGF0aWJs
ZSA9ICIuLi4iOwo+PiAgIAkJCXJlZyA9IDwxPjsKPj4gICAJCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKPj4gICAJCQkjc2l6ZS1jZWxscyA9IDwwPjsKPj4gICAKPj4gICAJCQlwb3J0QDAgewo+PiAg
IAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPj4gICAJCSAgICAgICAgICAgICAgICAjc2l6ZS1j
ZWxscyA9IDwwPjsKPj4gICAJCQkJcmVnID0gPDA+Owo+PiAgIAo+PiAgIAkJCQlkc2lfcGFuZWwx
X2luOiBlbmRwb2ludEAwIHsKPj4gCQkJCQlyZWcgPSA8MD47Cj4+ICAgCQkJCQlyZW1vdGUtZW5k
cG9pbnQgPSA8JmRzaV9vdXRfdmMxPjsKPj4gICAJCQkJfTsKPj4gICAJCQl9Owo+PiAgIAkJfTsK
Pj4gICAJfTsKPj4KPiAKPiBMb29rcyBjb3JyZWN0IHRvIG1lLiBJIHRoaW5rIGl0IGNhbiBiZSBh
IGJpdCBzaG9ydGVyIHRob3VnaDoKPiAKPiAtIFlvdSBkb24ndCBuZWVkICNhZGRyZXNzLWNlbGxz
IGFuZCAjc2l6ZS1jZWxscyBmb3IgYWxsLiBJIHRoaW5rIHRob3NlCj4gYXJlIGluaGVyaXRlZCBm
cm9tIHRoZSBwYXJlbnQuCj4gLSBJZiB0aGVyZSdzIGp1c3Qgb25lIHBvcnQgYW5kIG9uZSBlbmRw
b2ludCwgeW91IGNhbiBsZWF2ZSB0aGUgJ3JlZycKPiBvdXQsIGFzIGl0J3MgY29uc2lkZXJlZCB0
byBiZSAwIGJ5IGRlZmF1bHQuCj4gCj4gU28gZm9yIHRoZSBwYW5lbCwgeW91IGNhbiBoYXZlIGp1
c3Q6Cj4gCj4gcG9ydCB7Cj4gCWRzaV9wYW5lbDFfaW46IGVuZHBvaW50IHsKPiAJCXJlbW90ZS1l
bmRwb2ludCA9IDwmZHNpX291dF92YzE+Owo+IAl9Owo+IH07CgpMb29rcyBnb29kIHRvIG1lIHRv
by4KClRoYW5rcywKQXJjaGl0CgoKLS0gClF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMu
IGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24gQ29s
bGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
