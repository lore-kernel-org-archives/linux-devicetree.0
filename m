From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v6 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Tue, 4 Jun 2019 08:17:34 +0000
Message-ID: <BYAPR07MB47099815FA4691B6106F80FEDD150@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1554882504-9010-1-git-send-email-pawell@cadence.com>
 <1554882504-9010-6-git-send-email-pawell@cadence.com>
 <b768bde9-d6c8-f655-aecb-d08bcb9286a6@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b768bde9-d6c8-f655-aecb-d08bcb9286a6@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Pg0KPk9uIDEwLzA0LzE5IDE6MTggUE0sIFBhd2VsIExhc3pjemFrIHdyb3RlOg0KPj4gK3N0YXRp
YyB2b2lkIGNkbnMzX3dhMV90cmF5X3Jlc3RvcmVfY3ljbGVfYml0KHN0cnVjdCBjZG5zM19kZXZp
Y2UgKnByaXZfZGV2LA0KPj4gKwkJCQkJICAgICBzdHJ1Y3QgY2RuczNfZW5kcG9pbnQgKnByaXZf
ZXApDQo+PiArew0KPj4gKwlpbnQgZG1hX2luZGV4Ow0KPj4gKwl1MzIgZG9vcmJlbGw7DQo+PiAr
DQo+PiArCWRvb3JiZWxsID0gISEocmVhZGwoJnByaXZfZGV2LT5yZWdzLT5lcF9jbWQpICYgRVBf
Q01EX0RSRFkpOw0KPg0KPj4gKwlkbWFfaW5kZXggPSAocmVhZGwoJnByaXZfZGV2LT5yZWdzLT5l
cF90cmFkZHIpIC0NCj4+ICsJCSAgICBwcml2X2VwLT50cmJfcG9vbF9kbWEpIC8gVFJCX1NJWkU7
DQo+DQo+VGhpcyBnZXRzIHVwZ3JhZGVkIHRvIDY0LWJpdCBieSA2NC1iaXQgZGl2aXNpb24gd2hl
bmV2ZXIgZG1hX2FkZHJfdCBpcw0KPjY0LWJpdC4gVGhhdCBzaG91bGQgYmUgYXZvaWRlZC4gRm9s
bG93aW5nIGRpZmYgc2hvdWxkIGZpeCBpdC4NCj5CdXQgcGxlYXNlIHJldmlldyB0aGUgbG9naWMg
aXRzZWxmLiBZb3UgYXJlIHN1YnRyYWN0aW5nIGEgNjQgYml0IGVudGl0eQ0KPmZyb20gYSAzMi1i
aXQgZW50aXR5LiBXaGF0IGlzIGd1YXJhbnRlZWluZyB0aGF0IHByaXZfZXAtPnRyYl9wb29sX2Rt
YSBpcw0KPjMyLWJpdD8NCj4NCj5UaGVyZSBpcyBvbmUgbW9yZSBpbnN0YW5jZSBvZiBzYW1lIGlz
c3VlIGluIGNkbnMzX3JlcXVlc3RfaGFuZGxlZCgpLg0KPg0KPlRoYW5rcywNCj5TZWtoYXINCj4N
Cj5bMV0NCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY2RuczMvZ2FkZ2V0LmMgYi9kcml2ZXJz
L3VzYi9jZG5zMy9nYWRnZXQuYw0KPmluZGV4IGJmZDVkYmY0MGM3ZS4uZTczYjYxODUwMWZiIDEw
MDY0NA0KPi0tLSBhL2RyaXZlcnMvdXNiL2NkbnMzL2dhZGdldC5jDQo+KysrIGIvZHJpdmVycy91
c2IvY2RuczMvZ2FkZ2V0LmMNCj5AQCAtNzQ5LDggKzc0OSw4IEBAIHN0YXRpYyB2b2lkIGNkbnMz
X3dhMV90cmF5X3Jlc3RvcmVfY3ljbGVfYml0KHN0cnVjdCBjZG5zM19kZXZpY2UgKnByaXZfZGV2
LA0KPiAJdTMyIGRvb3JiZWxsOw0KPg0KPiAJZG9vcmJlbGwgPSAhIShyZWFkbCgmcHJpdl9kZXYt
PnJlZ3MtPmVwX2NtZCkgJiBFUF9DTURfRFJEWSk7DQo+LQlkbWFfaW5kZXggPSAocmVhZGwoJnBy
aXZfZGV2LT5yZWdzLT5lcF90cmFkZHIpIC0NCj4tCQkgICAgcHJpdl9lcC0+dHJiX3Bvb2xfZG1h
KSAvIFRSQl9TSVpFOw0KPisJZG1hX2luZGV4ID0gcmVhZGwoJnByaXZfZGV2LT5yZWdzLT5lcF90
cmFkZHIpIC0gcHJpdl9lcC0+dHJiX3Bvb2xfZG1hOw0KPisJZG1hX2luZGV4IC89IFRSQl9TSVpF
Ow0KDQpIaSBTZWtoYXIsDQoNCkluIHRoZSBuZXh0IGxhdGVzdCB2ZXJzaW9uIEkgYWRkZWQgc2V0
dGluZyBkbWEgYW5kIGNvaGVyZW50IG1hc2sgdG8gMzItYml0cyBhcyBzdWdnZXN0ZWQgYnkgUm9n
ZXIuIA0KQ29udHJvbGxlciBjYW4gZG8gb25seSAzMi1iaXQgYWNjZXNzLg0KDQpETUEgYWRkcmVz
cyBzcGFjZSBzaG91bGQgYmUgYWxsb2NhdGVkIGZyb20gZmlyc3QgMzIgYml0cyBvZiBhZGRyZXNz
IHNwYWNlLiBNb3N0IHNpZ25pZmljYW50IDMyLWJpdCANCm9mIHByaXZfZXAtPnRyYl9wb29sX2Rt
YSBzaG91bGQgYmUgemVyb2VkLCBzbyBJIGRvIG5vdCBhc3N1bWUgYW55IGlzc3VlIGluIHRoaXMg
cGxhY2UuDQoNCkhhdmUgeW91IHNlZW4gYW55IGlzc3VlIHdpdGggdGhpcyBvbiB5b3VyIHBsYXRm
b3JtID8NCg0KVGhhbmtzLA0KUGF3ZWwsDQo=
