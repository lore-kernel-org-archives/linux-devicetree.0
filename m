From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: msm/dsi: Add ref clock
 for PHYs
Date: Fri, 30 Nov 2018 14:16:50 -0800
Message-ID: <20181130221650.GB22824@google.com>
References: <20181126231159.122298-1-mka@chromium.org>
 <20181126231159.122298-2-mka@chromium.org>
 <CAD=FV=WvXFpZDJGbdvvY=HL_=tDWyhKpTg7zu8s=gUuJgK1ebg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WvXFpZDJGbdvvY=HL_=tDWyhKpTg7zu8s=gUuJgK1ebg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rajesh Yadav <ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jeykumar Sankaran <jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, freedreno <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBOb3YgMjcsIDIwMTggYXQgMDk6NDE6MzlQTSAtMDgwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPiAKPiBPbiBNb24sIE5vdiAyNiwgMjAxOCBhdCAzOjEyIFBNIE1hdHRoaWFz
IEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+Cj4gPiBBbGxvdyB0aGUgUEhZ
IGRyaXZlcnMgdG8gZ2V0IHRoZSByZWYgY2xvY2sgZnJvbSB0aGUgRFQuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+
IENoYW5nZXMgaW4gdjI6Cj4gPiAtIGFkZCB0aGUgcmVmIGNsb2NrIGZvciBhbGwgUEhZcywgbm90
IG9ubHkgdGhlIDEwbm0gb25lCj4gPiAtIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UKPiA+IC0tLQo+
ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2kudHh0
IHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2ku
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RzaS50
eHQKPiA+IGluZGV4IGRmYzc0MzIxOWJkODguLmIwNDg1NTU5YTcxOWMgMTAwNjQ0Cj4gPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dAo+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2Rz
aS50eHQKPiA+IEBAIC0xMDYsNiArMTA2LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKPiA+ICAt
IGNsb2NrczogUGhhbmRsZXMgdG8gZGV2aWNlIGNsb2Nrcy4gU2VlIFsxXSBmb3IgZGV0YWlscyBv
biBjbG9jayBiaW5kaW5ncy4KPiA+ICAtIGNsb2NrLW5hbWVzOiB0aGUgZm9sbG93aW5nIGNsb2Nr
cyBhcmUgcmVxdWlyZWQ6Cj4gPiAgICAqICJpZmFjZSIKPiA+ICsgICogInJlZiIKPiAKPiBXZSBj
YW4ndCBxdWl0ZSBtYWtlIHJlZiAicmVxdWlyZWQiIGJlY2F1c2UgdGhlcmUgYXJlIHNvbWUgb2xk
IGRldmljZQo+IHRyZWUgZmlsZXMgZGF0aW5nIGJhY2sgdG8gMjAxNiB0aGF0IHdvdWxkIGJlIGJy
b2tlbi4gIEl0IGNvdWxkIGJlCj4gbGlzdGVkIGFzIG9wdGlvbmFsLCBidXQgSSBfdGhpbmtfIFJv
YiBpcyBPSyB3aXRoIGl0IGJlaW5nIGxpc3RlZCBhcwo+ICJyZXF1aXJlZCIgZm9yIGFsbCBuZXcg
ZGV2aWNlIHRyZWUgZmlsZXMgd2l0aCB0aGUgZm9vdG5vdGUgdGhhdCBpZgo+IGl0J3Mgbm90IHBy
ZXNlbnQgdGhlbiB0aGUgY29kZSB3aWxsIHN0aWxsIHdvcmsuCgpPaywgd2lsbCB1cGRhdGUgdGhl
IGNvZGUgdG8ga2VlcCBzdXBwb3J0aW5nIG9sZCBEVCBmaWxlcyBhbmQgdXBkYXRlCnRoZSBkZXNj
cmlwdGlvbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
RnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==
