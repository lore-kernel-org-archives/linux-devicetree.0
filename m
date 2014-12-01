From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v13 07/12] drm: bridge/dw_hdmi: add support for multi-byte
 register width access
Date: Mon, 01 Dec 2014 20:46:36 +0800
Message-ID: <547C632C.7000309@rock-chips.com>
References: <1417008157-31861-1-git-send-email-andy.yan@rock-chips.com>
 <1417008759-32257-1-git-send-email-andy.yan@rock-chips.com>
 <1417019657.3177.10.camel@pengutronix.de> <547843B9.6000806@rock-chips.com>
 <1417435456.4624.12.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1417435456.4624.12.camel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, rmk+kernel@arm.linux.org.uk, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Dave Airlie <airlied@redhat.com>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

SGkgUGhpbGlwcDoKT24gMjAxNOW5tDEy5pyIMDHml6UgMjA6MDQsIFBoaWxpcHAgWmFiZWwgd3Jv
dGU6Cj4gQW0gRnJlaXRhZywgZGVuIDI4LjExLjIwMTQsIDE3OjQzICswODAwIHNjaHJpZWIgQW5k
eSBZYW46Cj4+IEhpIFphYmVsOgo+PiBPbiAyMDE05bm0MTHmnIgyN+aXpSAwMDozNCwgUGhpbGlw
cCBaYWJlbCB3cm90ZToKPj4+IEFtIE1pdHR3b2NoLCBkZW4gMjYuMTEuMjAxNCwgMjE6MzIgKzA4
MDAgc2NocmllYiBBbmR5IFlhbjoKPj4+PiBPbiByb2NrY2hpcCByazMyODgsIG9ubHkgd29yZCgz
Mi1iaXQpIGFjY2Vzc2VzIGFyZQo+Pj4+IHBlcm1pdHRlZCBmb3IgaGRtaSByZWdpc3RlcnMuICBC
eXRlIHdpZHRoIGFjY2Vzc2VzICh3cml0ZWIsCj4+Pj4gcmVhZGIpIGdlbmVyYXRlIGFuIGltcHJl
Y2lzZSBleHRlcm5hbCBhYm9ydC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxh
bmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4+Pgo+Pj4+IC0tLQo+Pj4+Cj4+Pj4gQ2hhbmdlcyBp
biB2MTM6IE5vbmUKPj4+PiBDaGFuZ2VzIGluIHYxMjogTm9uZQo+Pj4+IENoYW5nZXMgaW4gdjEx
OiBOb25lCj4+Pj4gQ2hhbmdlcyBpbiB2MTA6IE5vbmUKPj4+PiBDaGFuZ2VzIGluIHY5OiBOb25l
Cj4+Pj4gQ2hhbmdlcyBpbiB2ODogTm9uZQo+Pj4+IENoYW5nZXMgaW4gdjc6IE5vbmUKPj4+PiBD
aGFuZ2VzIGluIHY2Ogo+Pj4+IC0gcmVmYWN0b3IgcmVnaXN0ZXIgYWNjZXNzIHdpdGhvdXQgcmVn
X3NoaWZ0Cj4+Pj4KPj4+PiBDaGFuZ2VzIGluIHY1Ogo+Pj4+IC0gcmVmYWN0b3IgcmVnLWlvLXdp
ZHRoCj4+Pj4KPj4+PiBDaGFuZ2VzIGluIHY0OiBOb25lCj4+Pj4gQ2hhbmdlcyBpbiB2MzoKPj4+
PiAtIHNwbGl0IG11bHRpLXJlZ2lzdGVyIGFjY2VzcyB0byBvbmUgaW5kZXBlbnQgcGF0Y2gKPj4+
Pgo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHdfaGRtaS5jIHwgNTcgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA1
MSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvZHdfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9k
d19oZG1pLmMKPj4+PiBpbmRleCBhNTNiZjYzLi41ZTg4YzhkIDEwMDY0NAo+Pj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvZHdfaGRtaS5jCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9kd19oZG1pLmMKPj4+PiBAQCAtMTAwLDYgKzEwMCwxMSBAQCBzdHJ1Y3QgaGRtaV9k
YXRhX2luZm8gewo+Pj4+ICAgIAlzdHJ1Y3QgaGRtaV92bW9kZSB2aWRlb19tb2RlOwo+Pj4+ICAg
IH07Cj4+Pj4gICAgCj4+Pj4gK3VuaW9uIGR3X3JlZ19wdHIgewo+Pj4+ICsJdTMyIF9faW9tZW0g
KnAzMjsKPj4+PiArCXU4IF9faW9tZW0gKnA4Owo+Pj4+ICt9Owo+Pj4gSSBzZWUgbm8gbmVlZCB0
byBpbnRyb2R1Y2UgdGhpcy4gSnVzdCBleHBsaWNpdGx5IG11bHRpcGx5IHRoZSBvZmZzZXQgaW4K
Pj4+IGR3X2hkbWlfd3JpdGVsLgo+Pj4KPj4gICAgICAgSXMgdGhlcmUgYW55IGRpc2FkdmFudGFn
ZSB0byBkbyBsaWtlIHRoaXM/Cj4+ICAgICAgIFRoZSBjb21waWxlciBjYW4gaGVscCB1cyBkbyB0
aGUgZXhwbGljaXRseSBtdWx0aXBseSBieSB0aGlzIHdheS4KPiBGb3VyIGFkZGl0aW9uYWwgbGlu
ZXMsIGEgbmV3IGRlZmluZWQgdHlwZSwgYSBmZXcgbW9yZSBjaGFuZ2VzIHRvIHN0cnVjdAo+IGR3
X2hkbWkgYW5kIGR3X2hkbWlfYmluZCBuZWNlc3NhcnkuCj4KPiBUZWNobmljYWxseSBJIHNlZSBu
byBwcm9ibGVtIHRvIGxldCB0aGUgY29tcGlsZXIgZG8gdGhlIG11bHRpcGxpY2F0aW9uLAo+IG15
IGlzc3VlIGlzIHRoYXQgaXQgZXZlciBzbyBzbGlnaHRseSBvYmZ1c2NhdGVzIHRoZSBjb2RlLiBJ
bnN0ZWFkIG9mCj4ganVzdCB3cml0aW5nICIqIDQiIGluIHR3byBmdW5jdGlvbnMsIHdlIGdldCBh
IG5ldyB1bmlvbiB0aGF0IHlvdSBuZWVkIHRvCj4ga25vdyBhYm91dCB3aGVuIGxvb2tpbmcgYXQg
c3RydWN0IGR3X2hkbWkgYW5kIGR3X2hkbWlfYmluZCwgcmVncy5wOCBpcwo+IHVzZWQgYnV0IG5l
dmVyIGFzc2lnbmVkIGRpcmVjdGx5LCBpdCdzIGp1c3QgYSB0aW55IGJpdCBvZiBhZGRpdGlvbmFs
Cj4gZWZmb3J0IG5lZWRlZCB0byB1bmRlcnN0YW5kIHRoZSBjb2RlLiBCdXQgd2hlbiB0aGUgY29z
dCB0byBhdm9pZCB0aGF0IGlzCj4gc28gc21hbGwuLi4KPgo+IHJlZ2FyZHMKPiBQaGlsaXBwCj4K
CiAgIFdoYXQgeW91IHNhaWQgaXMgcmlnaHQsIEkgd2lsbCBjaGFuZ2UgaXQgaW4gUEFUQ0ggVjE1
CiAgICB0aGFua3MgLgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gTGludXgtcm9ja2NoaXAgbWFpbGluZyBsaXN0Cj4gTGludXgtcm9ja2NoaXBAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcm9ja2NoaXAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkZXZlbCBtYWlsaW5nIGxpc3QKZGV2ZWxAbGludXhkcml2ZXJwcm9qZWN0
Lm9yZwpodHRwOi8vZHJpdmVyZGV2LmxpbnV4ZHJpdmVycHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcml2ZXJkZXYtZGV2ZWwK
