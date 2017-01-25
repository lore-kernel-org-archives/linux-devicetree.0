From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 2/2] dt-bindings: mtd: add a common label property to all
 mtd devices
Date: Wed, 25 Jan 2017 19:17:35 +0100
Message-ID: <1485368255-12038-3-git-send-email-clg@kaod.org>
References: <1485368255-12038-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1485368255-12038-1-git-send-email-clg@kaod.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

VGhpcyBjYW4gYmUgdXNlZCB0byBlYXNpbHkgaWRlbnRpZnkgYSBzcGVjaWZpYyBjaGlwIG9uIGEg
c3lzdGVtIHdpdGgKbXVsdGlwbGUgY2hpcHMuCgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdv
YXRlciA8Y2xnQGthb2Qub3JnPgpBY2tlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6
aWxsb25AZnJlZS1lbGVjdHJvbnMuY29tPgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2NvbW1v
bi50eHQgfCAxNSArKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25z
KCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9jb21tb24udHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9jb21tb24udHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9jb21tb24udHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4u
ZmMwNjhiOTIzZDdhCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9jb21tb24udHh0CkBAIC0wLDAgKzEsMTUgQEAKKyogQ29tbW9uIHByb3Bl
cnRpZXMgb2YgYWxsIE1URCBkZXZpY2VzCisKK09wdGlvbmFsIHByb3BlcnRpZXM6CistIGxhYmVs
OiB1c2VyLWRlZmluZWQgTVREIGRldmljZSBuYW1lLiBDYW4gYmUgdXNlZCB0byBhc3NpZ24gdXNl
cgorICBmcmllbmRseSBuYW1lcyB0byBNVEQgZGV2aWNlcyAoaW5zdGVhZCBvZiB0aGUgZmxhc2gg
bW9kZWwgb3IgZmxhc2gKKyAgY29udHJvbGxlciBiYXNlZCBuYW1lKSBpbiBvcmRlciB0byBlYXNl
IGZsYXNoIGRldmljZSBpZGVudGlmaWNhdGlvbgorICBhbmQvb3IgZGVzY3JpYmUgd2hhdCB0aGV5
IGFyZSB1c2VkIGZvci4KKworRXhhbXBsZToKKworCWZsYXNoQDAgeworCQlsYWJlbCA9ICJTeXN0
ZW0tZmlybXdhcmUiOworCisJCS8qIGZsYXNoIHR5cGUgc3BlY2lmaWMgcHJvcGVydGllcyAqLwor
CX07Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
