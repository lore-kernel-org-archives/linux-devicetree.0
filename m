From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 5/5] mtd: spi-nor: add a label property to jedec,spi-nor
Date: Fri,  9 Dec 2016 17:49:27 +0100
Message-ID: <1481302167-28044-6-git-send-email-clg@kaod.org>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1481302167-28044-1-git-send-email-clg@kaod.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
List-Id: devicetree@vger.kernel.org

VGhpcyBjYW4gYmUgdXNlZCB0byBlYXNpbHkgaWRlbnRpZnkgYSBjaGlwIG9uIGEgc3lzdGVtIHdp
dGggbXVsdGlwbGUKY2hpcHMuCgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVk
ZWMsc3BpLW5vci50eHQgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxz
cGktbm9yLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMs
c3BpLW5vci50eHQKaW5kZXggMmM5MWMwM2U3ZWIwLi5iN2NkMDJhM2ViZTggMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci50eHQK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9y
LnR4dApAQCAtNjUsNiArNjUsNyBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAg
ICAgICAgIGFsbCBjaGlwcyBhbmQgc3VwcG9ydCBmb3IgaXQgY2FuIG5vdCBiZSBkZXRlY3RlZCBh
dCBydW50aW1lLgogICAgICAgICAgICAgICAgICAgIFJlZmVyIHRvIHlvdXIgY2hpcHMnIGRhdGFz
aGVldCB0byBjaGVjayBpZiB0aGlzIGlzIHN1cHBvcnRlZAogICAgICAgICAgICAgICAgICAgIGJ5
IHlvdXIgY2hpcC4KKy0gbGFiZWwgOiBuYW1lIHRvIGFzc2lnbiB0byBtdGQuIElmIG9taXR0ZWQs
IHRoZSBsYWJlbCBpcyB0aGUgTVREIGRldmljZSBuYW1lLgogCiBFeGFtcGxlOgogCkBAIC03NSw0
ICs3Niw1IEBAIEV4YW1wbGU6CiAJCXJlZyA9IDwwPjsKIAkJc3BpLW1heC1mcmVxdWVuY3kgPSA8
NDAwMDAwMDA+OwogCQltMjVwLGZhc3QtcmVhZDsKKwkJbGFiZWwgPSAiU3lzdGVtLWZpcm13YXJl
IjsKIAl9OwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
