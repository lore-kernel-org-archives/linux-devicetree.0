From: Marko Kohtala <marko.kohtala@okoko.fi>
Subject: [PATCH 3/6] video: ssd1307fb: Start page range at page_offset
Date: Tue, 18 Jun 2019 10:41:08 +0300
Message-ID: <20190618074111.9309-4-marko.kohtala@okoko.fi>
References: <20190618074111.9309-1-marko.kohtala@okoko.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190618074111.9309-1-marko.kohtala@okoko.fi>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, David Airlie <airlied@linux.ie>, Marko Kohtala <marko.kohtala@okoko.fi>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

VGhlIHBhZ2Vfb2Zmc2V0IHdhcyBvbmx5IGFwcGxpZWQgdG8gdGhlIGVuZCBvZiB0aGUgcGFnZSBy
YW5nZS4gVGhpcyBjYXVzZWQKdGhlIGRpc3BsYXkgdXBkYXRlcyB0byBjYXVzZSBhIHNjcm9sbGlu
ZyBlZmZlY3Qgb24gdGhlIGRpc3BsYXkgYmVjYXVzZSB0aGUKYW1vdW50IG9mIGRhdGEgd3JpdHRl
biB0byB0aGUgZGlzcGxheSBkaWQgbm90IG1hdGNoIHRoZSByYW5nZSBkaXNwbGF5CmV4cGVjdGVk
LgoKRml4ZXM6IDMwMWJjMDY3NWI2NyAoInZpZGVvOiBzc2QxMzA3ZmI6IE1ha2UgdXNlIG9mIGhv
cml6b250YWwgYWRkcmVzc2luZyBtb2RlIikKU2lnbmVkLW9mZi1ieTogTWFya28gS29odGFsYSA8
bWFya28ua29odGFsYUBva29rby5maT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdm
Yi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYyBiL2RyaXZlcnMv
dmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMKaW5kZXggOWFiMDBlMGRhZGM3Li44NmYyYjc5ZjNlZDUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMKKysrIGIvZHJpdmVy
cy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYwpAQCAtNDMzLDcgKzQzMyw3IEBAIHN0YXRpYyBpbnQg
c3NkMTMwN2ZiX2luaXQoc3RydWN0IHNzZDEzMDdmYl9wYXIgKnBhcikKIAlpZiAocmV0IDwgMCkK
IAkJcmV0dXJuIHJldDsKIAotCXJldCA9IHNzZDEzMDdmYl93cml0ZV9jbWQocGFyLT5jbGllbnQs
IDB4MCk7CisJcmV0ID0gc3NkMTMwN2ZiX3dyaXRlX2NtZChwYXItPmNsaWVudCwgcGFyLT5wYWdl
X29mZnNldCk7CiAJaWYgKHJldCA8IDApCiAJCXJldHVybiByZXQ7CiAKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
