From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v7 1/5] drm/rockchip: add transfer function for cdn-dp
Date: Tue, 05 Jun 2018 15:42:11 +0200
Message-ID: <2246202.0LhvmkcTbg@diego>
References: <1527061353-16902-1-git-send-email-hl@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1527061353-16902-1-git-send-email-hl@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lin Huang <hl@rock-chips.com>
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org, briannorris@chromium.org, dianders@chromium.org, dri-devel@lists.freedesktop.org, kishon@ti.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, zyw@rock-chips.com, daniel.vetter@intel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksCgpBbSBNaXR0d29jaCwgMjMuIE1haSAyMDE4LCAwOTo0MjoyOSBDRVNUIHNjaHJpZWIgTGlu
IEh1YW5nOgo+IEZyb206IENocmlzIFpob25nIDx6eXdAcm9jay1jaGlwcy5jb20+Cj4gCj4gV2Ug
bWF5IHN1cHBvcnQgdHJhaW5pbmcgb3V0c2lkZSBmaXJtd2FyZSwgc28gd2UgbmVlZCBzdXBwb3J0
Cj4gZHBjZCByZWFkL3dyaXRlIHRvIGdldCB0aGUgbWVzc2FnZSBvciBkbyBzb21lIHNldHRpbmcg
d2l0aAo+IGRpc3BsYXkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgWmhvbmcgPHp5d0Byb2Nr
LWNoaXBzLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMaW4gSHVhbmcgPGhsQHJvY2stY2hpcHMuY29t
Pgo+IFJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiBSZXZp
ZXdlZC1ieTogRW5yaWMgQmFsbGV0Ym8gPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+Cgo+
IEBAIC0xMDMwLDYgKzEwNjQsMTMgQEAgc3RhdGljIGludCBjZG5fZHBfYmluZChzdHJ1Y3QgZGV2
aWNlICpkZXYsIHN0cnVjdAo+IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKSBkcC0+YWN0aXZl
ID0gZmFsc2U7Cj4gIAlkcC0+YWN0aXZlX3BvcnQgPSAtMTsKPiAgCWRwLT5md19sb2FkZWQgPSBm
YWxzZTsKPiArCWRwLT5hdXgubmFtZSA9ICJEUC1BVVgiOwo+ICsJZHAtPmF1eC50cmFuc2ZlciA9
IGNkbl9kcF9hdXhfdHJhbnNmZXI7Cj4gKwlkcC0+YXV4LmRldiA9IGRldjsKPiArCj4gKwlyZXQg
PSBkcm1fZHBfYXV4X3JlZ2lzdGVyKCZkcC0+YXV4KTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJu
IHJldDsKCnRoaXMgaXMgbWlzc2luZyBtYXRjaGluZyBkcm1fZHBfYXV4X3VucmVnaXN0ZXIgY2Fs
bHMgYm90aCBpbiB0aGUgZXJyb3IgcGF0aCBhcyAKd2VsbCBhcyBpbiB0aGUgdW5iaW5kIGNhbGxi
YWNrLgoKV2l0aCB0aGUgY29kZSBhcyBpcywgdGhlIGtlcm5lbCBnaXZlcyB3YXJuaW5ncyBhYm91
dCBpdCB0cnlpbmcgdG8gaW5pdGlhbGl6ZSAKYW4gYWxyZWFkeSBpbml0aWFsaXplZCBvYmplY3Qg
Li4uIGluIGNhc2VzIGxpa2UgcHJvYmUtZGVmZXJyYWxzLgoKCkhlaWtvCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
