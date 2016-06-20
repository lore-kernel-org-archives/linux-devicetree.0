From: "Yang, Wenyou" <Wenyou.Yang@atmel.com>
Subject: RE: [PATCH v3 1/2] usb: ohci-at91: Forcibly suspend ports while USB
 suspend
Date: Mon, 20 Jun 2016 08:46:02 +0000
Message-ID: <B256D81BAE5131468A838E5D7A24364101650C547F@penmbx01>
References: <1465359311-14544-1-git-send-email-wenyou.yang@atmel.com>
 <1465359311-14544-2-git-send-email-wenyou.yang@atmel.com>
 <20160608202651.GA23604@rob-hp-laptop> <20160608203810.GF2466@piout.net>
 <B256D81BAE5131468A838E5D7A24364101650C3632@penmbx01>
 <20160617135448.GI5809@piout.net>
 <B256D81BAE5131468A838E5D7A24364101650C5253@penmbx01>
 <20160620080334.GL5809@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160620080334.GL5809@piout.net>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "Ferre,
 Nicolas" <Nicolas.FERRE@atmel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgQWxleGFuZHJlICYgTmljb2xhcywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBBbGV4YW5kcmUgQmVsbG9uaSBbbWFpbHRvOmFsZXhhbmRyZS5iZWxsb25pQGZyZWUt
ZWxlY3Ryb25zLmNvbV0NCj4gU2VudDogMjAxNsTqNtTCMjDI1SAxNjowNA0KPiBUbzogWWFuZywg
V2VueW91IDxXZW55b3UuWWFuZ0BhdG1lbC5jb20+DQo+IENjOiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPjsgQWxhbiBTdGVybiA8c3Rlcm5Acm93bGFuZC5oYXJ2YXJkLmVkdT47DQo+IEdy
ZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBGZXJyZSwgTmlj
b2xhcw0KPiA8Tmljb2xhcy5GRVJSRUBhdG1lbC5jb20+OyBQYXdlbCBNb2xsIDxwYXdlbC5tb2xs
QGFybS5jb20+OyBNYXJrIEJyb3duDQo+IDxicm9vbmllQGtlcm5lbC5vcmc+OyBJYW4gQ2FtcGJl
bGwgPGlqYytkZXZpY2V0cmVlQGhlbGxpb24ub3JnLnVrPjsgS3VtYXINCj4gR2FsYSA8Z2FsYWtA
Y29kZWF1cm9yYS5vcmc+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
OyBsaW51eC0NCj4gdXNiQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYz
IDEvMl0gdXNiOiBvaGNpLWF0OTE6IEZvcmNpYmx5IHN1c3BlbmQgcG9ydHMgd2hpbGUgVVNCDQo+
IHN1c3BlbmQNCj4gDQo+IE9uIDIwLzA2LzIwMTYgYXQgMDM6MTY6MzUgKzAwMDAsIFlhbmcsIFdl
bnlvdSB3cm90ZSA6DQo+ID4gPiBTdXJlLCB3aGF0IEkgbWVhbiBpcyB0aGF0IHlvdSBjYW4gdHJ5
IHRvIGdldCB0aGUgcmVnbWFwIGZvciB0aGUgU0ZSIGluIGV2ZXJ5DQo+IGNhc2UuDQo+ID4gPiBE
ZXBlbmRpbmcgb24gd2hldGhlciB5b3Ugd2VyZSBhYmxlIHRvIGdldCBpdCwgeW91IGNhbiBkZWNp
ZGUgdG8gY2FsbA0KPiA+ID4gb2hjaV9hdDkxX3BvcnRfc3VzcGVuZC9yZXN1bWUgb3Igbm90IChq
dXN0IHRlc3QgZm9yIHNmcl9yZWdtYXAgIT0gTlVMTCkuDQo+ID4NCj4gPiBJIGRvbid0IHRoaW5r
IHNvLiBUaGUgU0ZSIGluY2x1ZGVzIGEgbG90IG9mIG1pc2NlbGxhbmVvdXMgZnVuY3Rpb25zLCBt
b3JlIHRoYW4NCj4gdGhpcyBvbmUuDQo+ID4NCj4gDQo+IEkga25vdyBidXQgdGhpcyBpcyBpcnJl
bGV2YW50IHRvIHRoaXMgZGlzY3Vzc2lvbi4gSWYgeW91IG5lZWQgdG8gdXNlIHRoZSBTRlIgZnJv
bQ0KPiBhbm90aGVyIGRyaXZlciB5b3Ugd2lsbCBzaW1wbHkgZ2V0IGl0IGZyb20gdGhhdCBvdGhl
ciBkcml2ZXIuDQo+IA0KPiBJIHRoYXQgY2FzZSwgeW91IHdpbGwgdHJ5IHRvIGdldCAiYXRtZWws
c2FtYTVkMi1zZnIiLiBJdCBpcyBvbmx5IHByZXNlbnQgb24gc2FtYTVkMg0KPiBzbyB5b3UgaGF2
ZSBlbm91Z2ggaW5mb3JtYXRpb24gdG8ga25vdyB3aGV0aGVyIG9yIG5vdCB5b3UgY2FuIHVzZSBp
dCB0bw0KPiBzdXNwZW5kL3Jlc3VtZS4NCg0KSSB1bmRlcnN0YW5kIHdoYXQgeW91ciBtZWFuaW5n
IDopLg0KVXNlICJhdG1lbCxzYW1hNWQyLXNmciIgY29tcGF0aWJsZSB0byBkaXN0aW5ndWlzaCB3
aGV0aGVyIGZvcmNpYmx5IHN1c3BlbmQgVVNCIHBvcnQgdmlhIFNGUiBvciBub3QuDQoNCkkgYW0g
bm90IHN1cmUgaWYgaXQgaXMgYSBiZXR0ZXIgc29sdXRpb24uDQoNCk5pY29sYXMsIGNvdWxkIHlv
dSBnaXZlIHlvdXIgb3Bpbmlvbj8NCg0KPiANCj4gLS0NCj4gQWxleGFuZHJlIEJlbGxvbmksIEZy
ZWUgRWxlY3Ryb25zDQo+IEVtYmVkZGVkIExpbnV4LCBLZXJuZWwgYW5kIEFuZHJvaWQgZW5naW5l
ZXJpbmcgaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQ0KDQoNCkJlc3QgUmVnYXJkcywNCldlbnlv
dSBZYW5nDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsCg==
