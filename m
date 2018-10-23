From: Shyam Saini <shyam.saini@amarulasolutions.com>
Subject: Re: [PATCH V2] ARM: dts: imx6qdl-icore: Add missing stdout-path
 property
Date: Tue, 23 Oct 2018 10:51:59 +0530
Message-ID: <CA+drQ_OZHPSXoECX4z7oWEwNV11EUn=DviNa6nmDpWKBs2o8+Q@mail.gmail.com>
References: <20181018150305.21408-1-shyam.saini@amarulasolutions.com>
 <20181018184532.xe2llbhwjuffgchx@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181018184532.xe2llbhwjuffgchx@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: u.kleine-koenig@pengutronix.de
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com, kernel@pengutronix.de, l.stach@pengutronix.de, fabio.estevam@nxp.com, Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBPY3QgMTksIDIwMTggYXQgMTI6MTUgQU0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE9jdCAxOCwgMjAx
OCBhdCAwODozMzowNVBNICswNTMwLCBTaHlhbSBTYWluaSB3cm90ZToKPiA+IFRoaXMgd291bGQg
aGVscCB1cyB0byBnZXQgZWFybHkgYm9vdCBsb2dzIGJ5IHBhc3NpbmcgImVhcmx5Y29uIiB0bwo+
ID4ga2VybmVsIGJvb3RhcmdzLgo+ID4KPiA+IEZ1cnRoZXIsIGJ5IGFkZGluZyB0aGlzIHdlIGRv
bid0IGhhdmUgdG8gZGVwZW5kIG9uIGNvbXBsZXggZWFybHlwcmludGsKPiA+IGNvbmZpZ3MgZm9y
IGVhcmx5IGJvb3QgbG9ncy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTaHlhbSBTYWluaSA8c2h5
YW0uc2FpbmlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiBSZXZpZXdlZC1ieTogRmFiaW8gRXN0
ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+Cj4gbWlub3Igbml0OiB5b3VyIFMtby1iIGxpbmUg
c2hvdWxkIGJlIHRoZSBsYXN0IHRoaW5nIHlvdSB3cml0ZS4gU28gaXQncwo+Cj4gICAgICAgICBT
aWduZWQtb2ZmLWJ5OiBTaHlhbSBTYWluaSA8c2h5YW0uc2FpbmlAYW1hcnVsYXNvbHV0aW9ucy5j
b20+Cj4gICAgICAgICBSZXZpZXdlZC1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwu
Y29tPgo+ICAgICAgICAgU2lnbmVkLW9mZi1ieTogSm9obiBNYWludGFpbmVyIDxqb2huQGV4YW1w
bGUub3JnPgo+Cj4gaWYgSm9obiBhZGRlZCB0aGUgUmV2aWV3ZWQtYnkgdGFnIGFuZAo+Cj4gICAg
ICAgICBSZXZpZXdlZC1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+ICAg
ICAgICAgU2lnbmVkLW9mZi1ieTogU2h5YW0gU2FpbmkgPHNoeWFtLnNhaW5pQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgo+ICAgICAgICAgU2lnbmVkLW9mZi1ieTogSm9obiBNYWludGFpbmVyIDxqb2hu
QGV4YW1wbGUub3JnPgo+Cj4gaWYgaXQgd2FzIHlvdS4KClRoYW5rcyBhIGxvdCBVd2UgZm9yIHlv
dXIgc3VnZ2VzdGlvbi4gSSdsbCB0YWtlIGNhcmUgb2YgdGhpcyB0aGluZyBuZXh0IHRpbWUuCkBT
aGF3biB3b3VsZCB5b3UgcGxlYXNlIG1ha2UgdGhlIG1pbm9yIGNoYW5nZSBhcyBzdWdnZXN0ZWQg
YnkgVXdlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYXJtLWtlcm5lbAo=
