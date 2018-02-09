From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [2/9] phy: add Rockchip Innosilicon hdmi phy
Date: Fri, 09 Feb 2018 10:24:01 +0100
Message-ID: <2860925.eKDKvHpOYg@phil>
References: <20180205143435.4723-3-heiko@sntech.de>
 <alpine.GSO.2.00.1802052159530.23549@dmz.c-home.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <alpine.GSO.2.00.1802052159530.23549@dmz.c-home.cz>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Martin Cerveny <M.Cerveny@computer.org>
Cc: mark.rutland@arm.com, Jose.Abreu@synopsys.com, algea.cao@rock-chips.com, devicetree@vger.kernel.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, kishon@ti.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, zhengyang@rock-chips.com
List-Id: devicetree@vger.kernel.org

SGkgTWFydGluLAoKQW0gTW9udGFnLCA1LiBGZWJydWFyIDIwMTgsIDIyOjMyOjA4IENFVCBzY2hy
aWViIE1hcnRpbiBDZXJ2ZW55Ogo+IE9uIE1vbiwgNSBGZWIgMjAxOCwgSGVpa28gU3R1ZWJuZXIg
d3JvdGU6Cj4gPiBGcm9tOiBaaGVuZyBZYW5nIDx6aGVuZ3lhbmdAcm9jay1jaGlwcy5jb20+Cj4g
Pgo+ID4gQWRkIGEgZHJpdmVyIGZvciB0aGUgSW5ub3NpbGljb24gaGRtaSBwaHkgdXNlZCBvbiBy
azMyMjgvcmszMjI5Cj4gPiBhbmQgcmszMzI4IHNvY3MgZnJvbSBSb2NrY2hpcC4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBaaGVuZyBZYW5nIDx6aGVuZ3lhbmdAcm9jay1jaGlwcy5jb20+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+ID4gLS0tCj4g
PiArKysgYi9kcml2ZXJzL3BoeS9yb2NrY2hpcC9waHktcm9ja2NoaXAtaW5uby1oZG1pLmMKPiA+
ICtzdGF0aWMgdTMyIGlubm9faGRtaV9waHlfZ2V0X3RtZHNjbGsoc3RydWN0IGlubm9faGRtaV9w
aHkgKmlubm8sIGludCByYXRlKQo+ID4gK3sKPiA+ICsJaW50IGJ1c193aWR0aCA9IHBoeV9nZXRf
YnVzX3dpZHRoKGlubm8tPnBoeSk7Cj4gPiArCXUzMiB0bWRzY2xrOwo+ID4gKwo+ID4gKwlzd2l0
Y2ggKGJ1c193aWR0aCkgewo+ID4gKwljYXNlIDQ6Cj4gPiArCQl0bWRzY2xrID0gcmF0ZSAvIDI7
Cj4gPiArCQlicmVhazsKPiA+ICsJY2FzZSA1Ogo+ID4gKwkJdG1kc2NsayA9IHJhdGUgKiA1IC8g
ODsKPiA+ICsJCWJyZWFrOwo+ID4gKwljYXNlIDY6Cj4gPiArCQl0bWRzY2xrID0gcmF0ZSAqIDMg
LyA0Owo+ID4gKwkJYnJlYWs7Cj4gPiArCWNhc2UgMTA6Cj4gPiArCQl0bWRzY2xrID0gcmF0ZSAq
IDUgLyA0Owo+ID4gKwkJYnJlYWs7Cj4gPiArCWNhc2UgMTI6Cj4gPiArCQl0bWRzY2xrID0gcmF0
ZSAqIDMgLyAyOwo+ID4gKwkJYnJlYWs7Cj4gPiArCWNhc2UgMTY6Cj4gPiArCQl0bWRzY2xrID0g
cmF0ZSAqIDI7Cj4gPiArCQlicmVhazsKPiA+ICsJZGVmYXVsdDoKPiA+ICsJCXRtZHNjbGsgPSBy
YXRlOwo+ID4gKwl9Cj4gPiArCj4gPiArCXJldHVybiB0bWRzY2xrOwo+ID4gK30KPiAKPiBQbGVh
c2UgY29ycmVjdHMgaW50ZWdlciBvdmVyZmxvdyAKPiBsaWtlIGh0dHBzOi8vZ2l0aHViLmNvbS9t
Y2VydmVueS9yb2NrY2hpcC1saW51eC9jb21taXQvYjRiYzcwM2YyZGNhNGU1MTE1YjIyMTU1OTIw
ZDIyNzc2NzFhOWYwMAoKdGhhbmtzIGZvciBmaW5kaW5nIHRoYXQgcG9zc2libGUgaXNzdWUuIEkn
dmUgYWRhcHRlZCB0aGUgcGh5IGRyaXZlcgppbiBhIHNpbWlsYXIgd2F5ICh1c2luZyB1NjQgdGhv
dWdoKSBhbmQgd2lsbCBpbmNsdWRlIHRoYXQgY2hhbmdlIGluIHRoZQpuZXh0IHZlcnNpb24uCgoK
VGhhbmtzCkhlaWtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
