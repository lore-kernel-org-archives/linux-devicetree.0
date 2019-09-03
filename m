From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: RE: [PATCH v3 11/11] misc: pci_endpoint_test: Add LS1088a in
 pci_device_id table
Date: Tue, 3 Sep 2019 01:52:30 +0000
Message-ID: <AM5PR04MB3299D598229952C13C492B48F5B90@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-12-xiaowei.bao@nxp.com>
 <20190902125454.GK9720@e119886-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190902125454.GK9720@e119886-lin.cambridge.arm.com>
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
To: Andrew Murray <andrew.murray@arm.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Roy Zang <roy.zang@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "arnd@arndb.de" <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IE11cnJheSA8
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo51MIyyNUgMjA6NTUNCj4gVG86
IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiBDYzogcm9iaCtkdEBrZXJuZWwu
b3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvDQo+IExp
IDxsZW95YW5nLmxpQG54cC5jb20+OyBraXNob25AdGkuY29tOyBsb3JlbnpvLnBpZXJhbGlzaUBh
cm0uY29tOyBNLmguDQo+IExpYW4gPG1pbmdodWFuLmxpYW5AbnhwLmNvbT47IE1pbmdrYWkgSHUg
PG1pbmdrYWkuaHVAbnhwLmNvbT47IFJveQ0KPiBaYW5nIDxyb3kuemFuZ0BueHAuY29tPjsgamlu
Z29vaGFuMUBnbWFpbC5jb207DQo+IGd1c3Rhdm8ucGltZW50ZWxAc3lub3BzeXMuY29tOyBsaW51
eC1wY2lAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsNCj4gYXJuZEBhcm5kYi5k
ZTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IFoucS4gSG91DQo+IDx6aGlxaWFuZy5ob3VA
bnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxMS8xMV0gbWlzYzogcGNpX2VuZHBv
aW50X3Rlc3Q6IEFkZCBMUzEwODhhIGluDQo+IHBjaV9kZXZpY2VfaWQgdGFibGUNCj4gDQo+IE9u
IE1vbiwgU2VwIDAyLCAyMDE5IGF0IDExOjE3OjE2QU0gKzA4MDAsIFhpYW93ZWkgQmFvIHdyb3Rl
Og0KPiA+IEFkZCBMUzEwODhhIGluIHBjaV9kZXZpY2VfaWQgdGFibGUgc28gdGhhdCBwY2ktZXBm
LXRlc3QgY2FuIGJlIHVzZWQNCj4gPiBmb3IgdGVzdGluZyBQQ0llIEVQIGluIExTMTA4OGEuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4N
Cj4gPiAtLS0NCj4gPiB2MjoNCj4gPiAgLSBObyBjaGFuZ2UuDQo+ID4gdjM6DQo+ID4gIC0gTm8g
Y2hhbmdlLg0KPiA+DQo+ID4gIGRyaXZlcnMvbWlzYy9wY2lfZW5kcG9pbnRfdGVzdC5jIHwgMSAr
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWlzYy9wY2lfZW5kcG9pbnRfdGVzdC5jDQo+ID4gYi9kcml2ZXJzL21pc2Mv
cGNpX2VuZHBvaW50X3Rlc3QuYw0KPiA+IGluZGV4IDZlMjA4YTAuLmQ1MzE5NTEgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9taXNjL3BjaV9lbmRwb2ludF90ZXN0LmMNCj4gPiArKysgYi9kcml2
ZXJzL21pc2MvcGNpX2VuZHBvaW50X3Rlc3QuYw0KPiA+IEBAIC03OTMsNiArNzkzLDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkDQo+IHBjaV9lbmRwb2ludF90ZXN0X3RibFtd
ID0gew0KPiA+ICAJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfVEksIFBDSV9ERVZJQ0VfSURf
VElfRFJBNzR4KSB9LA0KPiA+ICAJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfVEksIFBDSV9E
RVZJQ0VfSURfVElfRFJBNzJ4KSB9LA0KPiA+ICAJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURf
RlJFRVNDQUxFLCAweDgxYzApIH0sDQo+ID4gKwl7IFBDSV9ERVZJQ0UoUENJX1ZFTkRPUl9JRF9G
UkVFU0NBTEUsIDB4ODBjMCkgfSwNCj4gDQo+IFRoZSBGcmVlc2NhbGUgUENJIGRldmljZXMgYXJl
IHRoZSBvbmx5IGRldmljZXMgaW4gdGhpcyB0YWJsZSB0aGF0IGRvbid0IGhhdmUgYQ0KPiBkZWZp
bmUgZm9yIHRoZWlyIGRldmljZSBJRC4gSSB0aGluayBhIGRlZmluZSBzaG91bGQgYmUgY3JlYXRl
ZCBmb3IgYm90aCBvZiB0aGUNCj4gZGV2aWNlIElEcyBhYm92ZS4NCg0KT0ssIGJ1dCBJIG9ubHkg
ZGVmaW5lIGluIHRoaXMgZmlsZSwgSSBhbSBub3Qgc3VyZSB0aGlzIGNhbiBkZWZpbmUgaW4gaW5j
bHVkZS9saW51eC9wY2lfaWRzLmgNCmZpbGUgDQoNClRoYW5rcyANClhpYW93ZWkNCg0KPiANCj4g
VGhhbmtzLA0KPiANCj4gQW5kcmV3IE11cnJheQ0KPiANCj4gPiAgCXsgUENJX0RFVklDRV9EQVRB
KFNZTk9QU1lTLCBFRERBLCBOVUxMKSB9LA0KPiA+ICAJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1Jf
SURfVEksIFBDSV9ERVZJQ0VfSURfVElfQU02NTQpLA0KPiA+ICAJICAuZHJpdmVyX2RhdGEgPSAo
a2VybmVsX3Vsb25nX3QpJmFtNjU0X2RhdGENCj4gPiAtLQ0KPiA+IDIuOS41DQo+ID4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
