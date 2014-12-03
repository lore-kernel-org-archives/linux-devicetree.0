From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v16 03/12] drm: imx: imx-hdmi: convert imx-hdmi to
 drm_bridge mode
Date: Wed, 3 Dec 2014 23:40:00 +0000
Message-ID: <20141203234000.GJ11285@n2100.arm.linux.org.uk>
References: <1417620408-30354-1-git-send-email-andy.yan@rock-chips.com>
 <1417620566-30496-1-git-send-email-andy.yan@rock-chips.com>
 <20141203153847.GC11285@n2100.arm.linux.org.uk>
 <547F3495.9070206@rock-chips.com>
 <20141203161122.GF11285@n2100.arm.linux.org.uk>
 <547F3A9F.30701@rock-chips.com>
 <20141203163318.GH11285@n2100.arm.linux.org.uk>
 <547F40B8.6060706@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <547F40B8.6060706@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.com, Luc
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBEZWMgMDQsIDIwMTQgYXQgMTI6NTY6MjRBTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6
Cj4gSGkgUnVzc2VsbDoKPiBPbiAyMDE05bm0MTLmnIgwNOaXpSAwMDozMywgUnVzc2VsbCBLaW5n
IC0gQVJNIExpbnV4IHdyb3RlOgo+ID5PbiBUaHUsIERlYyAwNCwgMjAxNCBhdCAxMjozMDoyM0FN
ICswODAwLCBBbmR5IFlhbiB3cm90ZToKPiA+Pk9uIDIwMTTlubQxMuaciDA05pelIDAwOjExLCBS
dXNzZWxsIEtpbmcgLSBBUk0gTGludXggd3JvdGU6Cj4gPj4+SSBtZWFudCB0aGF0IGlteF9oZG1p
X2JpbmQgc2hvdWxkIGJlIHBhc3NlZCB0aGVzZSwgc28gdGhhdCBpdCBuZWVkcyB0bwo+ID4+Pmtu
b3cgbm90aGluZyBhYm91dCB0aGUgc3RydWN0IGRldmljZSBiZXlvbmQgdGhlIGdlbmVyaWMgZGV2
aWNlIHN0cnVjdHVyZS4KPiA+Pj5JbiBvdGhlciB3b3JkcywgdGhlIGR3LWhkbWkgY29yZSBzaG91
bGQgbm90IGFzc3VtZSB0aGF0IHRoZSBzdHJ1Y3QgZGV2aWNlCj4gPj4+aXMgcGFydCBvZiBhIHBs
YXRmb3JtIGRldmljZS4KPiA+Pj4KPiA+PiAgICBpZiBzbywgaG93IGFib3V0IHRoZSBkZXZpY2Ug
dHJlZSBwcm9wZXJ0aWVzICBkZGMtaTJjLWJ1cywgcmVnLWlvLXdpZHRoLAo+ID4+aWFoYiwgaXNm
ciwKPiA+PiAgIHRoZXkgYXJlIGFsbCBmb3VuZCBieSBkZXZpY2U/Cj4gPklmIHRoZSBkZXZpY2Ug
aGFzIGEgZGV2aWNlIHRyZWUgbm9kZSBhc3NvY2lhdGVkIHdpdGggaXQsIGl0IHdpbGwgaGF2ZSBh
Cj4gPm5vbi1OVUxMIGRldi0+b2Zfbm9kZSAtIHdoaWNoIGlzIHBhcnQgb2YgdGhlIGdlbmVyaWMg
ZGV2aWNlIHN0cnVjdHVyZS4KPiA+Cj4gICBzbyAsIEkganVzdCBuZWVkIGdldCB0aGUgcmVzb3Vy
Y2UgYW5kIGlycSBudW1iZXIgaW4gdGhlCj4gZHdfaGRtaS1pbXgvcm9ja2NoaXAgLHRoYW4KPiAg
IHBhc3MgdGhlbSB0byBpbXhfaGRtaV9iaW5kLCBhcyB0aGUgcHJvcGVydGllcyBkZGMtaTJjLWJ1
cywgcmVnLWlvLXdpZHRoLAo+IGlhaGIsaXNmciwgdGhleQo+ICAgYXJlIHN0aWxsIGNhbiBiZSBo
YW5kbGVkIGluIGlteF9oZG1pX2JpbmQgPwoKQmFzaWNhbGx5LCB3aGF0IEknbSBzdWdnZXN0aW5n
IGlzIGp1c3QgdGhpcyBjaGFuZ2UgdG8gaW14X2hkbWlfYmluZCgpOgoKIGludCBpbXhfaGRtaV9i
aW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAoJCSAgdm9pZCAq
ZGF0YSwgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAorCQkgIGNvbnN0IHN0cnVjdCByZXNv
dXJjZSAqaW9yZXMsIGludCBpcnEsCgkJICBjb25zdCBzdHJ1Y3QgaW14X2hkbWlfcGxhdF9kYXRh
ICpwbGF0X2RhdGEpCiB7Ci0Jc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRm
b3JtX2RldmljZShkZXYpOwouLi4KCX0KCi0JaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAw
KTsKCWlmIChpcnEgPCAwKQoJCXJldHVybiBpcnE7Ci4uLgoJCXJldHVybiByZXQ7CgotCWlvcmVz
ID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKCWhkbWkt
PnJlZ3MgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCBpb3Jlcyk7CglpZiAoSVNfRVJSKGhk
bWktPnJlZ3MpKQoKYW5kIHN1cHBseWluZyB0aG9zZSBhcyBhcmd1bWVudHMgZnJvbSB0aGUgY2Fs
bGVyLgoKLS0gCkZUVEMgYnJvYWRiYW5kIGZvciAwLjhtaWxlIGxpbmU6IGN1cnJlbnRseSBhdCA5
LjVNYnBzIGRvd24gNDAwa2JwcyB1cAphY2NvcmRpbmcgdG8gc3BlZWR0ZXN0Lm5ldC4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2ZWwgbWFpbGluZyBs
aXN0CmRldmVsQGxpbnV4ZHJpdmVycHJvamVjdC5vcmcKaHR0cDovL2RyaXZlcmRldi5saW51eGRy
aXZlcnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vZHJpdmVyZGV2LWRldmVsCg==
