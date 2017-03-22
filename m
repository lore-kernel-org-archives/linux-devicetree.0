From: Alexander Kochetkov <al.kochet@gmail.com>
Subject: Re: [PATCH] ARM: dts: rockchip: setup DMA-channels for mmc0 and emmc
 for rk3188
Date: Wed, 22 Mar 2017 19:20:56 +0300
Message-ID: <C2BC0A84-EF69-42E3-84FA-A873B8A7187A@gmail.com>
References: <1490109227-4006-1-git-send-email-al.kochet@gmail.com>
 <11123239.Wc863F7R2R@phil>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <11123239.Wc863F7R2R@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, LAK <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGVsbG8sIEhlaWtvIQoKPiAyMiDQvNCw0YDRgtCwIDIwMTcg0LMuLCDQsiAxODo1NCwgSGVpa28g
U3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4g0L3QsNC/0LjRgdCw0Lso0LApOgo+IAo+IEkndmUg
YXBwbGllZCBhIHNsaWdodGx5IGRpZmZlcmVudCB2YXJpYW50IGluIFswXSB3aXRoIHlvdXIgY29t
bWl0IG1lc3NhZ2UgYW5kCj4gbW92ZWQgdGhlIGRtYSBwcm9wZXJ0aWVzIHRvIHRoZSBtbWMvZW1t
YyBub2RlcyBpbiByazN4eHguZHRzaSAtIGFzIHRoZSBkbWEKPiBjaGFubmVscyBhcmUgdGhlIHNh
bWUgb24gYm90aCByazMxODggYW5kIHJrMzA2Ni4KClRoYW5rIHlvdSEgSSBoYWQgY2hhbmdlcyBp
biB0aGUgcmszeHh4LmR0c2kgaW5pdGlhbGx5LCBidXQgdGhlbSBtb3ZlZCB0aGVtCmludG8gcmsz
MTg4LiBEb27igJl0IGtub3cgd2h5IEkgZGlkIHRoYXQuIE1heSBiZSBiZWNhdXNlIEkgZG9u4oCZ
dCBoYXZlIHJrMzA2NgpiYXNlZCBib2FyZCB0byB0ZXN0IG9uLgoKPiBXaGlsZSBhdCBpdCwgSSd2
ZSBhbHNvIGFkZGVkIHRoZSBzZGlvIGRtYSBhcyB0aGVyZSBpcyBubyBuZWVkIHRvIGxlYXZlIGl0
IG91dC4KCknigJl2ZSB0ZXN0ZWQgbW1jMCBhbmQgZW1tIGFuZCB0aGV5IHdvcmsgZ3JlYXQuIEkg
aGF2ZW7igJl0IHRlc3RlZCBzZGlvLgoKPiAKPiBBbHNvIHdoZW4gY2hhbmdpbmcgdGhlIGRldmlj
ZXRyZWUsIHBsZWFzZSBkbyBub3QgYXBwZW5kIHN0dWZmIGF0IHRoZSBib3R0b20KPiBidXQgaW5z
dGVhZCBzb3J0IG5ldyBub2RlcyAodGhlICZtbWMgJmVtbWMgaW4gdGhpcyBjYXNlKSBhbmQgcHJv
cGVydGllcwo+IGFscGhhYmV0aWNhbGx5LgoKT2suIFRoYW5rIHlvdS4KCkkgaGF2ZSB3b3JraW5n
IHNldHRpbmdzIGZvciBlTU1DIGZvciByYWR4YSByb2NrLiBXaGF0IGRvIHlvdSB0aGluaywgaXMg
aXQgZ29vZCBpZGVhIHRvIGFkZCB0aGVtCnRvIHRoZSBrZXJuZWwgRFQ/IEFzIFJhZHhhIFJvY2sg
ZG9lc27igJl0IGNvbWUgd2l0aCBlTU1DLCBidXQgZU1NQyBjYW4gYmUgc29sZGVyZWQgbWFudWFs
bHkuCgpBbGV4YW5kZXIuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXJtLWtlcm5lbAo=
