From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v5 5/9] ARM: versatile: Map local timers using Device
 Tree when possible
Date: Mon, 12 Dec 2011 11:03:31 +0000
Message-ID: <1323687811.2391.3.camel@hornet.cambridge.arm.com>
References: <1323457432-4800-1-git-send-email-pawel.moll@arm.com>
 <1323457432-4800-6-git-send-email-pawel.moll@arm.com>
 <4EE37A4D.8060204@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4EE37A4D.8060204@ru.mvista.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

TW9ybmluZywKCk9uIFNhdCwgMjAxMS0xMi0xMCBhdCAxNToyNyArMDAwMCwgU2VyZ2VpIFNodHls
eW92IHdyb3RlOgo+ID4gICBpbnQgX19jcHVpbml0IGxvY2FsX3RpbWVyX3NldHVwKHN0cnVjdCBj
bG9ja19ldmVudF9kZXZpY2UgKmV2dCkKPiA+ICAgewo+ID4gKyNpZiBkZWZpbmVkKENPTkZJR19P
RikKPiA+ICsJaWYgKCF0d2RfYmFzZSkgewo+ID4gKwkJc3RydWN0IGRldmljZV9ub2RlICpucCA9
IG9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKE5VTEwsCj4gPiArCQkJCU5VTEwsICJhcm0sc21wLXR3
ZCIpOwo+ID4gKwo+ID4gKwkJdHdkX2Jhc2UgPSBvZl9pb21hcChucCwgMCk7Cj4gPiArCQlpZiAo
IXR3ZF9iYXNlKQo+ID4gKwkJCXJldHVybiAtRU5YSU87Cj4gCj4gICAgIC1FTk9NRU0uCgpIbS4g
V2hhdCBJIGRpZCBzaW1wbHkgbWltaWNzIHRoaXMgKCJhcmNoL2FybS9pbmNsdWRlL2FzbS9sb2Nh
bHRpbWVyLmgiKToKCiNpZmRlZiBDT05GSUdfTE9DQUxfVElNRVJTClsuLi5dCiNlbHNlCgpzdGF0
aWMgaW5saW5lIGludCBsb2NhbF90aW1lcl9zZXR1cChzdHJ1Y3QgY2xvY2tfZXZlbnRfZGV2aWNl
ICpldnQpCnsKICAgICAgICByZXR1cm4gLUVOWElPOwp9CgpOb3csIEkgaGFkIGEgbG9vayBhdCAi
aW5jbHVkZS9hc20tZ2VuZXJpYy9lcnJuby1iYXNlLmgiOgoKI2RlZmluZSBFTlhJTyAgICAgICAg
ICAgIDYgICAgICAvKiBObyBzdWNoIGRldmljZSBvciBhZGRyZXNzICovClsuLi5dCiNkZWZpbmUg
RU5PTUVNICAgICAgICAgIDEyICAgICAgLyogT3V0IG9mIG1lbW9yeSAqLwoKYW5kIHRvIGJlIGhv
bmVzdCwgRU5YSU8gbWFrZXMgbW9yZSBzZW5zZSB0byBtZSwgYnV0IEkgcmVhbGx5IGhhdmUgbm8K
c3Ryb25nIGZlZWxpbmdzIGVpdGhlciB3YXkuLi4gRG8geW91PwoKVGhhbmtzIGZvciB5b3VyIHRp
bWUhCgpQYXdlxYIKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYXJtLWtlcm5lbAo=
