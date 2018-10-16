Return-Path: <SRS0=Uwhs=M4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00054.outbound.protection.outlook.com ([40.107.0.54]:62584
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726729AbeJPOGQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 16 Oct 2018 10:06:16 -0400
From: Andy Tang <andy.tang@nxp.com>
Subject: RE: [PATCH 1/3] clk: qoriq: add t1023 soc support
Date: Tue, 16 Oct 2018 06:17:18 +0000
Message-ID: <DB5PR0401MB22134ACEF603C05F6B0D9980F3FE0@DB5PR0401MB2213.eurprd04.prod.outlook.com>
References: <20180919073906.34187-1-andy.tang@nxp.com>
In-Reply-To: <20180919073906.34187-1-andy.tang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "oss@buserror.net" <oss@buserror.net>
Cc: "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

SGksDQoNCkFwcHJlY2lhdGUgaWYgeW91IGNhbiB0YWtlIGEgbG9vayBhdCB0aGlzIHBhdGNoIHNl
dC4NCg0KQlIsDQpBbmR5DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
YW5keS50YW5nQG54cC5jb20gPGFuZHkudGFuZ0BueHAuY29tPg0KPiBTZW50OiAyMDE4xOo51MIx
OcjVIDE1OjM5DQo+IFRvOiBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsgb3NzQGJ1c2Vycm9yLm5l
dA0KPiBDYzogc2JveWRAa2VybmVsLm9yZzsgcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxh
bmRAYXJtLmNvbTsNCj4gbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7IEFuZHkgVGFuZw0KPiA8YW5keS50YW5nQG54cC5jb20+DQo+IFN1YmplY3Q6
IFtQQVRDSCAxLzNdIGNsazogcW9yaXE6IGFkZCB0MTAyMyBzb2Mgc3VwcG9ydA0KPiANCj4gRnJv
bTogWXVhbnRpYW4gVGFuZyA8YW5keS50YW5nQG54cC5jb20+DQo+IA0KPiBBZGQgdDEwMjMgY2xv
Y2sgY29tcGF0aWJsZSBzdHJpbmcgdG8gdGhlIGJpbmRpbmdzLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogVGFuZyBZdWFudGlhbiA8YW5keS50YW5nQG54cC5jb20+DQo+IC0tLQ0KPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY2xvY2svcW9yaXEtY2xvY2sudHh0ICAgICAgfCAgICAxICsNCj4gIDEg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9xb3JpcS1j
bG9jay50eHQNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svcW9y
aXEtY2xvY2sudHh0DQo+IGluZGV4IDk3ZjQ2YWQuLjM0ZTE5MzMgMTAwNjQ0DQo+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9xb3JpcS1jbG9jay50eHQNCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3FvcmlxLWNsb2Nr
LnR4dA0KPiBAQCAtMzcsNiArMzcsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiAgCSogImZz
bCxsczEwNDZhLWNsb2NrZ2VuIg0KPiAgCSogImZzbCxsczEwODhhLWNsb2NrZ2VuIg0KPiAgCSog
ImZzbCxsczIwODBhLWNsb2NrZ2VuIg0KPiArCSogImZzbCx0MTAyMy1jbG9ja2dlbiINCj4gIAlD
aGFzc2lzLXZlcnNpb24gY2xvY2sgc3RyaW5ncyBpbmNsdWRlOg0KPiAgCSogImZzbCxxb3JpcS1j
bG9ja2dlbi0xLjAiOiBmb3IgY2hhc3NpcyAxLjAgY2xvY2tzDQo+ICAJKiAiZnNsLHFvcmlxLWNs
b2NrZ2VuLTIuMCI6IGZvciBjaGFzc2lzIDIuMCBjbG9ja3MNCj4gLS0NCj4gMS43LjENCg0K
