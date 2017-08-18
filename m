From: Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Subject: [PATCH v2 0/5] arm64: dts: add RK3399-Q7
Date: Fri, 18 Aug 2017 21:34:40 +0200
Message-ID: <20170818193445.47542-1-klaus.goger@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>, Philipp Tomsich <philipp.tomsich-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>, Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH73oGB3hsPCZA@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Pawe=C5=82=20Jarosz?= <paweljar>
List-Id: devicetree@vger.kernel.org

QWRkcyB0aGUgZGV2aWNldHJlZSBmb3IgdGhlIFFzZXZlbiBtb2R1bGUgUkszMzk5LVE3IGFuZCBp
dCdzIEVWSyBiYXNlYm9hcmQuClNlZSBodHRwczovL3d3dy50aGVvYnJvbWEtc3lzdGVtcy5jb20v
cmszMzk5LXE3LyBmb3IgbW9yZSBpbmZvcm1hdGlvbgphYm91dCB0aGUgbW9kdWxlCgpBcyBpdCB1
c2VzIGZhbjUzNTU1NSBpbnN0ZWFkIG9mIHN5cjgyeCB0aGF0IGhhcyBzbGlnaHRseSBkaWZmZXJl
bnQKdm9sdGFnZSBzZXR0aW5ncyB3ZSBhbHNvIG92ZXJ3cml0ZSB0aGUgY3B1X2IgY2x1c3RlciBv
cHAgc2V0dGluZ3MKZnJvbSByazMzOTktb3BwLmR0c2kKClRoaXMgc2VyaWVzIGFsc28gaW5jbHVk
ZXMgYWRkaXRpb25hbCBkZXZpY2V0cmVlIGJpbmRpbmdzIHRvIHNhdGlzZnkKY2hlY2twYXRjaC4K
ClR3byBpc3N1ZXMgdGhhdCBoYXZlIGJlZW4gb2JzZXJ2ZWQgd2l0aCBjdXJyZW50IGxpbnV4LW5l
eHQ6CiAqICBQQ0llIGlzIG5vdCB3b3JraW5nIGR1ZSBpb21tdV9nZXRfZG9tYWluX2Zvcl9kZXYg
YWx3YXlzIHJldHVybmluZyBudWxsLgogKiAgU0QtQ2FyZCBkZXRlY3Qgb25seSB3b3JrcyBpZiB1
c2VkIGFzIGNkLWdwaW8uCgoKQ2hhbmdlcyBpbiB2MjoK4oKLIHNwbGl0IGR0cyBpbiBhIFNvTSBk
dHNpIGFuZCBhIGR0cyBmb3IgdGhlIGJhc2Vib2FyZAotIHVzZSBkYXNoZXMgaW4gcGhhbmRsZXMK
LSB1c2UgL2RlbGV0ZS1ub2RlLyBiZWZvcmUgcmVkZWZpbmluZyBvcHAtdGFibGUxCi0gYWRkIGNv
bW1lbnQgd2h5IG9wcC10YWJsZTEgaXMgcmVkZWZpbmVkCi0gdXNlIGdlbmVyaWMgbm9kZSBuYW1l
cwotIHJlbW92ZSBkZXByZWNhdGVkIHJlZ3VsYXRvci1jb21wYXRpYmxlIHByb3BlcnR5Ci0gYWRk
IHZxbW1jIHByb3BlcnR5IHRvIHNkbW1jCgpLbGF1cyBHb2dlciAoNSk6CiAgZHQtYmluZGluZ3M6
IGFkZCB2ZW5kb3IgcHJlZml4IGZvciBUaGVvYnJvbWEgU3lzdGVtcwogIGR0LWJpbmRpbmdzOiBh
ZGQgYW1jNjgyMSwgaXNsMTIwOCB0cml2aWFsIGJpbmRpbmdzCiAgZHQtYmluZGluZ3M6IGFkZCBy
azMzOTktcTcgU29NCiAgYXJtNjQ6IGR0czogYWRkIFJLMzM5OS1RNyAoUHVtYSkgU29NCiAgYXJt
NjQ6IGR0czogYWRkIEhhaWtvdSBiYXNlYm9hcmQgd2l0aCBSSzMzOTktUTcgU29NCgogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9yb2NrY2hpcC50eHQgfCAgIDQgKwogLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvdHJpdmlhbC1kZXZpY2VzLnR4dCAgICAgICAgfCAgIDIgKwog
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4dCAgICAgICAgfCAgIDEg
KwogYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9NYWtlZmlsZSAgICAgICAgICAgICAgfCAg
IDEgKwogLi4uL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS1wdW1hLWhhaWtvdS5kdHMg
fCAyMjggKysrKysrKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS1wdW1h
LmR0c2kgICAgICB8IDU0NiArKysrKysrKysrKysrKysrKysrKysKIDYgZmlsZXMgY2hhbmdlZCwg
NzgyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRz
L3JvY2tjaGlwL3JrMzM5OS1wdW1hLWhhaWtvdS5kdHMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS1wdW1hLmR0c2kKCi0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1yb2Nr
Y2hpcCBtYWlsaW5nIGxpc3QKTGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJvY2tjaGlwCg==
