From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v18 0/12] dw-hdmi: convert imx hdmi to bridge/dw_hdmi
Date: Tue, 06 Jan 2015 16:27:45 +0100
Message-ID: <1420558065.3719.10.camel@pengutronix.de>
References: <1417760564-16858-1-git-send-email-andy.yan@rock-chips.com>
 <1417787724.3227.10.camel@pengutronix.de> <5481DDF2.6010700@rock-chips.com>
 <1956639.ADgYrPHa6L@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1956639.ADgYrPHa6L@phil>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, rmk+kernel@arm.linux.org.uk, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Andy Yan <andy.yan@rock-chips.com>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor
List-Id: devicetree@vger.kernel.org

SGkgSGVpa28sCgpBbSBEaWVuc3RhZywgZGVuIDA2LjAxLjIwMTUsIDEyOjQ5ICswMTAwIHNjaHJp
ZWIgSGVpa28gU3TDvGJuZXI6Cj4gSGkgUGhpbGlwcCwKPiAKPiBBbSBTYW1zdGFnLCA2LiBEZXpl
bWJlciAyMDE0LCAwMDozMTo0NiBzY2hyaWViIEFuZHkgWWFuOgo+ID4gPiBJIGFtIGhhcHB5IHdp
dGggdGhlIHNlcmllcyBzbyBmYXIuIFBlbmRpbmcgQWNrcyBmcm9tIHRoZSBkZXZpY2UgdHJlZQo+
ID4gPiBtYWludGFpbmVycyBmb3IgdGhlIG5ldyBiaW5kaW5nIGRvY3VtZW50cywgSSdkIGxpa2Ug
dG8gYXBwbHkgZWl0aGVyIHRoZQo+ID4gPiB3aG9sZSBvZiBpdCBvbiB0b3Agb2YKPiA+ID4gCj4g
PiA+ICAgICAgZ2l0Oi8vZ2l0LnBlbmd1dHJvbml4LmRlL2dpdC9wemEvbGludXguZ2l0IGlteC1k
cm0vbmV4dAo+ID4gPiAKPiA+ID4gb3IgdGFrZSBhdCBsZWFzdCB0aGUgaS5NWCBzcGVjaWZpYyBw
YXRjaGVzICgxLTUpIGJlY2F1c2Ugb2YgdGhlCj4gPiA+IGRlcGVuZGVuY3kgb24gdGhlIGlteC1k
cm0gT0YgaGVscGVyIGNvbnZlcnNpb24uCj4gCj4gZG8geW91IHN0aWxsIHdhbnQgdG8gdGFrZSB0
aGlzIHNlcmllcz8KPgo+IEFzIGZvciB0aGUgZGV2aWNldHJlZSBBQ0ssIHRoZXJlIGlzIHRoaXMg
KHVud3JpdHRlbikgcnVsZSB0aGF0IGlmIHRoZQo+IGR0LW1haW50YWluZXJzIGRvIG5vdCByZXNw
b25kIGFmdGVyIDMgd2Vla3MgKGFuZCBhIHBpbmcgbWFpbCB0byB0aGVtKQo+IGl0IHNob3VsZCBi
ZSBjb25zaWRlcmVkIGFja2VkLiBBcyB0aGlzIHZlcnNpb24gb2YgdGhlIHNlcmllcyBpcyBzaXR0
aW5nCj4gb24gdGhlIGxpc3RzIGZvciBhIG1vbnRoIG5vdyBhbmQgbm9ib2R5IGNvbXBsYWluZWQg
ZHVyaW5nIHRoZSBvdGhlcgo+IDE3IHZlcnNpb25zIGFzIHdlbGwsIEkgdGhpbmsgd2Ugc2hvdWxk
IGJlIG9uIHRoZSBzYWZlIHNpZGUgOi0pCgpBbHJpZ2h0LCBsZXQncyBhc3N1bWUgc2lsZW50IGFw
cHJvdmFsLgoKPiBUaGVyZSBpcyBvbmUgc2xpZ2h0IGNhdGNoLiBQYXRjaCAzIG5lZWRzIGEgbGl0
dGxlIG1vZGlmaWNhdGlvbiwgYXMgdGhlCj4gVEhJU19NT0RVTEUgb3dlciBvZiB0aGUgaW14X2hk
bWkgZ290IG1lYW53aGlsZSBjbGVhbmVkIHVwLgo+IAo+IFNvIHRoZSBwYXRjaCB3b3VsZCBuZWVk
IHRvIGJlIG1vZGlmaWVkIGFzIHNob3duIGJ5IHRoZSBkaWZmIGF0IHRoZQo+IGJvdHRvbS4gSSdt
IG5vdCBzdXJlIGlmIHlvdSB3YW50IEFuZHkgdG8gcmVwb3N0IHRoZSB3aG9sZSBzZXJpZXMgYWdh
aW4KPiBidXQgSSdsbCBqdXN0IHBvc3QgbXkgZml4ZWQgdmFyaWFudCBhcyByZXBseSB0byB0aGUg
b3JpZ2luIHYxOCBvZiBwYXRjaCAzCj4gZm9yIGNvbnZlbmllbmNlLgoKTm8gbmVlZCB0byBwb3N0
IHRoaXMgYWdhaW4sIEkgY2FuIGFwcGx5IHRoZSBwYXRjaGVzIGFuZCBmaXggdXAgdGhlCnJlbWFp
bmluZyBpc3N1ZXMgeW91IGFuZCBSdXNzZWxsIHBvaW50ZWQgb3V0IGluIHRoZSBwcm9jZXNzLgoK
cmVnYXJkcwpQaGlsaXBwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkZXZlbCBtYWlsaW5nIGxpc3QKZGV2ZWxAbGludXhkcml2ZXJwcm9qZWN0Lm9yZwpo
dHRwOi8vZHJpdmVyZGV2LmxpbnV4ZHJpdmVycHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cml2ZXJkZXYtZGV2ZWwK
