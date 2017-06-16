From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH V2 0/5] phy: bcm-ns-usb3: add MDIO driver
Date: Fri, 16 Jun 2017 13:22:05 +0530
Message-ID: <68b4f1ed-fc3b-77a0-fb6e-f024814a4a66@ti.com>
References: <20170511132925.14564-1-zajec5@gmail.com>
 <20170608200428.9187-1-zajec5@gmail.com>
 <a28bd799-abc2-8f4e-c3db-b9f82f35295a@ti.com>
 <30100fc8-7538-fd30-0a6a-665019b38c38@milecki.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <30100fc8-7538-fd30-0a6a-665019b38c38@milecki.pl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, linux-kernel@vger.kernel.org, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksCgpPbiBGcmlkYXkgMTYgSnVuZSAyMDE3IDEyOjQ0IFBNLCBSYWZhxYIgTWnFgmVja2kgd3Jv
dGU6Cj4gT24gMDYvMTYvMjAxNyAwODozNiBBTSwgS2lzaG9uIFZpamF5IEFicmFoYW0gSSB3cm90
ZToKPj4gT24gRnJpZGF5IDA5IEp1bmUgMjAxNyAwMTozNCBBTSwgUmFmYcWCIE1pxYJlY2tpIHdy
b3RlOgo+Pj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+Pj4KPj4+
IEFzIGV4cGxhaW5lZCBpbiB0aGUgY29tbWl0IDkyMDBjNmYxNzc2MzggKCJSZXZlcnQgInBoeTog
QWRkIFVTQjMgUEhZIHN1cHBvcnQKPj4+IGZvciBCcm9hZGNvbSBOU1AgU29DIiIpIHRoaXMgbW9k
dWxlIHNob3VsZCBiZSBtb2RpZmllZCB0byB1c2UgTURJTyBidXMgYXMKPj4+IHRoaXMgaXMgaG93
IFBIWSBpcyByZWFsbHkgYXR0YWNoZWQuCj4+Pgo+Pj4gVGhpcyBzaG91bGQgYWxsb3cgcmV1c2lu
ZyB0aGlzIGRyaXZlciBvbiBOU1AgYW5kIGFueSBvdGhlciBwbGF0Zm9ybSB3aXRoCj4+PiBNRElP
IGJ1cyBhbmQgdGhpcyBwYXJ0aWN1bGFyIFBIWS4KPj4KPj4gY2FuIHlvdSBydW4gY2hlY2twYXRj
aCBhbmQgZml4IGFsbCB3YXJuaW5ncyBpbiB0aGlzIHNlcmllcz8KPiAKPiBJIGFsd2F5cyBjaGVj
ayBteSBwYXRjaGVzIGJlZm9yZSBzZW5kaW5nLiBGb3IgdGhpcyBzZXQgdGhlIG9ubHkgd2Fybmlu
ZyBJCj4gZ2V0IGlzOgo+IAo+IFdBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCj4gIzEx
NzogRklMRTogZHJpdmVycy9waHkvYnJvYWRjb20vcGh5LWJjbS1ucy11c2IzLmM6MjI0Ogo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gdXNlY3NfdG9famlmZmllcyhCQ01f
TlNfVVNCM19NSUlfTU5HX1RJTUVPVVRfVVMpKTsKPiAKPiBJJ3ZlIHByb2JsZW0gZmluZGluZyBh
IG5pY2Ugd2F5IG9mIGZpeGluZyB0aGlzLgo+IDEpIEkgY2FuJ3QgYnJlYWsgdGhlIGxpbmUgYmV0
d2VlbiBhcmd1bWVudHMgYXMgdGhlcmUgaXMgb25seSAxIGFyZ3VtZW50Cj4gMikgSSBzaG91bGRu
J3QgdXNlIHNtYWxsIGluZGVudGlvbiBhcyBpdCB3b3VsZCBtaXNhbGlnbiB0aGlzIGxpbmUKPiAz
KSBVc2luZyB0bXAgdmFyIGZvciBCQ01fTlNfVVNCM19NSUlfTU5HX1RJTUVPVVRfVVMgc291bmRz
IGEgYml0IHBvaW50bGVzcwo+IAo+IEFjY29yZGluZyB0byB0aGUgY29kaW5nLXN0eWxlLnJzdCBo
YXZpbmcgODArIGNoYXJzIGxpbmVzIGlzIGFjY2VwdGFibGUgaWYgaXQKPiAic2lnbmlmaWNhbnRs
eSBpbmNyZWFzZXMgcmVhZGFiaWxpdHkgYW5kIGRvZXMgbm90IGhpZGUgaW5mb3JtYXRpb24iLiBN
YXliZQo+IHdlIGNhbiBqdXN0IGxpdmUgd2l0aCB0aGlzIHNpbmdsZSBsaW5lIGxpa2UgdGhhdD8g
SXNuJ3QgdGhpcyBhIGJpdCBiaWtlCj4gc2hlZGRpbmcgaW4gdGhpcyBjYXNlPwoKU3VyZSwganVz
dCB3YW50ZWQgdG8gbWFrZSBzdXJlIHdlIGRpZG4ndCBvdmVybG9vayBjaGVja3BhdGNoIHdhcm5p
bmdzLgoKVGhhbmtzCktpc2hvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
