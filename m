From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 1/2] drm/bridge: Add Cadence DSI driver
Date: Wed, 11 Oct 2017 15:43:15 +0530
Message-ID: <b7c0b92e-83e6-0005-2d55-02615292e9ee@codeaurora.org>
References: <20170831155519.3704-1-boris.brezillon@free-electrons.com>
 <c17e158a-3e37-8ae6-e31c-7ed89429166a@codeaurora.org>
 <20171011112602.15a7817d@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20171011112602.15a7817d@bbrezillon>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Cyprian Wronka <cwronka@cadence.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Simon Hatliff <hatliff@cadence.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org, Alan Douglas <adouglas@cadence.com>, Rob Herring <robh+dt@kernel.org>, Jyri Sarha <jsarha@ti.com>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Richard Sproul <sproul@cadence.com>, Neil Webb <neilw@cadence.com>
List-Id: devicetree@vger.kernel.org

CgpPbiAxMC8xMS8yMDE3IDAyOjU2IFBNLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gSGkgQXJj
aGl0LAo+IAo+IE9uIFRodSwgNyBTZXAgMjAxNyAxNTowNjoxMyArMDUzMAo+IEFyY2hpdCBUYW5l
amEgPGFyY2hpdHRAY29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+IAo+Pgo+Pj4gKwo+Pj4gK3N0YXRp
YyB2b2lkIGNkbnNfZHNpX2JyaWRnZV9kaXNhYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2Up
Cj4+PiArewo+Pj4gKwlzdHJ1Y3QgY2Ruc19kc2lfaW5wdXQgKmlucHV0ID0gYnJpZGdlX3RvX2Nk
bnNfZHNpX2lucHV0KGJyaWRnZSk7Cj4+PiArCXN0cnVjdCBjZG5zX2RzaSAqZHNpID0gaW5wdXRf
dG9fZHNpKGlucHV0KTsKPj4+ICsJdTMyIHZhbDsKPj4+ICsKPj4+ICsJdmFsID0gcmVhZGwoZHNp
LT5yZWdzICsgTUNUTF9NQUlOX0RBVEFfQ1RMKTsKPj4+ICsJdmFsICY9IH4oSUZfVklEX1NFTEVD
VF9NQVNLIHwgSUZfVklEX01PREUgfCBWSURfRU4gfCBIT1NUX0VPVF9HRU4gfAo+Pj4gKwkJIERJ
U1BfRU9UX0dFTik7Cj4+Cj4+IEkgc2VlIHNvbWUgdHJ1bmNhdGlvbiByZWxhdGVkIHNwYXJzZSB3
YXJuaW5ncyBoZXJlIGFuZCBhIGNvdXBsZSBvZiBvdGhlciBwbGFjZXMKPj4gd2hlbiBidWlsZGlu
ZyBhZ2FpbnN0IGFybTMyLiBUaG9zZSB3b3VsZCBiZSBuaWNlIHRvIGZpeC4KPiAKPiBJIGhhZCBh
IGxvb2sgYW5kIGl0IHNlZW1zIHRvIGhhcHBlbiBldmVyeXRpbWUgSSB1c2UgR0VOTUFTSygpICh0
aGUKPiB0cnVuY2F0aW9uIGlzIGhhcm1sZXNzLCBidXQgc3BhcnNlIGNvbXBsYWlucykuCj4gSWYg
eW91IGRvbid0IG1pbmQsIEknZCBwcmVmZXIgdG8ga2VlcCBHRU5NQVNLKCkgcmF0aGVyIHRoYW4g
bWFudWFsbHkKPiBkZWZpbmluZyBtYXNrcywgYnV0IG1heWJlIHlvdSBoYXZlIGFuIGlkZWEgaG93
IHRvIGZpeCB0aGVzZSB3YXJuaW5ncwo+IHdpdGhvdXQgZ2V0dGluZyByaWQgb2YgR0VOTUFTSygp
LgoKSSBkb24ndCBrbm93IGVpdGhlci4gTGV0J3MgbGl2ZSB3aXRoIHRoZSB3YXJuaW5ncyBmb3Ig
bm93LgoKVGhhbmtzLApBcmNoaXQKCj4gCj4+Cj4+PiArCXdyaXRlbCh2YWwsIGRzaS0+cmVncyAr
IE1DVExfTUFJTl9EQVRBX0NUTCk7Cj4+PiArCj4+PiArCXZhbCA9IHJlYWRsKGRzaS0+cmVncyAr
IE1DVExfTUFJTl9FTikgJiB+SUZfRU4oaW5wdXQtPmlkKTsKPj4+ICsJd3JpdGVsKHZhbCwgZHNp
LT5yZWdzICsgTUNUTF9NQUlOX0VOKTsKPj4+ICt9Cj4gCgotLSAKUXVhbGNvbW0gSW5ub3ZhdGlv
biBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXgg
Rm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
