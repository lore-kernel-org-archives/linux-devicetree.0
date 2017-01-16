From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 2/3] dt-bindings: mtd: add a common label property to all
 mtd devices
Date: Mon, 16 Jan 2017 15:56:40 +0100
Message-ID: <1484578600-25994-1-git-send-email-clg@kaod.org>
References: <1484573225-19095-3-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1484573225-19095-3-git-send-email-clg@kaod.org>
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
aWxsb25AZnJlZS1lbGVjdHJvbnMuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvY29tbW9uLnR4dCB8IDE1ICsrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2NvbW1vbi50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2NvbW1vbi50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2NvbW1vbi50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwLi5mYzA2OGI5MjNkN2EKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2NvbW1vbi50eHQKQEAgLTAsMCArMSwxNSBA
QAorKiBDb21tb24gcHJvcGVydGllcyBvZiBhbGwgTVREIGRldmljZXMKKworT3B0aW9uYWwgcHJv
cGVydGllczoKKy0gbGFiZWw6IHVzZXItZGVmaW5lZCBNVEQgZGV2aWNlIG5hbWUuIENhbiBiZSB1
c2VkIHRvIGFzc2lnbiB1c2VyCisgIGZyaWVuZGx5IG5hbWVzIHRvIE1URCBkZXZpY2VzIChpbnN0
ZWFkIG9mIHRoZSBmbGFzaCBtb2RlbCBvciBmbGFzaAorICBjb250cm9sbGVyIGJhc2VkIG5hbWUp
IGluIG9yZGVyIHRvIGVhc2UgZmxhc2ggZGV2aWNlIGlkZW50aWZpY2F0aW9uCisgIGFuZC9vciBk
ZXNjcmliZSB3aGF0IHRoZXkgYXJlIHVzZWQgZm9yLgorCitFeGFtcGxlOgorCisJZmxhc2hAMCB7
CisJCWxhYmVsID0gIlN5c3RlbS1maXJtd2FyZSI7CisKKwkJLyogZmxhc2ggdHlwZSBzcGVjaWZp
YyBwcm9wZXJ0aWVzICovCisJfTsKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
