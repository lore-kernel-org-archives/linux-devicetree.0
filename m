From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCHv2 0/3] Intel FPGA VIP Frame Buffer II DRM Driver
Date: Thu, 4 May 2017 11:22:06 +0200
Message-ID: <CAKMK7uGdD0uh8vK7QCxGqQ9ZempsA+mHrwNW5FefRkOH2P2TEg@mail.gmail.com>
References: <1493086006-4392-1-git-send-email-hean.loong.ong@intel.com>
 <87shklznuo.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <87shklznuo.fsf@eliezer.anholt.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Eric Anholt <eric@anholt.net>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong,
 Hean Loong" <hean.loong.ong@intel.com>, tien.hock.loh@intel.com, dri-devel <dri-devel@lists.freedesktop.org>, dinguyen@kernel.org, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBNYXkgMywgMjAxNyBhdCAxMDoyOCBQTSwgRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0
Lm5ldD4gd3JvdGU6Cj4+IEZyb206IE9uZyBIZWFuIExvb25nIDxoZWFuLmxvb25nLm9uZ0BpbnRl
bC5jb20+Cj4+Cj4+IEhpLAo+Pgo+PiBUaGUgbmV3IEludGVsIEFycmlhMTAgU09DIEZQR0EgZGV2
a2l0IGhhcyBhIERpc3BsYXkgUG9ydCBJUCBjb21wb25lbnQKPj4gd2hpY2ggcmVxdWlyZXMgYSBu
ZXcgZHJpdmVyLiBUaGlzIGlzIGEgdmlydHVhbCBkcml2ZXIgaW4gd2hpY2ggdGhlCj4+IEZHUEEg
aGFyZHdhcmUgd291bGQgZW5hYmxlIHRoZSBEaXNwbGF5IFBvcnQgYmFzZWQgb24gdGhlIGluZm9y
bWF0aW9uCj4+IGFuZCBkYXRhIHByb3ZpZGVkIGZyb20gdGhlIERSTSBmcmFtZSBidWZmZXIgZnJv
bSB0aGUgT1MuIEJhc2ljYWxseSBhbGwKPj4gYWxsIGluZm9ybWF0aW9uIHdpdGggcmVhZ3JkcyB0
byByZXNvbHV0aW9uIGFuZCBiaXRzIHBlciBwaXhlbCBhcmUKPj4gcHJlLWNvbmZpZ3VyZWQgb24g
dGhlIEZQR0EgZGVzaWduIGFuZCB0aGVzZSBpbmZvcm1hdGlvbiBhcmUgZmVkIHRvCj4+IHRoZSBk
cml2ZXIgdmlhIHRoZSBkZXZpY2UgdHJlZSBpbmZvcm1hdGlvbiBhcyBwYXJ0IG9mIHRoZSBoYXJk
d2FyZQo+PiBpbmZvcm1hdGlvbi4KPgo+IEkgc3RhcnRlZCByZXZpZXdpbmcgdGhlIGNvZGUsIGJ1
dCBJIHdhbnQgdG8gbWFrZSBzdXJlIEkgdW5kZXJzdGFuZAo+IHdoYXQncyBnb2luZyBvbjoKPgo+
IFRoaXMgSVAgY29yZSBpc24ndCBkaXNwbGF5aW5nIGNvbnRlbnRzIGZyb20gc3lzdGVtIG1lbW9y
eSBvbiBzb21lIHNvcnQKPiBvZiBhY3R1YWwgcGh5c2ljYWwgZGlzcGxheSwgcmlnaHQ/ICBJdCdz
IGEgY29yZSB0aGF0IHRha2VzIHNvbWUgaW5wdXQKPiB2aWRlbyBzdHJlYW0gKG5vdCBkZXNjcmli
ZWQgaW4gdGhlIERUIG9yIGluIHRoaXMgZHJpdmVyKSBhbmQgc3RvcmVzIGl0Cj4gdG8gbWVtb3J5
PwoKSSBhc3N1bWVkIGl0J3MgdGhlIGlucHV0IElQIGNvcmUgaW4gdGhlIGxpbmtlZCBwZGYsIGku
ZS4gdGhlIENWSQooY2xvY2tlZCB2aWRlbyBpbnB1dCkuIFRoZXJlJ3MgYWxzbyBhIENWTyAoY2xv
Y2tlZCB2aWRlbyBvdXRwdXQpLCBhbmQKdGhhdCB3b3VsZCBpbmRlZWQgYmUgYSBtaXNmaXQgZm9y
IGRybS4gRGVmaW5pdGVseSBuZWVkIHRvIGNsYXJpZnkgdGhpcwooaW4gdGhlIERUIGRlc2NyaXB0
aW9uKS4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
