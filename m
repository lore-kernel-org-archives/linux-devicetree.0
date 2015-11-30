From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 03/10] drm/hisilicon: Add hisilicon DRM master driver
Date: Mon, 30 Nov 2015 11:25:28 -0600
Message-ID: <20151130172528.GA10974@rob-hp-laptop>
References: <CACvgo51NJNRKObgExtv=vNJ10GSgDPz=nQs=4BHAcgqPpSB_ug@mail.gmail.com>
 <20151130074603.GE17050@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20151130074603.GE17050@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linuxarm@huawei.com, ML dri-devel <dri-devel@lists.freedesktop.org>, xuwei5@hisilicon.com, Benjamin Gaignard <benjamin.gaignard@linaro.org>, zourongrong@huawei.com, xuyiping@hisilicon.com, corbet@lwn.net, w.f@huawei.com, lijianhua@huawei.com, devicetree@vger.kernel.org, bintian.wang@huawei.com, puck.chen@hisilicon.com, LAKML <linux-arm-kernel@lists.infradead.org>, andy.green@linaro.org, Emil Velikov <emil.l.velikov@gmail.com>, liguozhu@hisilicon.com, haojian.zhuang@linaro.org
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBOb3YgMzAsIDIwMTUgYXQgMDg6NDY6MDNBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBTYXQsIE5vdiAyOCwgMjAxNSBhdCAwMzoyNTozNVBNICswMDAwLCBFbWlsIFZl
bGlrb3Ygd3JvdGU6Cj4gPiBIaSBYaW5saWFuZywKPiA+IAo+ID4gT24gMjggTm92ZW1iZXIgMjAx
NSBhdCAxMDozOCwgWGlubGlhbmcgTGl1IDx4aW5saWFuZy5saXVAbGluYXJvLm9yZz4gd3JvdGU6
Cj4gPiA+IEFkZCBEUk0gbWFzdGVyIGRyaXZlciBmb3IgaGk2MjIwIFNvQyB3aGljaCB1c2VkIGlu
IEhpS2V5IGJvYXJkLgo+ID4gPiBBZGQgZHVtYiBidWZmZXIgZmVhdHVyZS4KPiA+ID4gQWRkIHBy
aW1lIGRtYWJ1ZiBmZWF0dXJlLgo+ID4gPgoKPiA+ID4gK3N0YXRpYyBpbnQgaGlzaV9nZW1fY21h
X2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9tb2RlX2NyZWF0ZV9kdW1i
ICphcmdzKQo+ID4gPiArewo+ID4gPiArICAgICAgIGludCBtaW5fcGl0Y2ggPSBESVZfUk9VTkRf
VVAoYXJncy0+d2lkdGggKiBhcmdzLT5icHAsIDgpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgLyog
bWFsaSBncHUgbmVlZCBwaXRjaCA4IGJ5dGVzIGFsaWdubWVudCBmb3IgMzJicHAgKi8KPiA+ID4g
KyAgICAgICBhcmdzLT5waXRjaCA9IHJvdW5kdXAobWluX3BpdGNoLCA4KTsKPiA+ID4gKwo+ID4g
SSdtIG5vdCBzdXJlIHlvdSB3YW50IHRoaXMga2luZCBvZiBkZXBlbmRlbmN5IG9mIGFuIG91dCBv
ZiB0cmVlIGRyaXZlcgo+ID4gdXBzdHJlYW0uIElmIHRoaXMgaXMgc29tZSBsaW1pdGF0aW9uIG9u
IHRoZSBkaXNwbGF5IGVuZ2luZSBzbyBiZSBpdCwKPiA+IGJ1dCB0YWlsb3JpbmcgdGhpbmdzIGZv
ciBhbiBleHRlcm5hbCBtb2R1bGUgc2VlbXMgbGlrZSBhIHZlcnkgYmFkCj4gPiBpZGVhLgo+IAo+
IFl1cCwgbmFja2VkLiBkdW1iX2NyZWF0ZSBpcyBmb3IgZHVtYiBidWZmZXJzLCBub3QgcmVuZGVy
aW5nLiBNYWxpIG5lZWRzIHRvCj4gZ28gdXBzdHJlYW0gdG8gZml4IHRoaXMgLi4uCgpJIGJlbGll
dmUgdGhpcyBpcyBjb3B5LW4tcGFzdGUgZnJvbSBSb2NrY2hpcCBkcml2ZXIuCgpJJ20gY3VyaW91
cyB3aHkgdGhlcmUgaXMgbm90IGEgY29tbW9uIGludGVyZmFjZSBmb3IgcmVuZGVyaW5nIGJ1ZmZl
cnMgYXQgCmxlYXN0IGZvciBzeXN0ZW1zIHdpdGhvdXQgZ3JhcGhpY3MgbWVtb3J5IGxpa2UgbW9z
dCBBUk0gc3lzdGVtcy4gQXJlIHRoZSAKcmVxdWlyZW1lbnRzIG9mIEdQVSBzbyBkaXZlcnNlIHRo
YXQgdGhpbmdzIGxpa2UgcGl0Y2ggYWxpZ25tZW50IGNhbid0IGJlIApwYXJhbWV0ZXJpemVkPwoK
Um9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
