From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v4 1/3] dt-bindings: describe dw_hdmi supplies
Date: Fri, 05 Jun 2015 19:05:43 +0200
Message-ID: <1707049.JEvfTcofKv@diego>
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
To: Thierry Reding <thierry.reding@gmail.com>, Mark Yao <mark.yao@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIERlc2lnbndhcmUgSERNSSBibG9jayBoYXMgdHdvIHN1cHBsaWVzIGZvciAxLjAgYW5kIDEu
OFYuIE5vdCBhbGwgSVAKaW1wbGVtZW50YXRpb25zIGV4cG9zZSBvciB3YW50IHRvIHVzZSB0aGVz
ZSwgc28gdGhleSByZW1haW4gb3B0aW9uYWwuCgpTaWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5l
ciA8aGVpa29Ac250ZWNoLmRlPgpBY2tlZC1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT4KLS0tCmNoYW5nZXMgc2luY2UgdjM6Ci0gc3BsaXQgZ2VuZXJpYyBkdC1iaW5k
aW5ncyBhbmQgcm9ja2NoaXAgaW1wbGVtZW50YXRpb24KLSBhZGQgQWNrIGZyb20gUGhpbGlwcCBa
YWJlbApjaGFuZ2VzIHNpbmNlIHYyOgotIHJlbmFtZSBzdXBwbGllcyB0byB0aGUgbmFtZXMgZm91
bmQgaW4gdGhlIGhkbWkgSVAgZGF0YWJvb2sKCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZHJtL2JyaWRnZS9kd19oZG1pLnR4dCB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kcm0vYnJpZGdlL2R3X2hkbWkudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2RybS9icmlkZ2UvZHdfaGRtaS50eHQKaW5kZXggYTkwNWMxNC4uYmE0MmQ4OSAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RybS9icmlkZ2UvZHdf
aGRtaS50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RybS9icmlk
Z2UvZHdfaGRtaS50eHQKQEAgLTIyLDYgKzIyLDEwIEBAIE9wdGlvbmFsIHByb3BlcnRpZXMKIC0g
ZGRjLWkyYy1idXM6IHBoYW5kbGUgb2YgYW4gSTJDIGNvbnRyb2xsZXIgdXNlZCBmb3IgRERDIEVE
SUQgcHJvYmluZwogLSBjbG9ja3MsIGNsb2NrLW5hbWVzOiBwaGFuZGxlIHRvIHRoZSBIRE1JIENF
QyBjbG9jaywgbmFtZSBzaG91bGQgYmUgImNlYyIKIAorT3B0aW9uYWwgc3VwcGxpZXM6CistIHZw
LXN1cHBseTogMS4wViBwb3dlciBzdXBwbHkKKy0gdnBoLXN1cHBseTogMS44ViBwb3dlciBzdXBw
bHkKKwogRXhhbXBsZToKIAloZG1pOiBoZG1pQDAxMjAwMDAgewogCQljb21wYXRpYmxlID0gImZz
bCxpbXg2cS1oZG1pIjsKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
