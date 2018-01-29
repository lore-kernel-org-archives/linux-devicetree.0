From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v5 1/2] drm/bridge: Add Cadence DSI driver
Date: Mon, 29 Jan 2018 14:46:23 +0100
Message-ID: <20180129144623.495f66bf@bbrezillon>
References: <20180118134309.13123-1-boris.brezillon@free-electrons.com>
 <9b45c6a3-f26b-59f5-d313-88290a2c5b42@ti.com>
 <20180129141409.0ec356d1@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180129141409.0ec356d1@bbrezillon>
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "Menon,
 Nishanth" <nm@ti.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, Simon Hatliff <hatliff@cadence.com>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, Alan Douglas <adouglas@cadence.com>, Rob Herring <robh+dt@kernel.org>, Jyri Sarha <jsarha@ti.com>, Suresh Punnoose <sureshp@cadence.com>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Richard Sproul <sproul@cadence.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gTW9uLCAyOSBKYW4gMjAxOCAxNDoxNDowOSArMDEwMApCb3JpcyBCcmV6aWxsb24gPGJvcmlz
LmJyZXppbGxvbkBmcmVlLWVsZWN0cm9ucy5jb20+IHdyb3RlOgoKPiBPbiBNb24sIDI5IEphbiAy
MDE4IDEzOjU2OjIxICswMjAwCj4gVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNv
bT4gd3JvdGU6Cj4gCj4gPiA+ICsKPiA+ID4gK3N0YXRpYyB2b2lkIGNkbnNfZHNpX2luaXRfbGlu
ayhzdHJ1Y3QgY2Ruc19kc2kgKmRzaSkKPiA+ID4gK3sKPiA+ID4gKwlzdHJ1Y3QgY2Ruc19kc2lf
b3V0cHV0ICpvdXRwdXQgPSAmZHNpLT5vdXRwdXQ7Cj4gPiA+ICsJdW5zaWduZWQgbG9uZyBzeXNj
bGtfcGVyaW9kLCB1bHBvdXQ7Cj4gPiA+ICsJdTMyIHZhbDsKPiA+ID4gKwlpbnQgaTsKPiA+ID4g
Kwo+ID4gPiArCWlmIChkc2ktPmxpbmtfaW5pdGlhbGl6ZWQpCj4gPiA+ICsJCXJldHVybjsKPiA+
ID4gKwo+ID4gPiArCXZhbCA9IDA7Cj4gPiA+ICsJZm9yIChpID0gMTsgaSA8IG91dHB1dC0+ZGV2
LT5sYW5lczsgaSsrKQo+ID4gPiArCQl2YWwgfD0gREFUQV9MQU5FX0VOKGkpOwo+ID4gPiArCj4g
PiA+ICsJaWYgKCEob3V0cHV0LT5kZXYtPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9DTE9DS19OT05f
Q09OVElOVU9VUykpCj4gPiA+ICsJCXZhbCB8PSBDTEtfQ09OVElOVU9VUzsKPiA+ID4gKwo+ID4g
PiArCXdyaXRlbCh2YWwsIGRzaS0+cmVncyArIE1DVExfTUFJTl9QSFlfQ1RMKTsKPiA+ID4gKwo+
ID4gPiArCS8qIFVMUE9VVCBzaG91bGQgYmUgc2V0IHRvIDFtcyBhbmQgaXMgZXhwcmVzc2VkIGlu
IHN5c2NsayBjeWNsZXMuICovCj4gPiA+ICsJc3lzY2xrX3BlcmlvZCA9IE5TRUNfUEVSX1NFQyAv
IGNsa19nZXRfcmF0ZShkc2ktPmRzaV9zeXNfY2xrKTsKPiA+ID4gKwl1bHBvdXQgPSBESVZfUk9V
TkRfVVAoTlNFQ19QRVJfTVNFQywgc3lzY2xrX3BlcmlvZCk7Cj4gPiA+ICsJd3JpdGVsKENMS19M
QU5FX1VMUE9VVF9USU1FKHVscG91dCkgfCBEQVRBX0xBTkVfVUxQT1VUX1RJTUUodWxwb3V0KSwK
PiA+ID4gKwkgICAgICAgZHNpLT5yZWdzICsgTUNUTF9VTFBPVVRfVElNRSk7Cj4gPiA+ICsKPiA+
ID4gKwl3cml0ZWwoTElOS19FTiwgZHNpLT5yZWdzICsgTUNUTF9NQUlOX0RBVEFfQ1RMKTsKPiA+
ID4gKwo+ID4gPiArCXZhbCA9IENMS19MQU5FX0VOIHwgUExMX1NUQVJUOwo+ID4gPiArCWZvciAo
aSA9IDA7IGkgPCBvdXRwdXQtPmRldi0+bGFuZXM7IGkrKykKPiA+ID4gKwkJdmFsIHw9IERBVEFf
TEFORV9TVEFSVChpKTsKPiA+ID4gKwo+ID4gPiArCXdyaXRlbCh2YWwsIGRzaS0+cmVncyArIE1D
VExfTUFJTl9FTik7Cj4gPiA+ICsKPiA+ID4gKwluZGVsYXkoMTAwKTsgICAgCj4gPiAKPiA+IEl0
J3MgZ29vZCB0byBoYXZlIGEgY29tbWVudCBhYm91dCBlYWNoIHNsZWVwL2RlbGF5IG9uIHdoYXQg
aXMgZm9yIGFuZAo+ID4gd2hlcmUgZG9lcyB0aGUgdmFsdWUgY29tZSBmcm9tLiAgCj4gCj4gWWVw
LCBJJ2xsIGZpZ3VyZSB0aGlzIG91dC4KCkxvb2tzIGxpa2UgdGhpcyBkZWxheSBpcyBub3QgbmVl
ZGVkIGluIHRoZSBlbmQuIEknbGwgcmVtb3ZlIGl0LgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
