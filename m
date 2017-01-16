From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/3] dt-bindings: mtd: add a common label property to all mtd
 devices
Date: Mon, 16 Jan 2017 14:27:04 +0100
Message-ID: <1484573225-19095-3-git-send-email-clg@kaod.org>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1484573225-19095-1-git-send-email-clg@kaod.org>
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
YXRlciA8Y2xnQGthb2Qub3JnPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvY29tbW9uLnR4dCB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL2NvbW1vbi50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL2NvbW1vbi50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL2NvbW1vbi50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMDAwLi5hNzgxNjQxYTNiMDAKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2NvbW1vbi50eHQKQEAgLTAsMCArMSwxMiBAQAorKiBDb21t
b24gcHJvcGVydGllcyBvZiBhbGwgTVREIGRldmljZXMKKworT3B0aW9uYWwgcHJvcGVydGllczoK
Ky0gbGFiZWwgOiBuYW1lIHRvIGFzc2lnbiB0byBtdGQuIElmIG9taXR0ZWQsIHRoZSBsYWJlbCBp
cyB0aGUgTVREIGRldmljZSBuYW1lLgorCitFeGFtcGxlOgorCisJZmxhc2hAMCB7CisJCWxhYmVs
ID0gIlN5c3RlbS1maXJtd2FyZSI7CisKKwkJLyogZmxhc2ggdHlwZSBzcGVjaWZpYyBwcm9wZXJ0
aWVzICovCisJfTsKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
