From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v2 10/11] drm/rockchip/dsi: fix phy clk lane stop state timeout
Date: Mon, 16 Jan 2017 18:08:30 +0800
Message-ID: <1484561311-494-11-git-send-email-zyw@rock-chips.com>
References: <1484561311-494-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1484561311-494-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dianders@chromium.org, tfiga@chromium.org, heiko@sntech.de, yzq@rock-chips.com, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, pawel.moll@arm.com, seanpaul@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Chris Zhong <zyw@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QmVmb3JlIHBoeSBpbml0LCB0aGUgZGV0ZWN0aW9uIG9mIHBoeSBzdGF0ZSBzaG91bGQgYmUgY29u
dHJvbGxlZAptYW51YWxseS4gQWZ0ZXIgdGhhdCwgd2UgY2FuIHN3aXRjaCB0aGUgZGV0ZWN0aW9u
IHRvIGhhcmR3YXJkLAppdCBpcyBhdXRvbWF0aWMuIEhlbmNlIG1vdmUgUEhZX1RYUkVRVUVTVENM
S0hTIHNldHRpbmcgdG8gdGhlIGVuZApvZiBwaHkgaW5pdC4KClNpZ25lZC1vZmYtYnk6IENocmlz
IFpob25nIDx6eXdAcm9jay1jaGlwcy5jb20+Ci0tLQoKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9kdy1taXBpLWRzaS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHct
bWlwaS1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS5jCmluZGV4
IGY1MDkwOWUuLjlkZmE3M2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9k
dy1taXBpLWRzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS5j
CkBAIC00NzUsNiArNDc1LDggQEAgc3RhdGljIGludCBkd19taXBpX2RzaV9waHlfaW5pdChzdHJ1
Y3QgZHdfbWlwaV9kc2kgKmRzaSkKIAkJZGV2X2Vycihkc2ktPmRldiwKIAkJCSJmYWlsZWQgdG8g
d2FpdCBmb3IgcGh5IGNsayBsYW5lIHN0b3Agc3RhdGVcbiIpOwogCisJZHNpX3dyaXRlKGRzaSwg
RFNJX0xQQ0xLX0NUUkwsIFBIWV9UWFJFUVVFU1RDTEtIUyk7CisKIHBoeV9pbml0X2VuZDoKIAlp
ZiAoIUlTX0VSUihkc2ktPnBoeV9jZmdfY2xrKSkKIAkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRz
aS0+cGh5X2NmZ19jbGspOwpAQCAtNzIxLDcgKzcyMyw2IEBAIHN0YXRpYyB2b2lkIGR3X21pcGlf
ZHNpX2luaXQoc3RydWN0IGR3X21pcGlfZHNpICpkc2kpCiAJCSAgfCBQSFlfUlNUWiB8IFBIWV9T
SFVURE9XTlopOwogCWRzaV93cml0ZShkc2ksIERTSV9DTEtNR1JfQ0ZHLCBUT19DTEtfRElWSURT
SU9OKDEwKSB8CiAJCSAgVFhfRVNDX0NMS19ESVZJRFNJT04oNykpOwotCWRzaV93cml0ZShkc2ks
IERTSV9MUENMS19DVFJMLCBQSFlfVFhSRVFVRVNUQ0xLSFMpOwogfQogCiBzdGF0aWMgdm9pZCBk
d19taXBpX2RzaV9kcGlfY29uZmlnKHN0cnVjdCBkd19taXBpX2RzaSAqZHNpLAotLSAKMi42LjMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
