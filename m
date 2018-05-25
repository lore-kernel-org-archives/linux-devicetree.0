From: <stu.hsieh@mediatek.com>
Subject: [PATCH v3 3/8] drm/mediatek: add connection from OD1 to RDMA1
Date: Fri, 25 May 2018 10:34:20 +0800
Message-ID: <1527215665-11937-4-git-send-email-stu.hsieh@mediatek.com>
References: <1527215665-11937-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1527215665-11937-1-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgoKVGhpcyBwYXRjaCBhZGQg
dGhlIGNvbm5lY3Rpb24gZnJvbSBPRDEgdG8gUkRNQTEgZm9yIGV4dCBwYXRoLgoKU2lnbmVkLW9m
Zi1ieTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCmluZGV4IDQ3
ZmZhMjQwYmQyNS4uMGY1NjhkZDg1M2Q4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHAuYwpAQCAtMTUxLDYgKzE1MSw5IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXRrX2RkcF9t
b3V0X2VuKGVudW0gbXRrX2RkcF9jb21wX2lkIGN1ciwKIAl9IGVsc2UgaWYgKGN1ciA9PSBERFBf
Q09NUE9ORU5UX0dBTU1BICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9SRE1BMSkgewogCQkqYWRk
ciA9IERJU1BfUkVHX0NPTkZJR19ESVNQX0dBTU1BX01PVVRfRU47CiAJCXZhbHVlID0gR0FNTUFf
TU9VVF9FTl9SRE1BMTsKKwl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX09EMSAmJiBu
ZXh0ID09IEREUF9DT01QT05FTlRfUkRNQTEpIHsKKwkJKmFkZHIgPSBESVNQX1JFR19DT05GSUdf
RElTUF9PRF9NT1VUX0VOOworCQl2YWx1ZSA9IE9EMV9NT1VUX0VOX1JETUExOwogCX0gZWxzZSBp
ZiAoY3VyID09IEREUF9DT01QT05FTlRfUkRNQTEgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RQ
STApIHsKIAkJKmFkZHIgPSBESVNQX1JFR19DT05GSUdfRElTUF9SRE1BMV9NT1VUX0VOOwogCQl2
YWx1ZSA9IFJETUExX01PVVRfRFBJMDsKLS0gCjIuMTIuNQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
