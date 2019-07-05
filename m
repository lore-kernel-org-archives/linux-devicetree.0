From: Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v5 08/12] dt-bindings: mediatek: Change the binding for
 mmsys clocks
Date: Fri, 5 Jul 2019 10:13:17 +0000
Message-ID: <acd26dd8-7933-7ef5-0ba2-be8a7aa5ef99@suse.com>
References: <20181116125449.23581-1-matthias.bgg@kernel.org>
 <20181116125449.23581-9-matthias.bgg@kernel.org>
 <20181116231522.GA18006@bogus>
 <2a23e407-4cd4-2e2b-97a5-4e2bb96846e0@gmail.com>
 <CAL_JsqKJQwfDJbpmwW+oCxiDkSp5+6mG-uoURmCQVEMP_jFOEg@mail.gmail.com>
 <154281878765.88331.10581984256202566195@swboyd.mtv.corp.google.com>
 <458178ac-c0fc-9671-7fc8-ed2d6f61424c@suse.com>
 <154356023767.88331.18401188808548429052@swboyd.mtv.corp.google.com>
 <a229bfc7-683f-5b0d-7b71-54f934de6214@suse.com>
 <1561953318.25914.9.camel@mtksdaap41>
 <84d1c444-d6cb-9537-1bf5-b4e736443239@gmail.com>
 <100944512.353257.1562254420397@webmail.strato.com>
 <1562290530.10428.6.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562290530.10428.6.camel@mtksdaap41>
Content-Language: en-US
Content-ID: <9AF2F788BE05D147BD5CCEB781B442D7@namprd18.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Ulrich Hecht <uli@fpond.eu>
Cc: Mark Rutland <mark.rutland@arm.com>, MichaelTurquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, Matthias Brugger <matthias.bgg@gmail.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, LaurentPinchart <laurent.pinchart@ideasonboard.com>, RandyDunlap <rdunlap@infradead.org>, "matthias.bgg@kernel.org" <matthias.bgg@kernel.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Sean Wang <sean.wang@kernel.org>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, "moderated list:ARM/FREESCALE IMX /MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Sean Wang <Sean.Wang@mediatek.com>, Philipp Zabel <p.zabel@pengutr>
List-Id: devicetree@vger.kernel.org

DQoNCk9uIDA1LzA3LzIwMTkgMDM6MzUsIENLIEh1IHdyb3RlOg0KPiBIaSwgVWxpOg0KPiANCj4g
T24gVGh1LCAyMDE5LTA3LTA0IGF0IDE3OjMzICswMjAwLCBVbHJpY2ggSGVjaHQgd3JvdGU6DQo+
Pj4gT24gSnVseSA0LCAyMDE5IGF0IDExOjA4IEFNIE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFz
LmJnZ0BnbWFpbC5jb20+IHdyb3RlOg0KPj4+IFlvdSBhcmUgcmlnaHQsIGl0IHRvb2sgZmFyIHRv
byBsb25nIGZvciBtZSB0byByZXNwb25kIHdpdGggYSBuZXcgdmVyc2lvbiBvZiB0aGUNCj4+PiBz
ZXJpZXMuIFRoZSBwcm9ibGVtIEkgZmFjZSBpcywgdGhhdCBJIHVzZSBteSBtdDgxNzMgYmFzZWQg
Y2hyb21lYm9vayBmb3INCj4+PiB0ZXN0aW5nLiBJdCBuZWVkcyBzb21lIGRvd25zdHJlYW0gcGF0
Y2hlcyBhbmQgYnJva2Ugc29tZXdoZXJlIGJldHdlZW4gbXkgbGFzdA0KPj4+IGVtYWlsIGFuZCBh
IGZldyBtb250aCBhZ28uDQo+Pg0KPj4gSWYgdGhhdCBDaHJvbWVib29rIGlzIGFuIEFjZXIgUjEz
IGFuZCB5b3UgbmVlZCBhIHdvcmtpbmcga2VybmVsLCB5b3UgbWF5IHdhbnQgdG8gaGF2ZSBhIGxv
b2sgYXQgaHR0cHM6Ly9naXRodWIuY29tL3VsaS9rZXJuZWwvdHJlZS9lbG0td29ya2luZy01LjIg
Lg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHNhbXBsZSBjb2RlLCBhbmQgeW91ciBpbXBsZW1lbnRh
dGlvbiBpcyBkaWZmZXJlbnQgdGhhbg0KPiBNYXR0aGlhcycgdmVyc2lvbi4gSW4geW91ciB2ZXJz
aW9uLCBtbXN5cyBpcyBhIHNpbmdsZSBkZXZpY2Ugd2hpY2ggaGFzDQo+IGNsb2NrIGZ1bmN0aW9u
IGFuZCBkaXNwbGF5IGZ1bmN0aW9uLCB0aGUgY2xvY2sgZnVuY3Rpb24gaXMgcGxhY2VkIGluDQo+
IGNsb2NrIGRyaXZlciBmb2xkZXIgYW5kIGRpc3BsYXkgZnVuY3Rpb24gaXMgcGxhY2VkIGluIGRy
bSBkcml2ZXIgZm9sZGVyLg0KPiBJbiBNYXR0aGlhcycgdmVyc2lvbiwgY2xvY2sgZnVuY3Rpb24g
aXMgYSBzdWIgZGV2aWNlIG9mIG1tc3lzLiBJJ3ZlIG5vDQo+IGlkZWEgb2Ygd2hpY2ggb25lIGlz
IGJldHRlci4gSSB3b3VsZCBnZXQgbW9yZSBpbmZvcm1hdGlvbiB0byBtYWtlIGJldHRlcg0KPiBk
ZWNpc2lvbi4NCj4gDQoNCkZyb20gdGhlIGRpc2N1c3Npb24gd2UgaGFkIGhlcmUgYW5kIHRoZSBs
YXN0IGNvbW1lbnRzIGZyb20gU3RlcGhlbiBJIHRoaW4gd2hhdA0Kd2Ugc2hvdWxkIGRvIGlzOg0K
LSBjcmVhdGUgYSBwbGF0Zm9ybSBkcml2ZXIgZm9yIHRoZSBtbXN5cyBjbG9jayBwYXJ0LCBpbiB0
aGUgZHJpdmVycy9jbGsvbWVkaWF0ZWsvLi4uDQotIHRoZSBEUk0gZHJpdmVyIGNyZWF0ZXMgYSBw
bGF0Zm9ybSBkZXZpY2Ugd2hpY2ggd2lsbCBwcm9iZSB0aGUgY2xvY2sgZHJpdmVyLg0KDQpUaGlz
IHdheSB5b3Ugd29uJ3QgbmVlZCB0byBjaGFuZ2UgYW55IGNvbXBhdGlibGUuDQoNCllvdSB3aWxs
IGhhdmUgdG8gcmUtcmVhZCB0aGUgZGlzY3Vzc2lvbnMgaW4gdGhlIGRpZmZlcmVudCB2ZXJzaW9u
cyBvZiB0aGlzIHNlcmllcy4NCk15IGZpcnN0IGFwcHJvYWNoIHdhcyB0byB1c2EgYSBtZmQgZHJp
dmVyIGZvciBtbXN5cywgd2hpY2ggd2FzIHJlamVjdGVkLg0KVGhlIGxhc3QgYXBwcm9hY2ggd2Fz
IHRvIGNyZWF0ZSBhIERUUyBzdWIgbm9kZSwgYWxzbyByZWplY3RlZCA6KQ0KDQpSZWdhcmRzLA0K
TWF0dGhpYXMNCg0KPiBSZWdhcmRzLA0KPiBDSw0KPiANCj4+DQo+PiBDVQ0KPj4gVWxpDQo+Pg0K
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IExp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZw0KPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlaw0KPiANCj4gDQo+IA0K
