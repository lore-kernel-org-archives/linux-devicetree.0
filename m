From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Subject: Re: [PATCH v2] clk/axs10x: introduce AXS10X pll driver
Date: Wed, 29 Mar 2017 11:20:46 +0000
Message-ID: <1490786446.32756.4.camel@synopsys.com>
References: <1487682670-4164-1-git-send-email-vzakhar@synopsys.com>
 <1488547113.2557.44.camel@synopsys.com>
 <20170303235005.GV25384@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170303235005.GV25384@codeaurora.org>
Content-Language: en-US
Content-ID: <A3F6E98378575349A5106C14101F0F27@internal.synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "Vladislav.Zakharov@synopsys.com" <Vladislav.Zakharov@synopsys.com>
Cc: "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, "robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgU3RlcGhlbiwgTWljaGFlbCwNCg0KT24gRnJpLCAyMDE3LTAzLTAzIGF0IDE1OjUwIC0wODAw
LCBTdGVwaGVuIEJveWQgd3JvdGU6DQo+IE9uIDAzLzAzLCBWbGFkIFpha2hhcm92IHdyb3RlOg0K
PiA+IA0KPiA+IEhpIE1pY2hhZWwsIFN0ZXBoZW4sDQo+ID4gDQo+ID4gT24gVHVlLCAyMDE3LTAy
LTIxIGF0IDE2OjExICswMzAwLCBWbGFkIFpha2hhcm92IHdyb3RlOg0KPiA+ID4gDQo+ID4gPiBB
WFMxMFggYm9hcmRzIG1hbmFnZXMgaXQncyBjbG9ja3MgdXNpbmcgdmFyaW91cyBQTExzLiBUaGVz
ZSBQTEwgaGFzIHNhbWUNCj4gPiA+IGRpdmlkZXJzIGFuZCBjb3JyZXNwb25kaW5nIGNvbnRyb2wg
cmVnaXN0ZXJzIG1hcHBlZCB0byBkaWZmZXJlbnQgYWRkcmVzc2VzLg0KPiA+ID4gU28gd2UgYWRk
IG9uZSBjb21tb24gZHJpdmVyIGZvciBzdWNoIFBMTHMuDQo+ID4gPiANCj4gPiA+IEVhY2ggUExM
IG9uIEFYUzEwWCBib2FyZCBjb25zaXN0IG9mIHRocmVlIGRpdmlkZXJzOiBJRElWLCBGQkRJViBh
bmQNCj4gPiA+IE9ESVYuIE91dHB1dCBjbG9jayB2YWx1ZSBpcyBtYW5hZ2VkIHVzaW5nIHRoZXNl
IGRpdmlkZXJzLg0KPiA+ID4gDQo+ID4gPiBXZSBhZGQgcHJlLWRlZmluZWQgdGFibGVzIHdpdGgg
c3VwcG9ydGVkIHJhdGUgdmFsdWVzIGFuZCBhcHByb3ByaWF0ZQ0KPiA+ID4gY29uZmlndXJhdGlv
bnMgb2YgSURJViwgRkJESVYgYW5kIE9ESVYgZm9yIGVhY2ggdmFsdWUuDQo+ID4gPiANCj4gPiA+
IEFzIG9mIHRvZGF5IHdlIGFkZCBzdXBwb3J0IGZvciBQTExzIHRoYXQgZ2VuZXJhdGUgY2xvY2sg
Zm9yIHRoZQ0KPiA+ID4gZm9sbG93aW5nIGRldmljZXM6DQo+ID4gPiDCoCogQVJDIGNvcmUgb24g
QVhDIENQVSB0aWxlcy4NCj4gPiA+IMKgKiBBUkMgUEdVIG9uIEFSQyBTRFAgTWFpbmJvYXJkLg0K
PiA+ID4gYW5kIG1vcmUgdG8gY29tZSBsYXRlci4NCj4gPiA+IA0KPiA+ID4gQWNrZWQtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBWbGFkIFph
a2hhcm92IDx2emFraGFyQHN5bm9wc3lzLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvc2Ug
QWJyZXUgPGpvYWJyZXVAc3lub3BzeXMuY29tPg0KPiA+ID4gQ2M6IE1pY2hhZWwgVHVycXVldHRl
IDxtdHVycXVldHRlQGJheWxpYnJlLmNvbT4NCj4gPiA+IENjOiBTdGVwaGVuIEJveWQgPHNib3lk
QGNvZGVhdXJvcmEub3JnPg0KPiA+ID4gQ2M6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFy
bS5jb20+DQo+ID4gDQo+ID4gTWF5YmUgeW91IGhhdmUgYW55IGNvbW1lbnRzIG9yIHJlbWFya3Mg
YWJvdXQgdGhpcyBwYXRjaD8gQW5kIGlmIHlvdSBkb24ndCBjb3VsZCB5b3UgcGxlYXNlIGFwcGx5
IGl0Lg0KPiA+IA0KPiANCj4gSSBoYXZlbid0IHJldmlld2VkIGl0IHlldC4gVGhlIG1lcmdlIHdp
bmRvdyBpcyB1cG9uIHVzIHJpZ2h0IG5vdw0KPiBzbyBJJ2xsIHByb2JhYmx5IGdldCB0byBnb2lu
ZyB0aHJvdWdoIHRoZSBxdWV1ZSB0aGlzIHdlZWtlbmQvbmV4dA0KPiB3ZWVrLg0KPiANCg0KUGxl
YXNlIHRyZWF0IHRoaXMgbWVzc2FnZSBhcyBhIHBvbGl0ZSByZW1pbmRlciB0byByZXZpZXcgbXkg
cGF0Y2guDQpJdCBpcyByZXF1aXJlZCBmb3Igc29tZSBzdWJzeXN0ZW1zIG9uIG91ciBib2FyZHMs
IGUuZy4gZm9yIEFSQyBQR1UuDQoNClRoYW5rcy4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpWbGFk
IFpha2hhcm92IDx2emFraGFyQHN5bm9wc3lzLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4
LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYw==
