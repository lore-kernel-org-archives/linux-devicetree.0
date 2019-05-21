From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH resend 0/2] Marvell A7k/A8k thermal throttling
Date: Tue, 21 May 2019 16:25:02 +0200
Message-ID: <20190521142504.31558-1-miquel.raynal@bootlin.com>
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
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGVsbG8sCgpUaGlzIHNlcmllcyB3b3JrcyBvbiB0b3Agb2YgR3JlZ29yeSdzIHNlcmllcyBhZGRp
bmcgYm90aCBDUFVmcmVxIChhbHJlYWR5Cm1lcmdlZCkgYW5kIGEgc3VpdGFibGUgQVA4MDYgY2xv
Y2sgZHJpdmVyLiBUaGVzZSB0d28gcGF0Y2hlcyBjYW4gZmx5CmFzLWlzIGFuZCBkbyBub3QgZGVw
ZW5kIG9uIEdyZWdvcnkncyB3b3JrIHRvIGFwcGx5IGFuZCBzaG91bGQgcHJvYmFibHkKbWVyZ2Vk
IGluZGVwZW5kZW50bHkuCgpXaXRoIGhpcyBwYXRjaGVzLCBhbGwgdGhlIHBpZWNlcyB3aGVyZSBh
dmFpbGFibGUgdG8gZW5hYmxlIHRoZXJtYWwKdGhyb3R0bGluZyBvbiB0aGUgQVA4MDYgZW1iZWRk
ZWQgaW4gTWFydmVsbCBBcm1hZGEgN2svOGsgU29Dcy4gVGhpcyBpcwpqdXN0IHRoZSBnbHVlIHRv
IG1ha2UgaXQgYWN0dWFsbHkgd29yay4KClBhdGNoIDEgY2hhbmdlcyB0aGUgY29yZSBudW1iZXJp
bmcgaW4gdGhlIHRoZXJtYWwtem9uZSBub2RlIHRvIGJlIGluCnN5bmMgd2l0aCB0aGUgQ1BVIG51
bWJlcmluZyBpbiB0aGUgRFQgKGZyb20gMCB0byAzIGluc3RlYWQgb2YgZnJvbSAxCnRvIDQpLiBQ
YXRjaCAyIGFkZHMgdHJpcCBwb2ludHMgYW5kIGNvb2xpbmcgbWFwcyB0byBhY3R1YWxseSBlbmFi
bGUKdGhlIGZlYXR1cmUuCgpUZXN0ZWQgd2l0aCBhbiBBcm1hZGEgN2sgREIuCgpUaGFua3MsCk1p
cXXDqGwKCk1pcXVlbCBSYXluYWwgKDIpOgogIGFybTY0OiBkdHM6IG1hcnZlbGw6IENoYW5nZSBj
b3JlIG51bWJlcmluZyBpbiBBUDgwNiB0aGVybWFsLW5vZGUKICBhcm02NDogZHRzOiBtYXJ2ZWxs
OiBFbmFibGUgQVA4MDYgdGhlcm1hbCB0aHJvdHRsaW5nIHdpdGggQ1BVZnJlcQoKIC4uLi9ib290
L2R0cy9tYXJ2ZWxsL2FybWFkYS1hcDgwNi1kdWFsLmR0c2kgICB8ICAgMiArCiAuLi4vYm9vdC9k
dHMvbWFydmVsbC9hcm1hZGEtYXA4MDYtcXVhZC5kdHNpICAgfCAgIDUgKwogYXJjaC9hcm02NC9i
b290L2R0cy9tYXJ2ZWxsL2FybWFkYS1hcDgwNi5kdHNpIHwgMTEwICsrKysrKysrKysrKysrKy0t
LQogMyBmaWxlcyBjaGFuZ2VkLCAxMDMgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgot
LSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXJtLWtlcm5lbAo=
