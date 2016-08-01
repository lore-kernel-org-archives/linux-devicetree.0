From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 3/3] ehci-platform: add the max clock number to 4
Date: Mon, 01 Aug 2016 15:05:52 +0800
Message-ID: <414101470035152@web9j.yandex.ru>
References: <20160731112536.4625-1-icenowy@aosc.xyz>
 <20160731112536.4625-3-icenowy@aosc.xyz> <2477355.hXm3xYUusy@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2477355.hXm3xYUusy@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Reinder de Haan <patchesrdh@mveas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Tony Prisk <linux@prisktech.co.nz>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

CQkJY2xvY2tzID0gPCZjY3UgQ0xLX0E2NF9CVVNfT0hDSTE+LAoJCQkJIDwmY2N1IENMS19BNjRf
QlVTX0VIQ0kxPiwKCQkJCSA8JmNjdSBDTEtfQTY0X1VTQl9PSENJMD4sCgkJCQkgPCZjY3UgQ0xL
X0E2NF9VU0JfT0hDSTE+OwoKT24gQTY0LCBFSENJIHJlcXVpcmVzIHRoZSBtYXRjaGVkIE9IQ0kg
dG8gd29yay4KQW5kIE9IQ0kxIGNsb2NrIHJlcXVpcmVzIE9IQ0kwIGNsb2NrIHRvIHdvcmsuCgoo
QnV0IGZyb20gdGhlIFNvQydzIHVzZXIgbWFudWFsIHdlIGNhbm5vdCBnZXQgYW55IGluZm9tYXRp
b24KYWJvdXQgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIE9IQ0kxIGNsb2NrIGFuZCBPSENJMCBj
bG9jaywKYW5kIGluIHRoZSBtYW51YWwgT0hDSTAgY2xvY2sgaXMgY2FsbGVkIE9URy1PSENJKQoK
MDEuMDguMjAxNiwgMTU6MDEsICJBcm5kIEJlcmdtYW5uIiA8YXJuZEBhcm5kYi5kZT46Cj4gT24g
U3VuZGF5LCBKdWx5IDMxLCAyMDE2IDc6MjU6MzYgUE0gQ0VTVCBJY2Vub3d5IFpoZW5nIHdyb3Rl
Ogo+PiDCoEFsbHdpbm5lciBBNjQgRUhDSSByZXF1aXJlcyA0IGNsb2NrcyB0byBiZSBlbmFibGVk
Lgo+Pgo+PiDCoFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy54eXo+
Cj4KPiBDYW4geW91IHNheSB3aGF0IHRob3NlIGZvdXIgY2xvY2tzIGFyZT8KPgo+IEFyZSB5b3Ug
c3VyZSB0aGF0IGl0J3Mgbm90IGp1c3QgYSBjYXNlIG9mIGEgY2xvY2sgYmVpbmcKPiBpbmNvcnJl
Y3RseSBkZXNjcmliZWQgaW4gdGhlIGNsayBkcml2ZXIsIGkuZS4geW91IHJlZmVyZW5jZQo+IG9u
ZSBjbG9jayBhbG9uZyB3aXRoIGl0cyBwYXJlbnQgaGVyZT8KPgo+IMKgwqDCoMKgwqDCoMKgwqBB
cm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
cm0ta2VybmVsCg==
