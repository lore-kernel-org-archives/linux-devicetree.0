From: Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2] drm/msm/dpu: Correct dpu destroy and
 disable order
Date: Fri, 2 Nov 2018 08:32:35 -0600
Message-ID: <20181102143235.GD19984@jcrouse-lnx.qualcomm.com>
References: <1541162957-12796-1-git-send-email-jshekhar@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1541162957-12796-1-git-send-email-jshekhar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jayant Shekhar <jshekhar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, abhinavk-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nganji-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, hoegsberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, chandanu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMDY6MTk6MTdQTSArMDUzMCwgSmF5YW50IFNoZWtoYXIg
d3JvdGU6Cj4gSW4gY2FzZSBvZiBtc20gZHJtIGJpbmQgZmFpbHVyZSwgZHB1X21kc3NfZGVzdHJv
eSBpcyB0cmlnZ2VyZWQuCj4gSW4gdGhpcyBmdW5jdGlvbiwgcmVzb3VyY2VzIGFyZSBmcmVlZCBh
bmQgcG0gcnVudGltZSBkaXNhYmxlIGlzCj4gY2FsbGVkLCB3aGljaCB0cmlnZ2VycyBkcHVfbWRz
c19kaXNhYmxlLiBOb3cgaW4gZHB1X21kc3NfZGlzYWJsZSwKPiBkcml2ZXIgdHJpZXMgdG8gYWNj
ZXNzIGEgbWVtb3J5IHdoaWNoIGlzIGFscmVhZHkgZnJlZWQuIFRoaXMKPiByZXN1bHRzIGluIGtl
cm5lbCBwYW5pYy4gRml4IHRoaXMgYnkgZW5zdXJpbmcgcHJvcGVyIHNlcXVlbmNlCj4gb2YgZHB1
IGRlc3Ryb3kgYW5kIGRpc2FibGUgY2FsbHMuCgpTaW5jZSB5b3UgYXJlIGluIHRoaXMgc3BlY2lm
aWMgYXJlYSwgSSBub3RpY2VkIHdlIGFsc28gaGFkIHNvbWUgbWVtb3J5IGxlYWtzCm9uIGJpbmQg
ImZhaWx1cmUiIGFuZCBJIGp1c3Qgc2VudCBvdXQgYSBwYXRjaCBmb3IgdGhhdC4KCkpvcmRhbgoK
LS0gClRoZSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiBD
b2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVj
dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJl
bm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K
