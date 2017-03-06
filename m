From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] dt-bindings: drm: rcar-du: Document optional reset
 properties
Date: Mon, 6 Mar 2017 17:36:41 +0100
Message-ID: <CAMuHMdVw7nR1EG_+3Vjm6HdUKtq+jvbO6AbQk5WT2dEs7JDqmg@mail.gmail.com>
References: <1488817556-21410-1-git-send-email-geert+renesas@glider.be>
 <1503576.T3vfvR3RGC@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1503576.T3vfvR3RGC@avalon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgTGF1cmVudCwKCk9uIE1vbiwgTWFyIDYsIDIwMTcgYXQgNTozMiBQTSwgTGF1cmVudCBQaW5j
aGFydAo8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToKPiBPbiBNb25k
YXkgMDYgTWFyIDIwMTcgMTc6MjU6NTYgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+PiBEb2N1
bWVudCB0aGUgb3B0aW9uYWwgcHJvcGVydGllcyBmb3IgZGVzY3JpYmluZyBtb2R1bGUgcmVzZXRz
LCB0bwo+PiBzdXBwb3J0IHJlc2V0dGluZyBkaXNwbGF5IGNoYW5uZWxzIGFuZCBMVkRTIGVuY29k
ZXJzIG9uIFItQ2FyIEdlbjIgYW5kCj4+IEdlbjMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4KPiBUaGlzIGxvb2tzIGdv
b2QgdG8gbWUuCj4KPiBBY2tlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPgoKVGhhbmtzIQoKPiBJIHRoaW5rIHdlIHNob3VsZCB0cnkgaW1w
bGVtZW50aW5nIHN1cHBvcnQgZm9yIHJlc2V0IGluIHRoZSBEVSBkcml2ZXIgYmVmb3JlCj4gbWVy
Z2luZyB0aGlzIHRob3VnaCwgaXQgYWx3YXlzIGhlbHBzIHRvIHRlc3QgdGhlIHByb3Bvc2VkIERU
IGJpbmRpbmdzLgoKRG8geW91IHdhbnQgbWUgdG8gZHJvcCB0aGUgRFUgcGFydHMgZnJvbSBteSBi
aWcgcGF0Y2hlcyB0byBhZGQgYWxsIHJlc2V0cwp0byB0aGUgLmR0c2lzIEkgd2FzIGdvaW5nIHRv
IHNlbmQ/CgpEVSBpcyB0aGUgc3BlY2lhbCBvbmUsIGFzIGl0IGRvZXNuJ3QgaGF2ZSBhIG9uZS10
by1vbmUgbWFwcGluZyBvZiByZXNldHMKdG8gbW9kdWxlcy4KCkdye29ldGplLGVldGluZ31zLAoK
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcK
CkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwg
bXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
