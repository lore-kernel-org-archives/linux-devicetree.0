From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH V5 3/7] dw-hdmi: make checkpatch happy
Date: Mon, 10 Nov 2014 17:28:54 +0800
Message-ID: <54608556.3080308@rock-chips.com>
References: <1415424410-7364-1-git-send-email-andy.yan@rock-chips.com>
 <1415424598-7533-1-git-send-email-andy.yan@rock-chips.com>
 <546083C5.8060502@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <546083C5.8060502@imgtec.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, airlied@linux.ie, heiko@sntech.de, fabio.estevam@freescale.com, rmk+kernel@arm.linux.org.uk
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, ykk@rock-chips.com, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, Shawn Guo <shawn.guo@linaro.org>, jay.xu@rock-chips.com, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

SGkgWnViYWlyTEs6Ck9uIDIwMTTlubQxMeaciDEw5pelIDE3OjIyLCBadWJhaXIgTHV0ZnVsbGFo
IEtha2FraGVsIHdyb3RlOgo+IEhpIEFuZHksCj4KPiBJbiAzLjE4IHJjNCwgSSBjYW5ub3QgZmlu
ZCBjaGVja3BhdGNoIGVycm9ycyBpbiBpbXgtaGRtaS5jCj4KPiBIYXZlIHRoZXNlIGVycm9ycyBj
b21lIGR1cmluZyB0aGUgcHJldmlvdXMgMiBwYXRjaGVzLgo+Cj4gSWYgeWVzLCB0aGVuIHRoZXNl
IGNoYW5nZXMgbmVlZCB0byBiZSBzcXVhc2hlZCBpbnRvIHRoZSBwcmV2aW91cwo+IHBhdGNoZXMu
IE5vIHBhdGNoIHNob3VsZCBhZGQgYSBjaGVja3BhdGNoIGVycm9yIGFuZCB0aGVuIGZpeCBpdCBp
biBhIGxhdGVyIHBhdGNoLgo+Cj4gUmVnYXJkcwo+IFp1YmFpckxLCmkgdXNlIGNoZWNrcGF0Y2gg
d2l0aCAtLXN1YmplY3RpdmUKPiBPbiAwOC8xMS8xNCAwNToyOSwgQW5keSBZYW4gd3JvdGU6Cj4+
IENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMKPj4gKyAgICAg
ICBpZiAoKGhkbWktPnZpYyA9PSAxMCkgfHwgKGhkbWktPnZpYyA9PSAxMSkgfHwKPj4gKyAgICAg
ICAgICAgICAgIChoZG1pLT52aWMgPT0gMTIpIHx8IChoZG1pLT52aWMgPT0gMTMpIHx8Cj4+Cj4+
IENIRUNLOiBicmFjZXMge30gc2hvdWxkIGJlIHVzZWQgb24gYWxsIGFybXMgb2YgdGhpcyBzdGF0
ZW1lbnQKPj4gKyAgICAgICBpZiAoaGRtaS0+aGRtaV9kYXRhLnZpZGVvX21vZGUubWR2aSkKPj4g
Wy4uLl0KPj4gKyAgICAgICBlbHNlIHsKPj4gWy4uLl0KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5k
eSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2R3X2hkbWkuYyB8IDk3ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRp
b25zKC0pCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZGV2ZWwgbWFpbGluZyBsaXN0CmRldmVsQGxpbnV4ZHJpdmVycHJvamVjdC5vcmcKaHR0cDov
L2RyaXZlcmRldi5saW51eGRyaXZlcnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vZHJpdmVy
ZGV2LWRldmVsCg==
