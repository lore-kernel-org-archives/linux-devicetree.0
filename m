From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v6 3/9] ARM: versatile: Map local timers using Device
 Tree when possible
Date: Thu, 15 Dec 2011 15:25:51 +0000
Message-ID: <1323962751.18989.4.camel@hornet.cambridge.arm.com>
References: <1323957761-13553-1-git-send-email-pawel.moll@arm.com>
 <1323957761-13553-4-git-send-email-pawel.moll@arm.com>
 <4EEA09E8.3010807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4EEA09E8.3010807@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDExLTEyLTE1IGF0IDE0OjUzICswMDAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+
IEBAIC0yMSw2ICsyMywxNiBAQAo+ID4gICAqLwo+ID4gIGludCBfX2NwdWluaXQgbG9jYWxfdGlt
ZXJfc2V0dXAoc3RydWN0IGNsb2NrX2V2ZW50X2RldmljZSAqZXZ0KQo+ID4gIHsKPiA+ICsjaWYg
ZGVmaW5lZChDT05GSUdfT0YpCj4gPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IG9mX2Zp
bmRfY29tcGF0aWJsZV9ub2RlKE5VTEwsCj4gPiArCQkJTlVMTCwgImFybSxzbXAtdHdkIik7Cj4g
PiArCj4gPiArCWlmIChub2RlKQo+ID4gKwkJdHdkX2Jhc2UgPSBvZl9pb21hcChub2RlLCAwKTsK
PiA+ICsjZW5kaWYKPiAKPiBJIHRoaW5rIHlvdXIgcHJldmlvdXMgdmVyc2lvbiB3YXMgbW9yZSBj
b3JyZWN0LiBUaGlzIGlzIGdvaW5nIHRvIGZpbmQKPiB0aGUgbm9kZSBhbmQgZG8gaW9yZW1hcCBO
IHRpbWVzIHdoZXJlIE4gaXMgdGhlIG51bWJlciBvZiBjb3Jlcy4gSXQgZG9lcwo+IHdvcmsgdGhv
dWdoIGJlY2F1c2UgdGhhdCBpcyB3aGF0IEkgZGlkIGluaXRpYWxseSB0b28uCgpSaWdodCwgaG93
IGFib3V0IHRoYXQsIHRoZW46CgpAQCAtMjEsNiArMjMsMjIgQEAKICAqLwogaW50IF9fY3B1aW5p
dCBsb2NhbF90aW1lcl9zZXR1cChzdHJ1Y3QgY2xvY2tfZXZlbnRfZGV2aWNlICpldnQpCiB7Cisj
aWYgZGVmaW5lZChDT05GSUdfT0YpCisgICAgICAgc3RhdGljIGludCBkdF9ub2RlX3Byb2JlZDsK
KworICAgICAgIGlmICghZHRfbm9kZV9wcm9iZWQpIHsKKyAgICAgICAgICAgICAgIHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSA9IG9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKE5VTEwsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCwgImFybSxzbXAtdHdkIik7CisKKyAgICAgICAg
ICAgICAgIGlmIChub2RlKQorICAgICAgICAgICAgICAgICAgICAgICB0d2RfYmFzZSA9IG9mX2lv
bWFwKG5vZGUsIDApOworCisgICAgICAgICAgICAgICBkdF9ub2RlX3Byb2JlZCA9IDE7CisgICAg
ICAgfQorI2VuZGlmCisgICAgICAgaWYgKCF0d2RfYmFzZSkKKyAgICAgICAgICAgICAgIHJldHVy
biAtRU5YSU87CisKICAgICAgICBldnQtPmlycSA9IElSUV9MT0NBTFRJTUVSOwogICAgICAgIHR3
ZF90aW1lcl9zZXR1cChldnQpOwogICAgICAgIHJldHVybiAwOwoKCkNoZWVycyEKClBhd2XFggoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCg==
