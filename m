From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/8] mailbox: introduce ARM SMC based mailbox
Date: Mon, 24 Jul 2017 18:38:23 +0100
Message-ID: <0aaba7fb-2183-2d4d-ba04-64b30cd0ae10@arm.com>
References: <20170630095608.24943-1-andre.przywara@arm.com>
 <20170630095608.24943-2-andre.przywara@arm.com>
 <CABb+yY18Aye3wr2A9-+jemqc=VSRyUA+xzKGo9s0G4KCt1ovyA@mail.gmail.com>
 <22d23c1d-ea8d-9829-4624-6305cd83ad4a@arm.com>
 <CABb+yY2hjfXdiCSZXd5TJf8=janwjWEo2oSqrxdoWc=1oUtteQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY2hjfXdiCSZXd5TJf8=janwjWEo2oSqrxdoWc=1oUtteQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>, =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>, Sudeep Holla <sudeep.holla@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgpPbiAyNC8wNy8xNyAxODoyMCwgSmFzc2kgQnJhciB3cm90ZToKPiBPbiBNb24sIEp1bCAyNCwg
MjAxNyBhdCA0OjUwIEFNLCBBbmRyw6kgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGFybS5jb20+
IHdyb3RlOgo+PiBPbiAwMi8wNy8xNyAwNjo1NSwgSmFzc2kgQnJhciB3cm90ZToKPj4KPj4+PiAr
ICAgICAgIG1ib3hfY2hhbl9yZWNlaXZlZF9kYXRhKGxpbmssICh2b2lkICopcmVzLmEwKTsKPj4+
PiArCj4+PiBPciB5b3UgY2FuIHVwZGF0ZSB0aGUgJ2RhdGEnIHdpdGggdmFsdWUgZnJvbSAnYTAn
ID8KPj4KPj4gTW1oLCBJIGFtIGEgYml0IHB1enpsZWQgYnkgdGhpcy4gV2h5IHdvdWxkIHRoaXMg
YmUgbmVlZGVkIG9yIHVzZWZ1bD8KPj4KPiBJIG1lYW50IGluc3RlYWQgb2YgY2FsbGluZyBtYm94
X2NoYW5fcmVjZWl2ZWRfZGF0YSgpLCBzaW1wbHkgdXBkYXRlCj4gdGhlIHZhbHVlIGF0ICdkYXRh
JyB3aXRoIHJlcy5hMAo+IAo+IFRlY2huaWNhbGx5IHRoZSBmaXJtd2FyZSBkb2VzIG5vdCAic2Vu
ZCIgdXMgYSBtZXNzYWdlLiBJdCBvbmx5IHVwZGF0ZXMKPiB0aGUgc3RydWN0dXJlIHdlIHNoYXJl
IHdpdGggaXQuIFNvIG1heWJlIHdlIGNvdWxkIHJlZmxlY3QgdGhhdCBieQo+IHVwZGF0aW5nIHRo
ZSBkYXRhIHBvaW50ZXIgdGhlIGNsaWVudCBkcml2ZXIgYXNrZWQgdG8gc2VuZC4KPiBBbHNvIGl0
IGlzIG9wdGlvbmFsIGZvciBjbGllbnRzIHRvIHByb3ZpZGUgdGhlIHJ4X2NhbGxiYWNrKCkuIEJ5
Cj4gY2FsbGluZyBtYm94X2NoYW5fcmVjZWl2ZWRfZGF0YSgpIHlvdSBtYW5kYXRlIGNsaWVudHMg
cHJvdmlkZSB0aGF0Cj4gY2FsbGJhY2suCj4gCj4gTm90aGluZyBzZXJpb3VzLCBqdXN0IHRoYXQg
bG9va2luZyBjbG9zZWx5LCB1cGRhdGluZyAnZGF0YScgc2VlbXMgYQo+IGJldHRlciBvcHRpb24u
Cj4gCj4+IEkgc2VlIHRoYXQgdGhlIFNDUEkgZmlybXdhcmUgZHJpdmVyIChhcyB0aGUgdXNlciBv
ZiB0aGUgbWFpbGJveCBBUEkpIGlzCj4+IGV4cGVjdGluZyB0aGUgcmV0dXJuIHZhbHVlIGZyb20g
YTAgYXMgcmV0dXJuZWQgYWJvdmUsIHRyYW5zbGF0aW5nIHRoZQo+PiBmaXJtd2FyZSBlcnJvciBj
b2RlcyBpbnRvIExpbnV4JyBvbmVzLgo+Pgo+IEkgYW0gYWZyYWlkLCBTQ1BJIGRyaXZlciBpcyBu
b3QgdGhlIGdvbGRlbiBleGFtcGxlIGZvciBjbGllbnQgZHJpdmVycwo+IHRvIGZvbGxvdy4gSXQg
aXMgc3VwcG9zZWQgdG8gd29yayBvbmx5IHdpdGggTUhVLCBhbmQgdGhlbiwgaXQgaXMKPiBsaWtl
bHkgdG8gYnJlYWsgaWYgc29tZSBvdGhlciBwcm90b2NvbCBpcyBydW5uaW5nIHBhcmFsbGVsIHRv
IGl0Lgo+IAoKTm90IHN1cmUgd2h5IGRvIHlvdSBzYXkgaXQgd29ya3Mgb25seSB3aXRoIEFSTSBN
SFUgPyBBbUxvZ2ljIHVzZXMgaXQKd2l0aCB0aGVpciBtYWlsYm94IGRyaXZlci4gSG93ZXZlciB0
aGV5IGZvbGxvd2VkIGFuIGludGVyaW0gdmVyc2lvbiBvZgp0aGUgU0NQSSBzcGVjIHdoaWNoIGlz
IHRlcm1lZCAibGVnYWN5IiBpbiB0aGUgZHJpdmVyLgotLSAKUmVnYXJkcywKU3VkZWVwCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2Vy
bmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVs
Cg==
