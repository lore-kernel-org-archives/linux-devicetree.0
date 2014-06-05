From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v7 3/7] dt-bindings: add mtk-timer bindings
Date: Thu,  5 Jun 2014 19:26:17 +0200
Message-ID: <1401989181-4712-4-git-send-email-matthias.bgg@gmail.com>
References: <1401989181-4712-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1401989181-4712-1-git-send-email-matthias.bgg@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, andrew@lunn.ch, linux-doc@vger.kernel.org, gregory.clement@free-electrons.com, thierry.reding@gmail.com, heiko.stuebner@bq.com, linux@arm.linux.org.uk, arnd@arndb.de, daniel.lezcano@linaro.org, linux-arm-kernel@lists.infradead.org, florian.vaussard@epfl.ch, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, marc.zyngier@arm.com, robh+dt@kernel.org, matthias.bgg@gmail.com, tglx@linutronix.de, soren.brinkmann@xilinx.com, rdunlap@infradead.org, sboyd@codeaurora.org, silvio.fricke@gmail.com, galak@codeaurora.org, olof@lixom.net, maxime.ripard@free-electrons.com, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

QWRkIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIEdlbmVyYWwgUG9ycG9zZSBUaW1lciBk
cml2ZXIgb2YKdGhlIE1lZGlhdGVrIFNvQ3MuCgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVn
Z2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgpBY2tlZC1ieTogU8O2cmVuIEJyaW5rbWFubiA8
c29yZW4uYnJpbmttYW5uQHhpbGlueC5jb20+CkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgotLS0KIC4uLi9iaW5kaW5ncy90aW1lci9tZWRpYXRlayxtdGstdGltZXIudHh0
ICAgICAgICAgIHwgICAxOCArKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOCBp
bnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3RpbWVyL21lZGlhdGVrLG10ay10aW1lci50eHQKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvbWVkaWF0ZWssbXRrLXRpbWVyLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9tZWRpYXRlayxtdGst
dGltZXIudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjEwYjdlMDkKLS0t
IC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIv
bWVkaWF0ZWssbXRrLXRpbWVyLnR4dApAQCAtMCwwICsxLDE4IEBACitNZWRpYXRlayBNVDY1Nzcs
IE1UNjU3MiBhbmQgTVQ2NTg5IFRpbWVycworLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CistIGNvbXBhdGlibGU6IFNob3VsZCBi
ZSAibWVkaWF0ZWssbXQ2NTc3LXRpbWVyIgorLSByZWc6IFNob3VsZCBjb250YWluIGxvY2F0aW9u
IGFuZCBsZW5ndGggZm9yIHRpbWVycyByZWdpc3Rlci4KKy0gY2xvY2tzOiBDbG9ja3MgZHJpdmlu
ZyB0aGUgdGltZXIgaGFyZHdhcmUuIFRoaXMgbGlzdCBzaG91bGQgaW5jbHVkZSB0d28KKwljbG9j
a3MuIFRoZSBvcmRlciBpcyBzeXN0ZW0gY2xvY2sgYW5kIGFzIHNlY29uZCBjbG9jayB0aGUgUlRD
IGNsb2NrLgorCitFeGFtcGxlczoKKworCXRpbWVyQDEwMDA4MDAwIHsKKwkJY29tcGF0aWJsZSA9
ICJtZWRpYXRlayxtdDY1NzctdGltZXIiOworCQlyZWcgPSA8MHgxMDAwODAwMCAweDgwPjsKKwkJ
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDExMyBJUlFfVFlQRV9MRVZFTF9MT1c+OworCQljbG9ja3Mg
PSA8JnN5c3RlbV9jbGs+LCA8JnJ0Y19jbGs+OworCQljbG9jay1uYW1lcyA9ICJzeXN0ZW0tY2xr
IiwgInJ0Yy1jbGsiOworCX07Ci0tIAoxLjcuOS41CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
