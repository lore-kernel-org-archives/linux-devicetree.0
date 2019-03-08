From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/2] Marvell A7k/A8k thermal throttling
Date: Fri,  8 Mar 2019 23:28:08 +0100
Message-ID: <20190308222810.5926-1-miquel.raynal@bootlin.com>
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

SGVsbG8sCgpUaGlzIHNlcmllcyBkZXBlbmRzIG9uIEdyZWdvcnkncyBzZXJpZXMgYWRkaW5nIGJv
dGggQ1BVZnJlcSAoYWxyZWFkeQptZXJnZWQpIGFuZCBhIHN1aXRhYmxlIEFQODA2IGNsb2NrIGRy
aXZlci4KCldpdGggaGlzIHBhdGNoZXMsIGFsbCB0aGUgcGllY2VzIHdoZXJlIGF2YWlsYWJsZSB0
byBlbmFibGUgdGhlcm1hbAp0aHJvdHRsaW5nIG9uIHRoZSBBUDgwNiBlbWJlZGRlZCBpbiBNYXJ2
ZWxsIEFybWFkYSA3ay84ayBTb0NzLiBUaGlzIGlzCmp1c3QgdGhlIGdsdWUgdG8gbWFrZSBpdCBh
Y3R1YWxseSB3b3JrLgoKUGF0Y2ggMSBjaGFuZ2VzIHRoZSBjb3JlIG51bWJlcmluZyBpbiB0aGUg
dGhlcm1hbC16b25lIG5vZGUgdG8gYmUgaW4Kc3luYyB3aXRoIHRoZSBDUFUgbnVtYmVyaW5nIGlu
IHRoZSBEVCAoZnJvbSAwIHRvIDMgaW5zdGVhZCBvZiBmcm9tIDEKdG8gNCkuIFBhdGNoIDIgYWRk
cyB0cmlwIHBvaW50cyBhbmQgY29vbGluZyBtYXBzIHRvIGFjdHVhbGx5IGVuYWJsZQp0aGUgZmVh
dHVyZS4KClRlc3RlZCB3aXRoIGFuIEFybWFkYSA3ayBEQi4KClRoYW5rcywKTWlxdcOobAoKTWlx
dWVsIFJheW5hbCAoMik6CiAgYXJtNjQ6IGR0czogbWFydmVsbDogQ2hhbmdlIGNvcmUgbnVtYmVy
aW5nIGluIEFQODA2IHRoZXJtYWwtbm9kZQogIGFybTY0OiBkdHM6IG1hcnZlbGw6IEVuYWJsZSBB
UDgwNiB0aGVybWFsIHRocm90dGxpbmcgd2l0aCBDUFVmcmVxCgogLi4uL2Jvb3QvZHRzL21hcnZl
bGwvYXJtYWRhLWFwODA2LWR1YWwuZHRzaSAgIHwgICAyICsKIC4uLi9ib290L2R0cy9tYXJ2ZWxs
L2FybWFkYS1hcDgwNi1xdWFkLmR0c2kgICB8ICAgNSArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21h
cnZlbGwvYXJtYWRhLWFwODA2LmR0c2kgfCAxMTAgKysrKysrKysrKysrKysrLS0tCiAzIGZpbGVz
IGNoYW5nZWQsIDEwMyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCi0tIAoyLjE5LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCg==
