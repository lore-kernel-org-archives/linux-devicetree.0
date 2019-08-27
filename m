From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v9 1/8] ARM: aurora-l2: add prefix to MAX_RANGE_SIZE
Date: Tue, 27 Aug 2019 21:13:11 +0000
Message-ID: <0e9c7c7cb17b6fdea8d49b06925badb0b3d2ff8b.camel@alliedtelesis.co.nz>
References: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
         <20190712034904.5747-2-chris.packham@alliedtelesis.co.nz>
         <20190823104621.GY13294@shell.armlinux.org.uk>
         <20190823105020.GZ13294@shell.armlinux.org.uk>
         <836653f04f526333e8dbd45361329731f8dfe2ea.camel@alliedtelesis.co.nz>
         <20190827091336.GI13294@shell.armlinux.org.uk>
         <b1e2e5b325b3c4453e2ed63c17e1e11d6b24f099.camel@alliedtelesis.co.nz>
         <20190827210713.GO13294@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827210713.GO13294@shell.armlinux.org.uk>
Content-Language: en-US
Content-ID: <4419FE1761C1324BB3ED319618247254@atlnz.lc>
Sender: linux-kernel-owner@vger.kernel.org
To: "linux@armlinux.org.uk" <linux@armlinux.org.uk>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "james.morse@arm.com" <james.morse@arm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "gregory.clement@free-electrons.com" <gregory.clement@free-electrons.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jlu@pengutronix.de" <jlu@pengutronix.de>, "bp@alien8.de" <bp@alien8.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "patches@armlinux.org.uk" <patches@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAyMDE5LTA4LTI3IGF0IDIyOjA3ICswMTAwLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGlu
dXggYWRtaW4NCndyb3RlOg0KPiBPbiBUdWUsIEF1ZyAyNywgMjAxOSBhdCAwODo1NjowNVBNICsw
MDAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAxOS0wOC0yNyBhdCAxMDox
MyArMDEwMCwgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluDQo+ID4gd3JvdGU6DQo+ID4g
PiBKdXN0IHNlbmQgdGhlIHNpbmdsZSBwYXRjaCB0byB0aGUgcGF0Y2ggdHJhY2tlciAtIGhhdmlu
ZyBpdCBhZ2FpbnN0DQo+ID4gPiA1LjMtcmMgaXMgZmluZSAoSSBkb24ndCB0aGluayBhbnl0aGlu
ZyBoYXMgY2hhbmdlZCBmb3IgYSBsb25nIHRpbWUNCj4gPiA+IHdpdGggdGhhdCBmaWxlLikNCj4g
PiANCj4gPiBEb25lIA0KPiA+IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIv
cGF0Y2hlcy92aWV3cGF0Y2gucGhwP2lkPTg5MDIvMQ0KPiA+IA0KPiA+IEknbSBzdGlsbCBub3Qg
ZW50aXJlbHkgc3VyZSB3aGF0IHRvIHB1dCBmb3IgdGhlIEtlcm5lbFZlcnNpb24gdGFnLiBJbg0K
PiA+IGhpbmRzaWdodCB0aGluayBJIG1pc2ludGVycHJldGVkIHlvdXIgY29tbWVudCBhYm92ZSBh
bmQgc2V0IGl0IHRvIDUuM3JjDQo+ID4gKHdoZXJlIHlvdSBtZWFudCBhIHNlcmllcyBiYXNlZCBv
biA1LjMtcmNYIHNob3VsZCBhcHBseSBjbGVhbmx5KS4gSXQNCj4gPiBwcm9iYWJseSBzaG91bGQg
aGF2ZSBiZWVuIG5leHQgb3IgbWFzdGVyIGJlY2F1c2UgaXQncyB3YXkgcGFzdCB0aGUNCj4gPiBt
ZXJnZSB3aW5kb3cgZm9yIDUuMy4NCj4gDQo+IFRoaW5rIGFib3V0IGl0IGFzICJ3aGljaCBrZXJu
ZWwgdmVyc2lvbiB3YXMgX3RoaXNfIHBhdGNoIGdlbmVyYXRlZA0KPiBhZ2FpbnN0IiAtIGl0J3Mg
YSBndWlkZSBmb3IgbWUgdG8ga25vdyB3aGljaCBrZXJuZWwgdmVyc2lvbiBpdA0KPiBzaG91bGQg
YmUgYXBwbGllZCB0by4gIFRoZSBuZWFyZXN0IExpbnVzIHJlbGVhc2UgKHJjIG9yIGZpbmFsKSBp
cw0KPiBnZW5lcmFsbHkgc3VmZmljaWVudC4NCj4gDQo+IElmIGl0IGRvZXNuJ3QgYXBwbHkgdG8g
bXkgY3VycmVudCBiYXNlLCB0aGVuIEkgbWlnaHQgY2hlY2sgb3V0IHRoYXQNCj4gdmVyc2lvbiwg
YXBwbHkgaXQgdGhlcmUsIGFuZCB0aGVuIG1lcmdlIGl0IGluLCByZXNvbHZpbmcgYW55DQo+IGNv
bmZsaWN0cyBkdXJpbmcgdGhlIG1lcmdlLg0KPiANCj4gSXQgc3RhcnRlZCBvZmYgd2l0aCBhIGRp
ZmZlcmVudCBwdXJwb3NlOiB3aGVuIHdlIGhhZCB0aGUgb2xkZXINCj4gZGV2ZWxvcG1lbnQgc3lz
dGVtLCBzdWNoIGFzIHRoZSAyLnggc2VyaWVzIGtlcm5lbHMsIHdlIHdvdWxkIGhhdmUNCj4gZXZl
biB4IGJlaW5nIHRoZSBjdXJyZW50IHN0YWJsZSBrZXJuZWxzLCBhbmQgY29uY3VycmVudGx5IHdl
J2QNCj4gYWxzbyBoYXZlIHgrMSBhcyB0aGUgZGV2ZWxvcG1lbnQgc2VyaWVzLiAgV2hlbiBzb21l
b25lIHNlbnQgbWUgYQ0KPiBwYXRjaCBiYWNrIHRoZW4sIGl0IHdhcyBpbXBvcnRhbnQgdG8ga25v
dyB3aGljaCBrZXJuZWwgc2VyaWVzIGl0DQo+IHdhcyBtZWFudCBmb3IuDQo+IA0KPiBJIGRlY2lk
ZWQgbm90IHRvIGdldCByaWQgb2YgaXQgYmVjYXVzZSBpdCBwcm92aWRlcyB1c2VmdWwNCj4gaW5m
b3JtYXRpb24gd2hlbiBwYXRjaGVzIGRvbid0IGFwcGx5LCBhbmQgZ2l2ZXMgbW9yZSBvcHRpb25z
DQo+IHRoYW4gbWUganVzdCBkaXNjYXJkaW5nIHRoZSBwYXRjaCB3aXRoIGEgY29tbWVudCBzYXlp
bmcgaXQNCj4gZG9lc24ndCBhcHBseS4NCj4gDQoNClRoYW5rcyBmb3IgdGhlIGluZm8uIFNvIDUu
My1yYyBpcyBub3QgYXMgd3JvbmcgYXMgSSB0aG91Z2h0IGl0IHdhcy4NCg0KT25lIGNvdWxkIGV2
ZW4gc3VtbWFyaXplIHRoZSBhYm92ZSBhcy4NCg0KICBnaXQgZm9ybWF0LXBhdGNoIC0tYWRkLWhl
YWRlciBcDQogICAgICAiS2VybmVsVmVyc2lvbjogJChnaXQgZGVzY3JpYmUgLS1hYmJyZXY9MCBI
RUFEKSINCg0K
