From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: fix uart1 CTS/RTS pins at PG on
 A23/A33
Date: Tue, 23 Aug 2016 14:50:32 +0800
Message-ID: <652921471935032@web14j.yandex.ru>
References: <20160823055826.20591-1-icenowy@aosc.xyz>
 <20160823064755.GA2598@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160823064755.GA2598@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgoyMy4wOC4yMDE2LCAxNDo0NywgIk1heGltZSBSaXBhcmQiIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT46Cj4gSGksCj4KPiBPbiBUdWUsIEF1ZyAyMywgMjAxNiBhdCAwMTo1ODoy
NVBNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+PiDCoFBHOCwgUEc5IGlzIHNhaWQgdG8g
YmUgdGhlIENUUy9SVFMgcGlucyBmb3IgVUFSVDEgYWNjb3JkaW5nIHRvIHRoZSBBMjMvMzMKPj4g
wqBkYXRhc2hlZXRzLiBIb3dldmVyLCB0aGUgZnVuY3Rpb24gaXMgd3JvbmdseSBuYW1lZCAidWFy
dDIiIGluIHRoZSBwaW5jdHJsCj4+IMKgZHJpdmVyLiBUaGlzIHBhdGNoIGZpeGVzIHRoaXMgYnkg
bW9kaWZ5aW5nIHRoZW0gdG8gYmUgbmFtZWQgInVhcnQxIi4KPj4KPj4gwqBTaWduZWQtb2ZmLWJ5
OiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MueHl6Pgo+Cj4gVGhpcyBsb29rcyBnb29kLCBi
dXQgY291bGQgeW91IHNlbmQgaXQgdG8gc3RhYmxlPwoKWWVzLi4uIEJ1dCBjdXJyZW50bHkgaW4g
bWFpbmxpbmUga2VybmVsLCBubyBkdCBmaWxlIGZvciBBMjMvMzMgdXNlcyBVQVJUMS4KKExvdHMg
b2YgdGhlIHRhYmxldHMgaXMgc28gbG93LWVuZCB0aGF0IHRoZXkgZG8gbm90IHNoaXAgd2l0aCBC
VCBzdXBwb3J0LCBhbmQKdGhlbiBubyBzdXBwb3J0IGZvciBleHRyYSBVQVJUIGlzIG5lZWRlZCkK
CkkgZm91bmQgdGhlIHByb2JsZW0gd2hlbiBydW5uaW5nIG1haW5saW5lIGtlcm5lbCBvbiBteSBp
TmV0IEQ5NzggUmV2MiBib2FyZAp0YWJsZXQuIEl0IGNvbWUgd2l0aCBhIFJUTDg3MjNCUy4KCj4K
PiBUaGFua3MsCj4gTWF4aW1lCj4KPiAtLQo+IE1heGltZSBSaXBhcmQsIEZyZWUgRWxlY3Ryb25z
Cj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHA6Ly9mcmVlLWVs
ZWN0cm9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFybS1rZXJuZWwK
