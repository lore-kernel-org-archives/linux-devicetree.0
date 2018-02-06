From: Sean Paul <seanpaul@chromium.org>
Subject: [PATCH 3/3] arm64: dts: rockchip: Specify override mode for kevin
 panel
Date: Tue,  6 Feb 2018 11:56:22 -0500
Message-ID: <20180206165626.37692-4-seanpaul@chromium.org>
References: <20180206165626.37692-1-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180206165626.37692-1-seanpaul@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <briannorris@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Jeffy Chen <jeffy.chen@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org, Emil Renner Berthing <kernel@esmil.dk>
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIGFuIG92ZXJyaWRlIG1vZGUgZm9yIGtldmluIGRldmljZXMuIFRoZSBt
b2RlIGluY3JlYXNlcwpib3RoIGJhY2sgcG9yY2hlcyB0byBhbGxvdyBhIHBpeGVsIGNsb2NrIG9m
IDI2NjY2a0h6IGFzIG9wcG9zZWQgdG8gdGhlCid0eXBpY2FsJyB2YWx1ZSBvZiAyNTI3NTBrSHou
IFRoaXMgaXMgbmVlZGVkIHRvIGF2b2lkIGludGVyZmVyZW5jZSB3aXRoCnRoZSB0b3VjaCBkaWdp
dGl6ZXIgb24gdGhlc2UgbGFwdG9wcy4KCkNjOiBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJv
bWl1bS5vcmc+CkNjOiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgpDYzogSmVmZnkg
Q2hlbiA8amVmZnkuY2hlbkByb2NrLWNoaXBzLmNvbT4KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0
QGtlcm5lbC5vcmc+CkNjOiBTdMOpcGhhbmUgTWFyY2hlc2luIDxtYXJjaGV1QGNocm9taXVtLm9y
Zz4KQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpDYzogbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBT
ZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRz
L3JvY2tjaGlwL3JrMzM5OS1ncnUta2V2aW4uZHRzIHwgMTQgKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290
L2R0cy9yb2NrY2hpcC9yazMzOTktZ3J1LWtldmluLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cm9ja2NoaXAvcmszMzk5LWdydS1rZXZpbi5kdHMKaW5kZXggMTkxYTZiY2IxNzA0Li4yNDQzMGU2
ODliY2YgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzk5LWdy
dS1rZXZpbi5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMzOTktZ3J1
LWtldmluLmR0cwpAQCAtOTgsNiArOTgsMjAgQEAKIAkJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+
OwogCQlwb3dlci1zdXBwbHkgPSA8JnBwMzMwMF9kaXNwPjsKIAorCQlvdmVycmlkZS1tb2RlIHsK
KwkJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyNjY2MDQ3MjA+OworCQkJaGFjdGl2ZSA9IDwyNDAwPjsK
KwkJCWhmcm9udC1wb3JjaCA9IDw0OD47CisJCQloYmFjay1wb3JjaCA9IDw4ND47CisJCQloc3lu
Yy1sZW4gPSA8MzI+OworCQkJaHN5bmMtYWN0aXZlID0gPDA+OworCQkJdmFjdGl2ZSA9IDwxNjAw
PjsKKwkJCXZmcm9udC1wb3JjaCA9IDwzPjsKKwkJCXZiYWNrLXBvcmNoID0gPDEyMD47CisJCQl2
c3luYy1sZW4gPSA8MTA+OworCQkJdnN5bmMtYWN0aXZlID0gPDA+OworCQl9OworCiAJCXBvcnRz
IHsKIAkJCXBhbmVsX2luX2VkcDogZW5kcG9pbnQgewogCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwm
ZWRwX291dF9wYW5lbD47Ci0tIAoyLjE2LjAucmMxLjIzOC5nNTMwZDY0OWE3OS1nb29nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
