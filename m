From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 3/5] drm: rcar-du: lvds: Add r8a7744 support
Date: Tue, 22 Jan 2019 17:45:07 +0200
Message-ID: <20190122154507.GF11461@pendragon.ideasonboard.com>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-4-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1548170749-12773-4-git-send-email-biju.das@bp.renesas.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

SGkgQmlqdSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVHVlLCBKYW4gMjIsIDIwMTkg
YXQgMDM6MjU6NDdQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6Cj4gVGhlIExWRFMgZW5jb2RlcnMg
b24gUlovRzFOIFNvQyBpcyBzaW1pbGFyIHRvIFJaL0cxTS4gQWRkIHN1cHBvcnQgZm9yCj4gUlov
RzFOIChSOEE3NzQ0KSBTb0MgdG8gdGhlIExWRFMgZW5jb2RlciBkcml2ZXIuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPgoKUmV2aWV3ZWQtYnk6
IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCmFu
ZCB0YWtlbiBpbiBteSB0cmVlLgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9sdmRzLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIGIvZHJpdmVycy9n
cHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiBpbmRleCA5NmQ3NDlhLi5jYWVhMmM1IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiBAQCAtNzg1LDYgKzc4NSw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcmNhcl9sdmRzX2RldmljZV9pbmZvIHJjYXJfbHZkc19yOGE3Nzk5
NV9pbmZvID0gewo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcmNhcl9s
dmRzX29mX3RhYmxlW10gPSB7Cj4gIAl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc0My1s
dmRzIiwgLmRhdGEgPSAmcmNhcl9sdmRzX2dlbjJfaW5mbyB9LAo+ICsJeyAuY29tcGF0aWJsZSA9
ICJyZW5lc2FzLHI4YTc3NDQtbHZkcyIsIC5kYXRhID0gJnJjYXJfbHZkc19nZW4yX2luZm8gfSwK
PiAgCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3NzRjMC1sdmRzIiwgLmRhdGEgPSAmcmNh
cl9sdmRzX3I4YTc3OTkwX2luZm8gfSwKPiAgCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3
NzkwLWx2ZHMiLCAuZGF0YSA9ICZyY2FyX2x2ZHNfcjhhNzc5MF9pbmZvIH0sCj4gIAl7IC5jb21w
YXRpYmxlID0gInJlbmVzYXMscjhhNzc5MS1sdmRzIiwgLmRhdGEgPSAmcmNhcl9sdmRzX2dlbjJf
aW5mbyB9LAo+IC0tIAo+IDIuNy40Cj4gCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
