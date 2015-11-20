From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v4 10/13] of: add vendor prefix for boe
Date: Fri, 20 Nov 2015 16:15:36 +0800
Message-ID: <1448007339-10966-11-git-send-email-zyw@rock-chips.com>
References: <1448007339-10966-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1448007339-10966-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: heiko@sntech.de, linux-rockchip@lists.infradead.org, mark.yao@rock-chips.com, treding@nvidia.com, emil.l.velikov@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Arnaud Ebalard <arno@natisbad.org>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Chris Zhong <zyw@rock-chips.com>, rmk+kernel@arm.linux.org.uk, ajaykumar.rs@samsung.com, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogQ2hyaXMgWmhvbmcgPHp5d0Byb2NrLWNoaXBzLmNvbT4KQWNrZWQtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQoKQ2hhbmdlcyBpbiB2NDogTm9uZQpD
aGFuZ2VzIGluIHYzOiBOb25lCkNoYW5nZXMgaW4gdjI6IE5vbmUKCiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4dCB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4dAppbmRleCA1NWRmMWQ0Li4wZjg4ZDZmIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVz
LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZp
eGVzLnR4dApAQCAtMzMsNiArMzMsNyBAQCBhdW8JQVUgT3B0cm9uaWNzIENvcnBvcmF0aW9uCiBh
dmFnbwlBdmFnbyBUZWNobm9sb2dpZXMKIGF2aWMJU2hhbmdoYWkgQVZJQyBPcHRvZWxlY3Ryb25p
Y3MgQ28uLCBMdGQuCiBheGlzCUF4aXMgQ29tbXVuaWNhdGlvbnMgQUIKK2JvZQlCT0UgVGVjaG5v
bG9neSBHcm91cCBDby4sIEx0ZC4KIGJvc2NoCUJvc2NoIFNlbnNvcnRlYyBHbWJICiBib3VuZGFy
eQlCb3VuZGFyeSBEZXZpY2VzIEluYy4KIGJyY20JQnJvYWRjb20gQ29ycG9yYXRpb24KLS0gCjIu
Ni4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
