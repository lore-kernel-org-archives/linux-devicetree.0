From: Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/msm/dsi: Get PHY ref clock from the
 DT
Date: Wed, 14 Nov 2018 15:30:36 -0800
Message-ID: <154223823699.88331.1641898155126305025@swboyd.mtv.corp.google.com>
References: <20181102214534.184593-1-mka@chromium.org>
 <20181102214534.184593-2-mka@chromium.org>
 <154154590845.88331.13649449650347478513@swboyd.mtv.corp.google.com>
 <20181114222443.GL22824@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181114222443.GL22824-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rajesh Yadav <ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

UXVvdGluZyBNYXR0aGlhcyBLYWVobGNrZSAoMjAxOC0xMS0xNCAxNDoyNDo0MykKPiBPbiBUdWUs
IE5vdiAwNiwgMjAxOCBhdCAwMzoxMTo0OFBNIC0wODAwLCBTdGVwaGVuIEJveWQgd3JvdGU6Cj4g
PiBRdW90aW5nIE1hdHRoaWFzIEthZWhsY2tlICgyMDE4LTExLTAyIDE0OjQ1OjM0KQo+ID4gPiBA
QCAtNjMwLDcgKzYzMiw4IEBAIHN0YXRpYyBpbnQgcGxsXzEwbm1fcmVnaXN0ZXIoc3RydWN0IGRz
aV9wbGxfMTBubSAqcGxsXzEwbm0pCj4gPiA+ICAgICAgICAgY2hhciBjbGtfbmFtZVszMl0sIHBh
cmVudFszMl0sIHZjb19uYW1lWzMyXTsKPiA+ID4gICAgICAgICBjaGFyIHBhcmVudDJbMzJdLCBw
YXJlbnQzWzMyXSwgcGFyZW50NFszMl07Cj4gPiA+ICAgICAgICAgc3RydWN0IGNsa19pbml0X2Rh
dGEgdmNvX2luaXQgPSB7Cj4gPiA+IC0gICAgICAgICAgICAgICAucGFyZW50X25hbWVzID0gKGNv
bnN0IGNoYXIgKltdKXsgInhvIiB9LAo+ID4gPiArICAgICAgICAgICAgICAgLnBhcmVudF9uYW1l
cyA9IChjb25zdCBjaGFyICpbXSl7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIF9fY2xr
X2dldF9uYW1lKHBsbF8xMG5tLT52Y29fcmVmX2NsaykgfSwKPiA+IAo+ID4gSSBmaW5kIHRoaXMg
c3ludGF4IG9kZCwgaW4gYWRkaXRpb24gdG8gbmVlZGluZyB0byBjaGVjayBmb3IgTlVMTCBoZXJl
IGFzCj4gPiBTZWFuIHBvaW50ZWQgb3V0LiBQcmVmZXJhYmx5IGp1c3QgaGF2ZSBpdCBiZSB0aGUg
YWRkcmVzcyBvZiB0aGUKPiA+IGNoYXJhY3RlciBwb2ludGVyIGluc3RlYWQgb2YgbWFraW5nIGFu
IGFub255bW91cyBhcnJheSBhbmQgdGhlbiBjYXN0aW5nCj4gPiB0aGF0IGlubGluZSwgaS5lCj4g
PiAKPiA+ICAgICAgICAgICAgICAgLnBhcmVudF9uYW1lcyA9ICZyZWZfY2xrX25hbWUsCj4gCj4g
T2sKPiAKPiBJJ20gbm90IGNvbnZpbmNlZCB0aGUgY2hlY2sgZm9yIE5VTEwgaXMgbmVlZGVkIHRo
b3VnaCwgc2VlIG15IHJlcGx5IHRvIFNlYW4uCgpPayEgSSdtIGZpbmUgZWl0aGVyIHdheSBvbiB0
aGUgTlVMTCBzdHVmZi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVk
cmVubwo=
