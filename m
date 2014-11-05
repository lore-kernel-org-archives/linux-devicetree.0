From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 0/2] make imx hdmi publicly used by dw hdmi compatible
 platform
Date: Wed, 05 Nov 2014 10:12:13 +0800
Message-ID: <5459877D.2080606@rock-chips.com>
References: <1415107992-34289-1-git-send-email-andy.yan@rock-chips.com>
 <20141104142908.GG4042@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20141104142908.GG4042@n2100.arm.linux.org.uk>
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
Cc: heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Ck9uIDIwMTTlubQxMeaciDA05pelIDIyOjI5LCBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggd3Jv
dGU6Cj4gT24gVHVlLCBOb3YgMDQsIDIwMTQgYXQgMDk6MzM6MTBQTSArMDgwMCwgQW5keSBZYW4g
d3JvdGU6Cj4+IEZyb206IEFuZHkgeWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4KPj4g
V2UgZm91bmQgZnJlZXNjYWxlIGlteDYgYW5kIHJvY2tjaGlwIHJrMzI4OCBhbmQgSW5nZW5pYyBK
WjQ3ODAgKFhidXJzdC9NSVBTKQo+PiB1c2UgdGhlIGludGVyZmFjZSBjb21wYXRpYmxlIERlc2ln
bndhcmUgSERNSSBJUCwgYnV0IHRoZXkgYWxzbyBoYXZlIHNvbWUKPj4gbGlnaHRseSBkaWZmZXJl
bmNlLCBzdWNoIGFzIHBoeSBwbGwgY29uZmlndXJhdGlvbiwgcmVnaXN0ZXIgd2lkdGgoaW14IGhk
bWkKPj4gcmVnaXN0ZXIgaXMgb25lIGJ5dGUsIGJ1dCByazMyODggaXMgNCBieXRlcyB3aWR0aCBh
bmQgY2FuIG9ubHkgYWNjZXNzIGJ5IHdvcmQpLAo+PiA0SyBzdXBwb3J0KGlteDYgZG9lc24ndCBz
dXBwb3J0IDRrLCBidXQgcmszMjg4IGRvZXMpLgo+Pgo+PiBUbyByZXVzZSB0aGUgaW14LWhkbWkg
ZHJpdmVyLCB3ZSBkbyB0aGlzIHBhdGNoIHNldDoKPj4gcGF0Y2ggKDEpOiBzcGxpdCBvdXQgaW14
LXNvYyBjb2RlIGZyb20gaW14LWhkbWkgdG8gZHdfaGRtaS1pbXguYwo+PiBwYXRjaCAoMik6IG1v
dmUgaW14LWhkbWkgdG8gYnJpZGdlLywgYW5kIHJlbmFtZSB0byBkdy1oZG1pIHRvCj4+IG1ha2Ug
dGhpcyBkcml2ZXIgaW5kZXBlbnQgb2YgZHJtLWlteCAuIEFuZCB3ZSB3aWxsIGFkZCByb2NrY2hp
cAo+PiBwbGF0Zm9ybSBzcGVjaWZpYyBjb2RlIGR3X2hkbWktcm9ja2NoaXAuYyBsYXRlciwgdGhp
cyBpcyBkZXBlbmQKPj4gb24gZHJtLXJvY2tjaGlwLgo+IEdyZWF0IC0gSSBmdWxseSBhZ3JlZSB0
aGF0IHRoaXMgbmVlZHMgdG8gYmUgcmVuYW1lZCBhcyBpdCBpcyBhIERlc2lnbndhcmUKPiBJUC4K
Pgo+IFNob3VsZCBpdCBiZSBtb3ZlZCBpbnRvIGJyaWRnZS8gPyAgSXQgaXNuJ3QgaW1wbGVtZW50
ZWQgYXMgYSBEUk0gYnJpZGdlCj4gZHJpdmVyIGF0IHByZXNlbnQsIHNvIHRoaXMgc2VlbXMgaWxs
b2dpY2FsLiAgSXMgdGhlIGxvbmdlciB0ZXJtIHBsYW4gdG8KPiBjb252ZXJ0IGl0IHRvIGJlIGEg
RFJNIGJyaWRnZT8KV2UgaGF2ZSBwbGFuIHRvIGNvbnZlcnQgaXQgdG8gRFJNIGJyaWRnZS4KPgo+
IFNlY29uZGx5LCBpZiB5b3Ugd2FudCBIRE1JIGF1ZGlvIHN1cHBvcnQsIHlvdSBtYXkgZmluZCB0
aGUgcGF0Y2hlcyBJCj4gbWFpbnRhaW4gZm9yIHRoZSBTb2xpZFJ1biBkZXZpY2VzIHVzZWZ1bCwg
d2hpY2ggYWRkIHRoaXMgYXMgYSBzdGFuZGFyZAo+IEFMU0EgZGV2aWNlLiAgSSBhbHNvIGhhdmUg
Q0VDIHN1cHBvcnQgZm9yIGl0IGFzIHdlbGwuICBJZiB5b3UncmUKPiBpbnRlcmVzdGVkLCBJJ2xs
IGVtYWlsIHRob3NlLgo+Ckl0J3MgdmVyeSBncmVhdCBpZiB5b3UgZW1haWwgdGhvc2UsIHdlIGFy
ZSBhbHNvIHdvcmtpbmcgb24gYXVkaW8gYW5kIENFQy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRldmVsIG1haWxpbmcgbGlzdApkZXZlbEBsaW51eGRy
aXZlcnByb2plY3Qub3JnCmh0dHA6Ly9kcml2ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaXZlcmRldi1kZXZlbAo=
