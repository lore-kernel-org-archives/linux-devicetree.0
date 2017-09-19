From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: Add Cadence DSI driver
Date: Tue, 19 Sep 2017 15:48:14 +0200
Message-ID: <20170919154814.02485818@bbrezillon>
References: <20170831155519.3704-1-boris.brezillon@free-electrons.com>
 <70f446c1-64d8-928c-4ea7-aa16dda12253@ti.com>
 <20170919152533.78fb2b3e@bbrezillon>
 <2ccf3816-8a98-5626-7e4e-1dd13f167811@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2ccf3816-8a98-5626-7e4e-1dd13f167811@ti.com>
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

T24gVHVlLCAxOSBTZXAgMjAxNyAxNjozODozMSArMDMwMApUb21pIFZhbGtlaW5lbiA8dG9taS52
YWxrZWluZW5AdGkuY29tPiB3cm90ZToKCj4g77u/Cj4gVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFu
ZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuIFktdHVubnVzL0J1c2luZXNz
IElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCj4gCj4gT24gMTkv
MDkvMTcgMTY6MjUsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+IE9uIFR1ZSwgMTkgU2VwIDIw
MTcgMTU6NTk6MjAgKzAzMDAKPiA+IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5j
b20+IHdyb3RlOgo+ID4gICAKPiA+PiDvu79IaSBCb3JpcywKPiA+Pgo+ID4+Cj4gPj4gVGV4YXMg
SW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2ku
IFktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhl
bHNpbmtpCj4gPj4KPiA+PiBPbiAzMS8wOC8xNyAxODo1NSwgQm9yaXMgQnJlemlsbG9uIHdyb3Rl
OiAgCj4gPj4+IEFkZCBhIGRyaXZlciBmb3IgQ2FkZW5jZSBEUEkgLT4gRFNJIGJyaWRnZS4KPiA+
Pj4KPiA+Pj4gVGhpcyBkcml2ZXIgb25seSBzdXBwb3J0IGEgc3Vic2V0IG9mIENhZGVuY2UgRFNJ
IGJyaWRnZSBjYXBhYmlsaXRpZXMuCj4gPj4+Cj4gPj4+IEhlcmUgaXMgYSBub24tZXhoYXVzdGl2
ZSBsaXN0IG9mIG1pc3NpbmcgZmVhdHVyZXM6Cj4gPj4+ICAqIGJ1cnN0IG1vZGUKPiA+Pj4gICog
ZHluYW1pYyBjb25maWd1cmF0aW9uIG9mIHRoZSBEUEhZIGJhc2VkIG9uIHRoZQo+ID4+PiAgKiBz
dXBwb3J0IGZvciBhZGRpdGlvbmFsIGlucHV0IGludGVyZmFjZXMgKFNESSBpbnB1dCkKPiA+Pj4K
PiA+Pj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AZnJl
ZS1lbGVjdHJvbnMuY29tPiAgICAKPiA+Pgo+ID4+IDxzbmlwPgo+ID4+ICAKPiA+Pj4gKwlkc2kt
PnBjbGsgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwgInBjbGsiKTsKPiA+Pj4gKwlpZiAoSVNf
RVJSKGRzaS0+cGNsaykpCj4gPj4+ICsJCXJldHVybiBQVFJfRVJSKGRzaS0+cGNsayk7ICAgIAo+
ID4+Cj4gPj4gV2hhdCdzIHRoZSBwdXJwb3NlIG9mIHBjbGs/IElzbid0IHRoYXQgbm9ybWFsbHkg
ZGVhbHQgd2l0aCB0aGUgbm9ybWFsCj4gPj4gbW9kZXNldHRpbmcsIGVuYWJsZWQgd2l0aCB0aGUg
dmlkZW8gc3RyZWFtPyBIb3cgY291bGQgaXQgZXZlbiBiZSBlbmFibGVkCj4gPj4gaGVyZSwgd2l0
aG91dCBhbnlvbmUgc2V0dGluZyB0aGUgcmF0ZT8gIAo+ID4gCj4gPiBJdCdzIHRoZSBwZXJpcGhl
cmFsIGNsb2NrLCBub3QgdGhlIHBpeGVsIGNsb2NrLCBhbmQgQUZBSVUgaXQgaGFzIHRvIGJlCj4g
PiBlbmFibGVkIGJlZm9yZSBhY2Nlc3NpbmcgRFNJIHJlZ2lzdGVycy4gIAo+IAo+IElzIHRoYXQg
dGhlIGRzaV9wX2Nsaz8gSSBjYW4ndCBmaW5kICJwZXJpcGhlcmFsIGNsb2NrIiBpbiB0aGUgc3Bl
Y3MuCgpZZXAsIGl0IGlzIGRzaV9wX2NsayAodGhlIEFQQiBjbG9jaykuCgo+IAo+IEkgdGhpbmsg
Y2FsbGluZyBpdCAicGNsayIgaW4gYSBkaXNwbGF5IGRyaXZlciBpcyB2ZXJ5IGNvbmZ1c2luZywg
YXMKPiBwY2xrLCBhdCBsZWFzdCBmb3IgbWUsIGFsd2F5cyBtZWFucyBwaXhlbCBjbG9jayA9KS4K
CkkgY2FuIHJlbmFtZSBpdCBpZiB5b3UgcHJlZmVyLiBXaGF0IG5hbWUgd291bGQgeW91IGxpa2Ug
dG8gc2VlPwphYnBfY2xrPyBwZXJpcGhfY2xrPyBTb21ldGhpbmcgZWxzZT8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
