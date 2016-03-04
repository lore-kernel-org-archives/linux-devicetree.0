From: Zhiqiang Hou <zhiqiang.hou@nxp.com>
Subject: RE: [PATCH v2 2/2] ARM64: dts: add LS1043a-QDS board support
Date: Fri, 4 Mar 2016 03:38:56 +0000
Message-ID: <AM4PR04MB2148E7CB47720D13909B442884BE0@AM4PR04MB2148.eurprd04.prod.outlook.com>
References: <1450948298-33238-1-git-send-email-Zhiqiang.Hou@freescale.com>
 <1450948298-33238-2-git-send-email-Zhiqiang.Hou@freescale.com>
 <20160219032830.GG6756@tiger>
 <HE1PR04MB0906707F686591B374AA364F84A00@HE1PR04MB0906.eurprd04.prod.outlook.com>
 <20160228023818.GB22051@tiger>
 <AM4PR04MB2148867ED34556A79AC0EB1584BB0@AM4PR04MB2148.eurprd04.prod.outlook.com>
 <CADRPPNQLifp1SsZZ+7W8FBWQ=m-nE0DqMWv+6C0uR7+ot9odEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CADRPPNQLifp1SsZZ+7W8FBWQ=m-nE0DqMWv+6C0uR7+ot9odEg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Li Yang <leoli@freescale.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Shaohui.Xie@freescale.com" <Shaohui.Xie@freescale.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, Zhiqiang Hou <Zhiqiang.Hou@freescale.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "galak@codeaurora.org" <galak@codeaurora.org>, "scottwood@freescale.com" <scottwood@freescale.com>, "Mingkai.Hu@freescale.com" <Mingkai.Hu@freescale.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgTGVvLA0KDQpZZXMsIEkgYW0gYnVzeSB3aXRoIGxzMTA0NmEgZW11IGFuZCBzZGsgd29ya2lu
ZyB0aG9zZSBkYXlzLCBhbmQgd2lsbCBzdWJtaXQgdjMgYmVmb3JlIG5leHQgVHVlc2RheS4NCg0K
VGhhbmtzLA0KWmhpcWlhbmcNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBwa3UubGVvQGdtYWlsLmNvbSBbbWFpbHRvOnBrdS5sZW9AZ21haWwuY29tXSBPbiBCZWhhbGYg
T2YgTGkgWWFuZw0KPiBTZW50OiAyMDE25bm0M+aciDTml6UgNDoyOA0KPiBUbzogWmhpcWlhbmcg
SG91IDx6aGlxaWFuZy5ob3VAbnhwLmNvbT4NCj4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2Vy
bmVsLm9yZz47IFpoaXFpYW5nIEhvdQ0KPiA8WmhpcWlhbmcuSG91QGZyZWVzY2FsZS5jb20+OyBt
YXJrLnJ1dGxhbmRAYXJtLmNvbTsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IFNoYW9o
dWkuWGllQGZyZWVzY2FsZS5jb207IHBhd2VsLm1vbGxAYXJtLmNvbTsNCj4gaWpjK2RldmljZXRy
ZWVAaGVsbGlvbi5vcmcudWs7IGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tOyB3aWxsLmRlYWNvbkBh
cm0uY29tOw0KPiByb2JoK2R0QGtlcm5lbC5vcmc7IGdhbGFrQGNvZGVhdXJvcmEub3JnOyBzY290
dHdvb2RAZnJlZXNjYWxlLmNvbTsNCj4gTWluZ2thaS5IdUBmcmVlc2NhbGUuY29tOyBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAy
LzJdIEFSTTY0OiBkdHM6IGFkZCBMUzEwNDNhLVFEUyBib2FyZCBzdXBwb3J0DQo+IA0KPiBIaSBa
aGlxaWFuZywNCj4gDQo+IFdpbGwgdGhlcmUgYmUgYSB2MyBjb21pbmcgb3V0IGJlZm9yZSB0aGUg
NC42IG1lcmdlIHdpbmRvd3M/DQo+IA0KPiBSZWdhcmRzLA0KPiBMZW8NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
