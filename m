From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 0/2] Add a "label" property to the mtd device
Date: Thu,  9 Feb 2017 10:21:06 +0100
Message-ID: <1486632068-14894-1-git-send-email-clg@kaod.org>
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
b3N0LCBwbHVzIGNoaXBzIHdpdGggZ29sZGVuIGltYWdlcyBmb3IgcmVjb3ZlcnkuCgpUaGFua3Ms
CgpDLgoKIENoYW5nZXMgc2luY2UgdjI6CgogLSBvbmx5IGFzc2lnbiBkZXZpY2UgbmFtZSBmcm9t
IGxhYmVsIGlmIG10ZC0+bmFtZSBpcyB1bmRlZmluZWQKCiBDaGFuZ2VzIHNpbmNlIHYxOgoKIC0g
bW92ZWQgdGhlIHVzZSBvZiB0aGUgImxhYmVsIiBwcm9wZXJ0eSBmcm9tIG10ZF9zZXRfZGV2X2Rl
ZmF1bHRzKCkKICAgdG8gbXRkX3NldF9vZl9ub2RlKCkgdG8gbGV0IGRyaXZlcnMga2VlcCBjb250
cm9sIG9uIGhvdyBtdGQtPm5hbWUKICAgaXMgc2V0IGFuZCBhbGxvY2F0ZWQuCgpDw6lkcmljIExl
IEdvYXRlciAoMik6CiAgbXRkOiBuYW1lIHRoZSBtdGQgZGV2aWNlIHdpdGggYW4gb3B0aW9uYWwg
bGFiZWwgcHJvcGVydHkKICBkdC1iaW5kaW5nczogbXRkOiBhZGQgYSBjb21tb24gbGFiZWwgcHJv
cGVydHkgdG8gYWxsIG10ZCBkZXZpY2VzCgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9jb21tb24udHh0IHwgMTUgKysrKysrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L210
ZC9tdGQuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMTggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvY29tbW9uLnR4dAoKLS0gCjIuNy40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
