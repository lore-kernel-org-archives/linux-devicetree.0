From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH v2 3/5] phy: berlin-sata: Document BG2 compatible
Date: Tue, 21 Oct 2014 11:07:55 +0200
Message-ID: <1413882477-27922-4-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1413882477-27922-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1413882477-27922-1-git-send-email-sebastian.hesselbarth@gmail.com>
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
YW0gSSA8a2lzaG9uQHRpLmNvbT4gCkNjOiAiQW50b2luZSBUw6luYXJ0IiA8YW50b2luZS50ZW5h
cnRAZnJlZS1lbGVjdHJvbnMuY29tPgpDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKQ2M6
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZyAKLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5
L2Jlcmxpbi1zYXRhLXBoeS50eHQgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGh5L2Jlcmxpbi1zYXRhLXBoeS50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGh5L2Jlcmxpbi1zYXRhLXBoeS50eHQKaW5kZXggODhmOGMyMzM4NGMw
Li5jMDE1NWY4NDJmNjIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waHkvYmVybGluLXNhdGEtcGh5LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGh5L2Jlcmxpbi1zYXRhLXBoeS50eHQKQEAgLTIsNyArMiw5IEBAIEJlcmxp
biBTQVRBIFBIWQogLS0tLS0tLS0tLS0tLS0tCiAKIFJlcXVpcmVkIHByb3BlcnRpZXM6Ci0tIGNv
bXBhdGlibGU6IHNob3VsZCBiZSAibWFydmVsbCxiZXJsaW4ycS1zYXRhLXBoeSIKKy0gY29tcGF0
aWJsZTogc2hvdWxkIGJlIG9uZSBvZgorICAgICJtYXJ2ZWxsLGJlcmxpbjItc2F0YS1waHkiCisg
ICAgIm1hcnZlbGwsYmVybGluMnEtc2F0YS1waHkiCiAtIGFkZHJlc3MtY2VsbHM6IHNob3VsZCBi
ZSAxCiAtIHNpemUtY2VsbHM6IHNob3VsZCBiZSAwCiAtIHBoeS1jZWxsczogZnJvbSB0aGUgZ2Vu
ZXJpYyBQSFkgYmluZGluZ3MsIG11c3QgYmUgMQotLSAKMi4xLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcg
bGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
