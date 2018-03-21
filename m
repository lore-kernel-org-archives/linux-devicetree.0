Return-Path: <SRS0=ljBG=GL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-he1eur01on0084.outbound.protection.outlook.com ([104.47.0.84]:48448
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751459AbeCULNi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 21 Mar 2018 07:13:38 -0400
From: Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 1/5] usb: typec: tcpm: source pdo selection update
Date: Wed, 21 Mar 2018 11:13:34 +0000
Message-ID: <VI1PR0402MB39177169CD440072D318B61D89AA0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
References: <1521541570-25363-1-git-send-email-jun.li@nxp.com>
 <1521541570-25363-2-git-send-email-jun.li@nxp.com>
 <adaf1af5-d8f4-6b8c-7258-3cb75bedc9ad@redhat.com>
In-Reply-To: <adaf1af5-d8f4-6b8c-7258-3cb75bedc9ad@redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "rmfrfs@gmail.com" <rmfrfs@gmail.com>, "yueyao.zhu@gmail.com" <yueyao.zhu@gmail.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

SGkNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFucyBkZSBHb2VkZSBb
bWFpbHRvOmhkZWdvZWRlQHJlZGhhdC5jb21dDQo+IFNlbnQ6IDIwMTjlubQz5pyIMjDml6UgMjA6
MjcNCj4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+OyBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZzsNCj4gcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsNCj4gaGVp
a2tpLmtyb2dlcnVzQGxpbnV4LmludGVsLmNvbTsgbGludXhAcm9lY2stdXMubmV0OyBybWZyZnNA
Z21haWwuY29tOw0KPiB5dWV5YW8uemh1QGdtYWlsLmNvbQ0KPiBDYzogbGludXgtdXNiQHZnZXIu
a2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteA0KPiA8
bGludXgtaW14QG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS81XSB1c2I6IHR5cGVj
OiB0Y3BtOiBzb3VyY2UgcGRvIHNlbGVjdGlvbiB1cGRhdGUNCj4gDQo+IEhpLA0KPiANCj4gT24g
MjAtMDMtMTggMTE6MjYsIExpIEp1biB3cm90ZToNCj4gPiBJbnN0ZWFkIG9mIG9ubHkgY29tcGFy
ZSBiZXR3ZWVuIHRoZSBzYW1lIHBkbyB0eXBlIG9mIHNpbmsgYW5kIHNvdXJjZSwNCj4gPiB0aGlz
IHBhdGNoIHVwZGF0ZSB0aGUgc291cmNlIHBkbyBzZWxlY3Rpb24gYnkgY2hlY2tpbmcgdGhlIHNv
dXJjZSBwZG8NCj4gPiB2b2x0YWdlIHJhbmdlIGlzIHdpdGhpbiB0aGF0IG9mIHNpbmsuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMaSBKdW4gPGp1bi5saUBueHAuY29tPg0KPiANCj4gVGhpcyBw
YXRjaCBhcHBsaWVzIG9uIHRvcCBvZiB0aGUgYnJva2VuIHJldmVydGVkIGNvbW1pdCwgYnV0IHRo
ZSByZXZlcnQgaGFzDQo+IGFscmVhZHkgYmVlbiBtZXJnZWQgYnkgTGludXM6DQo+IA0KPiBodHRw
czovL2VtZWEwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNB
JTJGJTJGZ2l0LmtlDQo+IHJuZWwub3JnJTJGcHViJTJGc2NtJTJGbGludXglMkZrZXJuZWwlMkZn
aXQlMkZ0b3J2YWxkcyUyRmxpbnV4LmdpdCUyDQo+IEZjb21taXQlMkZkcml2ZXJzJTJGdXNiJTJG
dHlwZWMlM0ZpZCUzRDZmNTY2YWYzNDYyODk3ZmM3NDNlM2FmNmVhDQo+IDhjYzc5MGExMzE0OGJh
JmRhdGE9MDIlN0MwMSU3Q2p1bi5saSU0MG54cC5jb20lN0MxODhmMmNkZmE1ZWI0NGFmDQo+IGQy
NzgwOGQ1OGU1ZGQxM2MlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0Mw
JTcNCj4gQzYzNjU3MTQ1NTk1OTM2MTA1NiZzZGF0YT1Dam5zRzByeElmSm5tMEsydFF5RGJGeElQ
NEFscyUyQlRUMjQzRmgNCj4geTdVWXlJJTNEJnJlc2VydmVkPTANCj4gDQo+IFRoaXMgY29tbWl0
IGlzIG5vdCBpbiB1c2ItbmV4dCBiZWNhdXNlIGl0IHdlbnQgaW50byA0LjE2IGFzIGZpeCBhZnRl
ciA0LjE2LXJjMS4NCj4gQXMgYWxyZWFkeSBtZW50aW9uZWQgaW4gYW5vdGhlciByaHJlYWQgdGhp
cyBuZWVkcyB0byBiZSBiYWNrLW1lcmdlZCBpbnRvDQo+IHVzYi1uZXh0Lg0KPiANCj4gU28gdGhp
cyBuZWVkcyB0byBiZSByZXNwdW4gdG8gYXBwbHkgb24gdG9wIG9mIHRoZSByZXZlcnQgc28gdGhh
dCBpdCBjYW4gYmUNCj4gbWVyZ2VkIHdpdGhvdXQgaXNzdWVzIHdpdGggVG9ydmFsZCdzIHRyZWUg
bGF0ZXIuDQoNCk9LLCBJIHdpbGwgZG8gdGhlIHJlYmFzZSBpbiB2Mi4NCg0KVGhhbmtzDQpKdW4N
Cg==
