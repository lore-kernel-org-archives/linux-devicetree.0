From: Manish Narani <MNARANI@xilinx.com>
Subject: RE: [PATCH v4 0/4] EDAC: Enhancements to Synopsys EDAC driver
Date: Mon, 6 Aug 2018 13:58:27 +0000
Message-ID: <SN6PR02MB4959577EB1CE589F980E6A43C1200@SN6PR02MB4959.namprd02.prod.outlook.com>
References: <1533374735-16662-1-git-send-email-manish.narani@xilinx.com>
 <20180804163230.GA8157@nazgul.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180804163230.GA8157@nazgul.tnic>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Michal Simek <michals@xilinx.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mdf@kernel.org" <mdf@kernel.org>, Edgar Iglesias <edgari@xilinx.com>, Shubhrajyoti Datta <shubhraj@xilinx.com>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Bharat Kumar Gogada <bharatku@xilinx.com>, "stefan.krsmanovic@aggios.com" <stefan.krsmanovic@aggios.com>, Srinivas Goud <sgoud@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGkgQm9yaXMsDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jp
c2xhdiBQZXRrb3YgW21haWx0bzpicEBhbGllbjguZGVdDQo+IFNlbnQ6IFNhdHVyZGF5LCBBdWd1
c3QgNCwgMjAxOCAxMDowMyBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDAvNF0gRURBQzog
RW5oYW5jZW1lbnRzIHRvIFN5bm9wc3lzIEVEQUMgZHJpdmVyDQo+IA0KPiBPbiBTYXQsIEF1ZyAw
NCwgMjAxOCBhdCAwMjo1NTozMVBNICswNTMwLCBNYW5pc2ggTmFyYW5pIHdyb3RlOg0KPiA+IFRo
aXMgcGF0Y2ggc2VyaWVzIGVuaGFuY2VzIHRoZSBjdXJyZW50IEVEQUMgZHJpdmVyIHRvIHN1cHBv
cnQNCj4gPiBkaWZmZXJlbnQNCj4gDQo+IFRoaXMgb25lLCB5b3VyIDIvNCBhbmQgNC80IHN0aWxs
IHNheXMgInRoaXMgcGF0Y2giLiBIdXJyaWVkIHRvbyBtdWNoPw0KPiBIb3cgYWJvdXQgc2xvd2lu
ZyBkb3duIGFuZCBsb29raW5nIGF0IHRoZW0gd2l0aCBhIGNyaXRpY2FsIGV5ZT8NCj4gDQo+IEFs
c28sIGhvdyBhYm91dCB3YWl0aW5nIGZvciBhIHdlZWsgYmVmb3JlIHJlc2VuZGluZyB5b3VyIHBh
dGNoZXMgc28gdGhhdCB5b3UNCj4gZ2l2ZSBwZW9wbGUgY2hhbmNlIHRvIHJldmlldyB0aGVtIHRv
bz8NCj4gDQo+IFdoaWxlIHlvdSB3YWl0LCBwbGVhc2UgcmVhZCBEb2N1bWVudGF0aW9uL3Byb2Nl
c3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdA0KPiAtIGl0J2xsIGhlbHAgeW91IHdpdGggdGhlIHN1
Ym1pc3Npb24gbW9kYWxpdGllcy4NCg0KWWVzLCBJIG1pc3NlZCBpdC4gU29ycnkgZm9yIHRoYXQu
IEkgd2lsbCBzdXJlbHkgd2FpdCBmb3IgYXJvdW5kIGEgd2VlayBmb3Igb3RoZXJzIHRvIHJldmll
dy4NClRoYW5rcyBmb3IgdGhlIGd1aWRhbmNlLg0KDQpUaGFua3MsDQpNYW5pc2ggTmFyYW5pDQo=
