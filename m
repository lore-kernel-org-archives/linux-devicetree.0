Return-Path: <SRS0=ZPg/=RD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr40058.outbound.protection.outlook.com ([40.107.4.58]:54991
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726335AbfB1JK2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Feb 2019 04:10:28 -0500
From: Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 2/2] usb: typec: add typec switch via GPIO control
Date: Thu, 28 Feb 2019 09:10:23 +0000
Message-ID: <VI1PR04MB45583D8E64D63E74A811400089750@VI1PR04MB4558.eurprd04.prod.outlook.com>
References: <1551078369-1654-1-git-send-email-jun.li@nxp.com>
 <1551078369-1654-2-git-send-email-jun.li@nxp.com>
 <20190227094031.GD27730@kuha.fi.intel.com>
In-Reply-To: <20190227094031.GD27730@kuha.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGVpa2tpIEtyb2dlcnVz
IDxoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAyMDE5xOoy1MIyN8jV
IDE3OjQxDQo+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPg0KPiBDYzogcm9iaCtkdEBrZXJu
ZWwub3JnOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgaGRlZ29lZGVAcmVkaGF0LmNvbTsN
Cj4gYW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbTsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsN
Cj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54
cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSB1c2I6IHR5cGVjOiBhZGQgdHlwZWMg
c3dpdGNoIHZpYSBHUElPIGNvbnRyb2wNCj4gDQo+IE9uIE1vbiwgRmViIDI1LCAyMDE5IGF0IDA3
OjI3OjA4QU0gKzAwMDAsIEp1biBMaSB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGFkZHMgYSBzaW1w
bGUgdHlwZWMgc3dpdGNoIGRyaXZlciB3aGljaCBvbmx5IG5lZWRzIGEgR1BJTw0KPiA+IHRvIHN3
aXRjaCB0aGUgc3VwZXIgc3BlZWQgYWN0aXZlIGNoYW5uZWwgYWNjb3JkaW5nIHRvIHR5cGVjDQo+
ID4gb3JpZW50YXRpb24uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaSBKdW4gPGp1bi5saUBu
eHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3VzYi90eXBlYy9tdXgvS2NvbmZpZyAgICAg
ICB8ICAgNiArKysNCj4gPiAgZHJpdmVycy91c2IvdHlwZWMvbXV4L01ha2VmaWxlICAgICAgfCAg
IDEgKw0KPiA+ICBkcml2ZXJzL3VzYi90eXBlYy9tdXgvZ3Bpby1zd2l0Y2guYyB8IDEwNQ0KPiA+
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAzIGZpbGVzIGNoYW5n
ZWQsIDExMiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Vz
Yi90eXBlYy9tdXgvZ3Bpby1zd2l0Y2guYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL3R5cGVjL211eC9LY29uZmlnDQo+ID4gYi9kcml2ZXJzL3VzYi90eXBlYy9tdXgvS2NvbmZp
ZyBpbmRleCAwMWVkMGQ1Li5iYzdkM2M3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL3R5
cGVjL211eC9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy91c2IvdHlwZWMvbXV4L0tjb25maWcN
Cj4gPiBAQCAtOSw0ICs5LDEwIEBAIGNvbmZpZyBUWVBFQ19NVVhfUEkzVVNCMzA1MzINCj4gPiAg
CSAgU2F5IFkgb3IgTSBpZiB5b3VyIHN5c3RlbSBoYXMgYSBQZXJpY29tIFBJM1VTQjMwNTMyIFR5
cGUtQyBjcm9zcw0KPiA+ICAJICBzd2l0Y2ggLyBtdXggY2hpcCBmb3VuZCBvbiBzb21lIGRldmlj
ZXMgd2l0aCBhIFR5cGUtQyBwb3J0Lg0KPiA+DQo+ID4gK2NvbmZpZyBUWVBFQ19TV0lUQ0hfR1BJ
Tw0KPiA+ICsJdHJpc3RhdGUgIlNpbXBsZSBTdXBlciBTcGVlZCBBY3RpdmUgU3dpdGNoIHZpYSBH
UElPIg0KPiANCj4gZGVwZW5kcyBvbiBHUElPTElCPw0KDQpZZXMsIHlvdSBhcmUgcmlnaHQsIHdp
bGwgYWRkIGl0IGluIHYyLg0KDQpUaGFua3MNCkxpIEp1bg0KPiANCj4gPiArCWhlbHANCj4gPiAr
CSAgU2F5IFkgb3IgTSBpZiB5b3VyIHN5c3RlbSBoYXMgYSB0eXBlYyBzdXBlciBzcGVlZCBjaGFu
bmVsDQo+ID4gKwkgIHN3aXRjaCB2aWEgYSBzaW1wbGUgR1BJTyBjb250cm9sLg0KPiA+ICsNCj4g
DQo+IHRoYW5rcywNCj4gDQo+IC0tDQo+IGhlaWtraQ0K
