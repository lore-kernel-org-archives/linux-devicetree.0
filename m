Return-Path: <Sneeker.Yeh@tw.fujitsu.com>
From: Sneeker.Yeh <Sneeker.Yeh@tw.fujitsu.com>
Date: Wed, 17 Dec 2014 23:46:54 +0800
Subject: RE: [PATCH 1/3] usb: host: f_usb20ho: add support for Fujitsu
 ehci/ohci USB 2.0 host controller
Message-ID: <830AC58E49A426478AC39824BC0FA915D8BB402BB8@fmpitwmsex01.fmpi.sea.css.fujitsu.com>
References: <1418695828-605-1-git-send-email-Sneeker.Yeh@tw.fujitsu.com>
 <94603263.7VVvg5Qn7O@wuerfel>
 <830AC58E49A426478AC39824BC0FA915D8BB402BB7@fmpitwmsex01.fmpi.sea.css.fujitsu.com>
 <2084132.xT3x4RUEre@wuerfel>
In-Reply-To: <2084132.xT3x4RUEre@wuerfel>
Content-Language: zh-TW
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sneeker Yeh <sneeker.yeh@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Grant Likely <grant.likely@linaro.org>, Alan Stern <stern@rowland.harvard.edu>, Paul Bolle <pebolle@tiscali.nl>, Hans de Goede <hdegoede@redhat.com>, Thomas Pugliese <thomas.pugliese@gmail.com>, David Mosberger <davidm@egauge.net>, Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, Andy Green <andy.green@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-ID: <devicetree@vger.kernel.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEFybmQgQmVyZ21hbm4gW21h
aWx0bzphcm5kQGFybmRiLmRlXQ0KPlNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMTcsIDIwMTQg
MTE6NDQgUE0NCj5UbzogU25lZWtlci5ZZWgNCj5DYzogU25lZWtlciBZZWg7IFJvYiBIZXJyaW5n
OyBQYXdlbCBNb2xsOyBNYXJrIFJ1dGxhbmQ7IElhbiBDYW1wYmVsbDsgS3VtYXINCj5HYWxhOyBG
ZWxpcGUgQmFsYmk7IEdyZWcgS3JvYWgtSGFydG1hbjsgTWF0aGlhcyBOeW1hbjsgR3JhbnQgTGlr
ZWx5OyBBbGFuDQo+U3Rlcm47IFBhdWwgQm9sbGU7IEhhbnMgZGUgR29lZGU7IFRob21hcyBQdWds
aWVzZTsgRGF2aWQgTW9zYmVyZ2VyOyBQZXRlcg0KPkdyaWZmaW47IFN5bHdlc3RlciBOYXdyb2Nr
aTsgQW5kcmV3IEJyZXN0aWNrZXI7IEdyZWdvcnkgQ0xFTUVOVDsgWW9zaGloaXJvDQo+U2hpbW9k
YTsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7DQo+bGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgbGludXgtb21hcEB2Z2VyLmtlcm5lbC5v
cmc7IEFuZHkgR3JlZW47IEphc3NpIEJyYXINCj5TdWJqZWN0OiBSZTogW1BBVENIIDEvM10gdXNi
OiBob3N0OiBmX3VzYjIwaG86IGFkZCBzdXBwb3J0IGZvciBGdWppdHN1IGVoY2kvb2hjaQ0KPlVT
QiAyLjAgaG9zdCBjb250cm9sbGVyDQo+DQo+T24gV2VkbmVzZGF5IDE3IERlY2VtYmVyIDIwMTQg
MjM6MzM6MDIgU25lZWtlci4gWWVoIHdyb3RlOg0KPj4gPg0KPj4gPk5vIG5lZWQgZm9yIHBsYXlp
bmcgZ2FtZXMgd2l0aCBjaGlsZCBkZXZpY2VzLCBqdXN0IHNlZSBob3cgdGhlIG90aGVyDQo+PiA+
ZHJpdmVycyBkbyBpdC4NCj4+DQo+PiBJIGFtIHdvbmRlcmluZyBpZiB0aGlzIGlzIHdoYXQgeW91
IG1lbnRpb25lZCBoZXJlPyA6DQo+PiBIY2QyMTogZl91c2IyMGhvIHsNCj4+ICAgICAgICAgY29t
cGF0aWJsZSA9ICJmdWppdHN1LGZfdXNiMjBobyI7DQo+PiAgICAgICAgIC4uLg0KPj4gICAgICAg
ICBFaGNpIHsNCj4+ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImdlbmVyaWMtZWhjaSI7
DQo+PiAgICAgICAgICAgICAgICAgcmVnID0gPD47DQo+PiAgICAgICAgIH0NCj4+ICAgICAgICAg
b2hjaSB7DQo+PiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJnZW5lcmljLW9oY2kiOw0K
Pj4gICAgICAgICAgICAgICAgIHJlZyA9IDw+Ow0KPj4gICAgICAgICB9DQo+PiB9DQo+PiBCeSBk
b2luZyB0aGF0LCBJIGNhbiBqdXN0IHVzZSBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSgpIHRvIGNyZWF0
ZQ0KPj4gcGxhdGZvcm0gZGV2aWNlIG1vcmUgZ3JhY2VmdWxseSwgdGhhbiB1c2luZyBwbGF0Zm9y
bV9kZXZpY2VfeHh4KCkgdGhvc2UNCj5oYXZlIGJlZW4gZG9uZSBpbiBvZl9wbGF0Zm9ybV9wb3B1
bGF0ZSgpLg0KPj4gQW5kIGFsc28sIG1hbmFnaW5nIHJlZ2lzdGVyIG9mZnNldCBpcyB0b3RhbGx5
IGRvbmUgdmlhIGR0cyBkZXNjcmlwdGlvbiwgbm90IGluDQo+dGhlIGNvZGUuDQo+DQo+V2hhdCBJ
IG1lYW4gaXMgbGVhdmluZyBvdXQgdGhlIGZ1aml0c3UsZl91c2IyMGhvIG5vZGUgZW50aXJlbHks
IGp1c3QgcHV0IHRoZSB0d28NCj5VU0IgY29udHJvbGxlcnMgb24gdGhlIGJ1cyBkaXJlY3RseSBh
bmQgcmVtb3ZlIHRoaXMgZHJpdmVyLg0KDQpPa2F5LCBJIHNlZSBpdCBub3cuDQpUaGFua3MuDQoN
Ck11Y2ggYXBwcmVjaWF0ZSwNClNuZWVrZXINCg0KPg0KPiAgICAgICAgQXJuZA0KPg0KPi0tLS0t
DQo+pbymYqa5sFSup6Skp+So7K9mrHKhQw0KPqR3s3q5TCBBVkcgwMusZCAtIHd3dy5hdmcuY29t
DQo+qqmluzogMjAxMi4wLjIyNDkgLyCvZqxyrnc6IDQyMzUvODI1MSAtILVvp0ek6bTBOiAxMi8x
Ny8xNA0K
