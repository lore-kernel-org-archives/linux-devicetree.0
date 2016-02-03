From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v4 1/2] ARM: dts: imx6: Add support for Toradex Apalis
 iMX6Q/D SoM
Date: Wed, 3 Feb 2016 23:02:22 +0000
Message-ID: <1454540539.11389.14.camel@toradex.com>
References: <1453675703-31594-1-git-send-email-marcel.ziswiler@toradex.com>
 <1453675703-31594-2-git-send-email-marcel.ziswiler@toradex.com>
 <20160201132916.GF10671@tiger> <1454540116.11389.11.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1454540116.11389.11.camel@toradex.com>
Content-Language: en-US
Content-ID: <BE1E3865C33D9A49A080281B47040E68@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "stillcompiling@gmail.com" <stillcompiling@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "galak@codeaurora.org" <galak@codeaurora.org>, "ynezz@true.cz" <ynezz@true.cz>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE2LTAyLTAzIGF0IDIzOjU1ICswMTAwLCBNYXJjZWwgWmlzd2lsZXIgd3JvdGU6
DQo+IE9uIE1vbiwgMjAxNi0wMi0wMSBhdCAyMToyOSArMDgwMCwgU2hhd24gR3VvIHdyb3RlOg0K
PiANCj4gW3NuaXBdDQo+IA0KPiA+ICsJLyogU1RNUEU4MTEgdG91Y2ggc2NyZWVuIGNvbnRyb2xs
ZXIgKi8NCj4gPiA+ICsJc3RtcGU4MTFANDEgew0KPiA+ID4gKwkJY29tcGF0aWJsZSA9ICJzdCxz
dG1wZTgxMSI7DQo+ID4gDQo+ID4gVGhlIGNvbXBhdGlibGUgc2VlbXMgdG8gYmUgdXNlZCBieSBr
ZXJuZWwgd2l0aG91dCBhIGJpbmRpbmcNCj4gPiBkb2N1bWVudC4NCj4gDQo+IEluZGVlZCBhbmQg
bG9va2luZyBhdCBnaXQgbG9ncyBMaW51cyBoaW1zZWxmIGludHJvZHVjZWQgaXQgKDstcCk6DQo+
IA0KPiBjb21taXQgNWE4MjZmZWVkYzMzMWEyZDVjZWQyYWZkODMyMTk5YTcwYjNhZjg5MQ0KPiBB
dXRob3I6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gRGF0ZTrC
oMKgwqBXZWQgQXByIDIzIDIzOjM1OjU4IDIwMTQgKzAyMDANCj4gU3ViamVjdDogbWZkOiBzdG1w
ZTogUHJvYmUgcHJvcGVybHkgZnJvbSB0aGUgRGV2aWNlIFRyZWUNCg0KTG9va2luZyBtb3JlIGNs
b3NlbHkgdGhlcmUgaXMgYWN0dWFsbHkgYSBwcm9wZXIgYmluZGluZyBkb2N1bWVudCB3aGljaA0K
Z290IGFkZGVkIGJ5IExlZSBKb25lczoNCg0KY29tbWl0IDg0ZTZkZTgxM2IyZDFiZGIxMjc5NDNk
M2M4ZWRmMWMxYWZhYTkwZGENCkF1dGhvcjogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4NCkRhdGU6wqDCoMKgTW9uIE5vdiA1IDE2OjEwOjM0IDIwMTIgKzAxMDANClN1YmplY3Q6IERv
Y3VtZW50YXRpb246IERlc2NyaWJlIGJpbmRpbmdzIGZvciBTVE1QRSBNdWx0aS1GdW5jdGlvbmFs
DQpEZXZpY2UgZHJpdmVyDQoNCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQv
c3RtcGUudHh0DQoNClJlcXVpcmVkIHByb3BlcnRpZXM6DQrCoC0gY29tcGF0aWJsZcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgOiAic3Qsc3RtcGVbODExfDE2MDF8MjQwMXwy
NDAzXSINCg0KU29ycnkgZm9yIHRoZSBub2lzZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
