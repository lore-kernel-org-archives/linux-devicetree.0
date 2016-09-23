From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] drm/panel: simple: add support for Sharp LQ150X1LG11
 panels
Date: Fri, 23 Sep 2016 12:39:48 -0500
Message-ID: <20160923173948.GA26691@rob-hp-laptop>
References: <1474104862-16957-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1474104862-16957-1-git-send-email-peda@axentia.se>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Peter Rosin <peda@axentia.se>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Gustaf =?iso-8859-1?Q?Lindstr=F6m?= <gl@axentia.se>
List-Id: devicetree@vger.kernel.org

T24gU2F0LCBTZXAgMTcsIDIwMTYgYXQgMTE6MzQ6MjJBTSArMDIwMCwgUGV0ZXIgUm9zaW4gd3Jv
dGU6Cj4gRnJvbTogR3VzdGFmIExpbmRzdHLDtm0gPGdsQGF4ZW50aWEuc2U+Cj4gCj4gVGhlIFNo
YXJwIDE1IiBMUTE1MFgxTEcxMSBwYW5lbCBpcyBhbiBYR0EgVEZUIExDRCBwYW5lbC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBHdXN0YWYgTGluZHN0csO2bSA8Z2xAYXhlbnRpYS5zZT4KPiBTaWduZWQt
b2ZmLWJ5OiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPgo+IC0tLQo+ICAuLi4vYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9zaGFycCxscTE1MHgxbGcxMS50eHQgICB8ICA3ICsrKysrKwo+ICBk
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgICAgICAgICAgICAgICB8IDI3ICsr
KysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCsp
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9zaGFycCxscTE1MHgxbGcxMS50eHQKPiAKPiB2MS0+djI6IGNvcnJlY3Qg
YXV0aG9yCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL3NoYXJwLGxxMTUweDFsZzExLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NoYXJwLGxxMTUweDFsZzExLnR4dAo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wMTQ0MjhjOTg0YzgKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvc2hhcnAsbHExNTB4MWxnMTEudHh0Cj4gQEAgLTAsMCArMSw3IEBACj4gK1No
YXJwIDE1IiBMUTE1MFgxTEcxMSBYR0EgVEZUIExDRCBwYW5lbAo+ICsKPiArUmVxdWlyZWQgcHJv
cGVydGllczoKPiArLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgInNoYXJwLGxxMTUweDFsZzExIgoK
TG9va2luZyBhdCB0aGUgc3BlYywgd2hhdCBhYm91dCAxMlYgVkRELCAzLjNWIFZDQywgWFNUQUJZ
IChiYWNrbGlnaHQgCmN0cmwpLCBWQlIgKFBXTSksIFJML1VELCBTRUxMVkRTIHNpZ25hbHM/CgpS
b2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
