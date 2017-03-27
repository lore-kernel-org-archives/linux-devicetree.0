From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH 1/2] drm/bridge: ti-tfp410: support hpd via gpio
Date: Mon, 27 Mar 2017 11:28:42 +0530
Message-ID: <d6b2391f-3e4a-2761-b6a0-8997d2c78600@codeaurora.org>
References: <2e47786ab3d04078ae70d0c4064f7c4d@rwthex-s1-b.rwth-ad.de>
 <093b4e9c0ae6413499e5bf8ec309fa41@rwthex-s1-b.rwth-ad.de>
 <6dfb2b66ec2a408dabe80d703f411ce0@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <6dfb2b66ec2a408dabe80d703f411ce0@rwthex-s1-b.rwth-ad.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Christopher Spinrath <christopher.spinrath@rwth-aachen.de>, Jyri Sarha <jsarha@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, DRI mailing list <dri-devel@lists.freedesktop.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Igor Grinberg <grinberg@compulab.co.il>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiAwMy8wNy8yMDE3IDAzOjIxIEFNLCBDaHJpc3RvcGhlciBTcGlucmF0aCB3cm90ZToK
PiBIaSBGYWJpbywKPgo+IE9uIDAzLzA2LzIwMTcgMTA6NDYgUE0sIEZhYmlvIEVzdGV2YW0gd3Jv
dGU6Cj4+IEhpIENocmlzdG9waGVyLAo+Pgo+PiBPbiBNb24sIE1hciA2LCAyMDE3IGF0IDY6NDAg
UE0sICA8Y2hyaXN0b3BoZXIuc3BpbnJhdGhAcnd0aC1hYWNoZW4uZGU+IHdyb3RlOgo+Pj4gRnJv
bTogQ2hyaXN0b3BoZXIgU3BpbnJhdGggPGNocmlzdG9waGVyLnNwaW5yYXRoQHJ3dGgtYWFjaGVu
LmRlPgo+Pj4KPj4+IE9uIHNvbWUgYm9hcmRzIHRoZSBocGQgcGluIG9mIGEgaGRtaSBjb25uZWN0
b3IgaXMgd2lyZWQgdXAgdG8gYSBncGlvCj4+PiBwaW4uIFNpbmNlIGluIHRoZSBEUk0gd29ybGQg
dGhlIHRmcDQxMCBkcml2ZXIgaXMgcmVzcG9uc2libGUgZm9yCj4+PiBoYW5kbGluZyB0aGUgY29u
bmVjdG9yLCBhZGQgc3VwcG9ydCBmb3IgaHBkIGdwaW9zIGluIHRoaXMgdmVyeSBkcml2ZXIuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgU3BpbnJhdGggPGNocmlzdG9waGVyLnNw
aW5yYXRoQHJ3dGgtYWFjaGVuLmRlPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS90aS10ZnA0MTAuYyB8IDcyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
Cj4+Cj4+IEl0IHdvdWxkIGJlIG5pY2UgdG8gYWRkICdocGQtZ3Bpb3MnIHByb3BlcnR5IGluIHRo
ZSBiaW5kaW5nIGRvYyBhcyB3ZWxsOgo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvdGksdGZwNDEwLnR4dAo+Cj4gVGhlIGhwZC1ncGlvcyBwcm9wZXJ0
eSBkb2VzICpub3QqIGJlbG9uZyB0byB0aGUgdGksdGZwNDEwIGJpbmRpbmcgYnV0IHRvIHRoZSBo
ZG1pLWNvbm5lY3RvciBvbmUKPiB3aGVyZSBpdCBpcyBhbHJlYWR5IGRvY3VtZW50ZWQ6Cj4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvY29ubmVjdG9yL2hkbWktY29u
bmVjdG9yLnR4dAo+Cj4gVW5mb3J0dW5hdGx5LCB0aGVyZSBpcyBubyBkZWRpY2F0ZWQgZHJpdmVy
IGZvciB0aGUgY29ubmVjdG9yIGluIExpbnV4OyB0aGUgY29ubmVjdG9yIHByb3BlcnRpZXMgaGF2
ZQo+IHRvIGJlIGhhbmRsZWQgYnkgdGhlIGVuY29kZXIgKGhlcmUgIHRoZSB0ZnA0MTApIGRyaXZl
ci4gTm90ZSB0aGF0IHRoaXMgYWxyZWFkeSBoYXBwZW5zIGZvciB0aGUKPiBkZGMtaTJjLWJ1cyBw
cm9wZXJ0eS4KPgoKVGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuCgpKeXJpLAoKSXMgaXQgcG9z
c2libGUgZm9yIHlvdSB0byB2ZXJpZnkgdGhpcyBvbiBCZWFnbGVib25lIHBsYXRmb3JtPwoKVGhh
bmtzLApBcmNoaXQKCi0tIApRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1l
bWJlciBvZiBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRp
dmUgUHJvamVjdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
