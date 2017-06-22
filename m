From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3.1 1/3] drm/rockchip: dw_hdmi: add RK3399 HDMI support
Date: Thu, 22 Jun 2017 10:25:49 +0200
Message-ID: <2895576.2l0uxY0YQ7@phil>
References: <1496992236-10634-1-git-send-email-mark.yao@rock-chips.com>
 <1751555.73cFbViMXZ@phil> <594B79A4.1000509@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <594B79A4.1000509@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark yao <mark.yao@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gRG9ubmVyc3RhZywgMjIuIEp1bmkgMjAxNywgMTY6MDI6NDQgQ0VTVCBzY2hyaWViIE1hcmsg
eWFvOgo+IE9uIDIwMTflubQwNuaciDIy5pelIDE1OjMxLCBIZWlrbyBTdHVlYm5lciB3cm90ZToK
PiA+PiArCj4gPj4gPisvKioKPiA+PiA+KyAqIHN0cnVjdCByb2NrY2hpcF9oZG1pX2NoaXBfZGF0
YSAtIHNwbGl0ZSB0aGUgZ3JmIHNldHRpbmcgb2Yga2luZCBvZiBjaGlwcwo+ID4+ID4rICogQGxj
ZHNlbF9ncmZfcmVnOiBncmYgcmVnaXN0ZXIgb2Zmc2V0IG9mIGxjZGMgc2VsZWN0Cj4gPj4gPisg
KiBAbGNkc2VsX2JpZzogcmVnIHZhbHVlIG9mIHNlbGVjdGluZyB2b3AgYmlnIGZvciBIRE1JCj4g
Pj4gPisgKiBAbGNkc2VsX2xpdDogcmVnIHZhbHVlIG9mIHNlbGVjdGluZyB2b3AgbGl0dGxlIGZv
ciBIRE1JCj4gPj4gPisgKi8KPiA+PiA+K3N0cnVjdCByb2NrY2hpcF9oZG1pX2NoaXBfZGF0YSB7
Cj4gPj4gPisJdTMyCWxjZHNlbF9ncmZfcmVnOwo+ID4gSG93IGRvIHlvdSBwbGFuIG9uIGhhbmRs
aW5nIHRoZSByazMzNjggKHdpdGggb25seSBvbmUgVk9QIGFuZCB0aHVzCj4gPiBubyBzZWxlY3Rp
b24gaGFwcGVuaW5nKT8gSSdkIGp1c3QgbWFrZSB0aGUgYWJvdmUgYW4gaW50LCBzbyB3ZSBjb3Vs
ZAo+ID4gc2V0IGl0IHRvIC0xIGZvciB0aGF0IGNhc2UuICh2YWx1ZSAwIGlzIGFmdGVyIGFsbCBh
IHZhbGlkIHJlZykuCj4gCj4gSXQncyBhIHByb2JsZW0gaGFuZGxpbmcgb24gcmszMzY4LCB1c2lu
ZyAtMSB0byBqdWRnZSBtZWFucyB0aGF0IHdlIG5lZWQKPiBpbml0aWFsIHRoZSBsY2RzZWxfZ3Jm
X3JlZyB0byAtMSBvbiByazMzNjggcGxhdGZvcm0sIHdlIG5lZWQgYWx3YXlzIGFkZCBhIHBsYXRm
b3JtCj4gZGF0YSB0byBoYW5kbGUgaXQsIHNlZW1zIG5vdCBnb29kIGVub3VnaC4KPiAKPiBTaW5j
ZSB0aGUgaGRtaSBjaGlwIGRhdGEgb25seSB1c2UgZm9yIHZvcCBzZWxlY3Rpb24sIG1heWJlIHdl
IGNhbiBqdWRnZSB3aXRoCj4gY2hlY2tpbmcgaGRtaS0+Y2hpcF9kYXRhID09IE5VTEwgZm9yIHRo
ZSBjYXNlLgoKeWVhaCwgdGhhdCBjb3VsZCB3b3JrIGFzIHdlbGwgLi4uIGFzIGxvbmcgYXMgdGhl
IGdyZi12b3Atc2VsZWN0IGlzIHRoZSBvbmx5IGNoaXAtZGF0YQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
