From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] arm64: dts: marvell: armada-37xx: reserve memory for ATF
Date: Mon, 23 Apr 2018 10:31:27 +0200
Message-ID: <20180423103127.5b9ac041@xps13>
References: <20180421140342.25082-1-miquel.raynal@bootlin.com>
 <20180421161859.22d1ed18@windsurf>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180421161859.22d1ed18@windsurf>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Victor Gu <xigu@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgVGhvbWFzLAoKT24gU2F0LCAyMSBBcHIgMjAxOCAxNjoxODo1OSArMDIwMCwgVGhvbWFzIFBl
dGF6em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cgo+IEhlbGxvLAo+
IAo+IE9uIFNhdCwgMjEgQXByIDIwMTggMTY6MDM6NDIgKzAyMDAsIE1pcXVlbCBSYXluYWwgd3Jv
dGU6Cj4gPiBGcm9tOiBWaWN0b3IgR3UgPHhpZ3VAbWFydmVsbC5jb20+Cj4gPiAKPiA+IFRoZSBQ
U0NJIGFyZWEgc2hvdWxkIGJlIHJlc2VydmVkIGluIExpbnV4IGZvciBQU0NJIG9wZXJhdGlvbnMg
c3VjaCBhcwo+ID4gc3VzcGVuZC9yZXN1bWUuCj4gPiAKPiA+IFJlc2VydmUgMk1pQiBvZiBtZW1v
cnkgd2hpY2ggbWF0Y2hlcyB0aGUgYXJlYSB1c2VkIGJ5IEFURiAoQkwxLCBCTDIsCj4gPiBCTDN4
LCBzZWUgWzFdIGluIEFURiBzb3VyY2UgY29kZSkuIFRoaXMgY292ZXJzIGFsbCBQU0NJIGNvZGUg
YW5kIGRhdGEKPiA+IGFyZWEgYW5kIGlzIDJNaUIgYWxpZ25lZCwgd2hpY2ggaXMgcmVxdWlyZWQg
YnkgTGludXggZm9yIGh1Z2UgcGFnZXMKPiA+IGhhbmRsaW5nLgo+ID4gCj4gPiBbMV0gcGxhdC9t
YXJ2ZWxsL2EzNzAwL2NvbW1vbi9pbmNsdWRlL3BsYXRmb3JtX2RlZi5oCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IFZpY3RvciBHdSA8eGlndUBtYXJ2ZWxsLmNvbT4KPiA+IFttaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tOiByZXdvcmQgb2YgY29tbWl0IG1lc3NhZ2VdCj4gPiBTaWduZWQtb2ZmLWJ5
OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiAgCj4gCj4gU2hvdWxk
bid0IHRoaXMgYmUgZG9uZSBhdXRvbWF0aWNhbGx5IGJ5IHRoZSBib290bG9hZGVyLCBiZWZvcmUg
cGFzc2luZwo+IHRoZSBEVEIgdG8gdGhlIGtlcm5lbCA/CgpJIGFtIHdvcmtpbmcgd2l0aCBhIDIw
MTcuMDkgbWFpbmxpbmUgVS1Cb290LgoKSSBkaWQgbm90IGtub3cgdGhlIGJvb3Rsb2FkZXIgd2Fz
IHN1cHBvc2VkbHkgaW4gY2hhcmdlIG9mIHRoYXQuIEJ1dAp3aGF0IGlmIGl0IGZhaWxzIGRvaW5n
IGl0PyBGaXhpbmcgdGhlIGJvb3Rsb2FkZXIgaXMgb25lIHRoaW5nLCBJIGFzc3VtZQp2ZXJ5IGZl
dyBwZW9wbGUgd291bGQgdXBkYXRlIGl0LiBJcyBpdCB3b3J0aCBrZWVwaW5nIHRoaXMgaW4gTGlu
dXggRFQ/CgpUaGFua3MsCk1pcXXDqGwKCi0tIApNaXF1ZWwgUmF5bmFsLCBCb290bGluIChmb3Jt
ZXJseSBGcmVlIEVsZWN0cm9ucykKRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
