From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 4/5] ARM: BCM5301X: Specify all RAM by including extra
 block
Date: Tue, 6 Dec 2016 21:57:31 +0100
Message-ID: <CACna6rwdKHtgp+g58B3HrDnkYZoGGZUdSqVFAGXZbf8tNTBZPg@mail.gmail.com>
References: <20161206171714.22738-1-zajec5@gmail.com>
 <20161206171714.22738-4-zajec5@gmail.com>
 <20161206200621.GB2768@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161206200621.GB2768@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Mason <jon.mason@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Hauke Mehrtens <hauke@hauke-m.de>, Russell King <linux@armlinux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gNiBEZWNlbWJlciAyMDE2IGF0IDIxOjA2LCBKb24gTWFzb24gPGpvbi5tYXNvbkBicm9hZGNv
bS5jb20+IHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDA2LCAyMDE2IGF0IDA2OjE3OjEzUE0gKzAxMDAs
IFJhZmHFgiBNacWCZWNraSB3cm90ZToKPj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBt
aWxlY2tpLnBsPgo+Pgo+PiBTbyBmYXIgd2Ugd2VyZSBzcGVjaWZ5aW5nIG9ubHkgdGhlIGZpcnN0
IGJsb2NrIHdoaWNoIGlzIGFsd2F5cyBsaW1pdGVkCj4+IHVwIHRvIDEyOCBNaUIuIFRoZXJlIGFy
ZSBtYW55IGRldmljZXMgd2l0aCAyNTYgTWlCIGFuZCBmZXcgd2l0aCA1MTIgTWlCLgo+Cj4gQXNz
dW1pbmcgdGhhdCBOUyBpcyBsaWtlIE5TUCAoYW5kIEknbSBwcmV0dHkgc3VyZSBpdCBpcyksIHRo
ZXJlIGFyZSAyCj4gd2F5cyB0byBhY2Nlc3MgdGhlIGZpcnN0IDEyOE0gb2YgUkFNLCBhIHByb3h5
IHN0YXJ0aW5nIGF0IGFkZHJlc3MgMAo+IGFuZCB0aGUgcmVhbCBhZGRyZXNzLiAgSSB0aGluayB5
b3UgYXJlIHNwbGl0dGluZyBSQU0gYnkgYWNjZXNzaW5nIGl0Cj4gYm90aCB3YXlzLCB3aGVuIHlv
dSByZWFsbHkgc2hvdWxkIGp1c3QgYmUgYWNjZXNzaW5nIGl0IGF0IHRoZSByZWFsCj4gYWRkcmVz
cy4KCkkgbmVlZCBzb21lIG1vcmUgaGVscCwgcGxlYXNlLgoKVGhpcyBwYXRjaCAocXVpdGUgd2Vs
bCB0ZXN0ZWQpIGNvbmZpcm1zIHRoYXQgMHg4ODAwMDAwMCBjYW4gYmUgdXNlZCB0bwphY2Nlc3Mg
UkFNIGF0IG9mZnNldCAxMjggTWlCLiBJZiB0aGlzIGlzIGEgcmVhbCBhZGRyZXNzIGFuZCB3aG9s
ZQpzcGFjZSBpcyBjb250aWd1b3VzLCBpdCBtZWFucyB0aGUgYmFzZSByZWFsIGFkZHJlc3Mgc2hv
dWxkIGJlCjB4ODAwMDAwMDAuIFNvIHVzaW5nIDB4MCBhbmQgMHg4MDAwMDAwMCBzaG91bGQgYWxs
b3cgYWNjZXNzaW5nCmJlZ2lubmluZyBvZiB0aGUgUkFNLiBJIHRvb2sgYSBkZXZpY2UgdGhhdCB3
YXMgd29ya2luZyBqdXN0IGZpbmUgd2l0aDoKcmVnID0gPDB4MDAwMDAwMDAgMHgwODAwMDAwMD47
CmFuZCBJIHJlcGxhY2VkIGl0IHdpdGg6CnJlZyA9IDwweDgwMDAwMDAwIDB4MDgwMDAwMDA+Owpi
dXQgaXQgYnJva2UgdGhpbmdzLCBrZXJuZWwgZGlkbid0IGJvb3Qgd2l0aCB0aGUgbGFzdCBtZXNz
YWdlIGJlaW5nOgpbICAgIDAuMDAwMDAwXSBNZW1vcnkgcG9saWN5OiBEYXRhIGNhY2hlIHdyaXRl
YWxsb2MKCkkgY2FuIHNlZSB0aGF0IGJjbTk1ODUyNWVyLmR0cywgYmNtOTU4NTI1eG1jLmR0cywg
YmNtOTU4NjIzaHIuZHRzLApiY205NTg2MjVrLmR0cyBiY205ODgzMTJoci5kdHMgYXJlIHVzaW5n
IDB4NjAwMDAwMDAgYXMgYmFzZSBhZGRyZXNzLgpJdCBzZWVtcyB0byBiZSBkaWZmZXJlbnQgZnJv
bSBOb3J0aHN0YXIgYnV0IEkgdHJpZWQgZm9sbG93aW5nIGVudHJ5CmFueXdheToKcmVnID0gPDB4
NjAwMDAwMDAgMHgwODAwMDAwMD47CmFuZCBJIGdvdCBrZXJuZWwgaGFuZyBqdXN0IGxpa2UgaW4g
dGhlIHByZXZpb3VzIHRyeS4KCkRpZCBJIG1pc3Mgc29tZXRoaW5nPyBPciBkb2VzIE5vcnRoc3Rh
ciBzZWVtIHRvIGJlIGFjdHVhbGx5IGRpZmZlcmVudCB0aGFuIE5TUD8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
