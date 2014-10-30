From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH v3 3/5] phy: berlin-sata: Document BG2 compatible
Date: Thu, 30 Oct 2014 11:21:26 +0100
Message-ID: <1414664488-5911-4-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1413882477-27922-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1414664488-5911-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1414664488-5911-1-git-send-email-sebastian.hesselbarth@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

QmVybGluIEJHMiBTQVRBIFBIWSBpcyBzbGlnaHRseSBkaWZmZXJlbnQgZnJvbSBjdXJyZW50bHkg
c3VwcG9ydGVkCkJHMlEgU0FUQSBQSFkuIERvY3VtZW50IHRoZSBuZXcgY29tcGF0aWJsZSBmb3Ig
QkcyJ3MgUEhZLgoKQWNrZWQtYnk6IEFudG9pbmUgVMOpbmFydCA8YW50b2luZS50ZW5hcnRAZnJl
ZS1lbGVjdHJvbnMuY29tPgpTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gSGVzc2VsYmFydGggPHNl
YmFzdGlhbi5oZXNzZWxiYXJ0aEBnbWFpbC5jb20+Ci0tLQpDYzogS2lzaG9uIFZpamF5IEFicmFo
YW0gSSA8a2lzaG9uQHRpLmNvbT4KQ2M6ICJBbnRvaW5lIFTDqW5hcnQiIDxhbnRvaW5lLnRlbmFy
dEBmcmVlLWVsZWN0cm9ucy5jb20+CkNjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwpDYzog
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnCi0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9i
ZXJsaW4tc2F0YS1waHkudHh0IHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BoeS9iZXJsaW4tc2F0YS1waHkudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BoeS9iZXJsaW4tc2F0YS1waHkudHh0CmluZGV4IDg4ZjhjMjMzODRjMC4u
YzAxNTVmODQyZjYyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGh5L2Jlcmxpbi1zYXRhLXBoeS50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BoeS9iZXJsaW4tc2F0YS1waHkudHh0CkBAIC0yLDcgKzIsOSBAQCBCZXJsaW4g
U0FUQSBQSFkKIC0tLS0tLS0tLS0tLS0tLQogCiBSZXF1aXJlZCBwcm9wZXJ0aWVzOgotLSBjb21w
YXRpYmxlOiBzaG91bGQgYmUgIm1hcnZlbGwsYmVybGluMnEtc2F0YS1waHkiCistIGNvbXBhdGli
bGU6IHNob3VsZCBiZSBvbmUgb2YKKyAgICAibWFydmVsbCxiZXJsaW4yLXNhdGEtcGh5IgorICAg
ICJtYXJ2ZWxsLGJlcmxpbjJxLXNhdGEtcGh5IgogLSBhZGRyZXNzLWNlbGxzOiBzaG91bGQgYmUg
MQogLSBzaXplLWNlbGxzOiBzaG91bGQgYmUgMAogLSBwaHktY2VsbHM6IGZyb20gdGhlIGdlbmVy
aWMgUEhZIGJpbmRpbmdzLCBtdXN0IGJlIDEKLS0gCjIuMS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
