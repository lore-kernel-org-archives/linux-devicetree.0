From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with
 idk-1110wr display
Date: Thu, 29 Aug 2019 12:50:49 +0200
Message-ID: <CAMuHMdW7asYJGC2+c-4=a6006K2WMjEAAigBLA+MTaFip03R+Q@mail.gmail.com>
References: <1567074107-4899-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567074107-4899-3-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1567074107-4899-3-git-send-email-fabrizio.castro@bp.renesas.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, DRI Development <dri-devel@lists.freedesktop.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Biju Das <biju.das@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, ebiharaml@si-linux.co.jp, Thierry Reding <thierry.reding@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>, xu_shunji@hoperun.com
List-Id: devicetree@vger.kernel.org

SGkgRmFicml6aW8sCgpPbiBUaHUsIEF1ZyAyOSwgMjAxOSBhdCAxMjoyMiBQTSBGYWJyaXppbyBD
YXN0cm8KPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6Cj4gVGhlIEhpSG9w
ZSBSWi9HMk0gaXMgYWR2ZXJ0aXNlZCBhcyBjb21wYXRpYmxlIHdpdGggcGFuZWwgaWRrLTExMTB3
cgo+IGZyb20gQWR2YW50ZWNoLCBob3dldmVyIHRoZSBwYW5lbCBpc24ndCBzb2xkIGFsb25nc2lk
ZSB0aGUgYm9hcmQuCj4gQSBuZXcgZHRzLCBhZGRpbmcgZXZlcnl0aGluZyB0aGF0J3MgcmVxdWly
ZWQgdG8gZ2V0IHRoZSBwYW5lbCB0bwo+IHdvcmsgdGhlIEhpSG9wZSBSWi9HMk0sIGlzIHRoZSBt
b3N0IGNvbnZlbmllbnQgd2F5IHRvIHN1cHBvcnQgdGhlCj4gSGlIb3BlIFJaL0cyTSB3aGVuIGl0
J3MgY29ubmVjdGVkIHRvIHRoZSBpZGstMTExMHdyLgo+Cj4gU2lnbmVkLW9mZi1ieTogRmFicml6
aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgpUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghCgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc0YTEtaGlob3BlLXJ6ZzJtLWV4LWlkay0xMTEwd3IuZHRzCgo+ICsmZ3BpbzEg
ewo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFdoZW4gR1AxXzIwIGlzIExPVyBMVkRTMCBpcyBj
b25uZWN0ZWQgdG8gdGhlIExWRFMgY29ubmVjdG9yCj4gKyAgICAgICAgKiBXaGVuIEdQMV8yMCBp
cyBISUdIIExWRFMwIGlzIGNvbm5lY3RlZCB0byB0aGUgTFQ4OTE4TAo+ICsgICAgICAgICovCj4g
KyAgICAgICBsdmRzLWNvbm5lY3Rvci1lbi1ncGlvewoKTWlzc2luZyBzcGFjZSBiZWZvcmUgY3Vy
bHkgYnJhY2UuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlv
bmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9u
cyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
