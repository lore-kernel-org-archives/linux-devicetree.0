From: Qiang Zhao <qiang.zhao@nxp.com>
Subject: RE: [PATCH 3/6] QE: Add uqe_serial document to bindings
Date: Mon, 18 Jan 2016 09:24:34 +0000
Message-ID: <AM3PR04MB11851EDA91BA3C1D7386BC8D91C00@AM3PR04MB1185.eurprd04.prod.outlook.com>
References: <1452219494-31947-1-git-send-email-qiang.zhao@nxp.com>
 <1452219494-31947-3-git-send-email-qiang.zhao@nxp.com>
 <CADRPPNS3qT+=zz60UKRSYwxpaphcE7e04SntOQ==RjoOfhQ68Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <CADRPPNS3qT+=zz60UKRSYwxpaphcE7e04SntOQ==RjoOfhQ68Q@mail.gmail.com>
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
To: Li Yang <leoli@freescale.com>
Cc: "oss@buserror.net" <oss@buserror.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, lkml <linux-kernel@vger.kernel.org>, "Priyanka.Jain@freescale.com" <Priyanka.Jain@freescale.com>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBKYW4gMTgsIDIwMTYgYXQgMDU6MTAgUE0sIExpIFlhbmcgPGxlb2xpQGZyZWVzY2Fs
ZS5jb20+d3JvdGU6DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHBrdS5s
ZW9AZ21haWwuY29tIFttYWlsdG86cGt1Lmxlb0BnbWFpbC5jb21dIE9uIEJlaGFsZiBPZiBMaSBZ
YW5nDQo+IFNlbnQ6IE1vbmRheSwgSmFudWFyeSAxOCwgMjAxNiA1OjEwIFBNDQo+IFRvOiBRaWFu
ZyBaaGFvIDxxaWFuZy56aGFvQG54cC5jb20+DQo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVs
Lm9yZzsgbGttbCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47DQo+IGxpbnV4cHBjLWRl
diA8bGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc+OyBQcml5YW5rYS5KYWluQGZyZWVzY2Fs
ZS5jb207DQo+IG9zc0BidXNlcnJvci5uZXQNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzZdIFFF
OiBBZGQgdXFlX3NlcmlhbCBkb2N1bWVudCB0byBiaW5kaW5ncw0KPiANCj4gT24gRnJpLCBKYW4g
OCwgMjAxNiBhdCAxMDoxOCBBTSwgWmhhbyBRaWFuZyA8cWlhbmcuemhhb0BueHAuY29tPiB3cm90
ZToNCj4gPiBBZGQgdXFlX3NlcmlhbCBkb2N1bWVudCB0bw0KPiA+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9wb3dlcnBjL2ZzbC9jcG1fcWUvdXFlX3NlcmlhbC50eHQNCj4gDQo+
IEFzIHlvdSBoYXZlIHN1Ym1pdHRlZCBwYXRjaCB0byBtb3ZlIFFFIGNvZGUgZnJvbSBhcmNoL3Bv
d2VycGMgaW50bw0KPiBkcml2ZXJzL3NvYy9mc2wgZm9yIHRoZSByZXVzZSBvZiBBUk0gYW5kIHBv
d2VycGMsICB5b3Ugc2hvdWxkIGFsc28gbW92ZSB0aGUNCj4gYmluZGluZyBkb2N1bWVudHMgb3V0
IG9mIHRoZSBwb3dlcnBjIGZvbGRlciBpbnRvIGEgbW9yZSBjb21tb24gcGxhY2UgYW5kDQo+IGFk
ZCBuZXcgYmluZGluZ3MgaW4gdGhlIG5ldyBsb2NhdGlvbi4NCg0KVGhhbmsgeW91IGZvciB5b3Vy
IHJlY29tbWVuZGF0aW9uLiANCkhvdyBhYm91dCBjcmVhdGUgYSBuZXcgZGlyZWN0b3J5IG5hbWVk
IHFlIHVuZGVyICJEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvIj8gDQpPciB5b3Ug
aGF2ZSBhIGJldHRlciBzdWdnZXN0aW9uPw0KDQpSZWdhcmRzIA0KLVpoYW8gUWlhbmcNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4cHBjLWRldiBt
YWlsaW5nIGxpc3QKTGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5v
emxhYnMub3JnL2xpc3RpbmZvL2xpbnV4cHBjLWRldg==
