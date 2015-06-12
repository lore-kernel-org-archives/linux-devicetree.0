From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v3 1/2] drm/bridge: dw-hdmi: support optional supply
 regulators
Date: Fri, 12 Jun 2015 09:27:07 +0200
Message-ID: <4099644.agHN3RgGum@diego>
References: <4184159.j0iXe39dFB@phil> <3551826.dyCjorKhLA@diego>
 <20150609233618.GK7557@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150609233618.GK7557@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dianders@chromium.org, linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, Yakir Yang <ykk@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gTWl0dHdvY2gsIDEwLiBKdW5pIDIwMTUsIDAwOjM2OjE4IHNjaHJpZWIgUnVzc2VsbCBLaW5n
IC0gQVJNIExpbnV4Ogo+IE9uIFdlZCwgSnVuIDEwLCAyMDE1IGF0IDAxOjI5OjQzQU0gKzAyMDAs
IEhlaWtvIFN0w7xibmVyIHdyb3RlOgo+ID4gQWxsdGhvdWdoIGZyb20gdGhlIGRpc2N1c3Npb24g
YW5kIGV4cGxhbmF0aW9ucyBJJ3ZlIG5vdyBhbHNvIGdvdCB0aGUKPiA+ICJkb24ndAo+ID4gbWFr
ZSBpdCB3b3JzZSIgZmVlbGluZywgc28gYW0gc29tZWhvdyByZWx1Y3RhbnQgdG8gYWRkIHN1cHBs
aWVzIHRoYXQgYWxzbwo+ID4gbWlnaHQgZGVzY3JpYmUgdGhpcyBpbmFkZXF1YXRlbHkuCj4gPiAK
PiA+IFRoZSBSb2NrY2hpcC1zcGVjaWZpYyBkb2N1bWVudGF0aW9uIG9ubHkgbGlzdHMgdGhlIHR3
byBzdXBwbGllcyBhcwo+ID4gQVZERF8xVjAsIEFWRERfMVY4IHdpdGggYSBkZXNjcmlwdGlvbiBv
ZiAiREMgc3VwcGx5IHZvbHRhZ2UgZm9yIEFuYWxvZwo+ID4gcGFydCBvZiBIRE1JIi4gVGhlIHN1
cHBsaWVzIGFyZW4ndCBtZW50aW9uZWQgb3RoZXJ3aXNlIGF0IGFsbCwgc28gSSBndWVzcwo+ID4g
SSdsbCBwb25kZXIgdGhpcyBhIGJpdCBtb3JlIGF0IGZpcnN0Lgo+IAo+IEFyZSB0aGV5IGNvbnRy
b2xsYWJsZSBmcm9tIHNvZnR3YXJlIGF0IGFsbD8gIElmIHRoZXkgYXJlbid0LCB0aGVuCj4gSSdk
IHN1Z2dlc3QgbGVhdmluZyB0aGVtIG91dCB1bnRpbCB3ZSBoYXZlIGEgZGlzdGluY3Rpb24gYmV0
d2Vlbgo+IHRoZSBUeCBhbmQgUGh5IC0gbXVjaCBhcyB3ZSBkbyBmb3IgaU1YNi4KCnRoZXkgYXJl
IHN1cHBsaWVkIGJ5IHRoZSBwbWljIHRoZSBzeXN0ZW0gdXNlcyAobmFtZWQgdmRkMTBfbGNkIGFu
ZCB2ZGQxOF9sY2QgCmluIHRoZSBzb2MgbWFudWFscy9zY2hlbWF0aWNzKSAgYW5kIHN1cHBseSB0
aGUgaW5kaXZpZHVhbCBvdXRwdXQgZW5jb2RlciAKYW5hbG9nIHBhcnRzIChoZG1pLCBlZHAsIGx2
ZHMsIGV0YykuICBTbyBpZiB0aGVyZSBpcyBubyBvdXRwdXQgYXQgYWxsLCB0aGV5IApzaG91bGQg
YmUgYWJsZSB0byBiZSB0dXJuZWQgb2ZmLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
