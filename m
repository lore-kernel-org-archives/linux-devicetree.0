From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
Subject: Re: [PATCH v2 2/3] arm: mvebu: Enable USB controllers on Armada
 370/XP boards
Date: Wed, 23 Jan 2013 22:14:58 +0100
Message-ID: <20130123221458.6237568b@e6520eb>
References: <1358954792-16160-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1358954792-16160-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <CALF0-+XJEXJ2B3NLu5DvyxaDuuMNP=zk+z8QUd4GTQULW3BpyA@mail.gmail.com>
 <20130123190352.2d001218@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130123190352.2d001218@skate>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ezequiel Garcia <elezegarcia@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Michael Opdenacker <michael.opdenacker@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, Yehuda Yitschak <yehuday@marvell.com>, Arnd Bergmann <arnd@arndb.de>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Florian Fainelli <florian@openwrt.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGkgVGhvbWFzLAoKTGUgV2VkLCAyMyBKYW4gMjAxMyAxOTowMzo1MiArMDEwMCwKVGhvbWFzIFBl
dGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBmcmVlLWVsZWN0cm9ucy5jb20+IGEgw6ljcml0IDoK
PiBPbiBXZWQsIDIzIEphbiAyMDEzIDE0OjA0OjQyIC0wMzAwLCBFemVxdWllbCBHYXJjaWEgd3Jv
dGU6Cj4gCj4gPiBmcm9tIHRoZSBPcGVuQmxvY2tzIEFYMy00IGJvYXJkIGR0cyBmaWxlLCBzaW5j
ZSB5b3UgbWVudGlvbmVkIHRoaXMKPiA+IGJvYXJkIHVzZXMgdGhhdCBVU0IKPiA+IHBvcnQgZm9y
IGEgUENJZSBjb25uZWN0b3IgLS0gaWYgSSB1bmRlcnN0b29kIGNvcnJlY3RseS4KPiAKPiBOby4g
VGhlIE9wZW5CbG9ja3MgaGFzIGEgZGlmZmVyZW50IFVTQiBjb250cm9sbGVyIHRoYXQgc2l0cyBv
biB0aGUgUENJZQo+IGJ1cy4gVGhlcmUgaXMgbm90aGluZyBsaWtlIGEgUENJZSBwb3J0IHRoYXQg
dXNlcyBhIFVTQiBwb3J0LCB0aGF0Cj4gZG9lc24ndCBtYWtlIHNlbnNlLgo+IApJIGRvbid0IGhh
dmUgYSBBWDMtNCBidXQgaXQgc2VlbXMgdG8gaGF2ZSBhIE1pbmlQQ0llIHNvY2tldCBhbmQKbm90
IGEgUENJZSBvbmUuCk1pbmlQQ0llIHNwZWNpZmljYXRpb24gaW5jbHVkZXMgYm90aCBQQ0llIF9h
bmRfIFVTQjIuMCBzaWduYWxzIChvbiBwaW5zCjM2JjM4KSAoYW5kIGFsc28gU01CdXMsIFNJTSBh
bmQgTEVEcyBkcml2ZXJzIGNoZWNrIHRoZSBmb2xsb3dpbmcgdGFibGUKZm9yIGRldGFpbHMgaHR0
cDovL3Bpbm91dHNndWlkZS5jb20vU2xvdHMvbWluaV9wY2llX3Bpbm91dC5zaHRtbCApIHNvCnRo
ZSBwb3NzaWJpbGl0eSB0byBoYXZlIGEgVVNCIHBvcnQgY29ubmVjdGVkIHRvIHRoZSBNaW5pUENJ
ZSBvbiB0aGUKQVgzLTQgbWFrZXMgc2Vuc2UuCgpGb3IgZXhhbXBsZSBtb3N0IDNHIE1pbmlQQ0ll
IGJvYXJkcyBhcmUgdXNpbmcgdGhlIFVTQjIuMCBzaWduYWxzIGFuZApub3QgdGhlIFBDSWUgb25l
cy4KCkVyaWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwK
