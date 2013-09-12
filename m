From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v2 1/2] video: ARM CLCD: Add DT support
Date: Thu, 12 Sep 2013 16:26:21 +0100
Message-ID: <1378999581.13571.57.camel@hornet>
References: <1378808726-32535-1-git-send-email-pawel.moll@arm.com>
 <522F57B9.5000001@wwwdotorg.org> <1378899931.4082.75.camel@hornet>
 <5230AAEB.2030607@wwwdotorg.org> <1378991033.13571.33.camel@hornet>
 <5231D5FA.4060508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5231D5FA.4060508@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDEzLTA5LTEyIGF0IDE1OjU1ICswMTAwLCBTdGVwaGVuIFdhcnJlbiB3cm90ZToK
PiA+IE9rLCBzbyBJJ2xsIG1ha2UgaXQgYSBhcm0scGwxMXgsc3BlY2lmaWMgcHJvcGVydHkuIEFj
dHVhbGx5IHR3bwo+ID4gcHJvcGVydGllcyAtIG9uZSBiaXQgSSBtaXNzZWQgd2FzIHRoZSBkdWFs
IFNUTiBwYW5lbCBjYXNlLCB3aGVyZSB0aGV5Cj4gPiBoYXZlIHNlcGFyYXRlIGZyYW1lIGJ1ZmZl
cnMuIFNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMgb2Y6Cj4gPiAKPiA+IE9wdGlvbmFsOgo+ID4g
Cj4gPiAtIGFybSxwbDExeCxmcmFtZWJ1ZmZlci1iYXNlOiBhIHBhaXIgb2YgdHdvIHZhbHVlcywg
YWRkcmVzcyBhbmQgc2l6ZSwKPiA+IAkJCQlkZWZpbmluZyB0aGUgZnJhbWVidWZmZXIgZm9yIHRo
ZSB1cHBlcgo+ID4gCQkJCShvciB0aGUgb25seSBvbmUpIHBhbmVsCj4gPiAtIGFybSxwbDExeCxs
b3dlci1mcmFtZWJ1ZmZlci1iYXNlOiBhcyBhYm92ZSwgZm9yIHRoZSBsb3dlciBTVE4gcGFuZWws
Cj4gPiAJCQkJCXdoZW4gcHJlc2VudAo+ID4gCj4gPiBCZWluZyB2ZXJ5IGhhcmR3YXJlLXNwZWNp
ZmljLCBpdCBjb3ZlcnMgYWxsIHBvc3NpYmxlIHF1aXJreSBzY2VuYXJpb3MsCj4gPiBhdCB0aGUg
c2FtZSB0aW1lIGRvZXMgbm90IGV4Y2x1ZGUgdGhlIG9wdGlvbiBvZiB1c2luZyB0aGUgQ01BIHJl
Z2lvbgo+ID4gcGhhbmRsZXMsIGlmIGEgcGFydGljdWxhciBzeXN0ZW0gbmVlZGVkIGl0Lgo+IAo+
IFdoYXQgZG8gInVwcGVyIiBhbmQgImxvd2VyIiBtZWFuIGluIHRoaXMgY29udGV4dD8gSSBhc3N1
bWUgdGhpcyBzb21laG93Cj4gcmVmZXJzIHRvIHBsYWNlbWVudCBvZiB0aGUgZGlzcGxheXMgb24g
dGhlIGJvYXJkLiBJZiBzbywgaXQgc291bmRzIGxpa2UKPiB0aGVyZSBzaG91bGQgYmUgc29tZSBi
ZXR0ZXIgdGVybWlub2xvZ3k7IHNvbWV0aGluZyB0aGF0J3Mgc3BlY2lmaWMgdG8KPiB0aGUgQ0xD
RCBjb250cm9sbGVyIGl0c2VsZiwKCkl0IGlzIHZlcnkgQ0xDRCBzcGVjaWZpYyBpbmRlZWQgYW5k
IG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgYm9hcmQgOi0pCgpodHRwOi8vYXJtaW5mby5lbWVhLmFy
bS5jb20vaGVscC90b3BpYy9jb20uYXJtLmRvYy5kZGkwMjkzYy9JODk5MTM0Lmh0bWwKCiJVcHBl
ciBhbmQgTG93ZXIgUGFuZWwgRnJhbWUgQmFzZSBBZGRyZXNzIFJlZ2lzdGVycyIuCgo+ICByYXRo
ZXIgdGhhbiB0aGUgZW52aXJvbm1lbnQgaXQncyB1c2VkIGluLgo+IEFhbHRob3VnaCBpdCBkb2Vz
IHNvdW5kIGxpa2UgdGhpcyBpcyBpbiBhbiBGUEdBIGFuZCBoZW5jZSB0aGUgY29udHJvbGxlcgo+
IGlzIGJvYXJkLXNwZWNpZmljLCBidXQgSSBkb24ndCBzZWUgd2h5IGl0IGNvdWxkbid0IGJlIHJl
LXVzZWQgaW4gc29tZQo+IG90aGVyIEZQR0EtYmFzZWQgYm9hcmQgd2l0aCBkaWZmZXJlbnQgcGFu
ZWwgbGF5b3V0LiBXb3VsZCAiQSIgYW5kICJCIiBvcgo+ICJtYWluIiBhbmQgInByaW1hcnkiIG9y
ICJmaXJzdCIgYW5kICJzZWNvbmQiIHdvcmsgYmV0dGVyPwoKRnVubmlseSBlbm91Z2ggSSB0eXBl
ZCAic2Vjb25kYXJ5LWZyYW1lYnVmZmVyLWJhc2UiIGZpcnN0LCBidXQgdGhhbgp0aG91Z2h0ICJu
bywgbGV0J3MgbWF0Y2ggdGhlIHNwZWMiIDotKQoKUGF3ZcWCCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBs
aXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
