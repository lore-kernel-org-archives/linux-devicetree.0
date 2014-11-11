From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 5/7] drm: bridge/dw-hdmi: add support for multi byte
 register width access
Date: Tue, 11 Nov 2014 22:46:39 +0800
Message-ID: <5462214F.4010504@rock-chips.com>
References: <1415710229-11935-1-git-send-email-andy.yan@rock-chips.com>
 <1415710432-12167-1-git-send-email-andy.yan@rock-chips.com>
 <54621B23.1020602@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <54621B23.1020602@imgtec.com>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, ykk@rock-chips.com, Grant Likely <grant.likely@linaro.org>, djkurtz@google.com, Shawn Guo <shawn.guo@linaro.org>, jay.xu@rock-chips.com, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Ck9uIDIwMTTlubQxMeaciDEx5pelIDIyOjIwLCBadWJhaXIgTHV0ZnVsbGFoIEtha2FraGVsIHdy
b3RlOgo+IEhpIEFuZHksCj4KPiBUaGlzIHBhdGNoIGFkZHMgdGhlIHJlZy1pby13aWR0aCBiaW5k
aW5nLgo+Cj4gSGVuY2UgdGhlIGJpbmRpbmcgcGF0Y2ggc2hvdWxkIGNvbWUgYmVmb3JlIGl0Lgo+
CiAgICBkbyB5b3UgbWVhbiB0aGF0IEkgc2hvdWxkIHB1dCBkdHMgYmluZGluZyBwYXRjaAogICAg
YmVmb3JlIHRoaXMgcGF0Y2g/Cj4gT24gMTEvMTEvMTQgMTI6NTMsIEFuZHkgWWFuIHdyb3RlOgo+
PiBPbiByb2NrY2hpcCByazMyODgsIG9ubHkgd29yZCgzMi1iaXQpIGFjY2Vzc2VzIGFyZQo+PiBw
ZXJtaXR0ZWQgZm9yIGhkbWkgcmVnaXN0ZXJzLiAgQnl0ZSB3aWR0aCBhY2Nlc3NlcyAod3JpdGVi
LAo+PiByZWFkYikgZ2VuZXJhdGUgYW4gaW1wcmVjaXNlIGV4dGVybmFsIGFib3J0Lgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+Cj4+IC0t
LQo+Pgo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgdm9pZCBoZG1pX21vZGIoc3RydWN0IGR3X2hk
bWkgKmhkbWksIHU4IGRhdGEsIHU4IG1hc2ssIHVuc2lnbmVkIHJlZykKPj4gQEAgLTE0OTksNiAr
MTUyNywyMyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0
cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPj4gICAJc3RydWN0IGRldmljZV9ub2Rl
ICpkZGNfbm9kZTsKPj4gICAJc3RydWN0IHJlc291cmNlICppb3JlczsKPj4gICAJaW50IHJldCwg
aXJxOwo+PiArCXUzMiB2YWwgPSAxOwo+PiArCj4+ICsJb2ZfcHJvcGVydHlfcmVhZF91MzIobnAs
ICJyZWctaW8td2lkdGgiLCAmdmFsKTsKPj4gKwo+PiArCXN3aXRjaCAodmFsKSB7Cj4+ICsJY2Fz
ZSA0Ogo+PiArCQloZG1pLT53cml0ZSA9IGR3X2hkbWlfd3JpdGVsOwo+PiArCQloZG1pLT5yZWFk
ID0gZHdfaGRtaV9yZWFkbDsKPj4gKwkJYnJlYWs7Cj4+ICsJY2FzZSAxOgo+PiArCQloZG1pLT53
cml0ZSA9IGR3X2hkbWlfd3JpdGViOwo+PiArCQloZG1pLT5yZWFkID0gZHdfaGRtaV9yZWFkYjsK
Pj4gKwkJYnJlYWs7Cj4+ICsJZGVmYXVsdDoKPj4gKwkJZGV2X2VycihkZXYsICJyZWctaW8td2lk
dGggbXVzdCBiZSAxIG9yIDRcbiIpOwo+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4gKwl9Cj4gVGhl
IGJpbmRpbmcgcGF0Y2ggc2F5cyB0aGlzIGlzIGFuIG9wdGlvbmFsIHByb3BlcnR5Lgo+IEJ1dCBo
ZXJlIGlmIHVuZGVmaW5lZCBpdCByZXR1cm5zIC1FSU5WQUwuCj4KPiBJIHdvdWxkIGtlZXAgaXQg
b3B0aW9uYWwgYW5kIGRlZmF1bHQgaXQgdG8gYnl0ZSBhY2Nlc3MuCiAgIGlmIHRoZSBkdHMgdW5k
ZWZpbmVkIGl0LCB0aGUgdmFsIHdpbGwgYmUgMS4KICAgaWYgdGhlIGR0cyBkZWZpbmVkIG90aGVy
IHZhbHVlIGV4Y2VwdCA0IGFuZCAxLCByZXR1cm4gLUVJTlZBTAo+Cj4gUmVnYXJkcywKPiBadWJh
aXJMSwo+ICAgIAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBMaW51eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3QKPiBMaW51eC1yb2NrY2hpcEBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yb2NrY2hpcAo+Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRldmVsIG1haWxpbmcgbGlzdApkZXZlbEBsaW51eGRyaXZlcnBy
b2plY3Qub3JnCmh0dHA6Ly9kcml2ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaXZlcmRldi1kZXZlbAo=
