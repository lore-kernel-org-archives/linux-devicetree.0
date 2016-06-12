From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v2 6/6] drm/panel: simple: Add support for Sharp
 LQ123P1JX31 2400x1600 panel
Date: Sun, 12 Jun 2016 10:12:20 +0800
Message-ID: <575CC504.9040301@rock-chips.com>
References: <1465386727-27647-1-git-send-email-ykk@rock-chips.com>
 <1465386768-27947-1-git-send-email-ykk@rock-chips.com>
 <CAD=FV=V2RF+Wr_6PfoV1EVr1djauZASC=vEsYCaXvRtjd523KQ@mail.gmail.com>
 <CAD=FV=Vmh-weKJLdDY=zfLRL9bMzDGvSV5gN=jaRV3d-b+jxiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAD=FV=Vmh-weKJLdDY=zfLRL9bMzDGvSV5gN=jaRV3d-b+jxiw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

RG91ZywKCk9uIDA2LzExLzIwMTYgMTI6MTEgQU0sIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGks
Cj4KPiBPbiBXZWQsIEp1biA4LCAyMDE2IGF0IDk6MzUgQU0sIERvdWcgQW5kZXJzb24gPGRpYW5k
ZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4+IFlha2lyLAo+Pgo+PiBPbiBXZWQsIEp1biA4LCAy
MDE2IGF0IDQ6NTIgQU0sIFlha2lyIFlhbmcgPHlra0Byb2NrLWNoaXBzLmNvbT4gd3JvdGU6Cj4+
PiBUaGUgU2hhcnAgTFExMjNQMUpYMzEgaXMgYW4gMTIuMyIsIDI0MDB4MTYwMCBURlQtTENEIHBh
bmVsIGNvbm5lY3RlZAo+Pj4gdXNpbmcgZURQIGludGVyZmFjZXMuCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogWWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29tPgo+Pj4gLS0tCj4+PiBDaGFuZ2Vz
IGluIHYyOgo+Pj4gLSBBZGQgZGV0YWlsIHRpbWluZyBvZiBTaGFycCBMUTEyM1AxSlgzMSBwYW5l
bCBpbiB2Mgo+Pj4KPj4+ICAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwg
MjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI2IGlu
c2VydGlvbnMoKykKPj4gTG9va3MgZ29vZCB0byBtZS4gIFZhbHVlcyBpbiB0aGUgdGFibGUgbWF0
Y2ggdGhlIEVESUQgSSBzZWUgZnJvbSB0aGlzCj4+IHBhbmVsIGFuZCBldmVyeXRoaW5nIGVsc2Ug
bG9va3MgdG8gYmUgaW4gb3JkZXIuCj4+Cj4+IFJldmlld2VkLWJ5OiBEb3VnIEFuZGVyc29uIDxk
aWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4+IFRlc3RlZC1ieTogRG91ZyBBbmRlcnNvbiA8ZGlhbmRl
cnNAY2hyb21pdW0ub3JnPgo+IFNvcnJ5IGZvciBub3Qgbm90aWNpbmcuICA6KCAgLi4uYnV0IGFz
IG90aGVycyBoYXZlIHBvaW50ZWQgb3V0IGZvcgo+IHlvdXIgZWFybGllciBwYXRjaGVzLCB0aGUg
c2l6ZSBpcyBpbmNvcnJlY3QuICBJIGZvdW5kIHRoZSBjb3JyZWN0IHNpemUKPiBhbmQgaXQgc2hv
dWxkIGJlOgo+Cj4gICAgICAgICAgICAgICAgIC53aWR0aCA9IDI1OSwKPiAgICAgICAgICAgICAg
ICAgLmhlaWdodCA9IDE3MywKPgoKQWgsIHRoYW5rcywgd291bGQgY29ycmVjdCBpdCBub3cgOi1E
CgotIFlha2lyCgo+IC1Eb3VnCj4KPgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
