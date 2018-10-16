From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] drm/bridge: Add virtual display DT bindings
Date: Tue, 16 Oct 2018 11:40:06 +0200
Message-ID: <CACRpkdYFh07=mghuss3reQ4+mbAOn6sU_R7ejbOHaJ9OtQ31+w@mail.gmail.com>
References: <CGME20180824122324epcas3p2922f3e5415dacf4c89cfb136fa5c77b2@epcas3p2.samsung.com>
 <20180824122308.3092-1-linus.walleij@linaro.org>
 <20180827115302eucas1p24d36cfaf9835ccb217ac81e508484aa1~Ou5eTkYW-3006130061eucas1p2Z@eucas1p2.samsung.com>
 <CACRpkdaGNhxY-xAAEL1Bu4EMr8x7qTGoM9s-At2v7Ev8PwOTDw@mail.gmail.com>
 <20180829095822eucas1p1fe4336ca7944765c01fc6ad1e941b8b0~PUn7YujBw3056130561eucas1p1_@eucas1p1.samsung.com>
 <20180829100152.GL907@e110455-lin.cambridge.arm.com>
 <20180829102320eucas1p28f05f1c765eb85195a06199bb68b87ce~PU9ukgvXA1734817348eucas1p2L@eucas1p2.samsung.com>
 <20180829110045.GN907@e110455-lin.cambridge.arm.com>
 <20180829121627eucas1p2f41ba35016ce90185f3cc08af1a67e23~PWge4MaXN2588725887eucas1p2h@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180829121627eucas1p2f41ba35016ce90185f3cc08af1a67e23~PWge4MaXN2588725887eucas1p2h@eucas1p2.samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Sudeep Holla <sudeep.holla@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBBdWcgMjksIDIwMTggYXQgMjoxNiBQTSBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPiB3cm90ZToKCj4gTXkgcXVlc3Rpb24gc3RpbGwgc3RhbmRzOiB3aGF0IGlzIHdy
b25nL21pc3Npbmcgd2l0aCBkcGkgcGFuZWw/CgpIb3BlZnVsbHkgZGVzY3JpYmVkIHdpdGggbXkg
b3RoZXIgYW5zd2VyIDopCgo+IEkgZGlkIG5vdCBhbmFseXplIGRldGFpbHMsIGJ1dCBwbDExMSBv
dXRwdXQgc2VlbXMgdG8gYmUgRFBJIGNvbXBhdGlibGUuCgpUaGlzIHBhdGNoIHNldCBpcyBub3Qg
dHJ5aW5nIHRvIHN1cHBvcnQgdGhlIGVsZWN0cm9uaWMgZGV2aWNlClBMMTExIGF0IGFsbC4gSSBh
bSB0cnlpbmcgdG8gc3VwcG9ydCBhbiBlbXVsYXRvciB3aGljaCBoYXMgYQpoYWxmLWRvbmUgZW11
bGF0aW9uIG9mIHRoZSBQTDExMSByZWdpc3RlcnMuCgpUaGUgb3RoZXIgcGFuZWxzIGFjdHVhbGx5
IGF0dGFjaGVkIHRvIHJlYWwgd29ybGQgaW5zdGFuY2VzCm9mIFBMMTExIG1hZGUgaW4gc2lsaWNv
biwgYWxsIGhhdmUgcHJvcGVyIGRyaXZlcnMgaW4KZHJpdmVycy9ncHUvZHJtL3BhbmVsIGFscmVh
ZHkuCgpBbGwgcmVhbCBlbGVjdHJvbmljcyBhcmUgYWxyZWFkeSBjb3ZlcmVkLiBUaGV5IHVzZToK
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWFybS12ZXJzYXRpbGUuYwpkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2R1bWItdmdhLWRhYy5jCgpBbGwgUUVNVSBlbXVsYXRvcnMgYXJlIGFscmVhZHkg
Y292ZXJlZCAoYnkgbWFraW5nClFFTVUgZW11bGF0aW9uIGJlaGF2ZSBsaWtlIHJlYWwgaGFyZHdh
cmUpLiBJdCBub3cKdXNlcyBEREMgYnkgd2F5IG9mIGR1bWItdmdhLWRhYy5jLgoKVGhpcyB2aXJ0
dWFsIGRpc3BsYXkgaW4gdGhpcyBlbXVsYXRvciBpcyB0aGUgbWlzc2luZyBmaW5hbCBwaWVjZSB0
bwpjb252ZXJ0IHRoZSBQTDExMSBmYmRldiBkcml2ZXIgb3ZlciB0byB1c2UgRFJNLgoKWW91cnMs
CkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
