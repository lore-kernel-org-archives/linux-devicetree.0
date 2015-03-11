From: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: drm/bridge: Add IT6151 bridge chip driver
 bindings.
Date: Wed, 11 Mar 2015 14:18:52 +0800
Message-ID: <1426054733-54378-1-git-send-email-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkIGRldmljZXRyZWUgYmluZGluZ3MgZm9yIElUNjE1MSBNSVBJIHRvIGVEUCBicmlkZ2UgY2hp
cCBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Ci0tLQogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RybS9icmlkZ2UvaXQ2MTUxLnR4dCB8IDE1ICsr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZHJtL2JyaWRnZS9p
dDYxNTEudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2RybS9icmlkZ2UvaXQ2MTUxLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kcm0vYnJpZGdlL2l0NjE1MS50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MC4uYWQwYWQ2MAotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kcm0vYnJpZGdlL2l0NjE1MS50eHQKQEAgLTAsMCArMSwxNSBAQAoraXQ2MTUxIGJy
aWRnZSBiaW5kaW5ncworCitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorCS0gY29tcGF0aWJsZTogIml0
ZSxpdDYxNTEiCisJLSByZWc6IGkyYyBhZGRyZXNzIG9mIHRoZSBicmlkZ2UncyBkcCB0eC4KKwkt
IHJ4cmVnOiBpMmMgYWRkcmVzcyBvZiB0aGUgYnJpZGdlJ3MgbWlwaSByeC4KKwktIHJlc2V0LWdw
aW86IE9GIGRldmljZS10cmVlIGdwaW8gc3BlY2lmaWNhdGlvbgorCitFeGFtcGxlOgorCWl0ZTYx
NTE6IGVkcC1icmlkZ2VANWMgeworCQljb21wYXRpYmxlID0gIml0ZSxpdDYxNTEiOworCQlyZWcg
PSA8MHg1Yz47CisJCXJ4cmVnID0gPDB4NmM+OworCQlyZXNldC1ncGlvID0gPCZwaW8gOTQgR1BJ
T19BQ1RJVkVfSElHSD47CisJfTsKLS0gCjEuOC4xLjEuZGlydHkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
