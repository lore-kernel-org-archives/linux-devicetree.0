From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2 v16] drm/bridge: Add I2C based driver for ps8640 bridge
Date: Tue, 12 Jul 2016 12:13:52 +0200
Message-ID: <CAKMK7uEkUOq1CB3tj_1Qx50fBpw9B39+c3asX6MPNexT=dv9fA@mail.gmail.com>
References: <1464861445-11086-1-git-send-email-jitao.shi@mediatek.com>
 <1464861445-11086-2-git-send-email-jitao.shi@mediatek.com>
 <CACvgo53002XCPLufbJHQLC1uL1nNS7_0gh=napedetmvT6FoSw@mail.gmail.com>
 <CAGS+omDsDS5tx=+Efq8LWNd3-asU4r2h=-AE6vdKgfG-p6vdAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGS+omDsDS5tx=+Efq8LWNd3-asU4r2h=-AE6vdKgfG-p6vdAA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, stonea168@163.com, ML dri-devel <dri-devel@lists.freedesktop.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, cawa cheng <cawa.cheng@mediatek.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, devicetree <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, LAKML <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>, srv_heupstream <srv_heupstream@mediatek.com>, Emil Velikov <emi>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBKdW4gMjksIDIwMTYgYXQgNjozMSBBTSwgRGFuaWVsIEt1cnR6IDxkamt1cnR6QGNo
cm9taXVtLm9yZz4gd3JvdGU6Cj4gT24gRnJpLCBKdW4gMTcsIDIwMTYgYXQgMzoxNCBBTSwgRW1p
bCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+IHdyb3RlOgo+Pj4gK3N0YXRpYyBz
c2l6ZV90IHBzODY0MF91cGRhdGVfZndfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LAo+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0
ZSAqYXR0ciwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
Y2hhciAqYnVmLCBzaXplX3QgY291bnQpCj4+PiArewo+Pj4gKyAgICAgICBzdHJ1Y3QgaTJjX2Ns
aWVudCAqY2xpZW50ID0gdG9faTJjX2NsaWVudChkZXYpOwo+Pj4gKyAgICAgICBzdHJ1Y3QgcHM4
NjQwICpwc19icmlkZ2UgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50KTsKPj4+ICsgICAgICAg
Y29uc3Qgc3RydWN0IGZpcm13YXJlICpmdzsKPj4+ICsgICAgICAgaW50IGVycm9yOwo+Pj4gKwo+
Pj4gKyAgICAgICBlcnJvciA9IHJlcXVlc3RfZmlybXdhcmUoJmZ3LCBQU19GV19OQU1FLCBkZXYp
Owo+PiBDYW4gdGhlIGRldmljZSBvcGVyYXRlIHdpdGhvdXQgYSBmaXJtd2FyZSA/IElmIG5vdCwg
d2h5IGlzIHRoZQo+PiBmaXJtd2FyZSBsb2FkZWQgc28gbGF0ZXIvYWZ0ZXIgdXNlciBpbnRlcmFj
dGlvbiAodmlhIHN5c2ZzKSA/IEkgZG9uJ3QKPj4gcmVjYWxsIGFueSBvdGhlciBkcml2ZXIgaW4g
RFJNIHRvIHVzZSBzdWNoIGFuIGFwcHJvYWNoLgo+Cj4gVGhlIFBTODY0MCBoYXMgaW50ZXJuYWwg
Zmxhc2gsIHNvIGl0IHNob3VsZCBhbHdheXMgYWxyZWFkeSBoYXZlIGEKPiB3b3JraW5nIGZpcm13
YXJlLgo+IFRoaXMgc3lzZnMgaW50ZXJmYWNlIGlzIHVzZWZ1bCBmb3IgdXNlciBzcGFjZSBpbml0
aWF0ZWQgZmllbGQgZmlybXdhcmUgdXBkYXRlcy4KCk1pZ2h0IGJlIGJldHRlciB0byBqdXN0IGRv
IGEgcmVxdWVzdF9maXJtd2FyZSBvbiBkcml2ZXIgbG9hZCwgYW5kCnNpbXBseSBwcm9jZWVkIGlm
IGl0J3Mgbm90IHRoZXJlLiBBZGRpbmcgYSBzeXNmcyBpbnRlcmZhY2UgKHdoaWNoIGlzCmFiaSkg
c2VlbXMgd2F5IHRvbyBtdWNoIG92ZXJraWxsIGZvciB0aGlzIGltby4gSWYgeW91IHdhbnQgdG8g
dXBncmFkZQp0aGUgZmlybXdhcmUgeW91IGNhbiB0aGVuIGp1c3QgZHJvcCBpdCBpbnRvIHRoZSBy
aWdodCBkaXJlY3RvcnksIHdpdGgKbm8gZnVydGhlciBpbnRlcmFjdGlvbiBuZWVkZWQuCi1EYW5p
ZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
