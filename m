From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH 2/2 v16] drm/bridge: Add I2C based driver for ps8640 bridge
Date: Wed, 29 Jun 2016 12:31:23 +0800
Message-ID: <CAGS+omDsDS5tx=+Efq8LWNd3-asU4r2h=-AE6vdKgfG-p6vdAA@mail.gmail.com>
References: <1464861445-11086-1-git-send-email-jitao.shi@mediatek.com>
 <1464861445-11086-2-git-send-email-jitao.shi@mediatek.com>
 <CACvgo53002XCPLufbJHQLC1uL1nNS7_0gh=napedetmvT6FoSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACvgo53002XCPLufbJHQLC1uL1nNS7_0gh=napedetmvT6FoSw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, stonea168@163.com, ML dri-devel <dri-devel@lists.freedesktop.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, cawa cheng <cawa.cheng@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Thierry Reding <treding@nvidia.com>, devicetree <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, LAKML <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>, srv_heupstream <srv_heupstream@mediatek.com>, Linux-Kernel@Vger
List-Id: devicetree@vger.kernel.org

SGkgRW1pbCwKCk9uZSBhbnN3ZXIgaW5saW5lIGJlbG93LiAgVGhlIHJlc3QgSSBsZWF2ZSB0byBK
aXRhby4uLgoKW3NuaXAuLi5dCgpPbiBGcmksIEp1biAxNywgMjAxNiBhdCAzOjE0IEFNLCBFbWls
IFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4gd3JvdGU6Cgo+PiArc3RhdGljIHNz
aXplX3QgcHM4NjQwX3VwZGF0ZV9md19zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUg
KmF0dHIsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hh
ciAqYnVmLCBzaXplX3QgY291bnQpCj4+ICt7Cj4+ICsgICAgICAgc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudCA9IHRvX2kyY19jbGllbnQoZGV2KTsKPj4gKyAgICAgICBzdHJ1Y3QgcHM4NjQwICpw
c19icmlkZ2UgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50KTsKPj4gKyAgICAgICBjb25zdCBz
dHJ1Y3QgZmlybXdhcmUgKmZ3Owo+PiArICAgICAgIGludCBlcnJvcjsKPj4gKwo+PiArICAgICAg
IGVycm9yID0gcmVxdWVzdF9maXJtd2FyZSgmZncsIFBTX0ZXX05BTUUsIGRldik7Cj4gQ2FuIHRo
ZSBkZXZpY2Ugb3BlcmF0ZSB3aXRob3V0IGEgZmlybXdhcmUgPyBJZiBub3QsIHdoeSBpcyB0aGUK
PiBmaXJtd2FyZSBsb2FkZWQgc28gbGF0ZXIvYWZ0ZXIgdXNlciBpbnRlcmFjdGlvbiAodmlhIHN5
c2ZzKSA/IEkgZG9uJ3QKPiByZWNhbGwgYW55IG90aGVyIGRyaXZlciBpbiBEUk0gdG8gdXNlIHN1
Y2ggYW4gYXBwcm9hY2guCgpUaGUgUFM4NjQwIGhhcyBpbnRlcm5hbCBmbGFzaCwgc28gaXQgc2hv
dWxkIGFsd2F5cyBhbHJlYWR5IGhhdmUgYQp3b3JraW5nIGZpcm13YXJlLgpUaGlzIHN5c2ZzIGlu
dGVyZmFjZSBpcyB1c2VmdWwgZm9yIHVzZXIgc3BhY2UgaW5pdGlhdGVkIGZpZWxkIGZpcm13YXJl
IHVwZGF0ZXMuCgpSZWdhcmRzLAotRGFuaWVsCgo+IFJlZ2FyZHMsCj4gRW1pbAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
