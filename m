From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v16 03/12] drm: imx: imx-hdmi: convert imx-hdmi to
 drm_bridge mode
Date: Thu, 04 Dec 2014 08:51:02 +0800
Message-ID: <547FAFF6.3050800@rock-chips.com>
References: <1417620408-30354-1-git-send-email-andy.yan@rock-chips.com>
 <1417620566-30496-1-git-send-email-andy.yan@rock-chips.com>
 <20141203153847.GC11285@n2100.arm.linux.org.uk>
 <547F3495.9070206@rock-chips.com>
 <20141203161122.GF11285@n2100.arm.linux.org.uk>
 <547F3A9F.30701@rock-chips.com>
 <20141203163318.GH11285@n2100.arm.linux.org.uk>
 <547F40B8.6060706@rock-chips.com>
 <20141203234000.GJ11285@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20141203234000.GJ11285@n2100.arm.linux.org.uk>
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

SGkgUnVzc2VsOgpPbiAyMDE05bm0MTLmnIgwNOaXpSAwNzo0MCwgUnVzc2VsbCBLaW5nIC0gQVJN
IExpbnV4IHdyb3RlOgo+IE9uIFRodSwgRGVjIDA0LCAyMDE0IGF0IDEyOjU2OjI0QU0gKzA4MDAs
IEFuZHkgWWFuIHdyb3RlOgo+PiBIaSBSdXNzZWxsOgo+PiBPbiAyMDE05bm0MTLmnIgwNOaXpSAw
MDozMywgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IHdyb3RlOgo+Pj4gT24gVGh1LCBEZWMgMDQs
IDIwMTQgYXQgMTI6MzA6MjNBTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6Cj4+Pj4gT24gMjAxNOW5
tDEy5pyIMDTml6UgMDA6MTEsIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCB3cm90ZToKPj4+Pj4g
SSBtZWFudCB0aGF0IGlteF9oZG1pX2JpbmQgc2hvdWxkIGJlIHBhc3NlZCB0aGVzZSwgc28gdGhh
dCBpdCBuZWVkcyB0bwo+Pj4+PiBrbm93IG5vdGhpbmcgYWJvdXQgdGhlIHN0cnVjdCBkZXZpY2Ug
YmV5b25kIHRoZSBnZW5lcmljIGRldmljZSBzdHJ1Y3R1cmUuCj4+Pj4+IEluIG90aGVyIHdvcmRz
LCB0aGUgZHctaGRtaSBjb3JlIHNob3VsZCBub3QgYXNzdW1lIHRoYXQgdGhlIHN0cnVjdCBkZXZp
Y2UKPj4+Pj4gaXMgcGFydCBvZiBhIHBsYXRmb3JtIGRldmljZS4KPj4+Pj4KPj4+PiAgICAgaWYg
c28sIGhvdyBhYm91dCB0aGUgZGV2aWNlIHRyZWUgcHJvcGVydGllcyAgZGRjLWkyYy1idXMsIHJl
Zy1pby13aWR0aCwKPj4+PiBpYWhiLCBpc2ZyLAo+Pj4+ICAgIHRoZXkgYXJlIGFsbCBmb3VuZCBi
eSBkZXZpY2U/Cj4+PiBJZiB0aGUgZGV2aWNlIGhhcyBhIGRldmljZSB0cmVlIG5vZGUgYXNzb2Np
YXRlZCB3aXRoIGl0LCBpdCB3aWxsIGhhdmUgYQo+Pj4gbm9uLU5VTEwgZGV2LT5vZl9ub2RlIC0g
d2hpY2ggaXMgcGFydCBvZiB0aGUgZ2VuZXJpYyBkZXZpY2Ugc3RydWN0dXJlLgo+Pj4KPj4gICAg
c28gLCBJIGp1c3QgbmVlZCBnZXQgdGhlIHJlc291cmNlIGFuZCBpcnEgbnVtYmVyIGluIHRoZQo+
PiBkd19oZG1pLWlteC9yb2NrY2hpcCAsdGhhbgo+PiAgICBwYXNzIHRoZW0gdG8gaW14X2hkbWlf
YmluZCwgYXMgdGhlIHByb3BlcnRpZXMgZGRjLWkyYy1idXMsIHJlZy1pby13aWR0aCwKPj4gaWFo
Yixpc2ZyLCB0aGV5Cj4+ICAgIGFyZSBzdGlsbCBjYW4gYmUgaGFuZGxlZCBpbiBpbXhfaGRtaV9i
aW5kID8KPiBCYXNpY2FsbHksIHdoYXQgSSdtIHN1Z2dlc3RpbmcgaXMganVzdCB0aGlzIGNoYW5n
ZSB0byBpbXhfaGRtaV9iaW5kKCk6Cj4KPiAgIGludCBpbXhfaGRtaV9iaW5kKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAo+IAkJICB2b2lkICpkYXRhLCBzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gKwkJICBjb25zdCBzdHJ1Y3QgcmVzb3VyY2UgKmlvcmVz
LCBpbnQgaXJxLAo+IAkJICBjb25zdCBzdHJ1Y3QgaW14X2hkbWlfcGxhdF9kYXRhICpwbGF0X2Rh
dGEpCj4gICB7Cj4gLQlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1f
ZGV2aWNlKGRldik7Cj4gLi4uCj4gCX0KPgo+IC0JaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2
LCAwKTsKPiAJaWYgKGlycSA8IDApCj4gCQlyZXR1cm4gaXJxOwo+IC4uLgo+IAkJcmV0dXJuIHJl
dDsKPgo+IC0JaW9yZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9N
RU0sIDApOwo+IAloZG1pLT5yZWdzID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldiwgaW9yZXMp
Owo+IAlpZiAoSVNfRVJSKGhkbWktPnJlZ3MpKQo+Cj4gYW5kIHN1cHBseWluZyB0aG9zZSBhcyBh
cmd1bWVudHMgZnJvbSB0aGUgY2FsbGVyLgo+CiAgIGdvdCBpdCwgdGhhbmtzLCBhbmQgYWxzbyBt
YW55IHRoYW5rcyBmb3IgUGhpbGlwcAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRldmVsIG1haWxpbmcgbGlzdApkZXZlbEBsaW51eGRyaXZlcnByb2pl
Y3Qub3JnCmh0dHA6Ly9kcml2ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaXZlcmRldi1kZXZlbAo=
