From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 1/3] arm64: imx8mq: add imx8mq iomux-gpr field defines
Date: Tue, 13 Aug 2019 12:10:57 +0200
Message-ID: <20190813101057.GB10751@bogon.m.sigxcpu.org>
References: <cover.1565367567.git.agx@sigxcpu.org>
 <e0562d8bb4098dc4cdb4023b41fb75b312be22a5.1565367567.git.agx@sigxcpu.org>
 <CAK8P3a3Vrd+sttJrQwD-jA9p_egG4x-hc41eGK8H-_aVm-uoYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a3Vrd+sttJrQwD-jA9p_egG4x-hc41eGK8H-_aVm-uoYw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, Lee Jones <lee.jones@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

SGkgQXJuZCwKT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTA6MDg6NDRBTSArMDIwMCwgQXJuZCBC
ZXJnbWFubiB3cm90ZToKPiBPbiBGcmksIEF1ZyA5LCAyMDE5IGF0IDY6MjQgUE0gR3VpZG8gR8O8
bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBhZGRzIGFsbCB0aGUg
Z3ByIHJlZ2lzdGVycyBhbmQgdGhlIGRlZmluZSBuZWVkZWQgZm9yIHNlbGVjdGluZwo+ID4gdGhl
IGlucHV0IHNvdXJjZSBpbiB0aGUgaW14LW53bCBkcm0gYnJpZGdlLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Cj4gPiArCj4gPiArI2RlZmlu
ZSBJT01VWENfR1BSMCAgICAweDAwCj4gPiArI2RlZmluZSBJT01VWENfR1BSMSAgICAweDA0Cj4g
PiArI2RlZmluZSBJT01VWENfR1BSMiAgICAweDA4Cj4gPiArI2RlZmluZSBJT01VWENfR1BSMyAg
ICAweDBjCj4gPiArI2RlZmluZSBJT01VWENfR1BSNCAgICAweDEwCj4gPiArI2RlZmluZSBJT01V
WENfR1BSNSAgICAweDE0Cj4gPiArI2RlZmluZSBJT01VWENfR1BSNiAgICAweDE4Cj4gPiArI2Rl
ZmluZSBJT01VWENfR1BSNyAgICAweDFjCj4gKG1vcmUgb2YgdGhlIHNhbWUpCj4gCj4gaHVoPwoK
VGhlc2UgYXJlIHRoZSBuYW1lcyBmcm9tIHRoZSBpbXg4TVEgcmVmZXJlbmNlIG1hbnVhbCAoZ2Vu
ZXJhbCBwdXJwb3NlCnJlZ2lzdGVycywgdGhleSBsdW1wIHRvZ2V0aGVyIGFsbCBzb3J0cyBvZiB0
aGluZ3MpLCBpdCdzIHRoZSBzYW1lIG9uCmlteDYvaW14Nyk6CgogICAgaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUv
aW5jbHVkZS9saW51eC9tZmQvc3lzY29uL2lteDZxLWlvbXV4Yy1ncHIuaAogICAgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
L3RyZWUvaW5jbHVkZS9saW51eC9tZmQvc3lzY29uL2lteDctaW9tdXhjLWdwci5oICAgICAKCj4g
PiArLyogaS5NWDhNcSBpb211eCBncHIgcmVnaXN0ZXIgZmllbGQgZGVmaW5lcyAqLwo+ID4gKyNk
ZWZpbmUgSU1YOE1RX0dQUjEzX01JUElfTVVYX1NFTCAgICAgICAgICAgICAgQklUKDIpCj4gCj4g
SSB0aGluayB0aGlzIGRlZmluZSBzaG91bGQgcHJvYmFibHkgYmUgbG9jYWwgdG8gdGhlIHBpbmN0
cmwgZHJpdmVyLCB0bwo+IGVuc3VyZSB0aGF0IG5vIG90aGVyIGRyaXZlcnMgZmlkZGxlIHdpdGgg
dGhlIHJlZ2lzdGVycyBtYW51YWxseS4KClRoZSBwdXJwb3NlIG9mIHRoZXNlIGJpdHMgaXMgZm9y
IGEgZHJpdmVyIHRvIGZpZGRsZSB3aXRoIHRoZW0gdG8gc2VsZWN0CnRoZSBpbnB1dCBzb3VyY2Uu
IFNpbWlsYXIgb24gaW14NyBpdCdzIGFscmVhZHkgdXNlZCBmb3IgZS5nLiB0aGUgcGh5CnJlZmNs
ayBpbiB0aGUgcGNpIGNvbnRyb2xsZXI6CgogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpLWlteDYuYyNuNjM4CgpUaGUgR1BScyBhcmUgbm90IGFib3V0IHBh
ZCBjb25maWd1cmF0aW9uIGJ1dCBnYXRoZXIgYWxsIHNvcnRzIG9mIHRoaW5ncwooc2VjdGlvbiA4
LjIuNCBvZiB0aGUgaW14OG1xIHJlZmVyZW5jZSBtYW51YWwpOiBwY2llIHNldHVwLCBkc2kgcmVs
YXRlZApiaXRzIHNvIEkgZG9uJ3QgdGhpbmsgdGhpcyBzaG91bGQgYmUgZG9uZSB2aWEgYSBwaW5j
dHJsCmRyaXZlci4gU2hvdWxkIHdlIGhhbmRsZSB0aGF0IGRpZmZlcmVudGx5IHRoYW4gb24gaW14
Ni83PwoKQ2hlZXJzLAogLS0gR3VpZG8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
