From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: Re: [PATCH v3 2/2] drm/panel: Add display timing for Okaya
 RS800480T-7X0GP
Date: Thu, 13 Aug 2015 14:41:56 +0200
Message-ID: <CAAMH-ysbNC4J5ApPO7auFYvnGeX3gfRf_DnV3NvzsD8YKNHy8g@mail.gmail.com>
References: <1432827466-8104-1-git-send-email-gary.bisson@boundarydevices.com>
 <1433954663-31444-1-git-send-email-gary.bisson@boundarydevices.com>
 <1433954663-31444-3-git-send-email-gary.bisson@boundarydevices.com>
 <20150813123238.GE11095@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150813123238.GE11095@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Eric Nelson <eric.nelson@boundarydevices.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

SGkgVGhpZXJyeSwKCk9uIFRodSwgQXVnIDEzLCAyMDE1IGF0IDI6MzIgUE0sIFRoaWVycnkgUmVk
aW5nCjx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+IHdyb3RlOgo+IE9uIFdlZCwgSnVuIDEwLCAy
MDE1IGF0IDA2OjQ0OjIzUE0gKzAyMDAsIEdhcnkgQmlzc29uIHdyb3RlOgo+PiBBZGQgc3VwcG9y
dCBmb3IgdGhlIE9rYXlhIFJTODAwNDgwVC03WDBHUCB0byB0aGUgRFJNIHNpbXBsZSBwYW5lbAo+
PiBkcml2ZXIuCj4+Cj4+IFRoZSBSUzgwMDQ4MFQtN1gwR1AgaXMgYSBXVkdBICg4MDB4NDgwKSBw
YW5lbCB3aXRoIGFuIDE4LWJpdCBwYXJhbGxlbAo+PiBMQ0QgaW50ZXJmYWNlLiBJdCBzdXBwb3J0
cyBwaXhlbCBjbG9ja3MgaW4gdGhlIHJhbmdlIG9mIDMwLTQwIE1Iei4KPj4KPj4gVGhpcyBwYW5l
bCBkZXRhaWxzIGNhbiBiZSBmb3VuZCBhdDoKPj4gaHR0cDovL2JvdW5kYXJ5ZGV2aWNlcy5jb20v
cHJvZHVjdC83LTgwMHg0ODAtZGlzcGxheS8KPj4KPj4gU2lnbmVkLW9mZi1ieTogR2FyeSBCaXNz
b24gPGdhcnkuYmlzc29uQGJvdW5kYXJ5ZGV2aWNlcy5jb20+Cj4+IC0tLQo+PiAgLi4uL2JpbmRp
bmdzL3BhbmVsL29rYXlhLHJzODAwNDgwdF83eDBncC50eHQgICAgICAgfCAgNyArKysrKwo+PiAg
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jICAgICAgICAgICAgICAgfCAzMyAr
KysrKysrKysrKysrKysrKysrKysrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMo
KykKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGFuZWwvb2theWEscnM4MDA0ODB0Xzd4MGdwLnR4dAo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BhbmVsL29rYXlhLHJzODAwNDgwdF83eDBn
cC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGFuZWwvb2theWEscnM4
MDA0ODB0Xzd4MGdwLnR4dAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAw
Li5mN2M3MjlkCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BhbmVsL29rYXlhLHJzODAwNDgwdF83eDBncC50eHQKPj4gQEAgLTAsMCAr
MSw3IEBACj4+ICtPS0FZQSBFbGVjdHJpYyBBbWVyaWNhLCBJbmMuIFJTODAwNDgwVC03WDBHUCA3
IiBXVkdBIExDRCBwYW5lbAo+PiArCj4+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+PiArLSBjb21w
YXRpYmxlOiBzaG91bGQgYmUgIm9rYXlhLHJzODAwNDgwdF83eDBncCIKPgo+IFVuZGVyc2NvcmVz
IGFyZSBub3QgdHlwaWNhbGx5IHVzZWQgaW4gY29tcGF0aWJsZSBzdHJpbmdzLCBzbyBJJ3ZlCj4g
Y2hhbmdlZCB0aGlzIHRvICJva2F5YSxyczgwMDQ4MHQtN3gwZ3AiLgoKVGhhbmtzISBJJ2xsIG1h
a2Ugc3VyZSBub3QgdG8gdXNlIHVuZGVyc2NvcmVzIGZvciBzdWNoIG5hbWVzIGluIHRoZSBmdXR1
cmUuCgpSZWdhcmRzLApHYXJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
