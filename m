From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?=
 <vesa.jaaskelainen@vaisala.com>
Subject: [RFC PATCH 1/2] Documentation: devicetree: root node board-revision
 property documentation
Date: Sun, 16 Jul 2017 23:00:55 +0300
Message-ID: <1500235256-48937-2-git-send-email-vesa.jaaskelainen@vaisala.com>
References: <1500235256-48937-1-git-send-email-vesa.jaaskelainen@vaisala.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1500235256-48937-1-git-send-email-vesa.jaaskelainen@vaisala.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <vesa.jaaskelainen@vaisala.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Qm9hcmQgcmV2aXNpb24gaXMgaGFyZHdhcmUgcmV2aXNpb24gZm9yIGJvYXJkLiBNZWFuaW5nIG9m
IGhhcmR3YXJlCnJldmlzaW9uIGlzIGRlZmluZWQgYnkgZGV2aWNlL1NvTSBtYW51ZmFjdHVyZXIg
YW5kIGJlY2F1c2Ugb2YgdGhhdCBpdCBpcwpkZWZpbmVkIGFzIGEgc3RyaW5nLgoKQm9hcmQgcmV2
aXNpb24gaW5mb3JtYXRpb24gY2FuIGJlIHN0b3JlZCBpbiBoYXJkd2FyZSBpZGVudGlmaWVyIHJl
c2lzdG9ycywKZUZ1c2VzLCBFRVBST00gb3Igc29tZSBvdGhlciBkZXZpY2Ugc3BlY2lmaWMgbm9u
LXZvbGF0aWxlIHN0b3JhZ2UuIEl0IGlzCmV4cGVjdGVkIHRoYXQgYm9vdGxvYWRlciB3aWxsIGFu
YWx5c2UgYm9hcmQgcmV2aXNpb24gaW5mb3JtYXRpb24gYW5kIHBhc3MKaXQgaW4gZGV2aWNlIHRy
ZWUgdG8ga2VybmVsLgoKU2lnbmVkLW9mZi1ieTogVmVzYSBKw6TDpHNrZWzDpGluZW4gPHZlc2Eu
amFhc2tlbGFpbmVuQHZhaXNhbGEuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
b290aW5nLXdpdGhvdXQtb2YudHh0IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYm9vdGluZy13aXRob3V0
LW9mLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9ib290aW5nLXdpdGhvdXQtb2YudHh0
CmluZGV4IGZiNzQwNDQuLmFlOGY1ZWMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9ib290aW5nLXdpdGhvdXQtb2YudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9ib290aW5nLXdpdGhvdXQtb2YudHh0CkBAIC04NzIsNiArODcyLDcgQEAgYWRkcmVzcyB3aGlj
aCBjYW4gZXh0ZW5kIGJleW9uZCB0aGF0IGxpbWl0LgogICBBZGRpdGlvbmFsIHByb3BlcnRpZXMg
Zm9yIHRoZSByb290IG5vZGU6CiAKICAgICAtIHNlcmlhbC1udW1iZXIgOiBhIHN0cmluZyByZXBy
ZXNlbnRpbmcgdGhlIGRldmljZSdzIHNlcmlhbCBudW1iZXIKKyAgICAtIGJvYXJkLXJldmlzaW9u
IDogYSBzdHJpbmcgcmVwcmVzZW50aW5nIHRoZSBib2FyZCdzIHJldmlzaW9uCiAKICAgYikgVGhl
IC9jcHVzIG5vZGUKIAotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
