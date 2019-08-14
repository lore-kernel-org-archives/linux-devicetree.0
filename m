From: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2 06/15] drm/mxsfb: Update mxsfb with
 additional pixel formats
Date: Wed, 14 Aug 2019 14:58:47 +0000
Message-ID: <1565794726.3209.77.camel@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
 <1565779731-1300-7-git-send-email-robert.chiras@nxp.com>
 <CAPj87rMFG=RGmfVnawbE7qX4zU7vdYxLJB__K4E3B8jcJ764KQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAPj87rMFG=RGmfVnawbE7qX4zU7vdYxLJB__K4E3B8jcJ764KQ@mail.gmail.com>
Content-Language: en-US
Content-ID: <337ECD9F9D598D4CA82689858D08C84D@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "daniel@fooishbar.org" <daniel@fooishbar.org>
Cc: "marex@denx.de" <marex@denx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "airlied@linux.ie" <airlied@linux.ie>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "festevam@gmail.com" <festevam@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgRGFuaWVsLA0KDQpPbiBNaSwgMjAxOS0wOC0xNCBhdCAxMjo0NCArMDEwMCwgRGFuaWVsIFN0
b25lIHdyb3RlOg0KPiBIaSBSb2JlcnQsDQo+IA0KPiBPbiBXZWQsIDE0IEF1ZyAyMDE5IGF0IDEx
OjQ5LCBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+DQo+IHdyb3RlOg0KPiA+
IA0KPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9CR1I1NjU6IC8qIEJHMTYgKi8N
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKG14c2ZiLT5kZXZkYXRhLT5p
cHZlcnNpb24gPCA0KQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZ290byBlcnI7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHdy
aXRlbChDVFJMMl9PRERfTElORV9QQVRURVJOKENUUkwyX0xJTkVfUEFUVEVSTl9CRw0KPiA+IFIp
IHwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoENU
UkwyX0VWRU5fTElORV9QQVRURVJOKENUUkwyX0xJTkVfUEFUVEVSTl8NCj4gPiBCR1IpLA0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbXhzZmItPmJh
c2UgKyBMQ0RDX1Y0X0NUUkwyICsgUkVHX1NFVCk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoC8qIEZhbGwgdGhyb3VnaCAqLw0KPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJN
X0ZPUk1BVF9SR0I1NjU6IC8qIFJHMTYgKi8NCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgY3RybCB8PSBDVFJMX1NFVF9XT1JEX0xFTkdUSCgwKTsNCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgY3RybCAmPSB+Q1RSTF9ERjE2Ow0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBjdHJsMSB8PSBDVFJMMV9TRVRfQllURV9QQUNLQUdJTkcoMHhmKTsN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7DQo+IEZvciBub24tQkdS
IGZvcm1hdHMsIGRvIHlvdSBuZWVkIHRvIHdyaXRlIFJHQiBsaW5lLXBhdHRlcm4gYmFjayB0bw0K
PiB0aGUNCj4gQ1RSTDIgcmVnaXN0ZXI/IE90aGVyd2lzZSwgaWYgeW91IHN0YXJ0IHdpdGggQkdS
NTY1IHRoZW4gc3dpdGNoIGJhY2sNCj4gdG8gUkdCNTY1LCBwcmVzdW1hYmx5IENUUkwyIHdvdWxk
IHN0aWxsIGJlIHByb2dyYW1tZWQgZm9yIEJHUiBzbyB5b3UNCj4gd291bGQgZGlzcGxheSBpbnZl
cnRlZCBjaGFubmVscy4NClRoZSBMSU5FX1BBVFRFUk4gZnJvbcKgTENEQ19WNF9DVFJMMiByZWdp
c3RlciBpcyBjbGVhcmVkIGFib3ZlLCB3aXRoDQp0aGlzIGNvZGU6DQorwqDCoMKgwqDCoMKgwqBp
ZiAobXhzZmItPmRldmRhdGEtPmlwdmVyc2lvbiA+PSA0KQ0KK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHdyaXRlbChDVFJMMl9PRERfTElORV9QQVRURVJOKENUUkwyX0xJTkVfUEFUVEVS
Tl9DTFIpIHwNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoENU
UkwyX0VWRU5fTElORV9QQVRURVJOKENUUkwyX0xJTkVfUEFUVEVSTl9DTFIpLA0KK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbXhzZmItPmJhc2UgKyBMQ0RDX1Y0
X0NUUkwyICsgUkVHX0NMUik7DQo+IA0KPiBTYW1lIGdvZXMgZm9yIGFsbCB0aGUgb3RoZXIgQkdS
L1JHQiBmb3JtYXQgcGFpcnMgYmVsb3cuDQo+IA0KPiBDaGVlcnMsDQo+IERhbmllbA0KDQpUaGFu
a3MsDQpSb2JlcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXJtLWtlcm5lbAo=
