From: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 2/4] dt-bindings: drm/bridge: Document
 sn65dsi86 bridge bindings
Date: Tue, 12 Jun 2018 01:20:44 -0700
Message-ID: <152879164462.16708.9963016200597283450@swboyd.mtv.corp.google.com>
References: <1528177218-1051-1-git-send-email-spanda@codeaurora.org>
 <1528177218-1051-4-git-send-email-spanda@codeaurora.org>
 <20180605152050.GA9677@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180605152050.GA9677@rob-hp-laptop>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sandeep Panda <spanda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nganji-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, abhinavk-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, hoegsberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, chandanu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

UXVvdGluZyBSb2IgSGVycmluZyAoMjAxOC0wNi0wNSAwODoyMDo1MCkKPiA+ICsKPiA+ICstIGRk
Yy1pMmMtYnVzOiBwaGFuZGxlIG9mIHRoZSBJMkMgY29udHJvbGxlciB1c2VkIGZvciBEREMgRURJ
RCBwcm9iaW5nCj4gPiArCj4gPiArLSBncGlvLWNvbnRyb2xsZXI6IE1hcmtzIHRoZSBkZXZpY2Ug
aGFzIGEgR1BJTyBjb250cm9sbGVyLgo+ID4gKy0gI2dwaW8tY2VsbHMgICAgOiBTaG91bGQgYmUg
dHdvLiBUaGUgZmlyc3QgY2VsbCBpcyB0aGUgcGluIG51bWJlciBhbmQKPiA+ICsgICAgICAgICAg
ICAgICAgICAgdGhlIHNlY29uZCBjZWxsIGlzIHVzZWQgdG8gc3BlY2lmeSBmbGFncy4KPiA+ICsg
ICAgICAgICAgICAgICAgICAgU2VlIC4uLy4uL2dwaW8vZ3Bpby50eHQgZm9yIG1vcmUgaW5mb3Jt
YXRpb24uCj4gPiArLSAjcHdtLWNlbGxzIDogU2hvdWxkIGJlIG9uZS4gU2VlIC4uLy4uL3B3bS9w
d20udHh0IGZvciBkZXNjcmlwdGlvbiBvZgo+ID4gKyAgICAgICAgICAgICAgIHRoZSBjZWxsIGZv
cm1hdHMuCj4gPiArCj4gPiArLSBjbG9jay1uYW1lczogc2hvdWxkIGJlICJyZWZjbGsiCj4gPiAr
LSBjbG9ja3M6IFNwZWNpZmljYXRpb24gZm9yIGlucHV0IHJlZmVyZW5jZSBjbG9jay4gVGhlIHJl
ZmVyZW5jZQo+ID4gKyAgICAgICBjbG9jayByYXRlIG11c3QgYmUgMTIgTUh6LCAxOS4yIE1Ieiwg
MjYgTUh6LCAyNyBNSHogb3IgMzguNCBNSHouCj4gPiArCj4gPiArLSBsYW5lLW1hcHBpbmc6IFNw
ZWNpZmljYXRpb24gdG8gZGVzY3JpYmUgdGhlIGxvZ2ljYWwgdG8gcGh5c2ljYWwgbGFuZQo+IAo+
IEFzIEkgbWVudGlvbmVkIGluIHY3LCB3ZSBhbHJlYWR5IGhhdmUgYSBwcm9wZXJ0eSBmb3IgdGhp
cy4gSXQncyBjYWxsZWQKPiAnZGF0YS1sYW5lcycgYW5kIGRlZmluZWQgaW4gbWVkaWEvdmlkZW8t
aW50ZXJmYWNlcy50eHQuIFVzZSB0aGF0LiBJZiB5b3UgCj4gbmVlZCBwb2xhcml0eSB0b28sIHRo
ZW4gYWRkIGEgcHJvcGVydHkgZm9yIHRoYXQuIEFuZCBhZGQgaXQgdG8gCj4gdmlkZW8taW50ZXJm
YWNlcy50eHQuCgpMb29rcyBsaWtlIGludmVyc2lvbiBpcyBhbHJlYWR5IGhhbmRsZWQgYnkgdGhl
ICdsYW5lLXBvbGFyaXRpZXMnCnByb3BlcnR5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZnJlZWRyZW5vCg==
