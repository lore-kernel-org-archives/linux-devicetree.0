From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 6/6] arm64: dts: rockchip: Specify override mode for
 kevin panel
Date: Thu, 26 Apr 2018 08:29:17 -0700
Message-ID: <CAD=FV=U-CL6msCicDhE28huONe0T_ChE+FKZ1CkEJOK=WKryGQ@mail.gmail.com>
References: <20180208174855.55620-1-seanpaul@chromium.org>
 <20180208174855.55620-7-seanpaul@chromium.org>
 <CAD=FV=WGU+s015DQbNeWHkpqpHLFz+9AjHKAd0N3HWag0p5FWA@mail.gmail.com>
 <20180426120528.GA11985@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180426120528.GA11985@ulmo>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, Arnd Bergmann <arnd@arndb.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jeffy Chen <jeffy.chen@rock-chips.com>, Will Deacon <will.deacon@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, hoegsberg@chromium.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Emil Renner Berthing <kernel@esmil.dk>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiBUaHUsIEFwciAyNiwgMjAxOCBhdCA1OjA1IEFNLCBUaGllcnJ5IFJlZGluZwo8dGhp
ZXJyeS5yZWRpbmdAZ21haWwuY29tPiB3cm90ZToKPiBJZiB5b3UndmUgZ290IGFuIEVESUQgeW91
IHNob3VsZCBiZSByZWx5aW5nIG9uIHRoZSBFRElEIHRvIHByb3ZpZGUgdGhlCj4gdGltaW5ncy4g
Tm8gbmVlZCB0byBoYXZlIGFueSB0aW1pbmdzIGluIHRoZSBEVCBpbiB0aGF0IGNhc2UuCgpUaGUg
cHJvYmxlbSB0aGF0J3Mgc3BlY2lmaWNhbGx5IHRyeWluZyB0byBiZSBzb2x2ZWQgYnkgU2Vhbidz
IHNlcmllcwppcyB3aGVuIHdlIGhhdmUgdG8gdXNlIHRpbWluZ3Mgb3RoZXIgdGhhbiB0aGUgb25l
IHN1Z2dlc3RlZCBieSB0aGUKRURJRC4gIFNwZWNpZmljYWxseToKCiogT24gbWFueSBSb2NrY2hp
cCBTb0NzIHRoZXJlIGlzIG9ubHkgb25lICJleHRyYSIgUExMIGF2YWlsYWJsZS4gIFRoaXMKZXh0
cmEgUExMIGNhbiBvbmx5IGJlIHVzZWQgYnkgb25lIG9mIHRoZSB0d28gZGlzcGxheXMgKGVEUCBm
b3IKaW50ZXJuYWwgcGFuZWwgb3IgSERNSS9EUCBmb3IgZXh0ZXJuYWwgZGlzcGxheSkuICBUaGUg
b3RoZXIgZGlzcGxheQpoYXMgdG8gdXNlIG9uZSBvZiB0aGUgInNoYXJlZCIgUExMcyBpbiB0aGUg
c3lzdGVtLiAgVGhlc2UgUExMcyBoYXZlCnRoZWlyIHJhdGUgc2V0IGF0IGJvb3QgYW5kIGFyZW4n
dCBjaGFuZ2VkLgoKKiBJbiBvcmRlciB0byBwcm92aWRlIG1heGltdW0gZmxleGliaWxpdHkgdG8g
Y29ubmVjdCBleHRlcm5hbApkaXNwbGF5cywgd2UgYWx3YXlzIHdhbnQgdGhlICJleHRyYSIgUExM
IGRlZGljYXRlZCB0byB0aGUgZXh0ZXJuYWwKZGlzcGxheSBwb3J0LiAgVGhlbiB3ZSBjYW4gbWFr
ZSBsb3RzIG9mIHBpeGVsIGNsb2Nrcy4KCiogV2Ugd29yayB3aXRoIGRldmljZSBhbmQgZGlzcGxh
eSBtYW51ZmFjdHVyZXJzIHRvIGZpZ3VyZSBvdXQgYSBwaXhlbApjbG9jayB0aGF0IGlzIGFjaGll
dmFibGUgd2l0aCB0aGUgc2hhcmVkIFBMTHMgYW5kIHRoYXQgaGFzIHZhbGlkCnRpbWluZ3MuICBU
aGlzIGlzIHRoZSB0aGUgcGl4ZWwgY2xvY2sgdGhhdCB3YXMgdXNlZCB3aGVuIHRlc3RpbmcgRU1J
LApldGMuICBJdCBpcyB0aGUgb25lIHRoYXQgc2hvdWxkIGJlIHVzZWQuCgoqIFBhbmVsIG1hbnVm
YWN0dXJlcnMgYWdyZWVkIHRoYXQgdGhpcyBwaXhlbCBjbG9jayB3YXMgZ29vZCB0byB1c2UsCmJ1
dCB3ZSBkaWRuJ3QgZ2V0IGFuIHVwZGF0ZWQgRURJRCB0aGF0IHN1Z2dlc3RlZCB0aGlzIG1vZGUu
ICBJdCdzIG15CnVuZGVyc3RhbmRpbmcgdGhhdCBwYW5lbHMgd2VyZSBhbHJlYWR5IGF2YWlsYWJs
ZSBhbmQgaXQgZGlkbid0IHJlYWxseQptYWtlIHNlbnNlIHRvIHByb2dyYW0gaW4gYW4gRURJRCB0
byB3b3JrIGFyb3VuZCBhIGNlcnRhaW4gYm9hcmQuCgoKCi1Eb3VnCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
