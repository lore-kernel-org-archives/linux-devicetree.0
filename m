From: =?UTF-8?B?TXlsw6huZQ==?= Josserand <mylene.josserand@bootlin.com>
Subject: Re: [PATCH v4 02/10] ARM: sun9i: smp: Rename clusters's power-off
 register
Date: Sun, 25 Feb 2018 16:20:19 +0100
Message-ID: <20180225162019.3b2ae153@dell-desktop.home>
References: <20180223133742.26044-1-mylene.josserand@bootlin.com>
 <20180223133742.26044-3-mylene.josserand@bootlin.com>
 <20180223145650.dzhdhh2cprqioq5m@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180223145650.dzhdhh2cprqioq5m@flea.lan>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, quentin.schulz@bootlin.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, clabbe.montjoie@gmail.com, thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksCgpPbiBGcmksIDIzIEZlYiAyMDE4IDE1OjU2OjUwICswMTAwCk1heGltZSBSaXBhcmQgPG1h
eGltZS5yaXBhcmRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBPbiBGcmksIEZlYiAyMywgMjAxOCBh
dCAwMjozNzozNFBNICswMTAwLCBNeWzDqG5lIEpvc3NlcmFuZCB3cm90ZToKPiA+IFRvIHByZXBh
cmUgdGhlIHN1cHBvcnQgZm9yIHN1bjhpLWE4M3QsIHJlbmFtZSB0aGUgdmFyaWFibGUgbmFtZQo+
ID4gdGhhdCBoYW5kbGVzIHRoZSBwb3dlci1vZmYgb2YgY2x1c3RlcnMgYmVjYXVzZSBpdCBpcyBk
aWZmZXJlbnQgZnJvbQo+ID4gc3VuOWktYTgwIHRvIHN1bjhpLWE4M3QuCj4gPgo+ID4gVGhlIHBv
d2VyIG9mZiByZWdpc3RlciBmb3IgY2x1c3RlcnMgYXJlIGRpZmZlcmVudCBmcm9tIFNVTjlJIGFu
ZCBTVU44SSAgCj4gCj4gVGhpcyBpcyBqdXN0IGEgbml0cGljaywgYW5kIEkgc2VlIHlvdSB1c2Ug
dGhlbSBldmVyeXdoZXJlLCBidXQgc3VuOGkKPiBhbmQgc3VuOWkgYXJlIHRoZSBmYW1pbHkgb2Yg
U29DcywgYW5kIEE4MCBhbmQgQTgzdCB0aGUgbmFtZSBvZiBTb0NzCj4gd2l0aGluIHRoZWlyIHJl
c3BlY3RpdmUgZmFtaWxpZXMuCj4gCj4gU28gaW4geW91ciBjb21taXQgbG9nLCB5b3Ugd2FudCB0
byBzdXBwb3J0IHRoZSBBODN0IGJlY2F1c2UgaXQncwo+IGRpZmZlcmVudCB0aGFuIHRoZSBBODAs
IGFuZCB0aGUgc3VuOWkgYW5kIHN1bjhpIG1lbnRpb25uZWQgaW4geW91cgo+IGxhc3Qgc2VudGVu
Y2UgaXMgbm90IHJlYWxseSBtZWFuaW5nZnVsLgoKVHJ1ZSwgSSB3aWxsIHBheSBhdHRlbnRpb24g
bmV4dCB0aW1lLgoKPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE15bMOobmUgSm9zc2VyYW5kIDxteWxl
bmUuam9zc2VyYW5kQGJvb3RsaW4uY29tPiAgCj4gCj4gQWNrZWQtYnk6IE1heGltZSBSaXBhcmQg
PG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gCj4gTWF4aW1lCj4gCgpUaGFua3MsCgpNeWzD
qG5lCgotLSAKTXlsw6huZSBKb3NzZXJhbmQsIEJvb3RsaW4gKGZvcm1lcmx5IEZyZWUgRWxlY3Ry
b25zKQpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHA6Ly9ib290bGlu
LmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXJtLWtlcm5lbAo=
