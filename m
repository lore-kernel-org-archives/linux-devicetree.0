From: =?UTF-8?B?TXlsw6huZQ==?= Josserand <mylene.josserand@bootlin.com>
Subject: Re: [PATCH v3 7/7] ARM: sun8i: smp: Remove the disabling of CPU0
Date: Mon, 19 Feb 2018 11:50:31 +0100
Message-ID: <20180219115031.77a0a1ca@dell-desktop.home>
References: <20180219081837.15482-1-mylene.josserand@bootlin.com>
 <20180219081837.15482-8-mylene.josserand@bootlin.com>
 <20180219085408.5to43p7jbtijx4q3@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219085408.5to43p7jbtijx4q3@flea.lan>
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

SGksCgpPbiBNb24sIDE5IEZlYiAyMDE4IDA5OjU0OjA4ICswMTAwCk1heGltZSBSaXBhcmQgPG1h
eGltZS5yaXBhcmRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBPbiBNb24sIEZlYiAxOSwgMjAxOCBh
dCAwOToxODozN0FNICswMTAwLCBNeWzDqG5lIEpvc3NlcmFuZCB3cm90ZToKPiA+IE9uIHN1bjhp
LWE2M3QsIGhvdHBsdWcgQ1BVIGZvciBDUFUwIGlzIGN1cnJlbnRseSBub3Qgd29ya2luZy4KPiA+
IFJlbW92ZSB0aGUgcG9zc2liaWxpdHkgdG8gZGlzYWJsZSBDUFUwIG9ubHkgZm9yIHN1bjhpLWE4
M3QuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE15bMOobmUgSm9zc2VyYW5kIDxteWxlbmUuam9z
c2VyYW5kQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9hcm0vbWFjaC1zdW54aS9tY19z
bXAuYyB8IDYgKysrKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdW54aS9tY19z
bXAuYyBiL2FyY2gvYXJtL21hY2gtc3VueGkvbWNfc21wLmMKPiA+IGluZGV4IGZlYzU5MmJmNjhi
NC4uNjlkNWFlNWIzZDcyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm0vbWFjaC1zdW54aS9tY19z
bXAuYwo+ID4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdW54aS9tY19zbXAuYwo+ID4gQEAgLTY2MSw4
ICs2NjEsMTIgQEAgc3RhdGljIGludCBzdW54aV9tY19zbXBfY3B1X2tpbGwodW5zaWduZWQgaW50
IGxfY3B1KQo+ID4gIAlyZXR1cm4gIXJldDsKPiA+ICB9Cj4gPiAgCj4gPiAtc3RhdGljIGJvb2wg
c3VueGlfbWNfc21wX2NwdV9jYW5fZGlzYWJsZSh1bnNpZ25lZCBpbnQgX191bnVzZWQpCj4gPiAr
c3RhdGljIGJvb2wgc3VueGlfbWNfc21wX2NwdV9jYW5fZGlzYWJsZSh1bnNpZ25lZCBpbnQgY3B1
KQo+ID4gIHsKPiA+ICsJLyogQ1BVMCBob3RwbHVnIGhhbmRsZWQgb25seSBmb3Igc3VuOWkgKi8K
PiA+ICsJaWYgKG9mX21hY2hpbmVfaXNfY29tcGF0aWJsZSgiYWxsd2lubmVyLHN1bjhpLWE4M3Qi
KSkKPiA+ICsJCWlmIChjcHUgPT0gMCkKPiA+ICsJCQlyZXR1cm4gZmFsc2U7ICAKPiAKPiBUaGlz
IGFsc28gbWVhbnMgdGhhdCB5b3UgaGF2ZSBhIHdpbmRvdyBpbiB5b3VyIHBhdGNoIHNlcXVlbmNl
IHdoZXJlCj4geW91IGNhbiBkaXNhYmxlIHRoZSBDUFUwIG9uIHRoZSBBODN0LiBUaGlzIHBhdGNo
IHNob3VsZCBiZSBlYXJsaWVyLgoKSXQgaXMgdHJ1ZS4KV2l0aCB5b3VyIGNvbW1lbnQgaW4gbXkg
Zmlyc3QgcGF0Y2gsIGl0IHdpbGwgYmUgZG9uZSBlYXJsaWVyLgoKVGhhbmtzLAoKTXlsw6huZQoK
LS0gCk15bMOobmUgSm9zc2VyYW5kLCBCb290bGluIChmb3JtZXJseSBGcmVlIEVsZWN0cm9ucykK
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwOi8vYm9vdGxpbi5jb20K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK
