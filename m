From: Sergei Shtylyov <sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v5 5/9] ARM: versatile: Map local timers using Device
 Tree when possible
Date: Mon, 12 Dec 2011 15:18:26 +0400
Message-ID: <4EE5E302.8070301@ru.mvista.com>
References: <1323457432-4800-1-git-send-email-pawel.moll@arm.com>
 <1323457432-4800-6-git-send-email-pawel.moll@arm.com>
 <4EE37A4D.8060204@ru.mvista.com>
 <1323687811.2391.3.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323687811.2391.3.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGVsbG8uCgpPbiAxMi0xMi0yMDExIDE1OjAzLCBQYXdlbCBNb2xsIHdyb3RlOgoKPj4+ICAgIGlu
dCBfX2NwdWluaXQgbG9jYWxfdGltZXJfc2V0dXAoc3RydWN0IGNsb2NrX2V2ZW50X2RldmljZSAq
ZXZ0KQo+Pj4gICAgewo+Pj4gKyNpZiBkZWZpbmVkKENPTkZJR19PRikKPj4+ICsJaWYgKCF0d2Rf
YmFzZSkgewo+Pj4gKwkJc3RydWN0IGRldmljZV9ub2RlICpucCA9IG9mX2ZpbmRfY29tcGF0aWJs
ZV9ub2RlKE5VTEwsCj4+PiArCQkJCU5VTEwsICJhcm0sc21wLXR3ZCIpOwo+Pj4gKwo+Pj4gKwkJ
dHdkX2Jhc2UgPSBvZl9pb21hcChucCwgMCk7Cj4+PiArCQlpZiAoIXR3ZF9iYXNlKQo+Pj4gKwkJ
CXJldHVybiAtRU5YSU87Cgo+PiAgICAgIC1FTk9NRU0uCgo+IEhtLiBXaGF0IEkgZGlkIHNpbXBs
eSBtaW1pY3MgdGhpcyAoImFyY2gvYXJtL2luY2x1ZGUvYXNtL2xvY2FsdGltZXIuaCIpOgoKPiAj
aWZkZWYgQ09ORklHX0xPQ0FMX1RJTUVSUwo+IFsuLi5dCj4gI2Vsc2UKCj4gc3RhdGljIGlubGlu
ZSBpbnQgbG9jYWxfdGltZXJfc2V0dXAoc3RydWN0IGNsb2NrX2V2ZW50X2RldmljZSAqZXZ0KQo+
IHsKPiAgICAgICAgICByZXR1cm4gLUVOWElPOwo+IH0KCj4gTm93LCBJIGhhZCBhIGxvb2sgYXQg
ImluY2x1ZGUvYXNtLWdlbmVyaWMvZXJybm8tYmFzZS5oIjoKCj4gI2RlZmluZSBFTlhJTyAgICAg
ICAgICAgIDYgICAgICAvKiBObyBzdWNoIGRldmljZSBvciBhZGRyZXNzICovCj4gWy4uLl0KPiAj
ZGVmaW5lIEVOT01FTSAgICAgICAgICAxMiAgICAgIC8qIE91dCBvZiBtZW1vcnkgKi8KCj4gYW5k
IHRvIGJlIGhvbmVzdCwgRU5YSU8gbWFrZXMgbW9yZSBzZW5zZSB0byBtZSwgYnV0IEkgcmVhbGx5
IGhhdmUgbm8KPiBzdHJvbmcgZmVlbGluZ3MgZWl0aGVyIHdheS4uLiBEbyB5b3U/CgogICAgSSB0
aGluayBpZiBvZl9pb21hcCgpIGZhaWxzLCBpdCdzIGJlY2F1c2UgdGhlIHN5c3RlbSBpcyBvdXQg
b2YgbWVtb3J5LCBzbyAKLUVOT01FTSBzZWVtcyBtb3JlIHByb3BlciBlcnJvciBpbiB0aGlzIGNh
c2UuIEFsdGhvdWdoLi4uIGl0J3Mgbm90IHRoZSBvbmx5IApjYXNlIHdoZW4gb2ZfaW9tYXAoKSBm
YWlscy4KCj4gVGhhbmtzIGZvciB5b3VyIHRpbWUhCgo+IFBhd2XFggoKV0JSLCBTZXJnZWkKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2aWNldHJlZS1k
aXNjdXNzIG1haWxpbmcgbGlzdApkZXZpY2V0cmVlLWRpc2N1c3NAbGlzdHMub3psYWJzLm9yZwpo
dHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vZGV2aWNldHJlZS1kaXNjdXNzCg==
