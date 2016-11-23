From: Troy Jia <hongtao.jia@nxp.com>
Subject: RE: [PATCH V3 1/2] powerpc/mpc85xx: Update TMU device tree node for
 T1040/T1042
Date: Wed, 23 Nov 2016 07:14:30 +0000
Message-ID: <AM4PR0401MB18433E61BF1550676423E255EBB70@AM4PR0401MB1843.eurprd04.prod.outlook.com>
References: <1477361742-589-1-git-send-email-hongtao.jia@nxp.com>
 <1479884833.21746.44.camel@buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1479884833.21746.44.camel@buserror.net>
Content-Language: zh-CN
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Scott Wood <oss@buserror.net>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Scott Wood <scott.wood@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2NvdHQgV29vZCBbbWFp
bHRvOm9zc0BidXNlcnJvci5uZXRdDQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMjMsIDIw
MTYgMzowNyBQTQ0KPiBUbzogVHJveSBKaWEgPGhvbmd0YW8uamlhQG54cC5jb20+OyBydWkuemhh
bmdAaW50ZWwuY29tOyBlZHViZXp2YWxAZ21haWwuY29tOw0KPiByb2JoK2R0QGtlcm5lbC5vcmc7
IFNjb3R0IFdvb2QgPHNjb3R0Lndvb2RAbnhwLmNvbT47IHNoYXduZ3VvQGtlcm5lbC5vcmcNCj4g
Q2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJz
Lm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFYzIDEvMl0gcG93ZXJw
Yy9tcGM4NXh4OiBVcGRhdGUgVE1VIGRldmljZSB0cmVlIG5vZGUgZm9yDQo+IFQxMDQwL1QxMDQy
DQo+IA0KPiBPbiBUdWUsIDIwMTYtMTAtMjUgYXQgMTA6MTUgKzA4MDAsIEppYSBIb25ndGFvIHdy
b3RlOg0KPiA+IEZyb206IEhvbmd0YW8gSmlhIDxob25ndGFvLmppYUBueHAuY29tPg0KPiA+DQo+
ID4gVXBkYXRlICN0aGVybWFsLXNlbnNvci1jZWxscyBmcm9tIDAgdG8gMSBhY2NvcmRpbmcgdG8g
dGhlIG5ldyBiaW5kaW5nLg0KPiA+IFRoZSBzZW5zb3Igc3BlY2lmaWVyIGFkZGVkIGlzIHRoZSBt
b25pdG9yaW5nIHNpdGUgSUQsIGFuZCByZXByZXNlbnRzDQo+ID4gdGhlICJuIiBpbiBUUklUU1Ju
IGFuZCBUUkFUU1JuLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmlhIEhvbmd0YW8gPGhvbmd0
YW8uamlhQG54cC5jb20+DQo+IA0KPiBXaGVyZSBjYW4gSSBmaW5kIHRoaXMgbmV3IGJpbmRpbmc/
IMKgQXMgb2YgdGhlIGN1cnJlbnQgbGludXgtbmV4dCBJIGRvbid0IHNlZSBhbnl0aGluZw0KPiBp
biBxb3JpcS10aGVybWFsLnR4dCBhYm91dCB0aGlzLg0KDQpIaSBSdWkgWmhhbmcsDQoNCkFzIHdl
IGRpc2N1c3NlZCBiZWZvcmUuIFRoZSB0aW1lIHdhcyBpbmFwcHJvcHJpYXRlIGFzIG1lcmdlIHdp
bmRvdyB3YXMgYWJvdXQgdG8gY2xvc2UuDQpTbyBkbyB5b3UgaGF2ZSBhbnkgcGxhbiBmb3IgYXBw
bHlpbmcgdGhlIGJpbmRpbmcgZmlsZSByZWNlbnRseT8NCg0KLUhvbmd0YW8uDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
