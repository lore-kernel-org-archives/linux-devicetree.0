From: y@pengutronix.de
Subject: [PATCH 04/11] misc/atmel_tc: make atmel_tc.tcb_config member point to
 const data
Date: Fri, 13 Jul 2012 14:32:07 +0200
Message-ID: <48585.430524736$1342183126@news.gmane.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Rob Herring <rob.herring@calxeda.com>, kernel@pengutronix.de, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
ClRoaXMgcHJlcGFyZXMgb2ZfZGV2aWNlX2lkLmRhdGEgYmVjb21pbmcgY29uc3QuIFdpdGhvdXQg
dGhpcyBjaGFuZ2UKdGhlIGZvbGxvd2luZyB3YXJuaW5nIHdvdWxkIG9jY3VyOgoKCWRyaXZlcnMv
bWlzYy9hdG1lbF90Y2xpYi5jOiBJbiBmdW5jdGlvbiAndGNfcHJvYmUnOgoJZHJpdmVycy9taXNj
L2F0bWVsX3RjbGliLmM6MTcwOiB3YXJuaW5nOiBhc3NpZ25tZW50IGRpc2NhcmRzIHF1YWxpZmll
cnMgZnJvbSBwb2ludGVyIHRhcmdldCB0eXBlCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpDYzogTmljb2xhcyBGZXJyZSA8
bmljb2xhcy5mZXJyZUBhdG1lbC5jb20+CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPgotLS0KSGVsbG8sCgpidHcsIGdldF9tYWludGFpbmVyLnBsIHN1
Z2dlc3RlZCB0byBDYzoKbGludXgtYXRtLWdlbmVyYWxAbGlzdHMuc291cmNlZm9yZ2UubmV0IGJ1
dCBub3QgdGhlIEF0bWVsIHBlb3BsZSBiZWNhdXNlCmluY2x1ZGUvbGludXgvYXRtZWxfdGMuaCBt
YXRjaGVzIGluY2x1ZGUvbGludXgvYXRtKi4KCkJlc3QgcmVnYXJkcwpVd2UKIGluY2x1ZGUvbGlu
dXgvYXRtZWxfdGMuaCB8ICAgIDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYXRtZWxfdGMuaCBiL2lu
Y2x1ZGUvbGludXgvYXRtZWxfdGMuaAppbmRleCAxZDE0YjFkYy4uODlhOTMxYiAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9saW51eC9hdG1lbF90Yy5oCisrKyBiL2luY2x1ZGUvbGludXgvYXRtZWxfdGMu
aApAQCAtNjMsNyArNjMsNyBAQCBzdHJ1Y3QgYXRtZWxfdGMgewogCXN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UJKnBkZXY7CiAJc3RydWN0IHJlc291cmNlCQkqaW9tZW07CiAJdm9pZCBfX2lvbWVtCQkq
cmVnczsKLQlzdHJ1Y3QgYXRtZWxfdGNiX2NvbmZpZwkqdGNiX2NvbmZpZzsKKwljb25zdCBzdHJ1
Y3QgYXRtZWxfdGNiX2NvbmZpZyAqdGNiX2NvbmZpZzsKIAlpbnQJCQlpcnFbM107CiAJc3RydWN0
IGNsawkJKmNsa1szXTsKIAlzdHJ1Y3QgbGlzdF9oZWFkCW5vZGU7Ci0tIAoxLjcuMTAuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1r
ZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJu
ZWwK
