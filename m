From: <thomas.langer@lantiq.com>
Subject: RE: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Wed, 4 Sep 2013 13:45:40 +0000
Message-ID: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
 <522697E9.1050208@freescale.com> <20130904095523.GT3084@sirena.org.uk>
 <52270B8E.5080402@freescale.com> <20130904113322.GA5859@sirena.org.uk>
 <20130905014350.GA2261@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20130905014350.GA2261@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: shijie8@gmail.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, shawn.guo@linaro.org, b44548@freescale.com, dedekind1@gmail.com, linux-doc@vger.kernel.org, b18965@freescale.com, linux-spi@vger.kernel.org, b32955@freescale.com, linux-mtd@lists.infradead.org, kernel@pengutronix.de, lznuaa@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGVsbG8gSHVhbmcsDQoNCkh1YW5nIFNoaWppZSB3cm90ZSBvbsKgMjAxMy0wOS0wNToNCj4gT24g
V2VkLCBTZXAgMDQsIDIwMTMgYXQgMTI6MzM6MjJQTSArMDEwMCwgTWFyayBCcm93biB3cm90ZToN
Cj4+IE9uIFdlZCwgU2VwIDA0LCAyMDEzIGF0IDA2OjI5OjM0UE0gKzA4MDAsIEh1YW5nIFNoaWpp
ZSB3cm90ZToNCj4+PiDkuo4gMjAxM+W5tDA55pyIMDTml6UgMTc6NTUsIE1hcmsgQnJvd24g5YaZ
6YGTOg0KPj4+PiBPbiBXZWQsIFNlcCAwNCwgMjAxMyBhdCAxMDoxNjowOUFNICswODAwLCBIdWFu
ZyBTaGlqaWUgd3JvdGU6DQo+PiANCj4+Pj4+IFNpbmNlIHRoaXMgcXVhZHNwaSBkcml2ZXIgZGVw
ZW5kcyBvbiB0aGUgbXRkIGNvZGUsIGNvdWxkIHRoaXMgZHJpdmVyDQo+Pj4+PiBnb2VzIHRvIHRo
ZSBrZXJuZWwgYnkNCj4+Pj4+IHRoZSBsMi1tdGQgdHJlZT8NCj4+IA0KPj4+PiBXaHkgd291bGQg
YSBTUEkgZHJpdmVyIGRlcGVuZCBvbiBNVEQ/DQo+PiANCj4+PiBUaGUgcGF0Y2ggMS00IGFyZSBm
b3IgbTI1cDgwLmMsIGFuZCB0aGlzIHF1YWRzcGkgY29udHJvbGxlciBkcml2ZXJzDQo+Pj4gZGVw
ZW5kcyBvbiB0aGUNCj4+PiBwYXRjaCAxLTQuDQo+PiANCj4+IEluIHdoYXQgd2F5IGRvZXMgdGhl
IGNvbnRyb2xsZXIgZHJpdmVyIGRlcGVuZCBvbiB0aG9zZSBjaGFuZ2VzPw0KPiBUaGlzIGRyaXZl
ciBuZWVkcyB0aGUgc3BpIG5vciBjb21tYW5kIHRvIGZpbGwgdGhlIExVVCByZWdpc3Rlciwgc3Vj
aCBhcw0KPiBPUENPREVfV1JFTigweDA2KSwgc28gdGhlIHBhdGNoIDEgbW92ZXMgdGhlIHNwaSBu
b3IgY29tbWFuZCB0byBhIHNlcHJhdGUNCj4gaGVhZGVyIHNwaS1ub3IuaCwgYW5kIHRoaXMgZHJp
dmVyIGluY2x1ZGVzIHRoaXMgbmV3IGhlYWRlci4NCj4gDQpUaGVuIHNvbWUgcXVlc3Rpb25zIGNv
bWUgdXA6IA0KLSBXaHkgZG9lcyB0aGUgc3BpIGNvbnRyb2xsZXIgbmVlZCB0byBrbm93IHRoaXM/
DQotIFdoYXQgaXMgdGhpcyBMVVQgcmVnaXN0ZXIgYXQgYWxsPw0KLSBXaGF0IGhhcHBlbnMgaWYg
c29tZXRoaW5nIGRpZmZlcmVudCB0aGF0IGEgZmxhc2ggaXMgY29ubmVjdGVkIGFuZCANCiAgIHRo
ZSBkYXRhIHN0YXJ0cyB3aXRoIG9uZSBvZiB0aGVzZSBvcGNvZGVzPw0KDQpCZXN0IFJlZ2FyZHMs
DQpUaG9tYXMNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
