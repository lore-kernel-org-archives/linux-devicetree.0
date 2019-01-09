From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 2/3] drm/msm/dpu: Integrate interconnect API in MDSS
Date: Wed, 9 Jan 2019 08:04:16 -0800
Message-ID: <CAD=FV=WDYXrHGwvA9ODusBRLT9jVJ-defpzah1ggtWRiQgXtBQ@mail.gmail.com>
References: <1545373225-32046-1-git-send-email-jshekhar@codeaurora.org>
 <1545373225-32046-3-git-send-email-jshekhar@codeaurora.org>
 <f27f5879-04d2-ad7d-a1d6-3a4e638ef33d@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <f27f5879-04d2-ad7d-a1d6-3a4e638ef33d@linaro.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: devicetree@vger.kernel.org, Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Jayant Shekhar <jshekhar@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>, "Kristian H. Kristensen" <hoegsberg@chromium.org>, Chandan Uddaraju <chandanu@codeaurora.org>, freedreno <freedreno@lists.freedesktop.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiBXZWQsIEphbiA5LCAyMDE5IGF0IDY6MzggQU0gR2VvcmdpIERqYWtvdiA8Z2Vvcmdp
LmRqYWtvdkBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEhpIEpheWFudCwKPgo+IE9uIDEyLzIxLzE4
IDA4OjIwLCBKYXlhbnQgU2hla2hhciB3cm90ZToKPiA+IEZyb206IFNyYXZhbnRoaSBLb2xsdWt1
ZHVydSA8c2tvbGx1a3VAY29kZWF1cm9yYS5vcmc+Cj4gPgo+ID4gVGhlIGludGVyY29ubmVjdCBm
cmFtZXdvcmsgaXMgZGVzaWduZWQgdG8gcHJvdmlkZSBhCj4gPiBzdGFuZGFyZCBrZXJuZWwgaW50
ZXJmYWNlIHRvIGNvbnRyb2wgdGhlIHNldHRpbmdzIG9mCj4gPiB0aGUgaW50ZXJjb25uZWN0cyBv
biBhIFNvQy4KPiA+Cj4gPiBUaGUgaW50ZXJjb25uZWN0IEFQSSB1c2VzIGEgY29uc3VtZXIvcHJv
dmlkZXItYmFzZWQgbW9kZWwsCj4gPiB3aGVyZSB0aGUgcHJvdmlkZXJzIGFyZSB0aGUgaW50ZXJj
b25uZWN0IGJ1c2VzIGFuZCB0aGUKPiA+IGNvbnN1bWVycyBjb3VsZCBiZSB2YXJpb3VzIGRyaXZl
cnMuCj4gPgo+ID4gTURTUyBpcyBvbmUgb2YgdGhlIGludGVyY29ubmVjdCBjb25zdW1lcnMgd2hp
Y2ggdXNlcyB0aGUKPiA+IGludGVyY29ubmVjdCBBUElzIHRvIGdldCB0aGUgcGF0aCBiZXR3ZWVu
IGVuZHBvaW50cyBhbmQKPiA+IHNldCBpdHMgYmFuZHdpZHRoL2xhdGVuY3kvUW9TIHJlcXVpcmVt
ZW50cyBmb3IgdGhlIGdpdmVuCj4KPiBDdXJyZW50bHkgd2Ugc2V0IG9ubHkgYmFuZHdpZHRoLgo+
Cj4gPiBpbnRlcmNvbm5lY3RlZCBwYXRoLgo+ID4KPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAgICAg
ICAtIFJlbW92ZSBlcnJvciBsb2cgYW5kIHVubmVjZXNzYXJ5IGNoZWNrIChKb3JkYW4gQ3JvdXNl
KQo+ID4KPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiAgICAgICAtIENvZGUgY2xlYW4gaW52b2x2aW5n
IHZhcmlhYmxlIG5hbWUgY2hhbmdlLCByZW1vdmFsCj4gPiAgICAgICAgIG9mIGV4dHJhIHBhcmFu
dGhlc2lzIGFuZCB2YXJpYWJsZXMgKE1hdHRoaWFzIEthZWhsY2tlKQo+ID4KPiA+IENoYW5nZXMg
aW4gdjQ6Cj4gPiAgICAgICAtIEFkZCBjb21tZW50cywgc3BhY2luZ3MsIHRhYnMsIHByb3BlciBw
b3J0IG5hbWUKPiA+ICAgICAgICAgYW5kIGljYyBtYWNybyAoR2VvcmdpIERqYWtvdikKPgo+IFRo
ZSBjaGFuZ2VzIHNob3VsZCBub3QgYmUgcGFydCBvZiB0aGUgY29tbWl0IHRleHQsIGJ1dCBzaG91
bGQgbW92ZSBiZWxvdwo+IHRoZSAiLS0tIiBsaW5lLgoKRHJpdmUtYnkgY29tbWVudCB0aGF0IChJ
IGJlbGlldmUpIHRoZXkgYWN0dWFsbHkgc2hvdWxkIGJlIHBhcnQgb2YgdGhlCmNvbW1pdCB0ZXh0
LiAgQ29udmVudGlvbiBmb3IgY2hhbmdlcyBpbiB0aGUgImRybSIgc3Vic3lzdGVtIGFwcGVhcnMg
dG8KYmUgdG8gaW5jbHVkZSB0aGUgcmV2aXNpb24gbG9nIGluIHRoZSBjb21taXQgdGV4dC4gIFRo
aXMgaXMgdW5saWtlIHRoZQpyZXN0IG9mIHRoZSBrZXJuZWwsIGJ1dCAqc2hydWcqLgoKVHJ5LCBm
b3IgaW5zdGFuY2U6CgpnaXQgbG9nIC0tbm8tbWVyZ2VzIHY0LjE5Li52NS4wLXJjMSBkcml2ZXJz
L2dwdS9kcm0vbXNtIHwgZ3JlcCAndlswLTldJwoKLURvdWcKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
