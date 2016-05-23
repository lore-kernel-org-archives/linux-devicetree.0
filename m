From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [RFC v2 3/5] drm/mediatek: add *driver_data for different
 hardware settings
Date: Mon, 23 May 2016 17:43:02 +0800
Message-ID: <1463996582.30093.5.camel@mtksdaap41>
References: <1463756736-46573-1-git-send-email-yt.shen@mediatek.com>
 <1463756736-46573-4-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1463756736-46573-4-git-send-email-yt.shen@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: yt.shen@mediatek.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, srv_heupstream@mediatek.com, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksIFlUOgoKT25lIGNvbW1lbnQgYmVsb3cuCgpPbiBGcmksIDIwMTYtMDUtMjAgYXQgMjM6MDUg
KzA4MDAsIHl0LnNoZW5AbWVkaWF0ZWsuY29tIHdyb3RlOgo+IEZyb206IFlUIFNoZW4gPHl0LnNo
ZW5AbWVkaWF0ZWsuY29tPgo+IAo+IFRoZXJlIGFyZSBzb21lIGhhcmR3YXJlIHNldHRpbmdzIGNo
YW5nZWQsIGJldHdlZW4gTVQ4MTczICYgTVQyNzAxOgo+IERJU1BfT1ZMIGFkZHJlc3Mgb2Zmc2V0
IGNoYW5nZWQsIGNvbG9yIGZvcm1hdCBkZWZpbml0aW9uIGNoYW5nZWQuCj4gRElTUF9SRE1BIGZp
Zm8gc2l6ZSBjaGFuZ2VkLgo+IERJU1BfQ09MT1Igb2Zmc2V0IGNoYW5nZWQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogWVQgU2hlbiA8eXQuc2hlbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gKwo+ICtzdGF0
aWMgaW5saW5lIHN0cnVjdCBtdGtfZGRwX2NvbXBfZHJpdmVyX2RhdGEgKm10a19vdmxfZ2V0X2Ry
aXZlcl9kYXRhKAo+ICsJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiArewo+ICsJY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCAqb2ZfaWQgPQo+ICsJCW9mX21hdGNoX2RldmljZShtdGtf
ZGlzcF9vdmxfZHJpdmVyX2R0X21hdGNoLCAmcGRldi0+ZGV2KTsKPiArCj4gKwlyZXR1cm4gKHN0
cnVjdCBtdGtfZGRwX2NvbXBfZHJpdmVyX2RhdGEgKilvZl9pZC0+ZGF0YTsKPiArfQo+ICsKPiAr
c3RhdGljIGlubGluZSBzdHJ1Y3QgbXRrX2RkcF9jb21wX2RyaXZlcl9kYXRhICptdGtfcmRtYV9n
ZXRfZHJpdmVyX2RhdGEoCj4gKwlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICt7Cj4g
Kwljb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICpvZl9pZCA9Cj4gKwkJb2ZfbWF0Y2hfZGV2aWNl
KG10a19kaXNwX3JkbWFfZHJpdmVyX2R0X21hdGNoLCAmcGRldi0+ZGV2KTsKPiArCj4gKwlyZXR1
cm4gKHN0cnVjdCBtdGtfZGRwX2NvbXBfZHJpdmVyX2RhdGEgKilvZl9pZC0+ZGF0YTsKPiArfQo+
ICsKPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgbXRrX2RkcF9jb21wX2RyaXZlcl9kYXRhICptdGtf
Y29sb3JfZ2V0X2RyaXZlcl9kYXRhKAo+ICsJc3RydWN0IGRldmljZV9ub2RlICpub2RlKQo+ICt7
Cj4gKwljb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICpvZl9pZCA9Cj4gKwkJb2ZfbWF0Y2hfbm9k
ZShtdGtfZGlzcF9jb2xvcl9kcml2ZXJfZHRfbWF0Y2gsIG5vZGUpOwo+ICsKPiArCXJldHVybiAo
c3RydWN0IG10a19kZHBfY29tcF9kcml2ZXJfZGF0YSAqKW9mX2lkLT5kYXRhOwo+ICt9Cj4gKyAK
ClRoZXNlIHRocmVlIGZ1bmN0aW9ucyBsb29rcyB0aGUgc2FtZSB3aXRoIGRpZmZlcmVudCBwYXJh
bWV0ZXI6Cm10a19kaXNwX292bF9kcml2ZXJfZHRfbWF0Y2gsIG10a19kaXNwX3JkbWFfZHJpdmVy
X2R0X21hdGNoLCBhbmQKbXRrX2Rpc3BfY29sb3JfZHJpdmVyX2R0X21hdGNoLiBTbyBtZXJnZSB0
aGVtIHRvIHByZXZlbnQgZHVwbGljYXRlZApjb2RlLgoKUmVnYXJkcywKQ0sKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
