From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [RESEND PATCH 3/4] arm64: dts: marvell: add macro to make
 distinction between node names
Date: Fri, 21 Sep 2018 16:15:27 +0200
Message-ID: <87fty3gcn4.fsf@bootlin.com>
References: <20180830081501.11569-1-miquel.raynal@bootlin.com>
 <20180830081501.11569-3-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180830081501.11569-3-miquel.raynal@bootlin.com> (Miquel
 Raynal's message of "Thu, 30 Aug 2018 10:15:00 +0200")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgTWlxdWVsLAogCiBPbiBqZXUuLCBhb8O7dCAzMCAyMDE4LCBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gQmVjYXVzZSB0aGUgbGFiZWwgaXMgZGlm
ZmVyZW50IGJldHdlZW4gQ1BzLCB0aGUgZnVsbCBwYXRoIG9mIGEgbm9kZSBpcwo+IHVuaXF1ZS4g
SG93ZXZlciwgd2hlbiByZWZlcnJpbmcgdG8gdGhlIGVuZCBvZiB0aGUgcGF0aCBvbmx5ICh0aGUg
bm9kZQo+IG5hbWUpLCB0aGlzIG5hbWUgaXMgbm90IHVuaXF1ZSBhbnltb3JlLgo+Cj4gVGhlICp0
aGVybWFsX3pvbmVfb2Zfc2Vuc29yX3JlZ2lzdGVyKCkgZnVuY3Rpb25zIG9mIHRoZSB0aGVybWFs
IGNvcmUKPiBwcmVzZW50IHRoaXMgbGltaXRhdGlvbiBhbmQgcHJldmVudCBoYXZpbmcgYSB0aGVy
bWFsLXpvbmUgcGVyIENQLgo+Cj4gQWRkIGEgbWFjcm8gdG8gbWFrZSB0aGUgZGlzdGluY3Rpb24g
YmV0d2VlbiBub2RlIG5hbWVzIHRvIHNvbHZlIHRoaXMKPiBzaXR1YXRpb24uCj4KPiBTaWduZWQt
b2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKQXBwbGll
ZCBvbiBtdmVidS9kdDY0CgpUaGFua3MsCgpHcmVnb3J5Cgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jv
b3QvZHRzL21hcnZlbGwvYXJtYWRhLWNvbW1vbi5kdHNpIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWFy
dmVsbC9hcm1hZGEtY29tbW9uLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvYXJt
YWRhLWNvbW1vbi5kdHNpCj4gaW5kZXggZDVlOGFlZGVjMTg4Li5iMjljNjQwNWQyMTQgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2FybWFkYS1jb21tb24uZHRzaQo+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtY29tbW9uLmR0c2kKPiBA
QCAtNyw0ICs3LDUgQEAKPiAgI2RlZmluZSBQQVNURVIoeCwgeSkgeCAjIyB5Cj4gICNkZWZpbmUg
RVZBTFVBVE9SKHgsIHkpIFBBU1RFUih4LCB5KQo+ICAjZGVmaW5lIENQMTEwX0xBQkVMKG5hbWUp
IEVWQUxVQVRPUihDUDExMF9OQU1FLCBFVkFMVUFUT1IoXywgbmFtZSkpCj4gKyNkZWZpbmUgQ1Ax
MTBfTk9ERV9OQU1FKG5hbWUpIEVWQUxVQVRPUihDUDExMF9OQU1FLCBFVkFMVUFUT1IoLSwgbmFt
ZSkpCj4gICNkZWZpbmUgQUREUkVTU0lGWShhZGRyKSBFVkFMVUFUT1IoMHgsIGFkZHIpCj4gLS0g
Cj4gMi4xNy4xCj4KCi0tIApHcmVnb3J5IENsZW1lbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
