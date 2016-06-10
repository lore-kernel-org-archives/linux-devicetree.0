From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 6/6] drm/panel: simple: Add support for Sharp
 LQ123P1JX31 2400x1600 panel
Date: Fri, 10 Jun 2016 09:11:30 -0700
Message-ID: <CAD=FV=Vmh-weKJLdDY=zfLRL9bMzDGvSV5gN=jaRV3d-b+jxiw@mail.gmail.com>
References: <1465386727-27647-1-git-send-email-ykk@rock-chips.com>
 <1465386768-27947-1-git-send-email-ykk@rock-chips.com>
 <CAD=FV=V2RF+Wr_6PfoV1EVr1djauZASC=vEsYCaXvRtjd523KQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAD=FV=V2RF+Wr_6PfoV1EVr1djauZASC=vEsYCaXvRtjd523KQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Yakir Yang <ykk@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiBXZWQsIEp1biA4LCAyMDE2IGF0IDk6MzUgQU0sIERvdWcgQW5kZXJzb24gPGRpYW5k
ZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gWWFraXIsCj4KPiBPbiBXZWQsIEp1biA4LCAyMDE2
IGF0IDQ6NTIgQU0sIFlha2lyIFlhbmcgPHlra0Byb2NrLWNoaXBzLmNvbT4gd3JvdGU6Cj4+IFRo
ZSBTaGFycCBMUTEyM1AxSlgzMSBpcyBhbiAxMi4zIiwgMjQwMHgxNjAwIFRGVC1MQ0QgcGFuZWwg
Y29ubmVjdGVkCj4+IHVzaW5nIGVEUCBpbnRlcmZhY2VzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZ
YWtpciBZYW5nIDx5a2tAcm9jay1jaGlwcy5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIHYyOgo+
PiAtIEFkZCBkZXRhaWwgdGltaW5nIG9mIFNoYXJwIExRMTIzUDFKWDMxIHBhbmVsIGluIHYyCj4+
Cj4+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCAyNiArKysrKysrKysr
KysrKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPgo+
IExvb2tzIGdvb2QgdG8gbWUuICBWYWx1ZXMgaW4gdGhlIHRhYmxlIG1hdGNoIHRoZSBFRElEIEkg
c2VlIGZyb20gdGhpcwo+IHBhbmVsIGFuZCBldmVyeXRoaW5nIGVsc2UgbG9va3MgdG8gYmUgaW4g
b3JkZXIuCj4KPiBSZXZpZXdlZC1ieTogRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0u
b3JnPgo+IFRlc3RlZC1ieTogRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoK
U29ycnkgZm9yIG5vdCBub3RpY2luZy4gIDooICAuLi5idXQgYXMgb3RoZXJzIGhhdmUgcG9pbnRl
ZCBvdXQgZm9yCnlvdXIgZWFybGllciBwYXRjaGVzLCB0aGUgc2l6ZSBpcyBpbmNvcnJlY3QuICBJ
IGZvdW5kIHRoZSBjb3JyZWN0IHNpemUKYW5kIGl0IHNob3VsZCBiZToKCiAgICAgICAgICAgICAg
IC53aWR0aCA9IDI1OSwKICAgICAgICAgICAgICAgLmhlaWdodCA9IDE3MywKCgotRG91ZwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
