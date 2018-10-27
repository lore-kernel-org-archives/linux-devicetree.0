From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 3/3] drm/tinydrm: Fix setting of the column/page end
 addresses.
Date: Sat, 27 Oct 2018 18:13:44 +0200
Message-ID: <6cc67180-c844-566a-cb59-b06e9e2ff72a@tronnes.org>
References: <20181024184313.2967-1-eric@anholt.net>
 <20181024184313.2967-4-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181024184313.2967-4-eric@anholt.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

CkRlbiAyNC4xMC4yMDE4IDIwLjQzLCBza3JldiBFcmljIEFuaG9sdDoKPiBJZiB0aGUgY2xpcHBl
ZCBkaXJ0eSByZWdpb24ncyB4L3kgaGFwcGVuZWQgdG8gYWxpZ24gdG8gMjU2LCB3ZSB3b3VsZAo+
IGhhdmUgc2V0IHRoZSB0b3AgOCBiaXRzIHdyb25nLiAgTm90aWNlZCBieSBpbnNwZWN0aW9uLCBu
b3QgYnkKPiByZXByb2R1Y2luZyBhIGJ1Zy4KPgo+IFNpZ25lZC1vZmYtYnk6IEVyaWMgQW5ob2x0
IDxlcmljQGFuaG9sdC5uZXQ+Cj4gLS0tCgpHb29kIGNhdGNoLgpSZXZpZXdlZC1ieTogTm9yYWxm
IFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cgo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnlk
cm0vbWlwaS1kYmkuYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueWRy
bS9taXBpLWRiaS5jIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1kYmkuYwo+IGluZGV4
IGNiMzQ0MWU1MWQ1Zi4uMWJiODcwMDIxZjZlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90aW55ZHJtL21pcGktZGJpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueWRybS9taXBp
LWRiaS5jCj4gQEAgLTI0MCwxMCArMjQwLDEwIEBAIHN0YXRpYyBpbnQgbWlwaV9kYmlfZmJfZGly
dHkoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsCj4gICAKPiAgIAltaXBpX2RiaV9jb21tYW5k
KG1pcGksIE1JUElfRENTX1NFVF9DT0xVTU5fQUREUkVTUywKPiAgIAkJCSAoY2xpcC54MSA+PiA4
KSAmIDB4RkYsIGNsaXAueDEgJiAweEZGLAo+IC0JCQkgKGNsaXAueDIgPj4gOCkgJiAweEZGLCAo
Y2xpcC54MiAtIDEpICYgMHhGRik7Cj4gKwkJCSAoKGNsaXAueDIgLSAxKSA+PiA4KSAmIDB4RkYs
IChjbGlwLngyIC0gMSkgJiAweEZGKTsKPiAgIAltaXBpX2RiaV9jb21tYW5kKG1pcGksIE1JUElf
RENTX1NFVF9QQUdFX0FERFJFU1MsCj4gICAJCQkgKGNsaXAueTEgPj4gOCkgJiAweEZGLCBjbGlw
LnkxICYgMHhGRiwKPiAtCQkJIChjbGlwLnkyID4+IDgpICYgMHhGRiwgKGNsaXAueTIgLSAxKSAm
IDB4RkYpOwo+ICsJCQkgKChjbGlwLnkyIC0gMSkgPj4gOCkgJiAweEZGLCAoY2xpcC55MiAtIDEp
ICYgMHhGRik7Cj4gICAKPiAgIAlyZXQgPSBtaXBpX2RiaV9jb21tYW5kX2J1ZihtaXBpLCBNSVBJ
X0RDU19XUklURV9NRU1PUllfU1RBUlQsIHRyLAo+ICAgCQkJCShjbGlwLngyIC0gY2xpcC54MSkg
KiAoY2xpcC55MiAtIGNsaXAueTEpICogMik7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
