Return-Path: <SRS0=bzs4=TH=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 03/10] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
Date: Tue, 7 May 2019 11:45:04 +0000
Message-ID: 
 <TY1PR01MB1562550164C7977D28C90F128A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-4-chris.brandt@renesas.com>
 <17bcc673-5fed-ce4f-3d61-af34bfa5d769@cogentembedded.com>
In-Reply-To: <17bcc673-5fed-ce4f-3d61-af34bfa5d769@cogentembedded.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

T24gVHVlLCBNYXkgMDcsIDIwMTksIFNlcmdlaSBTaHR5bHlvdiB3cm90ZToNCj4gPiAtLS0gYS9k
cml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yY2FyLWdlbjMtdXNiMi5jDQo+ID4gKysrIGIvZHJpdmVy
cy9waHkvcmVuZXNhcy9waHktcmNhci1nZW4zLXVzYjIuYw0KPiA+IEBAIC00MDgsNyArNDA4LDEy
IEBAIHN0YXRpYyBpbnQgcmNhcl9nZW4zX3BoeV91c2IyX2luaXQoc3RydWN0IHBoeSAqcCkNCj4g
PiAgCQlpZiAocmNhcl9nZW4zX25lZWRzX2luaXRfb3RnKGNoYW5uZWwpKQ0KPiA+ICAJCQlyY2Fy
X2dlbjNfaW5pdF9vdGcoY2hhbm5lbCk7DQo+ID4gIAkJcnBoeS0+b3RnX2luaXRpYWxpemVkID0g
dHJ1ZTsNCj4gPiAtCX0NCj4gPiArCX0gZWxzZQ0KPiANCj4gICAgV2FpdCwgZG9uJ3Qgd2UgbmVl
ZWQge30gaGVyZT8NCj4gDQo+ID4gKwkJLyogTm90IE9URywgc28gZHJfbW9kZSBzaG91bGQgYmUg
c2V0IGluIFBIWSBub2RlICovDQo+ID4gKwkJaWYgKHVzYl9nZXRfZHJfbW9kZShjaGFubmVsLT5k
ZXYpID09IFVTQl9EUl9NT0RFX1BFUklQSEVSQUwpDQo+ID4gKwkJCXdyaXRlbCgweDgwMDAwMDAw
LCB1c2IyX2Jhc2UgKyBVU0IyX0NPTU1DVFJMKTsNCj4gPiArCQllbHNlDQo+ID4gKwkJCXdyaXRl
bCgweDAwMDAwMDAwLCB1c2IyX2Jhc2UgKyBVU0IyX0NPTU1DVFJMKTsNCg0KVGVjaG5pY2FsbHkg
dGhlcmUgaXMgb25seSAxIHN0YXRlbWVudCBhZnRlciB0aGUgZWxzZSAodGhlICdpZicgd2hpY2gg
DQp3aWxsIGFsc28gaW5jbHVkZSB0aGUgJ2Vsc2UnKSBzdGF0ZW1lbnQuIFRoZSBjb2RpbmcgcnVs
ZXMgc2F5IG5vdCB0byB1c2UNCnsgfSBpZiB0aGVyZSBpcyBvbmx5IDEgc3RhdGVtZW50Lg0KDQoN
CkNocmlzDQo=
