From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: Enable high resolution timer
Date: Fri, 27 Sep 2019 12:44:55 +0000
Message-ID: <69af57d1-13a9-9e35-78f2-4a0d17bdaf6d@st.com>
References: <20190927084819.645-1-benjamin.gaignard@st.com>
 <da48ce9633441cd0186518fa7ce1d528@www.loen.fr>
 <341949c8-7864-5d65-2797-988022724a4c@st.com>
 <ff11797da8f049b354797689754fde52@www.loen.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <ff11797da8f049b354797689754fde52@www.loen.fr>
Content-Language: en-US
Content-ID: <92F7A698A77B6645A13BFC2DB06725DE@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <maz@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

DQpPbiA5LzI3LzE5IDI6NDEgUE0sIE1hcmMgWnluZ2llciB3cm90ZToNCj4gT24gMjAxOS0wOS0y
NyAxMzozNiwgQmVuamFtaW4gR0FJR05BUkQgd3JvdGU6DQo+PiBPbiA5LzI3LzE5IDE6MjIgUE0s
IE1hcmMgWnluZ2llciB3cm90ZToNCj4+PiBPbiAyMDE5LTA5LTI3IDA5OjQ4LCBCZW5qYW1pbiBH
YWlnbmFyZCB3cm90ZToNCj4+Pj4gQWRkaW5nIGFsd2F5cy1vbiBtYWtlcyBhcm0gYXJjaF90aW1l
ciBjbGFpbSB0byBiZSBhbiBoaWdoIHJlc29sdXRpb24NCj4+Pj4gdGltZXIuDQo+Pj4+IFRoYXQg
aXMgcG9zc2libGUgYmVjYXVzZSBwb3dlciBtb2RlIHdvbid0IHN0b3AgY2xvY2tpbmcgdGhlIHRp
bWVyLg0KPj4+DQo+Pj4gVGhlICJhbHdheXMtb24iIGlzIG5vdCBhYm91dCB0aGUgY2xvY2suIEl0
IGlzIGFib3V0IHRoZSBjb21wYXJhdG9yLg0KPj4+IFRoZSBjbG9jayBpdHNlbGYgaXMgKmd1YXJh
bnRlZWQqIHRvIGFsd2F5cyB0aWNrLiBJZiBpdCBkaWRuJ3QsIA0KPj4+IHRoYXQnZCBiZQ0KPj4+
IGFuIGludGVncmF0aW9uIGJ1ZywgYW5kIGEgcHJldHR5IGJhZCBvbmUuDQo+Pj4NCj4+PiBXaGF0
IHlvdSdyZSBjbGFpbWluZyBoZXJlIGlzIHRoYXQgeW91ciBDUFUgbmV2ZXIgZW50ZXJzIGEgbG93
LXBvd2VyIA0KPj4+IG1vZGU/DQo+Pj4gRXZlcj8gSSBmaW5kIHRoaXMgdmVyeSBoYXJkIHRvIGJl
bGlldmUuDQo+Pj4NCj4+PiBGdXJ0aGVybW9yZSwgY2xhaW1pbmcgdGhhdCBhbHdheXMtb24gaXMg
dGhlIHdheSB0byBmb3JjZSB0aGUgYXJjaC10aW1lcg0KPj4+IHRvIGJlIGFuIGhydGltZXIgaXMg
ZmFjdHVhbGx5IHdyb25nLiBUaGlzIGlzIHdoYXQgaGFwcGVucyAqaWYqIHRoaXMgaXMNCj4+PiB0
aGUgb25seSB0aW1lciBpbiB0aGUgc3lzdGVtLiBUaGUgb25seSBjYXNlIHRoaXMgaXMgdHJ1ZSBp
cyBmb3IgdmlydHVhbA0KPj4+IG1hY2hpbmVzLiBBbnl0aGluZyBlbHNlIGhhcyBhIGdsb2JhbCB0
aW1lciBzb21ld2hlcmUgdGhhdCB3aWxsIGFsbG93DQo+Pj4gdGhlIGFyY2ggdGltZXJzIHRvIGJl
IHVzZWQgYXMgYW4gaHJ0aW1lci4NCj4+Pg0KPj4+IEknbSBwcmV0dHkgc3VyZSB5b3UgdG9vIGhh
dmUgYSBnbG9iYWwgdGltZXIgc29tZXdoZXJlIGluIHlvdXIgc3lzdGVtLg0KPj4+IEVuYWJsZSBp
dCwgYW5kIGVuam95IGhydGltZXJzIHdpdGhvdXQgaGF2aW5nIHRvIGxpZSBhYm91dCB0aGUgDQo+
Pj4gcHJvcGVydGllcw0KPj4+IG9mIHlvdXIgc3lzdGVtISA7LSkNCj4+DQo+PiBIaSBNYXJjLA0K
Pj4NCj4+IFRoaXMgU29DIGRvZXNuJ3QgaGF2ZSBhbnkgb3RoZXIgZ2xvYmFsIHRpbWVyLiBVc2Ug
YXJjaF90aW1lIGlzIHRoZSBvbmx5DQo+PiB3ZSBoYXZlIHRvIHByb3ZpZGUgaHJ0aW1lciBvbiB0
aGlzIHN5c3RlbS4NCj4NCj4gQW5kIHlvdSBkb24ndCBoYXZlIGFueSBmb3JtIG9mIHBvd2VyIG1h
bmFnZW1lbnQgZWl0aGVyPyBXaGF0IGhhcHBlbnMgd2hlbg0KPiB5b3VyIENQVSBnb2VzIGludG8g
aWRsZT8gSWYgeW91ciBzeXN0ZW0gZG9lcyBhbnkgZm9ybSBvZiBwb3dlciBtYW5hZ2VtZW50DQo+
ICphbmQqIGRvZXNuJ3QgaGF2ZSBhIHNlcGFyYXRlIHRpbWVyLCBpdCBpcyByZW1hcmthYmx5IGJy
b2tlbi4NCg0KRXZlbiBpbiBsb3ctcG93ZXIgbW9kZXMgdGhpcyB0aW1lciBpcyBhbHdheXMgcG93
ZXJlZCBhbmQgY2xvY2tlZCBzbyBpdCANCmlzIHdvcmtpbmcgZmluZS4NCg0KPg0KPiDCoMKgwqDC
oMKgwqDCoCBNLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hcm0ta2VybmVsCg==
