From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 03/12] drm: rcar-du: Fix legacy DT to create LVDS
 encoder nodes
Date: Tue, 20 Feb 2018 08:04:54 -0600
Message-ID: <CAL_JsqK8r31pQ1j_VQ_fR=vnNm3=x_pTiz7G_KEpjO3jwy9izA@mail.gmail.com>
References: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180215000415.19077-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAL_JsqJMwHQoht0Jj_UCVWgrW=1dU5egWrTeSVfFrKGfqMm9+g@mail.gmail.com>
 <3866023.VvEQmjTL1d@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <3866023.VvEQmjTL1d@avalon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, dri-devel <dri-devel@lists.freedesktop.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMzoxNSBBTSwgTGF1cmVudCBQaW5jaGFydAo8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToKPiBIaSBSb2IsCj4KPiBPbiBUdWVz
ZGF5LCAyMCBGZWJydWFyeSAyMDE4IDAyOjU0OjAwIEVFVCBSb2IgSGVycmluZyB3cm90ZToKPj4g
T24gV2VkLCBGZWIgMTQsIDIwMTggYXQgNjowNCBQTSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToK
Pj4gPiBUaGUgaW50ZXJuYWwgTFZEUyBlbmNvZGVycyBub3cgaGF2ZSB0aGVpciBvd24gRFQgYmlu
ZGluZ3MuIEJlZm9yZQo+PiA+IHN3aXRjaGluZyB0aGUgZHJpdmVyIGluZnJhc3RydWN0dXJlIHRv
IHRob3NlIG5ldyBiaW5kaW5ncywgaW1wbGVtZW50Cj4+ID4gYmFja3dhcmQtY29tcGF0aWJpbGl0
eSB0aHJvdWdoIGxpdmUgRFQgcGF0Y2hpbmcuCj4+ID4KPj4gPiBQYXRjaGluZyBpcyBkaXNhYmxl
ZCBhbmQgd2lsbCBiZSBlbmFibGVkIGFsb25nIHdpdGggc3VwcG9ydCBmb3IgdGhlIG5ldwo+PiA+
IERUIGJpbmRpbmdzIGluIHRoZSBEVSBkcml2ZXIuCj4+ID4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBM
YXVyZW50IFBpbmNoYXJ0Cj4+ID4gPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9h
cmQuY29tPgoKPj4gPiArc3RhdGljIGludCBfX2luaXQgcmNhcl9kdV9vZl9hZGRfcHJvcGVydHko
c3RydWN0IGRldmljZV9ub2RlICpucCwKPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBjaGFyICpuYW1lLCBjb25zdCB2b2lkCj4+ID4gKnZhbHVlLAo+
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVfdCBsZW5n
dGgpCj4+Cj4+IFNvLCB3ZXJlIHlvdSBnb2luZyB0byByZXZpdmUgUGFudGVsaXMnIHBhdGNoIG9y
IG1vdmUgdGhpcyB0byB0aGUgY29yZT8KPgo+IERvIHlvdSBoYXZlIGEgcG9pbnRlciB0byB0aGF0
IHBhdGNoID8KCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTEwNDU3MS8KaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85MTA0NTkxLwpodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzkxMDQ2MTEvCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvOTEwNDU4MS8KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85MTA0NjAx
LwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
