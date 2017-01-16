From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/3] Add a "label" property to the mtd device
Date: Mon, 16 Jan 2017 14:27:02 +0100
Message-ID: <1484573225-19095-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
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

SGVsbG8sCgpIZXJlciBhcmUgYSBjb3VwbGUgb2YgcGF0Y2hlcyBhZGRpbmcgYSAibGFiZWwiIHBy
b3BlcnR5IHRvIHRoZSBtdGQKZGV2aWNlLCB3aGljaCBjYW4gYmUgdXNlZCB0byBpZGVudGlmeSBh
IHNwZWNpZmljIGNoaXAgb24gYSBzeXN0ZW0gd2l0aAptdWx0aXBsZSBjaGlwcy4gVGhpcyBpcyBj
b21tb24gb24gdGhlIE9wZW5Qb3dlciBib2FyZHMsIHRoZXJlIGNhbiBiZQpmb3VyIGNoaXBzIGhv
bGRpbmcgdGhlIGZpcm13YXJlIGZvciB0aGUgQk1DIGFuZCB0aGUgZmlybXdhcmUgZm9yIHRoZQpo
b3N0LCBwbHVzIGNoaXBzIHdpdGggZ29sZGVuIGltYWdlcyBmb3IgcmVjb3ZlcnkuCgpBbHNvIGlu
Y2x1ZGVkIGEgcGF0Y2ggZnJvbSBSb2JlcnQgYWRkaW5nIGR1YWwgZGF0YSByZWFkIHRvIHRoZQpt
eDY2bDUxMjM1bCBjaGlwLiBJdCB3YXMgdGVzdGVkIG9uIGEgWmFpdXMgYm9hcmQgd2hpY2ggaGFz
IGEgQVNUMjUwMApTb0MgZm9yIEJNQy4KClRoYW5rcywKCkMuCgoKQ8OpZHJpYyBMZSBHb2F0ZXIg
KDIpOgogIG10ZDogbmFtZSB0aGUgbXRkIGRldmljZSB3aXRoIGFuIG9wdGlvbmFsIGxhYmVsIHBy
b3BlcnR5CiAgZHQtYmluZGluZ3M6IG10ZDogYWRkIGEgY29tbW9uIGxhYmVsIHByb3BlcnR5IHRv
IGFsbCBtdGQgZGV2aWNlcwoKUm9iZXJ0IExpcHBlcnQgKDEpOgogIG10ZDogc3BpLW5vcjogYWRk
IFNQSV9OT1JfRFVBTF9SRUFEIHRvIG14NjZsNTEyMzVsCgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9jb21tb24udHh0IHwgMTIgKysrKysrKysrKysrCiBkcml2ZXJzL210
ZC9tdGRjb3JlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNyArKysrKysrCiBkcml2
ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogMyBm
aWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9jb21tb24udHh0
CgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
