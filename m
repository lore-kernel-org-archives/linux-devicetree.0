From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] mfd: always assign of_node in mfd_add_device()
Date: Fri, 20 Dec 2013 14:25:30 +0000
Message-ID: <20131220142530.GK3709@lee--X1>
References: <1386626809-6251-1-git-send-email-swarren@wwwdotorg.org>
 <20131211092435.GC16780@lee--X1> <52B32C05.5010204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <52B32C05.5010204@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Stephen Warren <swarren@nvidia.com>, Samuel Ortiz <sameo@linux.intel.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, rtc-linux@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGkgU3RlcGhlbiwKClBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGlzIGlzIHN1aXRhYmxlIGFuZCBJ
IGNhbiBrZWVwIHlvdXIgQWNrLgoKLS0tLQoKbWZkOiBSZXZlcnQgIm1mZDogQWx3YXlzIGFzc2ln
biBvZl9ub2RlIGluIG1mZF9hZGRfZGV2aWNlKCkiCgpUaGlzIHJldmVydHMgY29tbWl0IDY4MDQ0
YmVlMTM3NzA5MThlMGIyOGRkNDRhYTk4Yzg4OWVjNzU1OGYuCgpXZSd2ZSBoYWQgY29uZmlybWVk
IHJlcG9ydHMgb2YgdGhpcyBwYXRjaCBjYXVzaW5nIHVuZm9yZXNlZW4gaXNzdWVzCndpdGggZXhp
c3RpbmcgTUZEIHVzZXJzLiBJdCBoYXMgYmVlbiBhZ3JlZWQgYnkgdGhlIG9yaWdpbmFsIGF1dGhv
cgphbmQgbXlzZWxmIHRoYXQgcmV2ZXJzaW9uIGlzIHRoZSBiZXN0IHNvbHV0aW9uLgoKQWNrZWQt
Ynk6IFN0ZXBoZW4gV2FycmVuIDxzd2FycmVuQG52aWRpYS5jb20+ClNpZ25lZC1vZmYtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQv
bWZkLWNvcmUuYyBiL2RyaXZlcnMvbWZkL21mZC1jb3JlLmMKaW5kZXggMzJlOGQ0Ny4uMjY3NjQ5
MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZmQvbWZkLWNvcmUuYworKysgYi9kcml2ZXJzL21mZC9t
ZmQtY29yZS5jCkBAIC0xMTcsOCArMTE3LDYgQEAgc3RhdGljIGludCBtZmRfYWRkX2RldmljZShz
dHJ1Y3QgZGV2aWNlICpwYXJlbnQsIGludCBpZCwKIAkJCX0KIAkJfQogCX0KLQlpZiAoIXBkZXYt
PmRldi5vZl9ub2RlKQotCQlwZGV2LT5kZXYub2Zfbm9kZSA9IHBhcmVudC0+b2Zfbm9kZTsKIAog
CWlmIChjZWxsLT5wZGF0YV9zaXplKSB7CiAJCXJldCA9IHBsYXRmb3JtX2RldmljZV9hZGRfZGF0
YShwZGV2LAoKLS0gCkxlZSBKb25lcwpMaW5hcm8gU1RNaWNyb2VsZWN0cm9uaWNzIExhbmRpbmcg
VGVhbSBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
