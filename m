From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v3 5/7] phy-sun4i-usb: Warn when external vbus is detected
Date: Sun, 21 Aug 2016 22:32:09 +0800
Message-ID: <27711471789929@web21g.yandex.ru>
References: <1471781799-10457-1-git-send-email-hdegoede@redhat.com>
 <1471781799-10457-5-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1471781799-10457-5-git-send-email-hdegoede@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans de Goede <hdegoede@redhat.com>, Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgoyMS4wOC4yMDE2LCAyMDoyMiwgIkhhbnMgZGUgR29lZGUiIDxoZGVnb2VkZUByZWRoYXQuY29t
PjoKPiBXYXJuIHdoZW4gZXh0ZXJuYWwgdmJ1cyBpcyBkZXRlY3RlZCB3aGVuIHdlJ3JlIHRyeWlu
ZyB0byBlbmFibGUgb3VyCj4gb3duIHZidXMuCgpXaWxsIGl0IGxlYWQgdG8gYSBkbWVzZyBmbG9v
ZCBpZiBhIG5vdC13ZWxsLWNvbm5lY3RlZCBVU0IgT1RHIENoYXJnaW5nIEh1YgppcyBwcmVzZW50
PwoKPgo+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+
Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAtTm8gY2hhbmdlcwo+IENoYW5nZXMgaW4gdjM6Cj4g
LU5vIGNoYW5nZXMKPiAtLS0KPiDCoGRyaXZlcnMvcGh5L3BoeS1zdW40aS11c2IuYyB8IDQgKysr
LQo+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L3BoeS1zdW40aS11c2IuYyBiL2RyaXZlcnMvcGh5L3Bo
eS1zdW40aS11c2IuYwo+IGluZGV4IGFmNDJmOGQuLjAzZjAzMGIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9waHkvcGh5LXN1bjRpLXVzYi5jCj4gKysrIGIvZHJpdmVycy9waHkvcGh5LXN1bjRpLXVz
Yi5jCj4gQEAgLTM5MCw4ICszOTAsMTAgQEAgc3RhdGljIGludCBzdW40aV91c2JfcGh5X3Bvd2Vy
X29uKHN0cnVjdCBwaHkgKl9waHkpCj4KPiDCoMKgwqDCoMKgwqDCoMKgwqAvKiBGb3IgcGh5MCBv
bmx5IHR1cm4gb24gVmJ1cyBpZiB3ZSBkb24ndCBoYXZlIGFuIGV4dC4gVmJ1cyAqLwo+IMKgwqDC
oMKgwqDCoMKgwqDCoGlmIChwaHktPmluZGV4ID09IDAgJiYgc3VuNGlfdXNiX3BoeTBfaGF2ZV92
YnVzX2RldChkYXRhKSAmJgo+IC0gZGF0YS0+dmJ1c19kZXQpCj4gKyBkYXRhLT52YnVzX2RldCkg
ewo+ICsgZGV2X3dhcm4oJl9waHktPmRldiwgIkV4dGVybmFsIHZidXMgZGV0ZWN0ZWQsIG5vdCBl
bmFibGluZyBvdXIgb3duIHZidXNcbiIpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gMDsKPiArIH0KPgo+IMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHJlZ3VsYXRv
cl9lbmFibGUocGh5LT52YnVzKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+IC0tCj4g
Mi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKPiBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFybS1rZXJuZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
