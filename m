From: Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v1 4/4] arm64: dts: sdm845: Add zap shader
 region for GPU
Date: Tue, 12 Mar 2019 12:13:42 -0600
Message-ID: <1552414422-9568-5-git-send-email-jcrouse@codeaurora.org>
References: <1552414422-9568-1-git-send-email-jcrouse@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1552414422-9568-1-git-send-email-jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

U29tZSBBZHJlbm8gR1BVIHRhcmdldHMgcmVxdWlyZSBhIHNwZWNpYWwgemFwIHNoYWRlciB0byBi
cmluZyB0aGUgR1BVCm91dCBvZiBzZWN1cmUgbW9kZS4gRGVmaW5lIGEgcmVnaW9uIHRvIGFsbG9j
YXRlIGFuZCBzdG9yZSB0aGUgemFwCnNoYWRlci4KClNpZ25lZC1vZmYtYnk6IEpvcmRhbiBDcm91
c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+Ci0tLQoKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNv
bS9zZG04NDUuZHRzaSB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zZG04NDUuZHRz
aSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zZG04NDUuZHRzaQppbmRleCBmZWQ3YTI5Li41
MjY0NTZkIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vc2RtODQ1LmR0c2kK
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NkbTg0NS5kdHNpCkBAIC0xMDAsNiArMTAw
LDExIEBACiAJCQluby1tYXA7CiAJCX07CiAKKwkJemFwX3NoYWRlcl9yZWdpb246IG1lbW9yeUA4
YzQxNTAwMCB7CisJCQlyZWcgPSA8MCAweDhjNDE1MDAwIDAgMHgyMDAwPjsKKwkJCW5vLW1hcDsK
KwkJfTsKKwogCQltcHNzX3JlZ2lvbjogbWVtb3J5QDhlMDAwMDAwIHsKIAkJCXJlZyA9IDwwIDB4
OGUwMDAwMDAgMCAweDc4MDAwMDA+OwogCQkJbm8tbWFwOwpAQCAtMTA5LDYgKzExNCw4IEBACiAJ
CQlyZWcgPSA8MCAweDk2NTAwMDAwIDAgMHgyMDAwMDA+OwogCQkJbm8tbWFwOwogCQl9OworCisK
IAl9OwogCiAJY3B1cyB7CkBAIC0xNTE0LDYgKzE1MjEsMTAgQEAKIAogCQkJcWNvbSxnbXUgPSA8
JmdtdT47CiAKKwkJCXphcC1zaGFkZXIgeworCQkJCW1lbW9yeS1yZWdpb24gPSA8JnphcF9zaGFk
ZXJfcmVnaW9uPjsKKwkJCX07CisKIAkJCWdwdV9vcHBfdGFibGU6IG9wcC10YWJsZSB7CiAJCQkJ
Y29tcGF0aWJsZSA9ICJvcGVyYXRpbmctcG9pbnRzLXYyIjsKIAotLSAKMi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5n
IGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
