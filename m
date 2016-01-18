From: Scott Wood <oss@buserror.net>
Subject: Re: [PATCH 3/6] QE: Add uqe_serial document to bindings
Date: Mon, 18 Jan 2016 17:07:56 -0600
Message-ID: <1453158476.19133.70.camel@buserror.net>
References: <1452219494-31947-1-git-send-email-qiang.zhao@nxp.com>
 <1452219494-31947-3-git-send-email-qiang.zhao@nxp.com>
 <CADRPPNS3qT+=zz60UKRSYwxpaphcE7e04SntOQ==RjoOfhQ68Q@mail.gmail.com>
 <AM3PR04MB11851EDA91BA3C1D7386BC8D91C00@AM3PR04MB1185.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <AM3PR04MB11851EDA91BA3C1D7386BC8D91C00@AM3PR04MB1185.eurprd04.prod.outlook.com>
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
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoli@freescale.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, lkml <linux-kernel@vger.kernel.org>, "Priyanka.Jain@freescale.com" <Priyanka.Jain@freescale.com>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCAyMDE2LTAxLTE4IGF0IDA5OjI0ICswMDAwLCBRaWFuZyBaaGFvIHdyb3RlOgo+IE9u
IEZyaSwgSmFuIDE4LCAyMDE2IGF0IDA1OjEwIFBNLCBMaSBZYW5nIDxsZW9saUBmcmVlc2NhbGUu
Y29tPndyb3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IHBrdS5s
ZW9AZ21haWwuY29tIFttYWlsdG86cGt1Lmxlb0BnbWFpbC5jb21dIE9uIEJlaGFsZiBPZiBMaSBZ
YW5nCj4gPiBTZW50OiBNb25kYXksIEphbnVhcnkgMTgsIDIwMTYgNToxMCBQTQo+ID4gVG86IFFp
YW5nIFpoYW8gPHFpYW5nLnpoYW9AbnhwLmNvbT4KPiA+IENjOiBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgbGttbCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47Cj4gPiBsaW51eHBw
Yy1kZXYgPGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnPjsgUHJpeWFua2EuSmFpbkBmcmVl
c2NhbGUuY29tOwo+ID4gb3NzQGJ1c2Vycm9yLm5ldAo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAz
LzZdIFFFOiBBZGQgdXFlX3NlcmlhbCBkb2N1bWVudCB0byBiaW5kaW5ncwo+ID4gCj4gPiBPbiBG
cmksIEphbiA4LCAyMDE2IGF0IDEwOjE4IEFNLCBaaGFvIFFpYW5nIDxxaWFuZy56aGFvQG54cC5j
b20+IHdyb3RlOgo+ID4gPiBBZGQgdXFlX3NlcmlhbCBkb2N1bWVudCB0bwo+ID4gPiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXJwYy9mc2wvY3BtX3FlL3VxZV9zZXJpYWwu
dHh0Cj4gPiAKPiA+IEFzIHlvdSBoYXZlIHN1Ym1pdHRlZCBwYXRjaCB0byBtb3ZlIFFFIGNvZGUg
ZnJvbSBhcmNoL3Bvd2VycGMgaW50bwo+ID4gZHJpdmVycy9zb2MvZnNsIGZvciB0aGUgcmV1c2Ug
b2YgQVJNIGFuZCBwb3dlcnBjLCAgeW91IHNob3VsZCBhbHNvIG1vdmUKPiA+IHRoZQo+ID4gYmlu
ZGluZyBkb2N1bWVudHMgb3V0IG9mIHRoZSBwb3dlcnBjIGZvbGRlciBpbnRvIGEgbW9yZSBjb21t
b24gcGxhY2UgYW5kCj4gPiBhZGQgbmV3IGJpbmRpbmdzIGluIHRoZSBuZXcgbG9jYXRpb24uCj4g
Cj4gVGhhbmsgeW91IGZvciB5b3VyIHJlY29tbWVuZGF0aW9uLiAKPiBIb3cgYWJvdXQgY3JlYXRl
IGEgbmV3IGRpcmVjdG9yeSBuYW1lZCBxZSB1bmRlcgo+ICJEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvIj8gCj4gT3IgeW91IGhhdmUgYSBiZXR0ZXIgc3VnZ2VzdGlvbj8KCkRvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvZnNsL2NwbV9xZQoKLVNjb3R0CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eHBwYy1kZXYg
bWFpbGluZyBsaXN0CkxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMu
b3psYWJzLm9yZy9saXN0aW5mby9saW51eHBwYy1kZXY=
