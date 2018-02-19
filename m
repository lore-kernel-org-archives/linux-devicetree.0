From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Subject: [PATCH v3 7/7] ARM: sun8i: smp: Remove the disabling of CPU0
Date: Mon, 19 Feb 2018 09:18:37 +0100
Message-ID: <20180219081837.15482-8-mylene.josserand@bootlin.com>
References: <20180219081837.15482-1-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219081837.15482-1-mylene.josserand@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: maxime.ripard@bootlin.com, wens@csie.org, linux@armlinux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, quentin.schulz@bootlin.com, linux-kernel@vger.kernel.org, clabbe.montjoie@gmail.com, thomas.petazzoni@bootlin.com, mylene.josserand@bootlin.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gc3VuOGktYTYzdCwgaG90cGx1ZyBDUFUgZm9yIENQVTAgaXMgY3VycmVudGx5IG5vdCB3b3Jr
aW5nLgpSZW1vdmUgdGhlIHBvc3NpYmlsaXR5IHRvIGRpc2FibGUgQ1BVMCBvbmx5IGZvciBzdW44
aS1hODN0LgoKU2lnbmVkLW9mZi1ieTogTXlsw6huZSBKb3NzZXJhbmQgPG15bGVuZS5qb3NzZXJh
bmRAYm9vdGxpbi5jb20+Ci0tLQogYXJjaC9hcm0vbWFjaC1zdW54aS9tY19zbXAuYyB8IDYgKysr
KystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdW54aS9tY19zbXAuYyBiL2FyY2gvYXJtL21hY2gtc3Vu
eGkvbWNfc21wLmMKaW5kZXggZmVjNTkyYmY2OGI0Li42OWQ1YWU1YjNkNzIgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtL21hY2gtc3VueGkvbWNfc21wLmMKKysrIGIvYXJjaC9hcm0vbWFjaC1zdW54aS9t
Y19zbXAuYwpAQCAtNjYxLDggKzY2MSwxMiBAQCBzdGF0aWMgaW50IHN1bnhpX21jX3NtcF9jcHVf
a2lsbCh1bnNpZ25lZCBpbnQgbF9jcHUpCiAJcmV0dXJuICFyZXQ7CiB9CiAKLXN0YXRpYyBib29s
IHN1bnhpX21jX3NtcF9jcHVfY2FuX2Rpc2FibGUodW5zaWduZWQgaW50IF9fdW51c2VkKQorc3Rh
dGljIGJvb2wgc3VueGlfbWNfc21wX2NwdV9jYW5fZGlzYWJsZSh1bnNpZ25lZCBpbnQgY3B1KQog
eworCS8qIENQVTAgaG90cGx1ZyBoYW5kbGVkIG9ubHkgZm9yIHN1bjlpICovCisJaWYgKG9mX21h
Y2hpbmVfaXNfY29tcGF0aWJsZSgiYWxsd2lubmVyLHN1bjhpLWE4M3QiKSkKKwkJaWYgKGNwdSA9
PSAwKQorCQkJcmV0dXJuIGZhbHNlOwogCXJldHVybiB0cnVlOwogfQogI2VuZGlmCi0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
cm0ta2VybmVsCg==
