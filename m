From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 0/4] media: sun6i: Add support for the H3 CSI controller
Date: Mon,  5 Mar 2018 11:04:28 +0100
Message-ID: <20180305100432.15009-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Yong Deng <yong.deng@magewell.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Mylene Josserand <mylene.josserand@bootlin.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SGksCgpUaGUgSDMgYW5kIEg1IGhhdmUgYSBDU0kgY29udHJvbGxlciBiYXNlZCBvbiB0aGUgb25l
IHByZXZpb3VzbHkgZm91bmQKaW4gdGhlIEEzMSwgdGhhdCBpcyBjdXJyZW50bHkgc3VwcG9ydGVk
IGJ5IHRoZSBzdW42aS1jc2kgZHJpdmVyLgoKQWRkIHRoZSBjb21wYXRpYmxlcyB0byB0aGUgZGV2
aWNlIHRyZWUgYmluZGluZ3MgYW5kIHRvIHRoZSBkcml2ZXIgdG8KbWFrZSBpdCB3b3JrIHByb3Bl
cmx5LgoKVGhpcyBvYnZpb3VzbHkgZGVwZW5kcyBvbiB0aGUgc2VyaWUgIkluaXRpYWwgQWxsd2lu
bmVyIFYzcyBDU0kKU3VwcG9ydCIgYnkgWW9uZyBEZW5nLgoKTGV0IG1lIGtub3cgd2hhdCB5b3Ug
dGhpbmssCk1heGltZQoKTWF4aW1lIFJpcGFyZCAoMik6CiAgZHQtYmluZGluZ3M6IG1lZGlhOiBz
dW42aTogQWRkIEEzMSBhbmQgSDMgY29tcGF0aWJsZXMKICBtZWRpYTogc3VuNmk6IEFkZCBBMzEg
Y29tcGF0aWJsZQoKTXlsw6huZSBKb3NzZXJhbmQgKDIpOgogIEFSTTogZHRzOiBzdW44aTogQWRk
IHRoZSBIMy9INSBDU0kgY29udHJvbGxlcgogIFtETyBOT1QgTUVSR0VdIEFSTTogZHRzOiBzdW44
aTogQWRkIENBTTUwMEIgY2FtZXJhIG1vZHVsZSB0byB0aGUgTmFubwogICAgUGkgTTErCgogLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc3VuNmktY3NpLnR4dCAgICAgICAgfCAgNSArLQog
YXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktaDMtbmFub3BpLW0xLXBsdXMuZHRzICAgICAgfCA4NSAr
KysrKysrKysrKysrKysrKysrKysrCiBhcmNoL2FybS9ib290L2R0cy9zdW54aS1oMy1oNS5kdHNp
ICAgICAgICAgICAgICAgICB8IDIyICsrKysrKwogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdW54
aS9zdW42aS1jc2kvc3VuNmlfY3NpLmMgfCAgMSArCiA0IGZpbGVzIGNoYW5nZWQsIDExMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgotLSAKMi4xNC4zCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
