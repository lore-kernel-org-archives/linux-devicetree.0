From: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 1/2] drm/bridge: ti-tfp410: support hpd via gpio
Date: Tue, 28 Mar 2017 16:32:34 +0300
Message-ID: <f87195b3-bd89-d698-c935-4e3aa97c01e2@ti.com>
References: <2e47786ab3d04078ae70d0c4064f7c4d@rwthex-s1-b.rwth-ad.de>
 <093b4e9c0ae6413499e5bf8ec309fa41@rwthex-s1-b.rwth-ad.de>
 <6dfb2b66ec2a408dabe80d703f411ce0@rwthex-s1-b.rwth-ad.de>
 <d6b2391f-3e4a-2761-b6a0-8997d2c78600@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <d6b2391f-3e4a-2761-b6a0-8997d2c78600@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Archit Taneja <architt@codeaurora.org>, Christopher Spinrath <christopher.spinrath@rwth-aachen.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, DRI mailing list <dri-devel@lists.freedesktop.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Igor Grinberg <grinberg@compulab.co.il>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMDMvMjcvMTcgMDg6NTgsIEFyY2hpdCBUYW5lamEgd3JvdGU6Cj4gSGksCj4gCj4gT24gMDMv
MDcvMjAxNyAwMzoyMSBBTSwgQ2hyaXN0b3BoZXIgU3BpbnJhdGggd3JvdGU6Cj4+IEhpIEZhYmlv
LAo+Pgo+PiBPbiAwMy8wNi8yMDE3IDEwOjQ2IFBNLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+Pj4g
SGkgQ2hyaXN0b3BoZXIsCj4+Pgo+Pj4gT24gTW9uLCBNYXIgNiwgMjAxNyBhdCA2OjQwIFBNLCAK
Pj4+IDxjaHJpc3RvcGhlci5zcGlucmF0aEByd3RoLWFhY2hlbi5kZT4gd3JvdGU6Cj4+Pj4gRnJv
bTogQ2hyaXN0b3BoZXIgU3BpbnJhdGggPGNocmlzdG9waGVyLnNwaW5yYXRoQHJ3dGgtYWFjaGVu
LmRlPgo+Pj4+Cj4+Pj4gT24gc29tZSBib2FyZHMgdGhlIGhwZCBwaW4gb2YgYSBoZG1pIGNvbm5l
Y3RvciBpcyB3aXJlZCB1cCB0byBhIGdwaW8KPj4+PiBwaW4uIFNpbmNlIGluIHRoZSBEUk0gd29y
bGQgdGhlIHRmcDQxMCBkcml2ZXIgaXMgcmVzcG9uc2libGUgZm9yCj4+Pj4gaGFuZGxpbmcgdGhl
IGNvbm5lY3RvciwgYWRkIHN1cHBvcnQgZm9yIGhwZCBncGlvcyBpbiB0aGlzIHZlcnkgZHJpdmVy
Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgU3BpbnJhdGgKPj4+PiA8Y2hy
aXN0b3BoZXIuc3BpbnJhdGhAcnd0aC1hYWNoZW4uZGU+Cj4+Pj4gLS0tCj4+Pj4gIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgfCA3Mgo+Pj4+ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tCj4+PgouLi4KPj4KPiAKPiBUaGUgcGF0Y2ggbG9va3MgZ29vZCB0
byBtZS4KPiAKPiBKeXJpLAo+IAo+IElzIGl0IHBvc3NpYmxlIGZvciB5b3UgdG8gdmVyaWZ5IHRo
aXMgb24gQmVhZ2xlYm9uZSBwbGF0Zm9ybT8KPiAKCklmIEkgcmVhZCBteSBCZWFnbGVCb25lIERW
SS1EIENhcGUgZG9jcyByaWdodCwgaXQgZG9lcyBub3QgaGF2ZSB0aGUgSFBECnBpbiBjb25uZWN0
ZWQuIEF0IGxlYXN0IGl0IGRvZXMgbm90IG1lbnRpb24gYW55IGdwaW8gdGhhdCBjb3VsZCBiZSB1
c2VkCmZvciB0aGUgcHVycG9zZS4gU28gSSBjYW4gbm90IGVhc2lseSB0ZXN0IHRoaXMgcGF0Y2gg
aW4gcmVhbCB3b3JsZApzaXR1YXRpb24uIEZvciB3aGF0IGl0IGlzIHdvcnRoIHRoZSBwYXRjaCBs
b29rcyBvayB0byBtZSB0b28uCgpCZXN0IHJlZ2FyZHMsCkp5cmkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
