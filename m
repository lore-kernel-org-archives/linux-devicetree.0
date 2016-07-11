From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH 2/2] drm/bridge: tc358767: Add DPI to eDP bridge driver
Date: Mon, 11 Jul 2016 14:16:44 +0530
Message-ID: <57835CF4.2080601@codeaurora.org>
References: <1467384610-29908-1-git-send-email-p.zabel@pengutronix.de>
 <1467384610-29908-3-git-send-email-p.zabel@pengutronix.de>
 <577B39D9.705@codeaurora.org> <1467705603.2978.22.camel@pengutronix.de>
 <57835993.4020709@codeaurora.org> <1468226655.3048.2.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1468226655.3048.2.camel@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrey Gusakov <andrey.gusakov@cogentembedded.com>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Chris Healy <Chris.Healy@zii.aero>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

CgpPbiAwNy8xMS8yMDE2IDAyOjE0IFBNLCBQaGlsaXBwIFphYmVsIHdyb3RlOgo+IEFtIE1vbnRh
ZywgZGVuIDExLjA3LjIwMTYsIDE0OjAyICswNTMwIHNjaHJpZWIgQXJjaGl0IFRhbmVqYToKPiBb
Li4uXQo+Pj4+PiArCS8qIFBYTCBQTEwgc2V0dXAgKi8KPj4+Pj4gKwlpZiAodGMtPnRlc3RfcGF0
dGVybikgewo+Pj4+Cj4+Pj4gSSBjb3VsZG4ndCBmaW5kIG91dCB3aG8gaXMgc2V0dGluZyB0Yy0+
dGVzdF9wYXR0ZXJuLiBJcyBpdCBhbHdheXMKPj4+PiAwPwo+Pj4KPj4+IEhtLCB5b3UgYXJlIHJp
Z2h0LiBJIHdvbmRlciB3aGF0IGEgZ29vZCBtZWNoYW5pc20gd291bGQgYmUgdG8gZW5hYmxlIGEK
Pj4+IHRlc3QgcGF0dGVybiBmb3IgYSBicmlkZ2UgZHJpdmVyLiBNb2R1bGUgcGFyYW1ldGVycz8g
V2UgZG9uJ3QgaGF2ZQo+Pj4gYW55aHRpbmcgbGlrZSBWNEwyX0NJRF9URVNUX1BBVFRFUk4gaW4g
ZHJtLiBJIGNvdWxkIGFsc28gZHJvcCB0ZXN0Cj4+PiBwYXR0ZXJuIHN1cHBvcnQgZnJvbSB0aGUg
aW5pdGlhbCBwYXRjaCBhbmQgc3VibWl0IGl0IHNlcGFyYXRlbHkuCj4+Cj4+IE1vZHVsZSBwYXJh
bWV0ZXIgc291bmRzIGxpa2UgYSBnb29kIG9wdGlvbi4KPgo+IE9rLgo+Cj4+IEFsdGhvdWdoLCBp
dCBzZWVtcyBsaWtlIHRoZSBwbGwgaXMgZW5hYmxlZCBvbmx5IHdoZW4gdGVzdF9wYXR0ZXJuIGlz
Cj4+IHNldC4gSG93IGRvZXMgdGhlIGJyaWRnZSB3b3JrIGlmIHRoZSBwbGwgaXNuJ3QgZW5hYmxl
ZD8KPgo+IFRoZSBQWEwgUExMIGlzIG9ubHkgbmVjZXNzYXJ5IHJlZ2VuZXJhdGUgdGhlIHBpeGVs
IGNsb2NrIGZyb20gdGhlIERTSSBIUwo+IGNsb2NrLCBvciB0byBjcmVhdGUgdGhlIHRlc3QgcGF0
dGVybi4gSW4gRFBJIG1vZGUgdGhlIHBpeGVsIGNsb2NrIGZyb20KPiB0aGUgcGFyYWxsZWwgaW50
ZXJmYWNlIGlzIHVzZWQgZGlyZWN0bHkuCgpPa2F5LiBUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0
aW9uLgoKQXJjaGl0Cgo+Cj4gcmVnYXJkcwo+IFBoaWxpcHAKPgoKLS0gClF1YWxjb21tIElubm92
YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVtLAphIExp
bnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
