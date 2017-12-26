From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/5] drm/panel: Add support for the EDT ETM0700G0BDH6
Date: Tue, 26 Dec 2017 11:25:08 -0600
Message-ID: <CAL_JsqL8Yny=tm23jbJTMvM2OdXUE3d1A+h4d2kNARHnLgLMkA@mail.gmail.com>
References: <95F51F4B902CAC40AF459205F6322F01B7FDFECC3D@BMK019S01.emtrion.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <95F51F4B902CAC40AF459205F6322F01B7FDFECC3D@BMK019S01.emtrion.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?B?VMO8cmssIEphbg==?= <Jan.Tuerk@emtrion.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, SZ Lin <sz.lin@moxa.com>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Sascha Hauer <kernel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabio Estevam <fabio.estevam@nxp.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, LinuxArmKernelMailingListe <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBEZWMgMjIsIDIwMTcgYXQgNDo0MyBBTSwgVMO8cmssIEphbiA8SmFuLlR1ZXJrQGVt
dHJpb24uZGU+IHdyb3RlOgo+PiBWb246IFJvYiBIZXJyaW5nIFttYWlsdG86cm9iaEBrZXJuZWwu
b3JnXQo+PiBHZXNlbmRldDogRnJlaXRhZywgMjIuIERlemVtYmVyIDIwMTcgMDA6MDAKPj4gQmV0
cmVmZjogUmU6IFtQQVRDSCB2MiAxLzVdIGRybS9wYW5lbDogQWRkIHN1cHBvcnQgZm9yIHRoZSBF
RFQKPj4gRVRNMDcwMEcwQkRINgo+Pgo+PiBPbiBXZWQsIERlYyAyMCwgMjAxNyBhdCAwMjo0Nzow
MVBNICswMTAwLCBqYW4udHVlcmtAZW10cmlvbi5jb20gd3JvdGU6Cj4+ID4gRnJvbTogSmFuIFR1
ZXJrIDxqYW4udHVlcmtAZW10cmlvbi5jb20+Cj4+ID4KPj4gPiBUaGUgRW1lcmdpbmcgRGlzcGxh
eSBUZWNobm9sb2d5IEVUTTA3MDBHMEJESDYgaXMgZXhhY3RseSB0aGUgc2FtZQo+PiA+IGRpc3Bs
YXkgYXMgdGhlIEVUTTA3MDBHMERINiwgZXhlcHQgdGhlIHBpeGVsY2xvY2sgcG9sYXJpdHkuIFRo
ZXJlZm9yZQo+PiA+IHJlLXVzZSB0aGUgRVRNMDcwMEcwREg2IG1vZGVzLiBJdCBpcyB1c2VkIGJ5
IGRlZmF1bHQgb24gZW10cmlvbiBBdmFyaQo+PiA+IGJhc2VkIGRldmVsb3BtZW50IGtpdHMuCj4+
Cj4+IEFzIEkgYXNrZWQgb24gdjEsIHdoeSBub3QgZG9jdW1lbnQgdGhlIHBhbmVscyB0b2dldGhl
ciBpbiBhIHNpbmdsZSBkb2M/Cj4KPiBBcyBkZW5vdGVkIGluIHRoZSBjb3ZlciBsZXR0ZXI6CgpJ
IGdlbmVyYWxseSBkb24ndCByZWFkIGNvdmVyIGxldHRlcnMuLi4KCj4+VGhlIGRvY3VtZW50YXRp
b24gZm9yIHRoZSBFRFQgZGlzcGxheSBpcyBrZXB0IGFzIGFuIGV4dHJhIGZpbGUgY3VycmVudGx5
LAo+PmFzIGl0IGlzIGRvbmUgYnkgdGhlIG1vc3QgZGlzcGxheXMgaW4gdGhlIGRvY3VtZW50YXRp
b24uIEFsc28gYSBuZXcKPj5uZXcgVmFyaWFudCBvZiB0aGUgRURUIGFscmVhZHkgYXJyaXZlZC4g
U28gbWVyZ2luZyB0aGVpciBkb2N1bWVudGF0aW9ucwo+PnNob3VsZCBiZSBkaXNjdXNzZWQgc2Vw
YXJhdGVseS4KCllvdSBtZWFuIGEgM3JkIHZhcmlhbnQ/Cgo+IEkgdGhpbmsgaXQgd2lsbCBiZSBl
dmVuIGEgbGl0dGxlIHRyaWNreSB0byBmaW5kIGEgbWF0Y2hpbmcgZmlsZW5hbWUgZm9yIGJvdGgg
dmVyc2lvbnMsCj4gYXMgdGhlIHJlY2VudCBvbmVzIGFkZGluZyBhbiBleHRyYSBjaGFyYWN0ZXIg
aW4gdGhlIGRlc2NyaXB0aW9uLiBBcmUgeW91IGV4cGVjdGluZyBzdGguCj4gbGlrZSBlZHQsZXRt
MDcwMHNlcmllcy50eHQ/CgpZZWFoLCBvciBlZHQsZXRtMDcwMGcwLnR4dC4KClJvYgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
