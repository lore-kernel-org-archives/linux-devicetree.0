From: y@pengutronix.de
Subject: [PATCH 0/9] make struct of_device_id.data const
Date: Fri, 13 Jul 2012 14:32:03 +0200
Message-ID: <4555.63577493212$1342183302@news.gmane.org>
References: <1342182734-321-1-git-send-email-y>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1342182734-321-1-git-send-email-y>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: devicetree@vger.kernel.org

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
CgpVd2UgS2xlaW5lLUvDtm5pZyAoOSk6CiAgc3BpL2lteDogbWFrZSBzcGlfaW14X2RhdGEuZGV2
dHlwZV9kYXRhIG1lbWJlciBwb2ludCB0byBjb25zdCBkYXRhCiAgc2VyaWFsL2lteDogbWFrZSBp
bXhfcG9ydC5kZXZkYXRhIG1lbWJlciBwb2ludCB0byBjb25zdCBkYXRhCiAgQVJNOiBjYWNoZS1s
MngwOiBhZGQgYSBjb25zdCBxdWFsaWZpZXIKICBtaXNjL2F0bWVsX3RjOiBtYWtlIGF0bWVsX3Rj
LnRjYl9jb25maWcgbWVtYmVyIHBvaW50IHRvIGNvbnN0IGRhdGEKICBncGlvL2dwaW8tb21hcC5j
OiBhZGQgYSBjb25zdCBxdWFsaWZpZXIKICBpMmMvaTJjLW9tYXA6IGFkZCBhIGNvbnN0IHF1YWxp
ZmllcgogIHNwaS9zcGktb21hcDItbWNzcGk6IGFkZCBhIGNvbnN0IHF1YWxpZmllcgogIG9mOiBh
ZGQgY29uc3QgdG8gc3RydWN0IG9mX2RldmljZV9pZC5kYXRhCiAgZ3Bpby9ncGlvLW9tYXA6IG1h
a2UgcGxhdGZvcm1kYXRhIHVzZWQgYXMgb2ZfZGV2aWNlX2lkLmRhdGEgY29uc3QKCiBhcmNoL2Fy
bS9tbS9jYWNoZS1sMngwLmMgICAgICAgIHwgICAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tb21h
cC5jICAgICAgICB8ICAgIDggKysrKy0tLS0KIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtb21hcC5j
ICAgfCAgICAzICsrLQogZHJpdmVycy9zcGkvc3BpLWlteC5jICAgICAgICAgICB8ICAgIDIgKy0K
IGRyaXZlcnMvc3BpL3NwaS1vbWFwMi1tY3NwaS5jICAgfCAgICAyICstCiBkcml2ZXJzL3R0eS9z
ZXJpYWwvaW14LmMgICAgICAgIHwgICAgMiArLQogaW5jbHVkZS9saW51eC9hdG1lbF90Yy5oICAg
ICAgICB8ICAgIDIgKy0KIGluY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmggfCAgICAyICst
CiA4IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKLS0g
CjEuNy4xMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwK
