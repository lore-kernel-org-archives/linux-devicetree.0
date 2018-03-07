From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: Overlay sugar syntax (was: Re: [PATCH v6 3/4] drm: rcar-du: Fix
 legacy DT to create LVDS encoder nodes)
Date: Tue, 6 Mar 2018 18:42:04 -0800
Message-ID: <52edd21d-de54-9612-e50a-8bc9b6d2c39d@gmail.com>
References: <CAMuHMdUqvZEKu5v4E29ofjj09sv+Yxk41W4K+FnfqKQ=88AWRA@mail.gmail.com>
 <20180306035412.GU2650@umbus.fritz.box>
 <CAMuHMdU54Bb8aObwaOuq6u7HO_LVhpGv9uMjGbt8VcKruop_tA@mail.gmail.com>
 <e46f67ff-2900-8500-b1aa-503a9757997f@gmail.com>
 <28e8e3cb-263d-5352-badf-34b269ad860b@gmail.com>
 <20180307023031.GC3083@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180307023031.GC3083@umbus.fritz.box>
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
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

T24gMDMvMDYvMTggMTg6MzAsIERhdmlkIEdpYnNvbiB3cm90ZToKPiBPbiBUdWUsIE1hciAwNiwg
MjAxOCBhdCAwMTo0MDoyMFBNIC0wODAwLCBGcmFuayBSb3dhbmQgd3JvdGU6Cj4+IE9uIDAzLzA2
LzE4IDExOjUxLCBGcmFuayBSb3dhbmQgd3JvdGU6Cj4+PiBPbiAwMy8wNi8xOCAwNDozMCwgR2Vl
cnQgVXl0dGVyaG9ldmVuIHdyb3RlOgoKPCBzbmlwID4KCj4+PiBBbmQgdGhlIHBhdGNoZWQgZHRj
IHdvcmtzIGZvciBhIGR0cyBmaWxlIHRoYXQgSSB3YXMgdHJ5aW5nIHRvIGNvbnZlcnQKPj4+IHRv
IHN1Z2FyIGR0cyBzeW50YXgKPj4KPj4gPCBzbmlwID4KPj4KPj4gSSBub3RpY2VkIHRoYXQgYSBz
cGFjZSBpbiAiJnsvfSIgaXMgYW4gZXJyb3IuICBJIHdhbnRlZCB0byBjaGVjayB3aGV0aGVyCj4+
IHRoYXQgd2FzIGRlbGliZXJhdGUsIG9yIHRoYXQgdGhlIHBhdGNoIHdhc24ndCBmdWxseSBjb21w
bGV0ZSB5ZXQuCj4gCj4gVGhhdCdzIGVzc2VudGlhbGx5IGRlbGliZXJhdGUgLSBpdCdzIG5vdCBy
ZWFsbHkgcmVsYXRlZCB0byB0aGlzIHBhdGNoCj4gYXQgYWxsLiAgVGhlIHBhdGNoIGp1c3QgcmUt
dXNlcyB0aGUgZXhpc3Rpbmcgc3ludGF4IGZvciBhICJwYXRoCj4gcmVmZXJlbmNlIi4gIFRoZSB3
aG9sZSB0aGluZyBpcyB0cmVhdGVkIGFzIGEgc2luZ2xlIHRva2VuLCBoZW5jZSwgbm8KPiBzcGFj
ZXMuCj4gCj4gSXQgbWlnaHQgYmUgcG9zc2libGUgdG8gY2hhbmdlIHRoYXQsIGJ1dCBpdCBjb3Vs
ZCBpbnRyb2R1Y2Ugc29tZQo+IGNvbXBsaWNhdGlvbnMgd2hlbiB0aGUgcGF0aCByZWZlcmVuY2Ug
c3ludGF4IGlzIHVzZWQgaW4gb3RoZXIgcGxhY2VzLgo+IFNvIEknbSBkaXNpbmNsaW5lZCB0byBj
aGFuZ2UgaXQsIHVubGVzcyB0aGVyZSdzIGEgdmVyeSBzdHJvbmcgcmVhc29uCj4gdG8uCj4gCgo8
IHNuaXAgPgoKTm8sIHBsZWFzZSBkbyBub3QgY2hhbmdlLiAgSSBqdXN0IHdhbnRlZCB0byBtYWtl
IHN1cmUgSSB1bmRlcnN0b29kIHRoZQppbnRlbmRlZCBzeW50YXguCgpCVFcsIHRoYW5rcyBmb3Ig
YWxsIHRoZSB0aW1lIHlvdSd2ZSBiZWVuIHB1dHRpbmcgaW50byB0aGlzIHJlY2VudCBzdHVmZi4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
