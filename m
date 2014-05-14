From: Neil Zhang <zhangwm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v4] ARM: perf: save/restore pmu registers in pm notifier
Date: Tue, 13 May 2014 19:28:02 -0700
Message-ID: <9034CBD80F070943B59700D7F8149ED9A087573F@SC-VEXCH4.marvell.com>
References: <1398133596-29170-1-git-send-email-zhangwm@marvell.com>
 <20140422103642.GF7484@arm.com>
 <175CCF5F49938B4D99B2E3EF7F558EBE5507A3B59B@SC-VEXCH4.marvell.com>
 <20140423170821.GJ5649@arm.com>
 <175CCF5F49938B4D99B2E3EF7F558EBE5507A3C1F1@SC-VEXCH4.marvell.com>
 <5360FB07.5030407@arm.com>
 <6106CAF835F351419ADA79E4836E6EC71B6A53C826@SC-VEXCH4.marvell.com>
 <9034CBD80F070943B59700D7F8149ED9A0875730@SC-VEXCH4.marvell.com>
 <20140513184503.GF16388@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140513184503.GF16388-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Will Deacon' <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, "'linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org'" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "'linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org'" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "'linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "'devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBXaWxsIERlYWNvbiBbbWFpbHRv
OndpbGwuZGVhY29uQGFybS5jb21dDQo+IFNlbnQ6IDIwMTTE6jXUwjE0yNUgMjo0NQ0KPiBUbzog
TmVpbCBaaGFuZw0KPiBDYzogU3VkZWVwIEhvbGxhOyAnbGludXhAYXJtLmxpbnV4Lm9yZy51ayc7
DQo+ICdsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcnOyAnbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZyc7DQo+ICdkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZycNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2NF0gQVJNOiBwZXJmOiBzYXZlL3Jlc3RvcmUgcG11IHJlZ2lzdGVy
cyBpbiBwbSBub3RpZmllcg0KPiANCj4gT24gTW9uLCBNYXkgMTIsIDIwMTQgYXQgMTE6MjI6MDlB
TSArMDEwMCwgTmVpbCBaaGFuZyB3cm90ZToNCj4gPiA+ID4gVGhlIGRldmljZSB0cmVlIGJpbmRp
bmdzIGZvciBwb3dlciBkb21haW5zIGlzIHVuZGVyIGRpc2N1c3Npb24gWzFdDQo+ID4gPg0KPiA+
ID4gVGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24uDQo+ID4gPiBCdXQgaXQgY3VycmVudGx5IGZv
ciBkZXZpY2Ugb25seSwgY29yZSByZWxhdGVkIHN0dWZmIGFyZSBub3Qgc3VwcG9ydGVkLg0KPiA+
ID4gQW5kIGlzIGl0IHJlYWxseSBnb29kIHRvIHJlZ2lzdGVyIHBvd2VyIHByb3ZpZGVyIGZvciBj
b3JlIGFuZCBsZXQNCj4gPiA+IHZmcCAvIHBtdSBldGMgdG8gZ2V0IGl0Pw0KPiA+ID4NCj4gPg0K
PiA+IFdoYXQncyB5b3VyIHN1Z2dlc3Rpb24gYWJvdXQgaXQ/DQo+ID4gSXMgaXQgT0sgdGhhdCBJ
IGFkZCBpdCB1bmRlciB0aGUgUE1VIG5vZGU/DQo+IA0KPiBJIGRvbid0IHJlYWxseSBtaW5kLiBJ
IGp1c3Qgd2FudCB0byBhdm9pZCByZS1pbnZlbnRpbmcgdGhlIHdoZWVsIGluIGENCj4gUE1VLXNw
ZWNpZmljIHdheSBhbmQgaGF2aW5nIHRvIG1haW50YWluIHRoYXQgY29kZSBmb3JldmVyIGJlY2F1
c2UgaXQgZW5kZWQNCj4gdXAgaW4gb3VyIERUIGRlc2NyaXB0aW9uLg0KPiANCj4gV2lsbA0KDQpJ
IHdpbGwgcHJlcGFyZSBhbm90aGVyIHBhdGNoIHRvIGFkZCBEVCBkZXNjcmlwdGlvbiB1bmRlciBQ
TVUgc2luY2UgdGhlcmUgaXMgDQpubyBnZW5lcmljIHBvd2VyIGRvbWFpbiBzdXBwb3J0IGZvciBw
bSBub3RpZmllciBpZiBubyBvdGhlciBjb25jZXJucy4NCldlIGNhbiBjaGFuZ2UgdGhlIG1hbm5l
ciBpZiB0aGVyZSBpcyBnZW5lcmljIHBvd2VyIGRvbWFpbiBzdXBwb3J0IGZvciBwbSBub3RpZmll
ciBsYXRlci4NClRoYW5rcy4NCg0KQmVzdCBSZWdhcmRzLA0KTmVpbCBaaGFuZw0K
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
