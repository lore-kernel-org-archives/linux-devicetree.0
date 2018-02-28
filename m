Return-Path: <SRS0=lHfj=FW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-by2nam01on0110.outbound.protection.outlook.com ([104.47.34.110]:17440
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S933691AbeB1R4C (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Feb 2018 12:56:02 -0500
From: Trent Piepho <tpiepho@impinj.com>
Subject: Re: [PATCHv4 2/3] spi: Add spi driver for Socionext Synquacer
 platform
Date: Wed, 28 Feb 2018 17:55:55 +0000
Message-ID: <1519840555.25567.218.camel@impinj.com>
References: <1519736182-3650-1-git-send-email-jassisinghbrar@gmail.com>
         <1519736330-3985-1-git-send-email-jassisinghbrar@gmail.com>
In-Reply-To: <1519736330-3985-1-git-send-email-jassisinghbrar@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4252E45543B33348A8E328B5C9EC21A0@namprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "jaswinder.singh@linaro.org" <jaswinder.singh@linaro.org>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "masami.hiramatsu@linaro.org" <masami.hiramatsu@linaro.org>
List-ID: <devicetree@vger.kernel.org>

T24gVHVlLCAyMDE4LTAyLTI3IGF0IDE4OjI4ICswNTMwLCBqYXNzaXNpbmdoYnJhckBnbWFpbC5j
b20gd3JvdGU6DQo+IEZyb206IEphc3NpIEJyYXIgPGphc3dpbmRlci5zaW5naEBsaW5hcm8ub3Jn
Pg0KPiANCj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIGNvbnRyb2xsZXIgZm91bmQgb24g
c3lucXVhY2VyIHBsYXRmb3Jtcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc3NpIEJyYXIgPGph
c3dpbmRlci5zaW5naEBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvc3BpL0tjb25maWcg
ICAgICAgICB8ICAxMSArDQo+ICBkcml2ZXJzL3NwaS9NYWtlZmlsZSAgICAgICAgfCAgIDEgKw0K
PiAgZHJpdmVycy9zcGkvc3BpLXN5bnF1YWNlci5jIHwgNjYzICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDY3NSBpbnNlcnRp
b25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zcGkvc3BpLXN5bnF1YWNlci5j
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvS2NvbmZpZyBiL2RyaXZlcnMvc3BpL0tj
b25maWcNCj4gaW5kZXggNjAzNzgzOS4uOWUwNGJiZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9z
cGkvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL3NwaS9LY29uZmlnDQo+IEBAIC02NTksNiArNjU5
LDE3IEBAIGNvbmZpZyBTUElfU1VONkkNCj4gIAloZWxwDQo+ICAJICBUaGlzIGVuYWJsZXMgdXNp
bmcgdGhlIFNQSSBjb250cm9sbGVyIG9uIHRoZSBBbGx3aW5uZXIgQTMxIFNvQ3MuDQo+ICANCj4g
K2NvbmZpZyBTUElfU1lOUVVBQ0VSDQo+ICsJdHJpc3RhdGUgIlNvY2lvbmV4dCdzIFN5bnF1YWNl
ciBIaWdoU3BlZWQgU1BJIGNvbnRyb2xsZXIiDQo+ICsJZGVwZW5kcyBvbiBBUkNIX1NZTlFVQUNF
UiB8fCBDT01QSUxFX1RFU1QNCj4gKwlzZWxlY3QgU1BJX0JJVEJBTkcNCj4gKwloZWxwDQo+ICsJ
ICBTUEkgZHJpdmVyIGZvciBTb2Npb25leHQncyBIaWdoIHNwZWVkIFNQSSBjb250cm9sbGVyIHdo
aWNoIHByb3ZpZGVzDQo+ICsJICB2YXJpb3VzIG9wZXJhdGluZyBtb2RlcyBmb3IgaW50ZXJmYWNp
bmcgdG8gc2VyaWFsIHBlcmlwaGVyYWwgZGV2aWNlcw0KPiArCSAgdGhhdCB1c2UgdGhlIGRlLWZh
Y3RvIHN0YW5kYXJkIFNQSSBwcm90b2NvbC4NCj4gKw0KPiArCSAgSXQgYWxzbyBzdXBwb3J0cyB0
aGUgbmV3IGR1YWwtYml0IGFuZCBxdWFkLWJpdCBTUEkgcHJvdG9jb2wuDQo+ICsNCg0KQXMgc29t
ZW9uZSB3aG8gZGVzaWducyBhbmQgZGV2ZWxvcHMgZW1iZWRkZWQgTGludXggZGV2aWNlcywgaXQg
d291bGQgYmUNCnJlYWxseSB1c2VmdWwgaWYgdGhlcmUgd2FzIGEgYml0IG1vcmUgZG9jdW1lbnRh
dGlvbiBhYm91dCB0aGUgZHJpdmVyLg0KDQpUaGUgaGFyZHdhcmUgZG9lc24ndCBzdXBwb3J0IERN
QSBvciBldmVuIGludGVycnVwdHMsIGFuZCBtdXN0IGJ1c3kgd2FpdA0KZm9yIHRoZSBkdXJhdGlv
biBvZiB0aGUgZW50aXJlIFNQSSB0cmFuc2ZlcnMuICBUaGF0J3Mga2luZCBvZiBhIEJpZw0KRGVh
bC4gIEEgZGVzaWduIHRoYXQgaW52b2x2ZXMgbG90cyBvZiBTUEkgdHJhbnNmZXJzIG9uIGEgc2xv
dyBjbG9jaw0Kd2lsbCB3b3JrIGZpbmUgb24gbW9zdCBTUEkgaGFyZHdhcmUsIGJ1dCB3aWxsIGJl
IHV0dGVybHkgdW5mZWFzaWJsZQ0KaGVyZS4gIEl0IHdvdWxkIGJlIG5pY2UgdG8gc2F5IHNvbWV0
aGluZyBhYm91dCB0aGF0LiAgSSdkIHByb2JhYmx5IHB1dA0KaXQgaW4gZHJpdmVyIGNvZGUu
