From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
Subject: Re: [PATCH v2 5/6] arm: dts: imx7-colibri: Use pwm polarity control
Date: Fri, 7 Oct 2016 10:19:59 +0530
Message-ID: <269990b4-ef58-e64b-2658-70bacfe51381@toradex.com>
References: <20161001101235.24598-1-bhuvanchandra.dv@toradex.com>
 <20161001101235.24598-6-bhuvanchandra.dv@toradex.com>
 <20161006084007.44c5cbae@jawa>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161006084007.44c5cbae@jawa>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lukasz Majewski <l.majewski@majess.pl>
Cc: devicetree@vger.kernel.org, stefan@agner.ch, thierry.reding@gmail.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMTAvMDYvMTYgMTI6MTAsIEx1a2FzeiBNYWpld3NraSB3cm90ZToKCj4gT24gU2F0LCAxIE9j
dCAyMDE2IDE1OjQyOjM0ICswNTMwCj4gQmh1dmFuY2hhbmRyYSBEViA8Ymh1dmFuY2hhbmRyYS5k
dkB0b3JhZGV4LmNvbT4gd3JvdGU6Cj4KPj4gQ29uZmlndXJlIFBXTSBwb2xhcml0eSBjb250cm9s
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBCaHV2YW5jaGFuZHJhIERWIDxiaHV2YW5jaGFuZHJhLmR2
QHRvcmFkZXguY29tPgo+PiAtLS0KPj4gICBhcmNoL2FybS9ib290L2R0cy9pbXg3LWNvbGlicmku
ZHRzaSB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDctY29saWJyaS5k
dHNpCj4+IGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14Ny1jb2xpYnJpLmR0c2kgaW5kZXggYTljYzY1
Ny4uMmFmNWUzZSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14Ny1jb2xpYnJp
LmR0c2kKPj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14Ny1jb2xpYnJpLmR0c2kKPj4gQEAg
LTQzLDcgKzQzLDcgQEAKPj4gICAvIHsKPj4gICAJYmw6IGJhY2tsaWdodCB7Cj4+ICAgCQljb21w
YXRpYmxlID0gInB3bS1iYWNrbGlnaHQiOwo+PiAtCQlwd21zID0gPCZwd20xIDAgNTAwMDAwMD47
Cj4+ICsJCXB3bXMgPSA8JnB3bTEgMCA1MDAwMDAwIDA+Owo+IE15IHJlY29tbWVuZGF0aW9uIHdv
dWxkIGJlIHRvIGFkZDoKPiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcHdtL3B3bS5oPgo+Cj4gYW5k
IHRoZW4gZGVmaW5lIHB3bXMgYXM6Cj4KPiBwd21zID0gPCZwd20xIDAgNTAwMDAwMCBQV01fUE9M
QVJJVFlfTk9STUFMPjsKPgo+IEl0IHdvdWxkIGJlIG1vcmUgcmVhZGFibGUKCk9rLCB3aWxsIGFk
ZCB0aGF0LgoKLS0KQmh1dmFuCgo+Cj4gQmVzdCByZWdhcmRzLAo+IMWBdWthc3ogTWFqZXdza2kK
Pgo+PiAgIAl9Owo+PiAgIAo+PiAgIAlyZWdfbW9kdWxlXzN2MzogcmVndWxhdG9yLW1vZHVsZS0z
djMgewoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwK
