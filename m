From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 1/4] staging/vc04_services: Use correct cache line size
Date: Fri, 14 Sep 2018 11:20:18 -0700
Message-ID: <0f4f1497-f076-09ac-49e0-625f64bbe2dd@gmail.com>
References: <1536931375-48769-1-git-send-email-phil@raspberrypi.org>
 <1536931375-48769-2-git-send-email-phil@raspberrypi.org>
 <c4807226-6738-d9da-6f08-4b0a782b9cae@gmail.com>
 <6097c969-4290-bb92-3569-72e89561490c@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <6097c969-4290-bb92-3569-72e89561490c@raspberrypi.org>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Phil Elwell <phil@raspberrypi.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devel@driverdev.osuosl.org
List-Id: devicetree@vger.kernel.org

T24gMDkvMTQvMjAxOCAxMToxMiBBTSwgUGhpbCBFbHdlbGwgd3JvdGU6Cj4gT24gMTQvMDkvMjAx
OCAxODowMywgRmxvcmlhbiBGYWluZWxsaSB3cm90ZToKPj4gT24gMDkvMTQvMjAxOCAwNjoyMiBB
TSwgUGhpbCBFbHdlbGwgd3JvdGU6Cj4+PiBVc2UgdGhlIGNvbXBhdGlibGUgc3RyaW5nIGluIHRo
ZSBEVEIgdG8gc2VsZWN0IHRoZSBjb3JyZWN0IGNhY2hlIGxpbmUKPj4+IHNpemUgZm9yIHRoZSBT
b0MgLSAzMiBmb3IgQkNNMjgzNSwgYW5kIDY0IGZvciBCQ00yODM2IGFuZCBCQ00yODM3Lgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IFBoaWwgRWx3ZWxsIDxwaGlsQHJhc3BiZXJyeXBpLm9yZz4KPj4+
IC0tLQo+Pgo+PiBbc25pcF0KPj4KPj4+IEBAIC0xNzAsNiArMTcwLDE0IEBAIHN0YXRpYyBzdHJ1
Y3QgZGV2aWNlICp2Y2hpcV9kZXY7Cj4+PiDCoCBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKG1zZ19x
dWV1ZV9zcGlubG9jayk7Cj4+PiDCoCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqYmNt
MjgzNV9jYW1lcmE7Cj4+PiDCoCArc3RhdGljIHN0cnVjdCB2Y2hpcV9kcnZkYXRhIGJjbTI4MzVf
ZHJ2ZGF0YSA9IHsKPj4+ICvCoMKgwqAgLmNhY2hlX2xpbmVfc2l6ZSA9IDMyLAo+Pj4gK307Cj4+
PiArCj4+PiArc3RhdGljIHN0cnVjdCB2Y2hpcV9kcnZkYXRhIGJjbTI4MzZfZHJ2ZGF0YSA9IHsK
Pj4+ICvCoMKgwqAgLmNhY2hlX2xpbmVfc2l6ZSA9IDY0LAo+Pj4gK307Cj4+Cj4+IFRob3NlIHR3
byBzdHJ1Y3R1cmVzIGNvdWxkIHByb2JhYmx5IGJlIG1hcmtlZCBjb25zdC4gT3RoZXIgdGhhbiB0
aGF0LAo+PiB0aGUgYXBwcm9hY2ggZGVmaW5pdGl2ZWx5IGxvb2tzIGdvb2QgdG8gbWUuCj4gCj4g
VGhlIG11dGFiaWxpdHkgaXMgaW50ZW50aW9uYWwgLSB0aGUgc3RydWN0dXJlIHBvaW50ZXIgdG8g
dGhlIGZpcm13YXJlIGlzCj4gYWxzbwo+IHN0b3JlZCB0aGVyZS4gVGhpcyBpc24ndCB0aGUgb25s
eSBwaWVjZSBvZiBtdXRhYmxlIHN0YXRpYyBkYXRhIGluIGEgZHJpdmVyCj4gdGhhdCB3aWxsIG9u
bHkgaGF2ZSBhIHNpbmdsZSBpbnN0YW5jZSwgc28gYWxsb2NhdGluZyBhbmQgaW5pdGlhbGlzaW5n
IGEKPiBwZXItaW5zdGFuY2Ugc3RydWN0dXJlIHNlZW1zIG5lZWRsZXNzbHkgY29tcGxpY2F0ZWQu
CgpGYWlyIGVub3VnaCwgdGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uCi0tIApGbG9yaWFuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRldmVsIG1haWxp
bmcgbGlzdApkZXZlbEBsaW51eGRyaXZlcnByb2plY3Qub3JnCmh0dHA6Ly9kcml2ZXJkZXYubGlu
dXhkcml2ZXJwcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaXZlcmRldi1kZXZlbAo=
