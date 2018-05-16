From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 0/6] hwmon: Add support for Raspberry Pi voltage sensor
Date: Wed, 16 May 2018 15:37:01 +0200
Message-ID: <1526477827-10859-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Eric Anholt <eric@anholt.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, Phil Elwell <phil@raspberrypi.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QSBjb21tb24gaXNzdWUgZm9yIHRoZSBSYXNwYmVycnkgUGkgaXMgYW4gaW5hZGVxdWF0ZSBwb3dl
ciBzdXBwbHkuIApOb3JhbGYgVHLDuG5uZXMgc3RhcnRlZCBhIGRpc2N1c3Npb24gWzFdIGFib3V0
IHdyaXR0aW5nIHN1Y2ggdW5kZXItdm9sdGFnZQpjb25kaXRpb25zIGludG8gdGhlIGtlcm5lbCBs
b2cuCgpUaGlzIHNlcmllcyBpcyBhIGRyYWZ0IHRvIHVwc3RyZWFtIHRoZSByZXN1bHRpbmcga2Vy
bmVsIHBhdGNoIGFuZCBpcyBub3QKaW50ZW5kZWQgZm9yIDQuMTguCgpbMV0gLSBodHRwczovL2dp
dGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvaXNzdWVzLzIzNjcKClN0ZWZhbiBXYWhyZW4gKDYp
OgogIEFSTTogYmNtMjgzNTogQWRkIEdFVF9USFJPVFRMRUQgZmlybXdhcmUgcHJvcGVydHkKICBk
dC1iaW5kaW5nczogaHdtb246IEFkZCBSYXNwYmVycnkgUGkgdm9sdGFnZSBzZW5zb3IKICBod21v
bjogQWRkIHN1cHBvcnQgZm9yIFJQaSB2b2x0YWdlIHNlbnNvcgogIEFSTTogYmNtMjgzNV9kZWZj
b25maWc6IEVuYWJsZSBSUGkgdm9sdGFnZSBzZW5zb3IKICBBUk06IG11bHRpX3Y3X2RlZmNvbmZp
ZzogRW5hYmxlIFJQaSB2b2x0YWdlIHNlbnNvcgogIGFybTY0OiBkZWZjb25maWc6IEVuYWJsZSBS
UGkgdm9sdGFnZSBzZW5zb3IKCiAuLi4vYmluZGluZ3MvaHdtb24vcmFzcGJlcnJ5cGktaHdtb24u
dHh0ICAgICAgICAgICB8ICAxOSArKwogYXJjaC9hcm0vY29uZmlncy9iY20yODM1X2RlZmNvbmZp
ZyAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGFyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVm
Y29uZmlnICAgICAgICAgICAgICAgIHwgICAxICsKIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvaHdtb24vS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEwICsKIGRyaXZlcnMvaHdtb24vTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvaHdtb24vcmFz
cGJlcnJ5cGktaHdtb24uYyAgICAgICAgICAgICAgICAgIHwgMjA3ICsrKysrKysrKysrKysrKysr
KysrKwogaW5jbHVkZS9zb2MvYmNtMjgzNS9yYXNwYmVycnlwaS1maXJtd2FyZS5oICAgICAgICAg
fCAgIDEgKwogOCBmaWxlcyBjaGFuZ2VkLCAyNDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9o
d21vbi9yYXNwYmVycnlwaS1od21vbi50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2h3
bW9uL3Jhc3BiZXJyeXBpLWh3bW9uLmMKCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0
CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
