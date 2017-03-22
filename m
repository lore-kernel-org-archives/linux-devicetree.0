From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v7 3/7] ARM: dts: rockchip: update compatible property for
 rk322x timer
Date: Wed, 22 Mar 2017 18:48:30 +0300
Message-ID: <1490197714-25415-4-git-send-email-al.kochet@gmail.com>
References: <1490197714-25415-1-git-send-email-al.kochet@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1490197714-25415-1-git-send-email-al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

UHJvcGVydHkgc2V0IHRvICcicm9ja2NoaXAscmszMjI4LXRpbWVyIiwgInJvY2tjaGlwLHJrMzI4
OC10aW1lciInCnRvIG1hdGNoIGRldmljZXRyZWUgYmluZGluZ3MuCgpTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgS29jaGV0a292IDxhbC5rb2NoZXRAZ21haWwuY29tPgpTdWdnZXN0ZWQtYnk6IEhl
aWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+ClJldmlld2VkLWJ5OiBIZWlrbyBTdHVlYm5l
ciA8aGVpa29Ac250ZWNoLmRlPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzIyeC5kdHNpIHwg
ICAgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjJ4LmR0c2kgYi9hcmNoL2FybS9ib290
L2R0cy9yazMyMnguZHRzaQppbmRleCA5ZTZiZjBlLi4yYTRlZWUyIDEwMDY0NAotLS0gYS9hcmNo
L2FybS9ib290L2R0cy9yazMyMnguZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9yazMyMngu
ZHRzaQpAQCAtMzIzLDcgKzMyMyw3IEBACiAJfTsKIAogCXRpbWVyOiB0aW1lckAxMTBjMDAwMCB7
Ci0JCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMjg4LXRpbWVyIjsKKwkJY29tcGF0aWJsZSA9
ICJyb2NrY2hpcCxyazMyMjgtdGltZXIiLCAicm9ja2NoaXAscmszMjg4LXRpbWVyIjsKIAkJcmVn
ID0gPDB4MTEwYzAwMDAgMHgyMD47CiAJCWludGVycnVwdHMgPSA8R0lDX1NQSSA0MyBJUlFfVFlQ
RV9MRVZFTF9ISUdIPjsKIAkJY2xvY2tzID0gPCZ4aW4yNG0+LCA8JmNydSBQQ0xLX1RJTUVSPjsK
LS0gCjEuNy45LjUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3QKTGludXgtcm9ja2NoaXBAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJvY2tjaGlwCg==
