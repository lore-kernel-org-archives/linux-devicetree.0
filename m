From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v5 5/8] clocksource/drivers/rockchip_timer: split bc_timer
 into rk_timer and rk_clock_event_device
Date: Sun, 29 Jan 2017 21:30:13 +0100
Message-ID: <3616490.5RPja2j5kp@phil>
References: <1485260203-14216-1-git-send-email-al.kochet@gmail.com>
 <3890508.0j97LNriXL@diego> <14EAE124-D504-4480-A6D4-EB7EFFC3C561@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <14EAE124-D504-4480-A6D4-EB7EFFC3C561@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Kochetkov <al.kochet@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Huang Tao <huangtao@rock-chips.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, LAK <linux-arm-kernel@lists.infradead.org>, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

SGkgQWxleGFuZGVyLAoKQW0gRGllbnN0YWcsIDI0LiBKYW51YXIgMjAxNywgMTg6MTY6MjAgQ0VU
IHNjaHJpZWIgQWxleGFuZGVyIEtvY2hldGtvdjoKPiA+IDI0INGP0L3Qsi4gMjAxNyDQsy4sINCy
IDE4OjAyLCBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPiDQvdCw0L/QuNGB0LDQuyjQ
sCk6Cj4gPiAKPiA+IFBsZWFzZSBkb24ndCBhZGQgUmV2aWV3ZWQtYnkgdGFncyB3aXRob3V0IGV4
cGxpY2l0IG1lbnRpb24gb2YgdGhlbSBieQo+ID4gcmV2aWV3ZXJzLiAoQWxzbyBpdCdzIHNwZWxs
ZWQgd3JvbmcpLgo+ID4gCj4gPiBJIGhhdmVuJ3QgbG9va2VkIHRoYXQgZGVlcGx5IGludG8gdGhl
IGRyaXZlciBpdHNlbGYgYW5kIHRoZSBjaGFuZ2VzIG1hZGUKPiA+IHRvCj4gPiBmZWVsIGNvbWZv
cnRhYmxlIHdpdGggYSAiUmV2aWV3ZWQtYnkiLgo+IAo+IFRoYW4gSSBwb3N0ZWQgYW5vdGhlciBs
aW51eCBjb2RlIEkgd2FzIGFza2VkIHRvIGFkZCBzdWNoIHRhZ3MgKGFuZCBvdGhlcnMpCj4gdG8g
YWRkIGNyZWRpdHMgdG8gcGVvcGxlLgo+IAo+IFNvcnJ5IGZvciB0aGF0LgoKbm8gcHJvYmxlbS4g
SW4gZ2VuZXJhbCBwZW9wbGUgcmV2aWV3aW5nIHBhdGNoZXMgd2lsbCByZXNwb25kIHRvIHRoZSBw
YXRjaCB3aXRoIAp0YWdzIHRoZXkgYXJlIGNvbWZvcnRhYmxlIHdpdGggYmVpbmcgYWRkZWQuIEFu
ZCBhIFJldmlld2VkLWJ5IGlzIGEgcHJldHR5IApzdHJvbmcgdGFnLCBpbmRpY2F0aW5nIHRoYXQg
c29tZSB0aG91Z2h0IHdlbnQgaW50byByZXZpZXdpbmcgYSBzcGVjaWZpYyBwYXRjaCwgCndoaWNo
IEkgaGFkbid0IGRvbmUgd2l0aCBteSBjdXJzb3J5IGdsYW5jZSBhdCB0aGUgdGltZSA6LSkKCkhl
aWtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
cm0ta2VybmVsCg==
