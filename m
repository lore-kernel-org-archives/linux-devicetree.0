From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH V2 0/5] phy: bcm-ns-usb3: add MDIO driver
Date: Fri, 16 Jun 2017 13:23:56 +0530
Message-ID: <dab533dc-a21c-807d-6688-f8aae4a03f61@ti.com>
References: <20170511132925.14564-1-zajec5@gmail.com>
 <20170608200428.9187-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170608200428.9187-1-zajec5@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, linux-kernel@vger.kernel.org, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

CgpPbiBGcmlkYXkgMDkgSnVuZSAyMDE3IDAxOjM0IEFNLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6
Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IAo+IEFzIGV4cGxh
aW5lZCBpbiB0aGUgY29tbWl0IDkyMDBjNmYxNzc2MzggKCJSZXZlcnQgInBoeTogQWRkIFVTQjMg
UEhZIHN1cHBvcnQKPiBmb3IgQnJvYWRjb20gTlNQIFNvQyIiKSB0aGlzIG1vZHVsZSBzaG91bGQg
YmUgbW9kaWZpZWQgdG8gdXNlIE1ESU8gYnVzIGFzCj4gdGhpcyBpcyBob3cgUEhZIGlzIHJlYWxs
eSBhdHRhY2hlZC4KPiAKPiBUaGlzIHNob3VsZCBhbGxvdyByZXVzaW5nIHRoaXMgZHJpdmVyIG9u
IE5TUCBhbmQgYW55IG90aGVyIHBsYXRmb3JtIHdpdGgKPiBNRElPIGJ1cyBhbmQgdGhpcyBwYXJ0
aWN1bGFyIFBIWS4KPiAKPiBWMjogUmViYXNlIGFuZCB1cGRhdGUgNC81IGFuZCA1LzUuCgptZXJn
ZWQsIHRoYW5rcyEKCi1LaXNob24KPiAKPiBSYWZhxYIgTWnFgmVja2kgKDUpOgo+ICAgcGh5OiBi
Y20tbnMtdXNiMzogYWx3YXlzIHdhaXQgZm9yIGlkbGUgYWZ0ZXIgd3JpdGluZyB0byB0aGUgUEhZ
IHJlZwo+ICAgcGh5OiBiY20tbnMtdXNiMzogdXNlIHBvaW50ZXIgZm9yIFBIWSB3cml0aW5nIGZ1
bmN0aW9uCj4gICBwaHk6IGJjbS1ucy11c2IzOiBlbmFibGUgTURJTyBpbiB0aGUgcGxhdGZvcm0g
c3BlY2lmaWMgY29kZQo+ICAgZHQtYmluZGluZ3M6IHBoeTogTW9kaWZ5IEJyb2FkY29tIE5TIFVT
QiAzLjAgUEhZIGJpbmRpbmcgdG8gdXNlIE1ESU8KPiAgIHBoeTogYmNtLW5zLXVzYjM6IGFkZCBN
RElPIGRyaXZlciB1c2luZyBwcm9wZXIgYnVzIGxheWVyCj4gCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BoeS9iY20tbnMtdXNiMy1waHkudHh0ICAgIHwgIDI3ICsrLQo+ICBkcml2ZXJzL3Bo
eS9icm9hZGNvbS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZl
cnMvcGh5L2Jyb2FkY29tL3BoeS1iY20tbnMtdXNiMy5jICAgICAgICAgICAgIHwgMjMwICsrKysr
KysrKysrKysrKy0tLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE4NiBpbnNlcnRpb25zKCspLCA3
MiBkZWxldGlvbnMoLSkKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
