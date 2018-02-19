From: =?UTF-8?B?TXlsw6huZQ==?= Josserand <mylene.josserand@bootlin.com>
Subject: Re: [PATCH v3 6/7] arm: dts: sun8i: a83t: Fix undefined offset with
 virtual timer
Date: Mon, 19 Feb 2018 11:44:22 +0100
Message-ID: <20180219114422.37977175@dell-desktop.home>
References: <20180219081837.15482-1-mylene.josserand@bootlin.com>
 <20180219081837.15482-7-mylene.josserand@bootlin.com>
 <20180219085205.jh6bcmbzcxqffkhk@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219085205.jh6bcmbzcxqffkhk@flea.lan>
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

SGksCgpPbiBNb24sIDE5IEZlYiAyMDE4IDA5OjUyOjA1ICswMTAwCk1heGltZSBSaXBhcmQgPG1h
eGltZS5yaXBhcmRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIaSwKPiAKPiBPbiBNb24sIEZlYiAx
OSwgMjAxOCBhdCAwOToxODozNkFNICswMTAwLCBNeWzDqG5lIEpvc3NlcmFuZCB3cm90ZToKPiA+
IFRoZSBBUk0gYXJjaGl0ZWN0ZWQgdGltZXJzIHVzZSBhbiBvZmZzZXQgYmV0d2VlbiB0aGVpciBw
aHlzaWNhbCBhbmQKPiA+IHZpcnR1YWwgY291bnRlcnMuIFRoYXQgb2Zmc2V0IHNob3VsZCBiZSBj
b25maWd1cmVkIGJ5IHRoZSBib290bG9hZGVyCj4gPiBpbiBDTlRWT0ZGLgo+ID4gCj4gPiBIb3dl
dmVyLCB0aGUgQTgzdCBib290bG9hZGVyIGZhaWxzIHRvIGRvIHNvLCBhbmQgd2UgZW5kIHVwIHdp
dGggYW4KPiA+IHVuZGVmaW5lZCBvZmZzZXQgKHdoaWNoIGluIG91ciBjYXNlIGlzIHJhbmRvbSks
IG1lYW5pbmcgdGhhdCBlYWNoIENQVQo+ID4gd2lsbCBoYXZlIGEgZGlmZmVyZW50IHRpbWUsIHdo
aWNoIGlzbid0IHdvcmtpbmcgdmVyeSB3ZWxsLgo+ID4gCj4gPiBGaXggdGhhdCBieSBzZXR0aW5n
IHRoZSBhcm0sY3B1LXJlZ2lzdGVycy1ub3QtZnctY29uZmlndXJlZCB0aGF0IHdpbGwKPiA+IG1h
a2UgTGludXggdXNlIHRoZSBwaHlzaWNhbCB0aW1lcnMgaW5zdGVhZCBvZiB0aGUgdmlydHVhbCBv
bmVzLiBPbmUKPiA+IHBvc3NpYmxlIHNpZGUgZWZmZWN0IHdvdWxkIGJlIHRoYXQgdGhlIHZpcnR1
YWxpemF0aW9uIGZlYXR1cmVzIHdvdWxkCj4gPiBiZSBkaXNhYmxlZC4gSG93ZXZlciwgZHVlIHRv
IHRoZSB3YXkgdGhlIEdJQyBoYXMgYmVlbiBpbnRlZ3JhdGVkIGluCj4gPiB0aGUgc3lzdGVtLCBp
dCBpcyBhbHJlYWR5IHVudXNhYmxlIHNvIHdlJ3JlIGVmZmVjdGl2ZWx5IG5vdCBsb3NpbmcgYW55
Cj4gPiBmZWF0dXJlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNeWzDqG5lIEpvc3NlcmFuZCA8
bXlsZW5lLmpvc3NlcmFuZEBib290bGluLmNvbT4gIAo+IAo+IE9uZSBzbWFsbCBuaXRwaWNrIG9u
IHRoaXMgb25lIChhbmQgdGhlIHByZXZpb3VzIG9uZSksIGFybSBpbiB0aGUKPiBzdWJqZWN0IHBy
ZWZpeCBzaG91bGQgYmUgdXBwZXJjYXNlLgoKT2theSwgSSB3aWxsIGZpeCB0aGF0IGluIFY0LgoK
TXlsw6huZQoKLS0gCk15bMOobmUgSm9zc2VyYW5kLCBCb290bGluIChmb3JtZXJseSBGcmVlIEVs
ZWN0cm9ucykKRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwOi8vYm9v
dGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwK
