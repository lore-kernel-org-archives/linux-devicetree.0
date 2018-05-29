From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 10/11] arm64: dts: r8a77965-salvator-x: Enable DU
 external clocks and HDMI
Date: Tue, 29 May 2018 08:48:43 +0200
Message-ID: <CAMuHMdWPFOjT9qk0Z4+-nSTumjhN_Q6Ntwh3__CgBCobquX8Rg@mail.gmail.com>
References: <20180427165722.19445-1-kieran.bingham+renesas@ideasonboard.com>
 <20180427165722.19445-11-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdW6HeWMwRDcn6PLnwzgxvYz-h=jx=1qvYEK9okwqY0itg@mail.gmail.com>
 <8736yb5jez.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <8736yb5jez.wl%kuninori.morimoto.gx@renesas.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Catalin Marinas <catalin.marinas@arm.com>, Magnus Damm <magnus.damm@gmail.com>, open list <linux-kernel@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Will Deacon <will.deacon@arm.com>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgTW9yaW1vdG8tc2FuLAoKT24gVHVlLCBNYXkgMjksIDIwMTggYXQgMzo0NCBBTSwgS3VuaW5v
cmkgTW9yaW1vdG8KPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPiB3cm90ZToKPj4g
PiArJmhkbWkwX2NvbiB7Cj4+ID4gKyAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JnJjYXJfZHdf
aGRtaTBfb3V0PjsKPj4gPiArfTsKPj4KPj4gSSB0aGluayB0aGUgaGRtaTAgYW5kIGhkbWkwX2Nv
biBwYXJ0cyBjYW4gYmUgbW92ZWQgdG8gc2FsdmF0b3ItY29tbW9uLmR0c2kuCj4+IENhbiB3ZSBk
byB0aGF0IG5vdyAod2l0aCBzdHVicz8pLCBvciBkb2VzIHRoaXMgaGF2ZSB0byB3YWl0IHVudGls
IHI4YTc3OTY1IGhhcwo+PiByZWNlaXZlZCBIRE1JIHNvdW5kIHN1cHBvcnQ/Cj4KPiBIRE1JIHNv
dW5kIGRvZXNuJ3QgdXNlIGhkbWkwX2Nvbi4KPiBZb3UgY2FuIGRvIGl0IG5vdywgdGhhbmtzCgpU
aGFua3MsIHNvIGhkbWkwX2NvbiBjYW4gYmUgbW92ZWQgbm93LgoKQnV0IEhETUkgc291bmQgZG9l
cyB1c2UgaGRtaTAvcG9ydHMvcG9ydEAyLiByaWdodD8KCkdye29ldGplLGVldGluZ31zLAoKICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhl
cmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJ
biBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15
c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0
IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
