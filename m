From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 1/2] drm/bridge: Add Cadence DSI driver
Date: Tue, 30 Jan 2018 09:51:49 +0200
Message-ID: <19cc13ff-d2eb-bc46-6ceb-c020ea3ddad3@ti.com>
References: <20180118134309.13123-1-boris.brezillon@free-electrons.com>
 <47b5af31-4870-9109-291c-894455a1a15c@ti.com>
 <20180129173854.1f1ee8ce@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180129173854.1f1ee8ce@bbrezillon>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "Menon,
 Nishanth" <nm@ti.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, Simon Hatliff <hatliff@cadence.com>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, Alan Douglas <adouglas@cadence.com>, Rob Herring <robh+dt@kernel.org>, Jyri Sarha <jsarha@ti.com>, Suresh Punnoose <sureshp@cadence.com>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Richard Sproul <sproul@cadence.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gMjkvMDEvMTggMTg6MzgsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKCj4gTm90ZSB0aGF0IHRo
ZSBUWCBieXRlIGNsayBzaG91bGQgYmUgY29uZmlndXJlZCB0byBtYXRjaCB0aGUgRFBJIHBpeGVs
Cj4gY2xvY2ssIHdoaWNoIG1lYW5zIHdlIHNob3VsZCByZWZ1c2UgYW55IGNvbmZpZyB3aGVyZSB0
aGUgdmFyaWF0aW9uIGlzCj4gdG9vIGJpZyB0byBiZSByZWNvdmVyZWQuIEFueXdheSwgd2Ugc3Rp
bGwgZG9uJ3QgaGF2ZSBhIHdheSB0byBjb25maWd1cmUKPiB0aGUgUExMIHJhdGUgKHdoaWNoIGlz
IGRyaXZpbmcgdGhlIFRYIGJ5dGUgY2xrKSwgc28gdGhlcmUncyBub3QgbXVjaCBJCj4gY2FuIGRv
IGFib3V0IHRoYXQgcmlnaHQgbm93LgoKV2UgY291bGQgaGF2ZSB0aGUgY29kZSB0byBjaGVjayB0
aGUgYWxsb3dlZCBkaWZmZXJlbmNlIGluIHBsYWNlLgoKPj4gQW5vdGhlciB0aGluZyBpcyB0aGF0
IHRoZSBtb2RlLT5jcnRjX2Nsb2NrIGlzIGluIGtIeiwgSSB3b25kZXIgaWYgdGhhdAo+PiByb3Vu
ZGluZyBjYW4gY2F1c2UgbWlzY2FsY3VsYXRpb25zIGluIHRoZSBhYm92ZSBjb2RlLgo+IAo+IERv
IHdlIHJlYWxseSBoYXZlIG1vZGVzIGV4cG9zaW5nIHBpeGVsIGNsa3Mgbm90IGFsaWduZWQgb24g
YSBLaHo/IEkKCldlbGwsIEkgdGhpbmsgdGhlIGNsb2NrcyBpbiB0aGUgbG9naWNhbCB2aWRlbyBt
b2RlcyBhcmUgYWxpZ25lZCwgYnV0IHRoZQphY3R1YWwgY2xvY2sgZnJvbSB0aGUgZGlzcGxheSBj
b250cm9sbGVyIG9yIHRoZSBQSFkgbW9zdCBsaWtlbHkgaXMgbm90CmFsaWduZWQuCgo+IGtub3cg
dGhlIGRpc3BsYXkgY29udHJvbGxlciBjYW4gYWRqdXN0IHRoZSB0aW1pbmdzLCBidXQgdGhlbiwg
dGhlCj4gdmFyaWF0aW9uIGNhdXNlZCBieSB0aGUgS2h6IGFwcHJveCBzaG91bGQgbm90IGJlIHRo
YXQgYmlnICg5OTlLaHogLwo+IDEwK01IeiA8IDEvMTAwMDApLCBhbmQgYW55d2F5LCB0aGF0J3Mg
d2hhdCB0aGUgRFJNIGZyYW1ld29yawo+IG1hbmlwdWxhdGVzLi4uCgpEZXBlbmRzIG9uIGhvdyBz
dHJpY3QgdGhlIEhXIGlzIGFib3V0IHRoZSBhbGxvd2VkIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUK
Y3J0YyBhbmQgdGhlIERTSSBJUC4gSXQgbWF5YmUgdGhhdCB0aGF0IDEgSHogaXMgb25lIHRvbyBt
YW55Li4uIEJ1dCB0aGF0CmNhbiBiZSBhdm9pZGVkIGJ5IGp1c3QgbWFraW5nIHN1cmUgdGhhdCB0
aGUgY2hlY2sgcm91bmRzIHRoZSB2YWx1ZXMKcHJvcGVybHksIG9yIG1heWJlIGp1c3QgcmVkdWNl
cyB0aGUgYWxsb3dlZCByYW5nZSBieSAxa0h6IG9uIGJvdGggZW5kcy4KClNvIEkgZG9uJ3QgdGhp
bmsgaXQncyBhbiBpc3N1ZSwgYnV0IGl0IGlzIHNvbWV0aGluZyB0byBrZWVwIGluIG1pbmQuCgog
VG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIs
IDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFp
a2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
