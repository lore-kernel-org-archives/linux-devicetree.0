From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: juno: add GPU subsystem
Date: Tue, 1 Oct 2019 13:45:30 +0100
Message-ID: <2a3b2fe1-b08a-bc21-6f3b-4a595b51463c@arm.com>
References: <88dc6386929b3dcd7a65ba8063628c62b66b330c.1569856049.git.robin.murphy@arm.com>
 <CAL_JsqKUP6qG6PVL47RQ5A5OcBhpdOA_0VL1YeYDuyVSVcRqCQ@mail.gmail.com>
 <20191001085954.GA10443@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191001085954.GA10443@bogus>
Content-Language: en-GB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, Steven Price <steven.price@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMDEvMTAvMjAxOSAwOTo1OSwgU3VkZWVwIEhvbGxhIHdyb3RlOgo+IE9uIE1vbiwgU2VwIDMw
LCAyMDE5IGF0IDEyOjQ2OjMzUE0gLTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+PiBPbiBNb24s
IFNlcCAzMCwgMjAxOSBhdCAxMDoyNSBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0u
Y29tPiB3cm90ZToKPj4+Cj4+PiBTaW5jZSB3ZSBub3cgaGF2ZSBiaW5kaW5ncyBmb3IgTWFsaSBN
aWRnYXJkIEdQVXMsIGxldCdzIHVzZSB0aGVtIHRvCj4+PiBkZXNjcmliZSBKdW5vJ3MgR1BVIHN1
YnN5c3RlbSwgaWYgb25seSBiZWNhdXNlIHdlIGNhbi4gSnVubyBzcG9ydHMgYQo+Pj4gTWFsaS1U
NjI0IGludGVncmF0ZWQgYmVoaW5kIGFuIE1NVS00MDAgKGFzIGEgZ2VzdHVyZSB0b3dhcmRzCj4+
PiB2aXJ0dWFsaXNhdGlvbiksIGluIHRoZWlyIG93biBkZWRpY2F0ZWQgcG93ZXIgZG9tYWluIHdp
dGggRFZGUwo+Pj4gY29udHJvbGxlZCBieSB0aGUgU0NQLgo+Pj4KPj4+IENDOiBMaXZpdSBEdWRh
dSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KPj4+IENDOiBTdWRlZXAgSG9sbGEgPHN1ZGVlcC5ob2xs
YUBhcm0uY29tPgo+Pj4gQ0M6IExvcmVuem8gUGllcmFsaXNpIDxsb3JlbnpvLnBpZXJhbGlzaUBh
cm0uY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJt
LmNvbT4KPj4+IC0tLQo+Pj4gICAuLi4vYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQueWFt
bCAgICAgICAgfCAgNSArKystCj4+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYXJtL2p1bm8tYmFz
ZS5kdHNpICAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysKPj4+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAzMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IFJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IAo+IElmIHlvdSBwbGFuIHRvIHRha2UgaXQg
YWxvbmcgd2l0aCBkcml2ZXIgY2hhbmdlLAo+IAo+IEFja2VkLWJ5OiBTdWRlZXAgSG9sbGEgPHN1
ZGVlcC5ob2xsYUBhcm0uY29tPgo+IAo+IElmIG5vdCwgcGxlYXNlIGxldCB1cyBrbm93LiBJIGNh
biB0YWtlIGl0IGZvciB2NS41CgpUaGUgZHJpdmVyIGNoYW5nZSBpcyBkZWJhdGFibGUgYW5kIG5v
dCBzdHJpY3RseSBuZWNlc3NhcnksIHNvIGl0IApwcm9iYWJseSBtYWtlcyBtb3JlIHNlbnNlIHRv
IHRha2UgdGhpcyBvbmUgdGhyb3VnaCB0aGUgVkV4cHJlc3MgdHJlZSBvbiAKaXRzIG93bi4gSSB3
b3VsZG4ndCBzdWdnZXN0IGZsaXBwaW5nIHRoZSBzdGF0dXMgdG8gImVuYWJsZWQiIGp1c3QgeWV0
LCAKYnV0IGl0IHNlZW1zIHdvcnRoIHB1dHRpbmcgdGhlIGJhc2ljIGRlc2NyaXB0aW9uIGluIHBs
YWNlIGFzIGEgCmp1bXBpbmctb2ZmIHBvaW50IGZvciBmb2xrcyB0byBoYWNrIG9uIChlLmcuIGl0
J3MgYW5vdGhlciAnaW50ZXJlc3RpbmcnIApjYXNlIGZvciBkZXZmcmVxIE9QUCBzdHVmZikuCgpU
aGFua3MsClJvYmluLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
