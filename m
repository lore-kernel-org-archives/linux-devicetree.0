From: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/3] drm/msm/dpu: Integrate interconnect
 API in MDSS
Date: Wed, 9 Jan 2019 22:23:03 +0200
Message-ID: <9ce72f28-e43e-ad51-1e47-5e8fac0007ba@linaro.org>
References: <1545373225-32046-1-git-send-email-jshekhar@codeaurora.org>
 <1545373225-32046-3-git-send-email-jshekhar@codeaurora.org>
 <f27f5879-04d2-ad7d-a1d6-3a4e638ef33d@linaro.org>
 <CAD=FV=WDYXrHGwvA9ODusBRLT9jVJ-defpzah1ggtWRiQgXtBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAD=FV=WDYXrHGwvA9ODusBRLT9jVJ-defpzah1ggtWRiQgXtBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jayant Shekhar <jshekhar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rajesh Yadav <ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nganji-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Abhinav Kumar <abhinavk-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Kristian H. Kristensen" <hoegsberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Chandan Uddaraju <chandanu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, freedreno <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Jeykumar Sankaran <jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sravanthi Kollukuduru <skolluku-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiA5LjAxLjE5IDE4OjA0LCBEb3VnIEFuZGVyc29uIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IFdlZCwgSmFuIDksIDIwMTkgYXQgNjozOCBBTSBHZW9yZ2kgRGpha292IDxnZW9yZ2kuZGpha292
QGxpbmFyby5vcmc+IHdyb3RlOgo+Pgo+PiBIaSBKYXlhbnQsCj4+Cj4+IE9uIDEyLzIxLzE4IDA4
OjIwLCBKYXlhbnQgU2hla2hhciB3cm90ZToKPj4+IEZyb206IFNyYXZhbnRoaSBLb2xsdWt1ZHVy
dSA8c2tvbGx1a3VAY29kZWF1cm9yYS5vcmc+Cj4+Pgo+Pj4gVGhlIGludGVyY29ubmVjdCBmcmFt
ZXdvcmsgaXMgZGVzaWduZWQgdG8gcHJvdmlkZSBhCj4+PiBzdGFuZGFyZCBrZXJuZWwgaW50ZXJm
YWNlIHRvIGNvbnRyb2wgdGhlIHNldHRpbmdzIG9mCj4+PiB0aGUgaW50ZXJjb25uZWN0cyBvbiBh
IFNvQy4KPj4+Cj4+PiBUaGUgaW50ZXJjb25uZWN0IEFQSSB1c2VzIGEgY29uc3VtZXIvcHJvdmlk
ZXItYmFzZWQgbW9kZWwsCj4+PiB3aGVyZSB0aGUgcHJvdmlkZXJzIGFyZSB0aGUgaW50ZXJjb25u
ZWN0IGJ1c2VzIGFuZCB0aGUKPj4+IGNvbnN1bWVycyBjb3VsZCBiZSB2YXJpb3VzIGRyaXZlcnMu
Cj4+Pgo+Pj4gTURTUyBpcyBvbmUgb2YgdGhlIGludGVyY29ubmVjdCBjb25zdW1lcnMgd2hpY2gg
dXNlcyB0aGUKPj4+IGludGVyY29ubmVjdCBBUElzIHRvIGdldCB0aGUgcGF0aCBiZXR3ZWVuIGVu
ZHBvaW50cyBhbmQKPj4+IHNldCBpdHMgYmFuZHdpZHRoL2xhdGVuY3kvUW9TIHJlcXVpcmVtZW50
cyBmb3IgdGhlIGdpdmVuCj4+Cj4+IEN1cnJlbnRseSB3ZSBzZXQgb25seSBiYW5kd2lkdGguCj4+
Cj4+PiBpbnRlcmNvbm5lY3RlZCBwYXRoLgo+Pj4KPj4+IENoYW5nZXMgaW4gdjI6Cj4+PiAgICAg
ICAtIFJlbW92ZSBlcnJvciBsb2cgYW5kIHVubmVjZXNzYXJ5IGNoZWNrIChKb3JkYW4gQ3JvdXNl
KQo+Pj4KPj4+IENoYW5nZXMgaW4gdjM6Cj4+PiAgICAgICAtIENvZGUgY2xlYW4gaW52b2x2aW5n
IHZhcmlhYmxlIG5hbWUgY2hhbmdlLCByZW1vdmFsCj4+PiAgICAgICAgIG9mIGV4dHJhIHBhcmFu
dGhlc2lzIGFuZCB2YXJpYWJsZXMgKE1hdHRoaWFzIEthZWhsY2tlKQo+Pj4KPj4+IENoYW5nZXMg
aW4gdjQ6Cj4+PiAgICAgICAtIEFkZCBjb21tZW50cywgc3BhY2luZ3MsIHRhYnMsIHByb3BlciBw
b3J0IG5hbWUKPj4+ICAgICAgICAgYW5kIGljYyBtYWNybyAoR2VvcmdpIERqYWtvdikKPj4KPj4g
VGhlIGNoYW5nZXMgc2hvdWxkIG5vdCBiZSBwYXJ0IG9mIHRoZSBjb21taXQgdGV4dCwgYnV0IHNo
b3VsZCBtb3ZlIGJlbG93Cj4+IHRoZSAiLS0tIiBsaW5lLgo+IAo+IERyaXZlLWJ5IGNvbW1lbnQg
dGhhdCAoSSBiZWxpZXZlKSB0aGV5IGFjdHVhbGx5IHNob3VsZCBiZSBwYXJ0IG9mIHRoZQo+IGNv
bW1pdCB0ZXh0LiAgQ29udmVudGlvbiBmb3IgY2hhbmdlcyBpbiB0aGUgImRybSIgc3Vic3lzdGVt
IGFwcGVhcnMgdG8KPiBiZSB0byBpbmNsdWRlIHRoZSByZXZpc2lvbiBsb2cgaW4gdGhlIGNvbW1p
dCB0ZXh0LiAgVGhpcyBpcyB1bmxpa2UgdGhlCj4gcmVzdCBvZiB0aGUga2VybmVsLCBidXQgKnNo
cnVnKi4KCkluZGVlZCEgVGhhbmtzIGZvciB0aGUgaW5mbyEgVGhlbiBpdCdzIGZpbmUuCgpCUiwK
R2VvcmdpCgo+IAo+IFRyeSwgZm9yIGluc3RhbmNlOgo+IAo+IGdpdCBsb2cgLS1uby1tZXJnZXMg
djQuMTkuLnY1LjAtcmMxIGRyaXZlcnMvZ3B1L2RybS9tc20gfCBncmVwICd2WzAtOV0nCj4gCj4g
LURvdWcKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
RnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==
