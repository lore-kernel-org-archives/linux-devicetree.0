From: Hou Zhiqiang <B48286@freescale.com>
Subject: RE: [V2,1/2] powerpc/fsl: Add PCI node in device tree of bsc9132qds
Date: Mon, 19 Oct 2015 02:12:32 +0000
Message-ID: <CY1PR0301MB078002CFBCD517A488933DF18B3A0@CY1PR0301MB0780.namprd03.prod.outlook.com>
References: <1444986071-27317-1-git-send-email-B48286@freescale.com>
 <20151017013337.GA22242@home.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20151017013337.GA22242@home.buserror.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Scott Wood <scottwood@freescale.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Harninder Rai <harninder.rai@freescale.com>, "Lian M.H." <Minghuan.Lian@freescale.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "paulus@samba.org" <paulus@samba.org>, Hu Vincent <Mingkai.Hu@freescale.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV29vZCBTY290dC1CMDc0
MjENCj4gU2VudDogMjAxNeW5tDEw5pyIMTfml6UgOTozNA0KPiBUbzogSG91IFpoaXFpYW5nLUI0
ODI4Ng0KPiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc7IGdhbGFrQGtlcm5lbC5j
cmFzaGluZy5vcmc7DQo+IGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZzsgcGF1bHVzQHNhbWJhLm9y
ZzsgbXBlQGVsbGVybWFuLmlkLmF1Ow0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgcm9i
aCtkdEBrZXJuZWwub3JnOyBwYXdlbC5tb2xsQGFybS5jb207DQo+IG1hcmsucnV0bGFuZEBhcm0u
Y29tOyBpamMrZGV2aWNldHJlZUBoZWxsaW9uLm9yZy51azsgUmFpIEhhcm5pbmRlci1CMDEwNDQ7
DQo+IExpYW4gTWluZ2h1YW4tQjMxOTM5OyBIdSBNaW5na2FpLUIyMTI4NA0KPiBTdWJqZWN0OiBS
ZTogW1YyLDEvMl0gcG93ZXJwYy9mc2w6IEFkZCBQQ0kgbm9kZSBpbiBkZXZpY2UgdHJlZSBvZg0K
PiBic2M5MTMycWRzDQo+IA0KPiBPbiBGcmksIE9jdCAxNiwgMjAxNSBhdCAwNTowMToxMFBNICsw
ODAwLCBaaGlxaWFuZyBIb3Ugd3JvdGU6DQo+ID4gRnJvbTogSGFybmluZGVyIFJhaSA8aGFybmlu
ZGVyLnJhaUBmcmVlc2NhbGUuY29tPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSGFybmluZGVy
IFJhaSA8aGFybmluZGVyLnJhaUBmcmVlc2NhbGUuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1p
bmdodWFuIExpYW4gPE1pbmdodWFuLkxpYW5AZnJlZXNjYWxlLmNvbT4NCj4gPiBDaGFuZ2UtSWQ6
IEk0MzU1YWRkNGE5MmQxZmNmNTE0ODQzYWVhNWVjYWRkMmUyNTE3OTY5DQo+ID4gUmV2aWV3ZWQt
b246IGh0dHA6Ly9naXQuYW0uZnJlZXNjYWxlLm5ldDo4MTgxLzI0NTQNCj4gPiBSZXZpZXdlZC1i
eTogWmFuZyBUaWVmZWktUjYxOTExIDx0aWUtZmVpLnphbmdAZnJlZXNjYWxlLmNvbT4NCj4gPiBS
ZXZpZXdlZC1ieTogS3VzaHdhaGEgUHJhYmhha2FyLUIzMjU3OSA8cHJhYmhha2FyQGZyZWVzY2Fs
ZS5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEZsZW1pbmcgQW5kcmV3LUFGTEVNSU5HIDxBRkxFTUlO
R0BmcmVlc2NhbGUuY29tPg0KPiA+IFRlc3RlZC1ieTogRmxlbWluZyBBbmRyZXctQUZMRU1JTkcg
PEFGTEVNSU5HQGZyZWVzY2FsZS5jb20+DQo+IA0KPiBBZ2FpbjoNCj4gDQo+IEdldCByaWQgb2Yg
dGhlIGdlcnJpdCBzdHVmZi4gIEFuZCB3aGVyZSBpcyB5b3VyIHNpZ25vZmY/DQoNCk9rLg0KDQpU
aGFua3MsDQpaaGlxaWFuZw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXhwcGMtZGV2IG1haWxpbmcgbGlzdApMaW51eHBwYy1kZXZAbGlzdHMub3ps
YWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vbGludXhwcGMtZGV2
