From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] CP115 pinctrl support
Date: Mon,  5 Aug 2019 12:16:04 +0200
Message-ID: <20190805101607.29811-1-miquel.raynal@bootlin.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Yan Markman <ymarkman@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Chulski <stefanc@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGVsbG8sCgpUaGlzIGlzIHRoZSBzZWNvbmQgYmF0Y2ggb2YgY2hhbmdlcyAob3V0IG9mIHRocmVl
KSB0byBzdXBwb3J0IHRoZSBicmFuZApuZXcgTWFydmVsbCBDTjkxMzAgU29DcyB3aGljaCBhcmUg
bWFkZSBvZiBvbmUgQVA4MDcgYW5kIG9uZSBDUDExNS4KCldlIGFkZCBhIG5ldyBjb21wYXRpYmxl
IChhbmQgdGhlIHJlbGV2YW50IHN1cHBvcnQgaW4gdGhlIHBpbmN0cmwKZHJpdmVyKSBiZWZvcmUg
dGhlIGFkZGl0aW9uIGluIGJhdGNoIDMvMyBvZiBDTjkxMzAgU29DcyBEVCB1c2luZyBpdC4KCjFz
dCBiYXRjaCB3YXMgY2xvY2tzIHN1cHBvcnQgYW5kIGlzIGluZGVwZW5kZW50IGZyb20gdGhpcyBv
bmUuCgpUaGFua3MsCk1pcXXDqGwKCgpHcnplZ29yeiBKYXN6Y3p5ayAoMik6CiAgZHQtYmluZGlu
Z3M6IGNwMTEwOiBkb2N1bWVudCB0aGUgbmV3IENQMTE1IHBpbmN0cmwgY29tcGF0aWJsZQogIHBp
bmN0cmw6IG12ZWJ1OiBhZGQgYWRkaXRpb25hbCB2YXJpYW50IGZvciBzdGFuZGFsb25lIENQMTE1
CgpLb25zdGFudGluIFBvcm90Y2hraW4gKDEpOgogIHBpbmN0cmw6IG12ZWJ1OiBBZGQgQ1AxMTAg
bWlzc2luZyBwaW4gZnVuY3Rpb25hbGl0eQoKIC4uLi9hcm0vbWFydmVsbC9jcDExMC1zeXN0ZW0t
Y29udHJvbGxlci50eHQgICB8ICA0ICsrLS0KIGRyaXZlcnMvcGluY3RybC9tdmVidS9waW5jdHJs
LWFybWFkYS1jcDExMC5jICB8IDIwICsrKysrKysrKysrKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgMTcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVs
IG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
