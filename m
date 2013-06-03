From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: ux500: register LP5521 LEDs in the device tree
Date: Mon, 3 Jun 2013 09:18:05 +0100
Message-ID: <20130603081805.GC3370@gmail.com>
References: <1369210331-18545-1-git-send-email-linus.walleij@stericsson.com>
 <CAK5ve-+oJL0fbtM=5xRSBjCztX1fP-fcwUvZurnj42hiXR5X+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK5ve-+oJL0fbtM=5xRSBjCztX1fP-fcwUvZurnj42hiXR5X+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Milo Kim <Milo.Kim-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez.st-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAzMSBNYXkgMjAxMywgQnJ5YW4gV3Ugd3JvdGU6Cgo+IE9uIFdlZCwgTWF5IDIyLCAy
MDEzIGF0IDE6MTIgQU0sIExpbnVzIFdhbGxlaWoKPiA8bGludXMud2FsbGVpakBzdGVyaWNzc29u
LmNvbT4gd3JvdGU6Cj4gPiBGcm9tOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFy
by5vcmc+Cj4gPgo+ID4gQmFzZWQgb24gcGVuZGluZyBkZXZpY2UgdHJlZSBzdXBwb3J0IGluIHRo
ZSBMUDU1eHggZHJpdmVycwo+ID4gd2UgY2FuIGFkZCB0aGUgY29ycmVjdCBMRUQgYW5kIGNoYW5u
ZWwgY29uZmlndXJhdGlvbiBmcm9tIHRoZQo+ID4gdXg1MDAgZGV2aWNlIHRyZWUgZm9yIGFsbCBI
UkVGIHZhcmlhbnRzLgo+ID4KPiA+IENjOiBNaWxvIEtpbSA8TWlsby5LaW1AdGkuY29tPgo+ID4g
Q2M6IEJyeWFuIFd1IDxjb29sb25leUBnbWFpbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMaW51
cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gPiAtLS0KPiA+ICBhcmNoL2Fy
bS9ib290L2R0cy9ocmVmLmR0c2kgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9ocmVmLmR0c2kgYi9h
cmNoL2FybS9ib290L2R0cy9ocmVmLmR0c2kKPiA+IGluZGV4IDYyNTIzZjYuLmUzMTU0MjkgMTAw
NjQ0Cj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9ocmVmLmR0c2kKPiA+ICsrKyBiL2FyY2gv
YXJtL2Jvb3QvZHRzL2hyZWYuZHRzaQo+ID4gQEAgLTYzLDE2ICs2Myw0MiBAQAo+ID4gICAgICAg
ICAgICAgICAgIH07Cj4gPgo+ID4gICAgICAgICAgICAgICAgIGkyY0A4MDEyODAwMCB7Cj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICBscDU1MjFAMHgzMyB7Cj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibHA1NTIxIjsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGxwNTUyMUAzMyB7Cj4gCj4gSXMgdGhpcyByaWdodCwgSSBndWVzcyBpdCBzaG91
bGQgYmUgc3RpbGwgImxwNTUyMUAweDMzIiwgYWx0aG91Z2ggaXQncwo+IGp1c3QgYSBuYW1lLgoK
V2hhdCBtYWtlcyB5b3Ugc2F5IHRoYXQgQnJ5YW4/CgpBbGwgb3RoZXIgbm9kZXMgZHJvcCB0aGUg
JzB4JywgYXMgaXQncyBpbXBsaWVkLgoKLS0gCkxlZSBKb25lcwpMaW5hcm8gU1QtRXJpY3Nzb24g
TGFuZGluZyBUZWFtIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2aWNldHJlZS1kaXNj
dXNzIG1haWxpbmcgbGlzdApkZXZpY2V0cmVlLWRpc2N1c3NAbGlzdHMub3psYWJzLm9yZwpodHRw
czovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vZGV2aWNldHJlZS1kaXNjdXNzCg==
