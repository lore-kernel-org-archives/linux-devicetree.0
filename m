From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v9 0/8] EDAC drivers for Armada XP L2 and DDR
Date: Sun, 28 Jul 2019 20:33:03 +0000
Message-ID: <1564345983.9737.9.camel@alliedtelesis.co.nz>
References: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
         <d1dfe8ec-66e8-e2c8-5421-a18d7e7fc8fc@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d1dfe8ec-66e8-e2c8-5421-a18d7e7fc8fc@arm.com>
Content-Language: en-US
Content-ID: <D7D656BF95F90C47AFC63125E32B5778@atlnz.lc>
Sender: linux-kernel-owner@vger.kernel.org
To: "james.morse@arm.com" <james.morse@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jlu@pengutronix.de" <jlu@pengutronix.de>, "bp@alien8.de" <bp@alien8.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "patches@armlinux.org.uk" <patches@armlinux.org.uk>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAyMDE5LTA3LTI2IGF0IDE1OjUzICswMTAwLCBKYW1lcyBNb3JzZSB3cm90ZToNCj4g
SGkgQ2hyaXMsDQo+IA0KPiBPbiAxMi8wNy8yMDE5IDA0OjQ4LCBDaHJpcyBQYWNraGFtIHdyb3Rl
Og0KPiA+IA0KPiA+IEkgc3RpbGwgc2VlbSB0byBiZSBzdHJ1Z2dsaW5nIHRvIGdldCB0aGlzIG9u
IGFueW9uZSdzIHJhZGFyLg0KPiBXaG9zZSByYWRhciBkb2VzIGl0IG5lZWQgdG8gY3Jvc3M/DQo+
IA0KDQpUaGF0J3MgYSBnb29kIHF1ZXN0aW9uLiBUaGUgbGFzdCBzb2xpZCBndWlkYW5jZSBJIGhh
ZCB3YXMgdGhhdCB0aGlzDQpzZXJpZXMgd2FzIGdvaW5nIGluIHZpYSB0aGUgQVJNIHRyZWUuIEJ1
dCBhcyB5b3Ugc2F5IGJlbG93IHRoYXQgd2FzIHR3bw0KeWVhcnMgYWdvLg0KDQpJIG9ubHkgcmVh
bGlzZWQgcmVjZW50bHkgdGhhdCB0aGUgQVJNIGNvcmUgc2VlbXMgdG8gaGF2ZSBhIGRpZmZlcmVu
dA0Kd29ya2Zsb3cgdG8gb3RoZXIga2VybmVsIHN1YnN5c3RlbXMuDQoNCj4gDQo+ID4gDQo+ID4g
VGhlIFJldmlld3MvQWNrcyBoYXZlIGJlZW4gZ2l2ZW4gc28gdGhpcyBzaG91bGQgYmUgZ29vZCB0
byBnbyBpbg0KPiA+IHZpYSB0aGUgQVJNDQo+ID4gdHJlZSBhcyBwbGFubmVkLg0KPiA+IA0KPiA+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1hcm0ta2VybmVsLzIw
MTctQXVndXN0LzUNCj4gPiAyNTU2MS5odG1sDQo+IEZvciB5b3VyIHY4IEkgdG9vayB0aGlzIHRv
IG1lYW4gdGhpcyBzZXJpZXMgd2FzIGRvbmUhDQo+IA0KPiBJZiBub3RoaW5nIGhhcyBjaGFuZ2Vk
IHdpdGggQm9yaXMgYW5kIFJ1c3NlbGwncyBkZWNpc2lvbiAoaXQgd2FzIHR3bw0KPiB5ZWFycyBh
Z28uLi4uKSwNCj4gZGV0YWlscyBvZiB0aGUgcGF0Y2ggc3lzdGVtIGFyZSBoZXJlOg0KPiANCj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDE5MDYyNDE0MjM0Ni5w
eGxqdjNtNG5wYXRkDQo+IGl5a0BzaGVsbC5hcm1saW51eC5vcmcudWsvDQo+IA0KDQpUaGFua3Mg
Zm9yIHRoZSBsaW5rLiBJIHdvdWxkIGhhdmUgbmV2ZXIgZm91bmQgdGhhdC4gSSBkaWQgdHJ5IHRv
IGZvbGxvdw0Kd2hhdCBJIGNvdWxkIGZpbmQgb27CoGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51
ay9kZXZlbG9wZXIvwqBidXQgYSBsb3QNCm9mIHRoYXQgc2VlbXMgdG8gYmUgb3V0IG9mIGRhdGUu
DQoNCkkgZGlkIG1hbmFnZSB0byBzdWJtaXQgdjkgwqB0byB0aGUgQVJNIHBhdGNoIHRyYWNrZXIg
YnV0IG5hdHVyYWxseSBJDQptZXNzZWQgaXQgdXAgdGhlIGZpcnN0IHRpbWXCoGh0dHBzOi8vd3d3
LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2gNCmVzL3ZpZXdwYXRjaC5waHA/aWQ9ODg3
Ny8xwqBhbmQgSSdtIG5vdCBzdXJlIEkgZ290IHRoZSBzZWNvbmQgYXR0ZW1wdA0KcmlnaHQgZWl0
aGVywqBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvdmlld3Bh
dGNoLnBoDQpwP2lkPTg4ODUvMQ0KDQoNCj4gVGhhbmtzLA0KPiANCj4gSmFtZXM=
