From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: Add Cadence DSI driver
Date: Tue, 19 Sep 2017 15:25:33 +0200
Message-ID: <20170919152533.78fb2b3e@bbrezillon>
References: <20170831155519.3704-1-boris.brezillon@free-electrons.com>
 <70f446c1-64d8-928c-4ea7-aa16dda12253@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <70f446c1-64d8-928c-4ea7-aa16dda12253@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Cyprian Wronka <cwronka@cadence.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Simon Hatliff <hatliff@cadence.com>, dri-devel@lists.freedesktop.org, Richard Sproul <sproul@cadence.com>, Alan Douglas <adouglas@cadence.com>, Rob Herring <robh+dt@kernel.org>, Jyri Sarha <jsarha@ti.com>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Neil Webb <neilw@cadence.com>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAxOSBTZXAgMjAxNyAxNTo1OToyMCArMDMwMApUb21pIFZhbGtlaW5lbiA8dG9taS52
YWxrZWluZW5AdGkuY29tPiB3cm90ZToKCj4g77u/SGkgQm9yaXMsCj4gCj4gCj4gVGV4YXMgSW5z
dHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuIFkt
dHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNp
bmtpCj4gCj4gT24gMzEvMDgvMTcgMTg6NTUsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+IEFk
ZCBhIGRyaXZlciBmb3IgQ2FkZW5jZSBEUEkgLT4gRFNJIGJyaWRnZS4KPiA+IAo+ID4gVGhpcyBk
cml2ZXIgb25seSBzdXBwb3J0IGEgc3Vic2V0IG9mIENhZGVuY2UgRFNJIGJyaWRnZSBjYXBhYmls
aXRpZXMuCj4gPiAKPiA+IEhlcmUgaXMgYSBub24tZXhoYXVzdGl2ZSBsaXN0IG9mIG1pc3Npbmcg
ZmVhdHVyZXM6Cj4gPiAgKiBidXJzdCBtb2RlCj4gPiAgKiBkeW5hbWljIGNvbmZpZ3VyYXRpb24g
b2YgdGhlIERQSFkgYmFzZWQgb24gdGhlCj4gPiAgKiBzdXBwb3J0IGZvciBhZGRpdGlvbmFsIGlu
cHV0IGludGVyZmFjZXMgKFNESSBpbnB1dCkKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQm9yaXMg
QnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AZnJlZS1lbGVjdHJvbnMuY29tPiAgCj4gCj4gPHNu
aXA+Cj4gCj4gPiArCWRzaS0+cGNsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCAicGNsayIp
Owo+ID4gKwlpZiAoSVNfRVJSKGRzaS0+cGNsaykpCj4gPiArCQlyZXR1cm4gUFRSX0VSUihkc2kt
PnBjbGspOyAgCj4gCj4gV2hhdCdzIHRoZSBwdXJwb3NlIG9mIHBjbGs/IElzbid0IHRoYXQgbm9y
bWFsbHkgZGVhbHQgd2l0aCB0aGUgbm9ybWFsCj4gbW9kZXNldHRpbmcsIGVuYWJsZWQgd2l0aCB0
aGUgdmlkZW8gc3RyZWFtPyBIb3cgY291bGQgaXQgZXZlbiBiZSBlbmFibGVkCj4gaGVyZSwgd2l0
aG91dCBhbnlvbmUgc2V0dGluZyB0aGUgcmF0ZT8KCkl0J3MgdGhlIHBlcmlwaGVyYWwgY2xvY2ss
IG5vdCB0aGUgcGl4ZWwgY2xvY2ssIGFuZCBBRkFJVSBpdCBoYXMgdG8gYmUKZW5hYmxlZCBiZWZv
cmUgYWNjZXNzaW5nIERTSSByZWdpc3RlcnMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
