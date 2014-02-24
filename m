From: =?UTF-8?q?J=C3=BCrg=20Billeter?= <j@bitron.ch>
Subject: [PATCH] ARM: kernel: respect device tree status of cpu nodes
Date: Mon, 24 Feb 2014 12:22:40 +0100
Message-ID: <1393240960-31846-1-git-send-email-j@bitron.ch>
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
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@lists.codethink.co.uk, devicetree@vger.kernel.org, =?UTF-8?q?J=C3=BCrg=20Billeter?= <j@bitron.ch>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

U2tpcCAnZGlzYWJsZWQnIGNwdSBub2RlcyB3aGVuIGJ1aWxkaW5nIHRoZSBjcHUgbG9naWNhbCBt
YXAuIFRoaXMgYXZvaWRzCmJvb3RpbmcgY3B1cyB0aGF0IGhhdmUgYmVlbiBkaXNhYmxlZCBpbiB0
aGUgZGV2aWNlIHRyZWUuCgpTaWduZWQtb2ZmLWJ5OiBKw7xyZyBCaWxsZXRlciA8akBiaXRyb24u
Y2g+ClJldmlld2VkLWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+Ci0t
LQogYXJjaC9hcm0va2VybmVsL2RldnRyZWUuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2tlcm5lbC9kZXZ0cmVlLmMgYi9h
cmNoL2FybS9rZXJuZWwvZGV2dHJlZS5jCmluZGV4IDczOWMzZGYuLjlhZWQyOTkgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtL2tlcm5lbC9kZXZ0cmVlLmMKKysrIGIvYXJjaC9hcm0va2VybmVsL2RldnRy
ZWUuYwpAQCAtOTUsNiArOTUsMTAgQEAgdm9pZCBfX2luaXQgYXJtX2R0X2luaXRfY3B1X21hcHMo
dm9pZCkKIAkJaWYgKG9mX25vZGVfY21wKGNwdS0+dHlwZSwgImNwdSIpKQogCQkJY29udGludWU7
CiAKKwkJLyogQ2hlY2sgaWYgQ1BVIGlzIGVuYWJsZWQgKi8KKwkJaWYgKCFvZl9kZXZpY2VfaXNf
YXZhaWxhYmxlKGNwdSkpCisJCQljb250aW51ZTsKKwogCQlwcl9kZWJ1ZygiICogJXMuLi5cbiIs
IGNwdS0+ZnVsbF9uYW1lKTsKIAkJLyoKIAkJICogQSBkZXZpY2UgdHJlZSBjb250YWluaW5nIENQ
VSBub2RlcyB3aXRoIG1pc3NpbmcgInJlZyIKLS0gCjEuOS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
