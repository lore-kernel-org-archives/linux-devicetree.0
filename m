Return-Path: <SRS0=bzs4=TH=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 03/10] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
Date: Tue, 7 May 2019 14:43:41 +0000
Message-ID: 
 <TY1PR01MB1562C153ABE676047F568BBD8A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-4-chris.brandt@renesas.com>
 <17bcc673-5fed-ce4f-3d61-af34bfa5d769@cogentembedded.com>
 <TY1PR01MB1562550164C7977D28C90F128A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <34544f59-76aa-710a-a6ec-7d7d7f31a023@cogentembedded.com>
In-Reply-To: <34544f59-76aa-710a-a6ec-7d7d7f31a023@cogentembedded.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

T24gVHVlLCBNYXkgMDcsIDIwMTkgMSwgU2VyZ2VpIFNodHlseW92IHdyb3RlOg0KPiAgICBEb24n
dCB5b3UgcmVtZW1iZXIgYW5vdGhlciBydWxlOiB1c2Uge30gaW4gYWxsIGJyYW5jaGVzIGlmIGF0
IGxlYXN0DQo+IG9uZSBicmFuY2ggdXNlcyB7fT8NCg0KQWgsIEkgc2VlIGl0IG5vdy4NCg0KRG9j
dW1lbnRhdGlvbi9wcm9jZXNzL2NvZGluZy1zdHlsZS5yc3Q6DQoNClRoaXMgZG9lcyBub3QgYXBw
bHkgaWYgb25seSBvbmUgYnJhbmNoIG9mIGEgY29uZGl0aW9uYWwgc3RhdGVtZW50IGlzIGEgc2lu
Z2xlDQpzdGF0ZW1lbnQ7IGluIHRoZSBsYXR0ZXIgY2FzZSB1c2UgYnJhY2VzIGluIGJvdGggYnJh
bmNoZXM6DQoNCi4uIGNvZGUtYmxvY2s6OiBjDQoNCglpZiAoY29uZGl0aW9uKSB7DQoJCWRvX3Ro
aXMoKTsNCgkJZG9fdGhhdCgpOw0KCX0gZWxzZSB7DQoJCW90aGVyd2lzZSgpOw0KCX0NCg0KDQpJ
IHdpbGwgY2hhbmdlIGl0Lg0KVGhhbmtzIQ0KDQpDaHJpcw0K
