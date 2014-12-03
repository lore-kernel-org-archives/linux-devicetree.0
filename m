From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v16 03/12] drm: imx: imx-hdmi: convert imx-hdmi to
 drm_bridge mode
Date: Thu, 04 Dec 2014 00:30:23 +0800
Message-ID: <547F3A9F.30701@rock-chips.com>
References: <1417620408-30354-1-git-send-email-andy.yan@rock-chips.com>
 <1417620566-30496-1-git-send-email-andy.yan@rock-chips.com>
 <20141203153847.GC11285@n2100.arm.linux.org.uk>
 <547F3495.9070206@rock-chips.com>
 <20141203161122.GF11285@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20141203161122.GF11285@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.com, Luc
List-Id: devicetree@vger.kernel.org

Ck9uIDIwMTTlubQxMuaciDA05pelIDAwOjExLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggd3Jv
dGU6Cj4gT24gVGh1LCBEZWMgMDQsIDIwMTQgYXQgMTI6MDQ6MzdBTSArMDgwMCwgQW5keSBZYW4g
d3JvdGU6Cj4+IEhpIFJ1c3NlbGw6Cj4+Cj4+IE9uIDIwMTTlubQxMuaciDAz5pelIDIzOjM4LCBS
dXNzZWxsIEtpbmcgLSBBUk0gTGludXggd3JvdGU6Cj4+PiBPbiBXZWQsIERlYyAwMywgMjAxNCBh
dCAxMToyOToyNlBNICswODAwLCBBbmR5IFlhbiB3cm90ZToKPj4+PiAraW50IGlteF9oZG1pX2Jp
bmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCj4+Pj4gKwkJICB2
b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCj4+Pj4gKwkJICBjb25zdCBz
dHJ1Y3QgaW14X2hkbWlfcGxhdF9kYXRhICpwbGF0X2RhdGEpCj4+Pj4gICB7Cj4+Pj4gICAJc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkZXYpOwo+Pj4+
IC0JY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqb2ZfaWQgPQo+Pj4+IC0JCQkJb2ZfbWF0Y2hf
ZGV2aWNlKGlteF9oZG1pX2R0X2lkcywgZGV2KTsKPj4+PiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtID0gZGF0YTsKPj4+PiAgIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2Rl
Owo+Pj4+ICAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqZGRjX25vZGU7Cj4+Pj4gQEAgLTE1OTQsMTkg
KzE1NjYsMTYgQEAgc3RhdGljIGludCBpbXhfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+Pj4+ICAgCXN0cnVjdCByZXNvdXJj
ZSAqaW9yZXM7Cj4+Pj4gICAJaW50IHJldCwgaXJxOwo+Pj4+IC0JaGRtaSA9IGRldm1fa3phbGxv
YyhkZXYsIHNpemVvZigqaGRtaSksIEdGUF9LRVJORUwpOwo+Pj4+ICsJaGRtaSA9IGRldm1fa3ph
bGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmhkbWkpLCBHRlBfS0VSTkVMKTsKPj4+PiAgIAlpZiAo
IWhkbWkpCj4+Pj4gICAJCXJldHVybiAtRU5PTUVNOwo+Pj4+IC0JaGRtaS0+ZGV2ID0gZGV2Owo+
Pj4+ICsJaGRtaS0+cGxhdF9kYXRhID0gcGxhdF9kYXRhOwo+Pj4+ICsJaGRtaS0+ZGV2ID0gJnBk
ZXYtPmRldjsKPj4+PiArCWhkbWktPmRldl90eXBlID0gcGxhdF9kYXRhLT5kZXZfdHlwZTsKPj4+
PiAgIAloZG1pLT5zYW1wbGVfcmF0ZSA9IDQ4MDAwOwo+Pj4+ICAgCWhkbWktPnJhdGlvID0gMTAw
Owo+Pj4+IC0KPj4+PiAtCWlmIChvZl9pZCkgewo+Pj4+IC0JCWNvbnN0IHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2VfaWQgKmRldmljZV9pZCA9IG9mX2lkLT5kYXRhOwo+Pj4+IC0KPj4+PiAtCQloZG1p
LT5kZXZfdHlwZSA9IGRldmljZV9pZC0+ZHJpdmVyX2RhdGE7Cj4+Pj4gLQl9Cj4+Pj4gKwloZG1p
LT5lbmNvZGVyID0gZW5jb2RlcjsKPj4+IEknZCBzdWdnZXN0IGNoYW5naW5nIGlteF9oZG1pX2Jp
bmQoKSB0byB0YWtlIHRoZSBzdHJ1Y3QgcmVzb3VyY2UgYW5kIGlycQo+Pj4gbnVtYmVyLCBhbmQg
YXZvaWRpbmcgdGhlIHBsYXRmb3JtIGRldmljZSBzdHVmZiBhbHRvZ2V0aGVyIGluIGhlcmUuCj4+
Pgo+PiAgICAgQWN0dWFsbHkgdGhpcyBpcyB3aGF0IHRoZSBjdXJyZW50IGNvZGUgZG86IHRoZSBy
ZXNvdXJjZSBhbmQgaXJxIG51bWJlcgo+PiBhcmUgYWxsIGhhbmRsZWQgaW4gaW14X2hkbWlfYmlu
ZAo+IEkgbWVhbnQgdGhhdCBpbXhfaGRtaV9iaW5kIHNob3VsZCBiZSBwYXNzZWQgdGhlc2UsIHNv
IHRoYXQgaXQgbmVlZHMgdG8KPiBrbm93IG5vdGhpbmcgYWJvdXQgdGhlIHN0cnVjdCBkZXZpY2Ug
YmV5b25kIHRoZSBnZW5lcmljIGRldmljZSBzdHJ1Y3R1cmUuCj4gSW4gb3RoZXIgd29yZHMsIHRo
ZSBkdy1oZG1pIGNvcmUgc2hvdWxkIG5vdCBhc3N1bWUgdGhhdCB0aGUgc3RydWN0IGRldmljZQo+
IGlzIHBhcnQgb2YgYSBwbGF0Zm9ybSBkZXZpY2UuCj4KICAgIGlmIHNvLCBob3cgYWJvdXQgdGhl
IGRldmljZSB0cmVlIHByb3BlcnRpZXMgIGRkYy1pMmMtYnVzLCAKcmVnLWlvLXdpZHRoLCBpYWhi
LCBpc2ZyLAogICB0aGV5IGFyZSBhbGwgZm91bmQgYnkgZGV2aWNlPwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2ZWwgbWFpbGluZyBsaXN0CmRldmVs
QGxpbnV4ZHJpdmVycHJvamVjdC5vcmcKaHR0cDovL2RyaXZlcmRldi5saW51eGRyaXZlcnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vZHJpdmVyZGV2LWRldmVsCg==
