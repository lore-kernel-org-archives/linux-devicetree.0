From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5 3/7] arm64: dts: rockchip: Specify override mode for
 kevin panel
Date: Thu, 11 Jul 2019 23:30:10 +0200
Message-ID: <2176386.nGWJ3FArxS@diego>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-4-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190401171724.215780-4-dianders@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, Rob Herring <robh+dt@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Jeffy Chen <jeffy.chen@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Klaus Goger <klaus.goger@theobroma-systems.com>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Boris Brezillon <boris.brezillon@collabora.com>, Enric =?ISO-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>, =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ezequiel Garcia <ezequiel@collabora.com>, mka@chromium.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gTW9udGFnLCAxLiBBcHJpbCAyMDE5LCAxOToxNzoyMCBDRVNUIHNjaHJpZWIgRG91Z2xhcyBB
bmRlcnNvbjoKPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiAKPiBU
aGlzIHBhdGNoIGFkZHMgYW4gb3ZlcnJpZGUgbW9kZSBmb3Iga2V2aW4gZGV2aWNlcy4gVGhlIG1v
ZGUgaW5jcmVhc2VzCj4gYm90aCBiYWNrIHBvcmNoZXMgdG8gYWxsb3cgYSBwaXhlbCBjbG9jayBv
ZiAyNjY2NmtIeiBhcyBvcHBvc2VkIHRvIHRoZQo+ICd0eXBpY2FsJyB2YWx1ZSBvZiAyNTI3NTBr
SHouIFRoaXMgaXMgbmVlZGVkIHRvIGF2b2lkIGludGVyZmVyZW5jZSB3aXRoCj4gdGhlIHRvdWNo
IGRpZ2l0aXplciBvbiB0aGVzZSBsYXB0b3BzLgo+IAo+IENjOiBEb3VnIEFuZGVyc29uIDxkaWFu
ZGVyc0BjaHJvbWl1bS5vcmc+Cj4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4g
Q2M6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gQ2M6IEplZmZ5IENoZW4gPGpl
ZmZ5LmNoZW5Acm9jay1jaGlwcy5jb20+Cj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+Cj4gQ2M6IFN0w6lwaGFuZSBNYXJjaGVzaW4gPG1hcmNoZXVAY2hyb21pdW0ub3JnPgo+
IENjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+IENjOiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gQ2M6IGxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBTaWduZWQtb2Zm
LWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiBUZXN0ZWQtYnk6IEVucmlj
IEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKYXBwbGll
ZCBmb3IgNS40CgpUaGFua3MKSGVpa28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
