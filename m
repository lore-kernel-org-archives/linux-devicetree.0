From: Yakir Yang <ykk@rock-chips.com>
Subject: [RFC PATCH v1 4/4] ARM: dst: rockchip: enable RGA support on veyron
 devices
Date: Mon, 21 Mar 2016 17:42:45 +0800
Message-ID: <1458553365-27252-1-git-send-email-ykk@rock-chips.com>
References: <1458552518-25527-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1458552518-25527-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogWWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29tPgotLS0KIGFyY2gv
YXJtL2Jvb3QvZHRzL3JrMzI4OC12ZXlyb24uZHRzaSB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC12
ZXlyb24uZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC12ZXlyb24uZHRzaQppbmRleCA5
ZmNlOTFmLi41ZWI0ZTk3IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9yazMyODgtdmV5
cm9uLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LXZleXJvbi5kdHNpCkBAIC00
MjUsNiArNDI1LDEwIEBACiAJZHJfbW9kZSA9ICJob3N0IjsKIH07CiAKKyZyZ2EgeworCXN0YXR1
cyA9ICJva2F5IjsKK307CisKICZ2b3BiIHsKIAlzdGF0dXMgPSAib2theSI7CiB9OwotLSAKMS45
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
