From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: [PATCH 1/2] Documentation: DT: vdma: Add clock support for vdma
Date: Wed, 20 Apr 2016 11:30:10 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A5791F3@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1461136800-20334-1-git-send-email-appanad@xilinx.com>
 <CAKfKVtEkfnDqU476troXmCw20ATvQvj-JdPX-BCuPDR-9ZxKHQ@mail.gmail.com>
 <C246CAC1457055469EF09E3A7AC4E11A4A578F73@XAP-PVEXMBX01.xlnx.xilinx.com>
 <571764CF.6070003@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <571764CF.6070003@metafoo.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, Moritz Fischer <moritz.fischer@ettus.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "luis@debethencourt.com" <luis@debethencourt.com>, Anirudha Sarangi <anirudh@xilinx.com>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgTGFycywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXJzLVBl
dGVyIENsYXVzZW4gW21haWx0bzpsYXJzQG1ldGFmb28uZGVdDQo+IFNlbnQ6IFdlZG5lc2RheSwg
QXByaWwgMjAsIDIwMTYgNDo0NSBQTQ0KPiBUbzogQXBwYW5hIER1cmdhIEtlZGFyZXN3YXJhIFJh
byA8YXBwYW5hZEB4aWxpbnguY29tPjsgU2h1YmhyYWp5b3RpIERhdHRhDQo+IDxzaHViaHJhanlv
dGkuZGF0dGFAZ21haWwuY29tPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9y
Zz47IFBhd2VsIE1vbGwgPHBhd2VsLm1vbGxAYXJtLmNvbT47DQo+IE1hcmsgUnV0bGFuZCA8bWFy
ay5ydXRsYW5kQGFybS5jb20+OyBJYW4gQ2FtcGJlbGwNCj4gPGlqYytkZXZpY2V0cmVlQGhlbGxp
b24ub3JnLnVrPjsgS3VtYXIgR2FsYSA8Z2FsYWtAY29kZWF1cm9yYS5vcmc+OyBNaWNoYWwNCj4g
U2ltZWsgPG1pY2hhbHNAeGlsaW54LmNvbT47IFNvcmVuIEJyaW5rbWFubiA8c29yZW5iQHhpbGlu
eC5jb20+Ow0KPiB2aW5vZC5rb3VsQGludGVsLmNvbTsgZGFuLmoud2lsbGlhbXNAaW50ZWwuY29t
OyBNb3JpdHogRmlzY2hlcg0KPiA8bW9yaXR6LmZpc2NoZXJAZXR0dXMuY29tPjsgTGF1cmVudCBQ
aW5jaGFydA0KPiA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPjsgbHVpc0BkZWJl
dGhlbmNvdXJ0LmNvbTsgQW5pcnVkaGENCj4gU2FyYW5naSA8YW5pcnVkaEB4aWxpbnguY29tPjsg
UHVubmFpYWggQ2hvdWRhcnkgS2FsbHVyaQ0KPiA8cHVubmFpYUB4aWxpbnguY29tPjsgZG1hZW5n
aW5lQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIERvY3VtZW50YXRpb246IERUOiB2
ZG1hOiBBZGQgY2xvY2sgc3VwcG9ydCBmb3IgdmRtYQ0KPiANCj4gT24gMDQvMjAvMjAxNiAxMDoz
OSBBTSwgQXBwYW5hIER1cmdhIEtlZGFyZXN3YXJhIFJhbyB3cm90ZToNCj4gWy4uLl0NCj4gPj4g
aG93ZXZlciAgd2Ugc2hvdWxkIGtlZXAgdGhlIG5hbWVzIHNhbWUgYXMgdGhlIFRSTS4NCj4gPg0K
PiA+IFdoeT8/IFdoeSBjYW4ndCB3ZSB1c2Ugc2ltcGxlIGNvbnZlbmllbnQgbmFtZXMgdGhhdCBy
ZWZlcnMgdG8NCj4gPiBlcXVpdmFsZW50IGNsb2NrcyBvZiBoL3cNCj4gDQo+IEJlY2F1c2UgaXQg
aXMgY29uZnVzaW5nLiBJZiB5b3UgdXNlIHRoZSBzYW1lIG5hbWUgaXQncyB2ZXJ5IHN0cmFpZ2h0
IGZvcndhcmQgdG8NCj4gdW5kZXJzdGFuZCB3aGljaCBjbG9jayBpcyBiZWluZyByZWZlcnJlZCB0
by4gVGhhdCdzIG5vdCB0aGUgY2FzZSBpZiB5b3UgY29tZSB1cA0KPiB3aXRoIHJhbmRvbSBuZXcg
bmFtZXMuDQoNCk9rIHdpbGwgZml4IGluIHRoZSB2Mi4uLg0KDQpSZWdhcmRzLA0KS2VkYXIuDQo=
