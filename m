From: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH v2] dt-bindings: aspeed-lpc: Make parameter optional
Date: Tue, 29 Jan 2019 23:00:11 +0000
Message-ID: <A29B3BAA-8FA1-4FED-AB8D-C6DA2C2F785C@fb.com>
References: <20190118201547.640173-1-vijaykhemka@fb.com>
 <20190129123008.GC24070@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190129123008.GC24070@dell>
Content-Language: en-US
Content-ID: <AF1F6947D459C44888696407724BBA09@namprd15.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

VGhhbmtzIExlZSwNCg0K77u/T24gMS8yOS8xOSwgNDozMCBBTSwgIkxlZSBKb25lcyIgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiB3cm90ZToNCg0KICAgIE9uIEZyaSwgMTggSmFuIDIwMTksIFZpamF5
IEtoZW1rYSB3cm90ZToNCiAgICANCiAgICA+IE1lbW9yeS1yZWdpb24gYW5kIGZsYXNoIHBoYW5k
bGUgaXMgbm90IGEgcmVxdWlyZWQgcGFyYW1ldGVyLCBpdCBpcw0KICAgID4gb3B0aW9uYWwgdG8g
ZGVzY3JpYmUgaW4gZGV2aWNlIHRyZWUgYW5kIG5lZWRlZCBvbmx5IHVzZSBiYXNpcy4NCiAgICA+
IA0KICAgID4gU2lnbmVkLW9mZi1ieTogVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+
DQogICAgPiAtLS0NCiAgICA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZk
L2FzcGVlZC1scGMudHh0IHwgMyArKysNCiAgICA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspDQogICAgPiANCiAgICA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWZkL2FzcGVlZC1scGMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21mZC9hc3BlZWQtbHBjLnR4dA0KICAgID4gaW5kZXggMzRkZDg5MDg3Y2ZmLi5k
MjhjNGUxMTc2MTEgMTAwNjQ0DQogICAgPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWZkL2FzcGVlZC1scGMudHh0DQogICAgPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWZkL2FzcGVlZC1scGMudHh0DQogICAgPiBAQCAtMTM1LDYgKzEz
NSw5IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQogICAgPiAgLSBjbG9ja3M6CWNvbnRhaW5zIGEg
cGhhbmRsZSB0byB0aGUgc3lzY29uIG5vZGUgZGVzY3JpYmluZyB0aGUgY2xvY2tzLg0KICAgID4g
IAkJVGhlcmUgc2hvdWxkIHRoZW4gYmUgb25lIGNlbGwgcmVwcmVzZW50aW5nIHRoZSBjbG9jayB0
byB1c2UNCiAgICA+ICANCiAgICA+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOg0KICAgID4gK1RoZXNl
IGJlbG93IHByb3BlcnRpZXMgYXJlIG9wdGlvbmFsIHRvIGRlZmluZS4NCiAgICANCiAgICBUaGlz
IGxpbmUgaXMgc3VwZXJmbHVvdXMuICBQbGVhc2UgcmVtb3ZlIGl0Lg0KSSB3aWxsIHJlbW92ZSBp
dC4gSSBhbSBhc3N1bWluZyBvbmx5IDEgbGluZSB0byByZW1vdmUuDQogICAgDQogICAgPiArDQog
ICAgPiAgLSBtZW1vcnktcmVnaW9uOiBBIHBoYW5kbGUgdG8gYSByZXNlcnZlZF9tZW1vcnkgcmVn
aW9uIHRvIGJlIHVzZWQgZm9yIHRoZSBMUEMNCiAgICA+ICAJCXRvIEFIQiBtYXBwaW5nDQogICAg
PiAgDQogICAgDQogICAgLS0gDQogICAgTGVlIEpvbmVzIFvmnY7nkLzmlq9dDQogICAgTGluYXJv
IFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkDQogICAgTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ug
c29mdHdhcmUgZm9yIEFSTSBTb0NzDQogICAgRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0
dGVyIHwgQmxvZw0KICAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
