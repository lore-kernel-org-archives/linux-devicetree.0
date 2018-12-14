From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] video/backlight: Use of_node_name_eq for node name
 comparisons
Date: Fri, 14 Dec 2018 12:27:09 +0000
Message-ID: <20181214122709.GX4497@dell>
References: <20181205195050.4759-28-robh@kernel.org>
 <20181206140221.rq4zp74olghzipxu@holly.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20181206140221.rq4zp74olghzipxu@holly.lan>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: linux-fbdev@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAwNiBEZWMgMjAxOCwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiBXZWQsIERl
YyAwNSwgMjAxOCBhdCAwMTo1MDo0NFBNIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+IENv
bnZlcnQgc3RyaW5nIGNvbXBhcmVzIG9mIERUIG5vZGUgbmFtZXMgdG8gdXNlIG9mX25vZGVfbmFt
ZV9lcSBoZWxwZXIKPiA+IGluc3RlYWQuIFRoaXMgcmVtb3ZlcyBkaXJlY3QgYWNjZXNzIHRvIHRo
ZSBub2RlIG5hbWUgcG9pbnRlci4KPiA+IAo+ID4gRm9yIGluc3RhbmNlcyB1c2luZyBvZl9ub2Rl
X2NtcCwgdGhpcyBoYXMgdGhlIHNpZGUgZWZmZWN0IG9mIG5vdyB1c2luZwo+ID4gY2FzZSBzZW5z
aXRpdmUgY29tcGFyaXNvbnMuIFRoaXMgc2hvdWxkIG5vdCBtYXR0ZXIgZm9yIGFueSBGRFQgYmFz
ZWQKPiA+IHN5c3RlbSB3aGljaCB0aGlzIGlzLgo+ID4gCj4gPiBDYzogTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4KPiA+IENjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNv
bkBsaW5hcm8ub3JnPgo+ID4gQ2M6IEppbmdvbyBIYW4gPGppbmdvb2hhbjFAZ21haWwuY29tPgo+
ID4gQ2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNv
bT4KPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBDYzogbGludXgt
ZmJkZXZAdmdlci5rZXJuZWwub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgo+IAo+IEFja2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9t
cHNvbkBsaW5hcm8ub3JnPgo+IAo+IFt0aGlzIGlzIEZBTyBMZWUgSi4gcmF0aGVyIHRoYW4gcmVj
b21tZW5kaW5nIHlvdSB0YWtlIGl0IHZpYSB5b3UgdHJlZV0KClJvYiBrbm93cyBiZXR0ZXIgdGhh
biB0aGF0LiA7KQoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpM
aW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ug
c29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8
IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
