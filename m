From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH] drm/arcpgu: Get rid of "encoder-slave" property
Date: Fri, 3 Mar 2017 17:48:19 +0000
Message-ID: <1488563298.2940.33.camel@synopsys.com>
References: <1488554364-25579-1-git-send-email-abrodkin@synopsys.com>
 <20170303162837.GO917@e110455-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170303162837.GO917@e110455-lin.cambridge.arm.com>
Content-Language: en-US
Content-ID: <1813302EC06FDE46A08990C92D967D08@internal.synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "airlied@linux.ie" <airlied@linux.ie>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgTGl2aXUsDQoNCk9uIEZyaSwgMjAxNy0wMy0wMyBhdCAxNjoyOCArMDAwMCwgTGl2aXUgRHVk
YXUgd3JvdGU6DQo+IE9uIEZyaSwgTWFyIDAzLCAyMDE3IGF0IDA2OjE5OjI0UE0gKzAzMDAsIEFs
ZXhleSBCcm9ka2luIHdyb3RlOg0KPiA+IA0KPiA+IC0JLyogZmluZCB0aGUgZW5jb2RlciBub2Rl
IGFuZCBpbml0aWFsaXplIGl0ICovDQo+ID4gLQllbmNvZGVyX25vZGUgPSBvZl9wYXJzZV9waGFu
ZGxlKGRybS0+ZGV2LT5vZl9ub2RlLCAiZW5jb2Rlci1zbGF2ZSIsIDApOw0KPiA+IC0JaWYgKGVu
Y29kZXJfbm9kZSkgew0KPiA+IC0JCXJldCA9IGFyY3BndV9kcm1faGRtaV9pbml0KGRybSwgZW5j
b2Rlcl9ub2RlKTsNCj4gPiAtCQlvZl9ub2RlX3B1dChlbmNvZGVyX25vZGUpOw0KPiA+ICsJLyog
VGhlcmUgaXMgb25seSBvbmUgb3V0cHV0IHBvcnQgaW5zaWRlIGVhY2ggZGV2aWNlLCBmaW5kIGl0
ICovDQo+ID4gKwlwb3J0ID0gb2ZfZ3JhcGhfZ2V0X25leHRfZW5kcG9pbnQocGRldi0+ZGV2Lm9m
X25vZGUsIE5VTEwpOw0KPiA+ICsNCj4gPiArCWlmIChwb3J0KSB7DQo+ID4gKwkJaWYgKG9mX2Rl
dmljZV9pc19hdmFpbGFibGUocG9ydCkpDQo+ID4gKwkJCWVuY29kZXIgPSBvZl9ncmFwaF9nZXRf
cmVtb3RlX3BvcnRfcGFyZW50KHBvcnQpOw0KPiA+ICsJCW9mX25vZGVfcHV0KHBvcnQpOw0KPiA+
ICsJfQ0KPiANCj4gWW91IG11c3QndmUgYmVlbiBsb29raW5nIGF0IHNvbWUgb2xkIHZlcnNpb24u
IEN1cnJlbnQgdmVyc2lvbiBpbiAtbmV4dCB1c2VzDQo+IG9mX2dyYXBoX2dldF9yZW1vdGVfbm9k
ZSgpIHRvIHJlcGxhY2UgYWxsIHRob3NlIGxpbmVzIHlvdSBoYXZlIGFkZGVkIChzZWUgUm9iDQo+
IEhlcnJpbmcncyBzZXJpZXMgdG8gaW50cm9kdWNlIG9mX2dyYXBoX2dldF9yZW1vdGVfbm9kZSgp
IGZ1bmN0aW9uKQ0KDQpIbSwgSSdtIG5vdCBvbiBMaW51cycgbWFzdGVyIHRyZWUgWzFdIGFuZCBz
byBJIHRob3VnaHQgSSB3YXMgcXVpdGUgdXAgdG8gZGF0ZSA6KQ0KU3RpbGwgSSBtYWRlIGEgY2hl
Y2sgb2YgbGludXgtbmV4dCBhbmQgZG9uJ3Qgc2VlIGFueSBjaGFuZ2VzIGluDQoiZHJpdmVycy9n
cHUvZHJtL2FybSIgY29tcGFyZWQgdG8gTGludXMnIHRyZWUuDQoNClsxXcKgaHR0cDovL2dpdC5r
ZXJuZWwub3JnL2NnaXQvbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0
L2RyaXZlcnMvZ3B1L2RybS9hcm0/aWQ9ZTQ1NjNmNmJhNzE3OTJjNzdhZWNjYjIwOTJjYzIzMTQ5
YjQ0ZTY0Mg0KWzJdwqBodHRwOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0
L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0L2RyaXZlcnMvZ3B1L2RybS9hcm0/aWQ9ZTQ1NjNm
NmJhNzE3OTJjNzdhZWNjYjIwOTJjYzIzMTQ5YjQ0ZTY0Mg0KDQpDb3VsZCB5b3UgcGxlYXNlIGNs
YXJpZnkgd2hpY2ggZXhhY3QgdHJlZSBkaWQgeW91IG1lYW4/DQoNCkFueXdheXMgSSBqdXN0IHRy
aWVkIHRvIHJlYmFzZSBteSBwYXRjaCBvbiB0b3Agb2YgbGludXgtbmV4dCB0cmVlIGFuZCBub3cN
CnZpZGVvIG91dHB1dCBpcyBicm9rZW4gZm9yIG1lIC0gSSBvbmx5IHNlZSBzb21lIGdhcmJhZ2Ug
b24gdG9wIG9mIHRoZSBzY3JlZW4NCnNvIEknbGwgbmVlZCB0byBpbnZlc3RpZ2F0ZSBpdCBmaXJz
dCBiZWZvcmUgbW92aW5nIGZvcndhcmQgd2l0aCBzdHVmZiB5b3UNCnByb3Bvc2VkIDopDQoNCi1B
bGV4ZXkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBz
LWFyYw==
