From: Liberman Igal <Igal.Liberman@freescale.com>
Subject: RE: [PATCH] powerpc/mpc85xx: Add pcsphy nodes to FManV3 device tree
Date: Tue, 22 Dec 2015 08:53:21 +0000
Message-ID: <DM2PR03MB509BC216FC7290C255B94CBE6E50@DM2PR03MB509.namprd03.prod.outlook.com>
References: <1450655851-6556-1-git-send-email-igal.liberman@freescale.com>
 <VI1PR04MB1664BA0097C2C574F084F544E8E50@VI1PR04MB1664.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <VI1PR04MB1664BA0097C2C574F084F544E8E50@VI1PR04MB1664.eurprd04.prod.outlook.com>
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
To: Shaohui Xie <shaohui.xie@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: Scott Wood <scottwood@freescale.com>, Shaohui Xie <Shaohui.Xie@freescale.com>, Madalin-Cristian Bucur <madalin.bucur@freescale.com>
List-Id: devicetree@vger.kernel.org

CgpSZWdhcmRzLApJZ2FsIExpYmVybWFuCgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4g
RnJvbTogU2hhb2h1aSBYaWUgW21haWx0bzpzaGFvaHVpLnhpZUBueHAuY29tXQo+IFNlbnQ6IFR1
ZXNkYXksIERlY2VtYmVyIDIyLCAyMDE1IDg6MjcgQU0KPiBUbzogTGliZXJtYW4gSWdhbC1CMzE5
NTAgPElnYWwuTGliZXJtYW5AZnJlZXNjYWxlLmNvbT47Cj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnCj4gQ2M6IFdvb2QgU2NvdHQtQjA3
NDIxIDxzY290dHdvb2RAZnJlZXNjYWxlLmNvbT47IEJ1Y3VyIE1hZGFsaW4tCj4gQ3Jpc3RpYW4t
QjMyNzE2IDxtYWRhbGluLmJ1Y3VyQGZyZWVzY2FsZS5jb20+OyBYaWUgU2hhb2h1aS1CMjE5ODkK
PiA8U2hhb2h1aS5YaWVAZnJlZXNjYWxlLmNvbT4KPiBTdWJqZWN0OiBSRTogW1BBVENIXSBwb3dl
cnBjL21wYzg1eHg6IEFkZCBwY3NwaHkgbm9kZXMgdG8gRk1hblYzCj4gZGV2aWNlIHRyZWUKPiAK
PiA+IEBAIC01NSw2ICs1NSw3IEBAIGZtYW5ANDAwMDAwIHsKPiA+ICAJCXJlZyA9IDwweGUwMDAw
IDB4MTAwMD47Cj4gPiAgCQlmc2wsZm1hbi1wb3J0cyA9IDwmZm1hbjBfcnhfMHgwOCAmZm1hbjBf
dHhfMHgyOD47Cj4gPiAgCQlwdHAtdGltZXIgPSA8JnB0cF90aW1lcjA+Owo+ID4gKwkJcGNzcGh5
LWhhbmRsZSA9IDwmcGNzcGh5MD47Cj4gPiAgCX07Cj4gPgo+ID4gIAltZGlvQGUxMDAwIHsKPiA+
IEBAIC02Miw1ICs2Myw5IEBAIGZtYW5ANDAwMDAwIHsKPiA+ICAJCSNzaXplLWNlbGxzID0gPDA+
Owo+ID4gIAkJY29tcGF0aWJsZSA9ICJmc2wsZm1hbi1tZW1hYy1tZGlvIiwgImZzbCxmbWFuLXht
ZGlvIjsKPiA+ICAJCXJlZyA9IDwweGUxMDAwIDB4MTAwMD47Cj4gPiArCj4gPiArCQlwY3NwaHkw
OiBldGhlcm5ldC1waHlAMCB7Cj4gPiArCQkJcmVnID0gPDB4MD47Cj4gPiArCQl9Owo+ID4gIAl9
Owo+ID4gIH07Cj4gCj4gW1MuSF0gc25pcC4KPiAKPiA+ICAJbWRpb0BlMTAwMCB7Cj4gPiBAQCAt
NTgsNSArNTksOSBAQCBmbWFuQDQwMDAwMCB7Cj4gPiAgCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiA+
ICAJCWNvbXBhdGlibGUgPSAiZnNsLGZtYW4tbWVtYWMtbWRpbyIsICJmc2wsZm1hbi14bWRpbyI7
Cj4gPiAgCQlyZWcgPSA8MHhlMTAwMCAweDEwMDA+Owo+ID4gKwo+ID4gKwkJcGNzcGh5MDogcGNz
LXBoeUAwIHsKPiA+ICsJCQlyZWcgPSA8MHgwPjsKPiA+ICsJCX07Cj4gPiAgCX07Cj4gW1MuSF0g
U2hvdWxkIHVzZSAnZXRoZXJuZXQtcGh5Jywgc2FtZSBhcyBhYm92ZS4KPiAKCkknbGwgcmVzdWJt
aXQgYW5kIGZpeCB0aGlzIChwY3MtcGh5IC0tLT4gZXRoZXJuZXQtcGh5KS4KClRoYW5rIHlvdSwK
SWdhbAoKPiBUaGFua3MsCj4gU2hhb2h1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXhwcGMtZGV2IG1haWxpbmcgbGlzdApMaW51eHBwYy1kZXZA
bGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vbGludXhw
cGMtZGV2
