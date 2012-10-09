From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: ARM_ATAG_DTB_COMPAT fails on fdt_ro.c compiling
Date: Tue, 9 Oct 2012 11:17:20 +0800
Message-ID: <20121009031715.GC21822@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
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
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

SSBoYXZlIHNlZW4gdGhpcyBlcnJvciBvbiBtYWlubGluZSBmb3IgYSBjb3VwbGUgZGF5cyB3aGVu
CkFSTV9BVEFHX0RUQl9DT01QQVQgaXMgZW5hYmxlZC4KCiAgQ0MgICAgICBhcmNoL2FybS9ib290
L2NvbXByZXNzZWQvZmR0X3JvLm8KYXJjaC9hcm0vYm9vdC9jb21wcmVzc2VkL2ZkdF9yby5jOiBJ
biBmdW5jdGlvbiDigJhmZHRfcGF0aF9vZmZzZXTigJk6CmFyY2gvYXJtL2Jvb3QvY29tcHJlc3Nl
ZC9mZHRfcm8uYzoxNzI6MzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9u
IOKAmGZkdF9nZXRfYWxpYXNfbmFtZWxlbuKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1k
ZWNsYXJhdGlvbl0KYXJjaC9hcm0vYm9vdC9jb21wcmVzc2VkL2ZkdF9yby5jOjE3Mjo1OiB3YXJu
aW5nOiBhc3NpZ25tZW50IG1ha2VzIHBvaW50ZXIgZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBjYXN0
IFtlbmFibGVkIGJ5IGRlZmF1bHRdCmFyY2gvYXJtL2Jvb3QvY29tcHJlc3NlZC9mZHRfcm8uYzog
QXQgdG9wIGxldmVsOgphcmNoL2FybS9ib290L2NvbXByZXNzZWQvZmR0X3JvLmM6MzQwOjEzOiBl
cnJvcjogY29uZmxpY3RpbmcgdHlwZXMgZm9yIOKAmGZkdF9nZXRfYWxpYXNfbmFtZWxlbuKAmQph
cmNoL2FybS9ib290L2NvbXByZXNzZWQvZmR0X3JvLmM6MTcyOjc6IG5vdGU6IHByZXZpb3VzIGlt
cGxpY2l0IGRlY2xhcmF0aW9uIG9mIOKAmGZkdF9nZXRfYWxpYXNfbmFtZWxlbuKAmSB3YXMgaGVy
ZQpjYzE6IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKClNoYXduCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRldmljZXRyZWUtZGlz
Y3VzcyBtYWlsaW5nIGxpc3QKZGV2aWNldHJlZS1kaXNjdXNzQGxpc3RzLm96bGFicy5vcmcKaHR0
cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2RldmljZXRyZWUtZGlzY3Vzcwo=
