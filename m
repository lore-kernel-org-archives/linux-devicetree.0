From: Andy Tang <andy.tang@nxp.com>
Subject: RE: [PATCH 3/3 v2] clk: qoriq: update clock driver
Date: Thu, 25 Oct 2018 02:40:03 +0000
Message-ID: <DB5PR0401MB22130B915A5690E9BC56CCE5F3F70@DB5PR0401MB2213.eurprd04.prod.outlook.com>
References: <20181024021122.3942-1-andy.tang@nxp.com>
         <20181024021122.3942-2-andy.tang@nxp.com>
         <20181024021122.3942-3-andy.tang@nxp.com>
 <d4598171243a37516faae71095eb3126d77fa723.camel@buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d4598171243a37516faae71095eb3126d77fa723.camel@buserror.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Wood <oss@buserror.net>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org" <paulus@samba.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNjb3R0IFdvb2QgPG9zc0Bi
dXNlcnJvci5uZXQ+DQo+IFNlbnQ6IDIwMTjlubQxMOaciDI15pelIDI6MzcNCj4gVG86IEFuZHkg
VGFuZyA8YW5keS50YW5nQG54cC5jb20+OyBzYm95ZEBrZXJuZWwub3JnOw0KPiBtdHVycXVldHRl
QGJheWxpYnJlLmNvbQ0KPiBDYzogcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJt
LmNvbTsNCj4gYmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnOyBwYXVsdXNAc2FtYmEub3JnOyBtcGVA
ZWxsZXJtYW4uaWQuYXU7DQo+IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eHBw
Yy1kZXZAbGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvMyB2Ml0gY2xr
OiBxb3JpcTogdXBkYXRlIGNsb2NrIGRyaXZlcg0KPiANCj4gT24gV2VkLCAyMDE4LTEwLTI0IGF0
IDEwOjExICswODAwLCBhbmR5LnRhbmdAbnhwLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBZdWFudGlh
biBUYW5nIDxhbmR5LnRhbmdAbnhwLmNvbT4NCj4gPg0KPiA+IExlZ2FjeSBiaW5kaW5ncyBhcmUg
ZGVsZXRlZC4gU28gdGhlIGxlZ2FjeSBzdXBwb3J0IGluIGRyaXZlciBjYW4gYmUNCj4gPiBkZWxl
dGVkIHNhZmVseS4NCj4gDQo+IE5BQ0sgKGJvdGggdGhpcyBhbmQgMi8zKS4gIFRoZSBsZWdhY3kg
c3VwcG9ydCBpcyBpbnRlbmRlZCB0byBwcmVzZXJ2ZQ0KPiBjb21wYXRpYmlsaXR5LCByZWdhcmRs
ZXNzIG9mIHdoYXQgdGhlIGR0cyBmaWxlcyBpbiB0aGUgY3VycmVudCBrZXJuZWwgdHJlZSBkby4N
Cj4gIElmIHllYXJzIGxhdGVyIHdlIGZpbmQgaXQncyBiZWVuIGJyb2tlbiBmb3IgYSB3aGlsZSBh
bmQgbm9ib2R5IGNvbXBsYWluZWQsDQo+IHRoZW4gbWF5YmUgaXQnbGwgYmUgdGltZSB0byByZW1v
dmUgaXQsIGJ1dCB3aHkgZGVsaWJlcmF0ZWx5IHRocm93IGF3YXkNCj4gY29tcGF0aWJpbGl0eSB0
aGUgaW5zdGFudCB0aGUgdXNlcnMgaGF2ZSBiZWVuIHJlbW92ZWQgZnJvbSByZWZlcmVuY2UNCj4g
RFRzIHRoYXQgbWlnaHQgYmUgY29waWVkIGJ5IGJvYXJkIHZlbmRvcnMsIGV0Yz8NCj4gDQo+IE5v
dGUgdGhhdCBldmVuIGlmIHdlIGRpZG4ndCBjYXJlIGFib3V0IGxvbmctdGVybSBjb21wYXRpYmls
aXR5IGF0IGFsbCwNCj4gcmVtb3ZpbmcgdGhlIHN1cHBvcnQgaW4gdGhlIHNhbWUgcGF0Y2hzZXQg
YXMgdGhlIGNoYW5nZSB0byB0aGUgZHRzIGZpbGVzDQo+IG1lYW5zIHRoYXQgdGhlIHBhdGNoZXMg
Y2FuJ3QgZ28gaW4gdmlhIHNlcGFyYXRlIHRyZWVzICh0aG91Z2ggaWYgdGhhdCdzIHN0aWxsDQo+
IHRoZSBpbnRlbnQsIHlvdSBzaG91bGQgbWFrZSBpdCBjbGVhciB3aG8geW91J3JlIGFza2luZyB0
byB0YWtlIHdoYXQgYnkNCj4gcHV0dGluZyB0aGVtIGluIHNlcGFyYXRlIHBhdGNoc2V0cykuDQoN
ClBvaW50cyBhcmUgdGFrZW4uIFdpbGwgdXBkYXRlIHRoaXMgcGF0Y2ggc2V0LiBUaGFua3MgYSBs
b3QuDQoNCkJSLA0KQW5keQ0KPiANCj4gLVNjb3R0DQoNCg==
