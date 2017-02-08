From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Add support for Seiko 43WVF1G
Date: Tue, 7 Feb 2017 22:48:16 -0200
Message-ID: <CAOMZO5C+7v=ppVpSYwKEiprCSVSM1z0wVVOwSmbuEPaO3618Wg@mail.gmail.com>
References: <1486065840-13575-1-git-send-email-breno.lima@nxp.com>
 <20170207184935.7shhx5pqtprucmgc@rob-hp-laptop>
 <CAOMZO5Bv2gHa3O_6dbAgKePcZDfMeueeYptRb4r=WLTHYYS8uA@mail.gmail.com>
 <CAL_Jsq+Fu6XRbPEO2OWvpGHuRk9w+k=X3tT+P-UUqiu2r+F12Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAL_Jsq+Fu6XRbPEO2OWvpGHuRk9w+k=X3tT+P-UUqiu2r+F12Q@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Breno Lima <breno.lima@nxp.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Breno Matheus Lima <brenomatheus@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBGZWIgNywgMjAxNyBhdCA5OjM2IFBNLCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKCj4gRXhjZXB0IEkgaGF2ZSBubyB3YXkgb2Yga25vd2luZyB3aGV0aGVyOiBh
KSB5b3Ugb21pdHRlZCBhIHN1cHBseQo+IGJlY2F1c2UgeW91IGRvbid0ICh5ZXQpIGNhcmUsIGIp
IHRoZSBwYW5lbCBoYXMgYSBzaW5nbGUgc3VwcGx5IGFuZCB5b3UKPiBhcmUgdXNpbmcgcG93ZXIt
c3VwcGx5IG9yIGMpIHRoZSBwYW5lbCBoYXMgbXVsdGlwbGUgc3VwcGxpZXMgYW5kIHlvdXIKPiBi
aW5kaW5nIGlzIHdyb25nLgo+Cj4gSSBjYW4gb25seSBlbGltaW5hdGUgQSBpZiB5b3UgbGlzdCB0
aGUgc3VwcGxpZXMuIEp1c3QgbmVlZCBzb21ldGhpbmcKPiBsaWtlICJwb3dlci1zdXBwbHkgOiBz
ZWUgc2ltcGxlLXBhbmVsLnR4dCIuIEkndmUgc3RpbGwgZ290IHRvIGdvIHJlYWQKPiB0aGUgcGFu
ZWwgc3BlYyBpZiBJIHJlYWxseSB3YW50IHRvIGNoZWNrIHRoZSBiaW5kaW5nLgoKSnVzdCBjaGVj
a2VkIHRoZSBwYW5lbCBkYXRhc2hlZXQgYXQKaHR0cDovL3d3dy5nbHluLmRlL2RhdGEvZ2x5bi9t
ZWRpYS9kb2MvNDN3dmYxZy0wLnBkZiBhbmQgaXQgbGlzdHMgdHdvCnN1cHBsaWVzOgpEVkREIChE
aWdpdGFsIHBvd2VyIHN1cHBseSkgYW5kIEFWREQgKEFuYWxvZyBwb3dlciBzdXBwbHkpLgoKT3Vy
IGR0cyB3YXMganVzdCBwcm92aWRpbmcgYSBzaW5nbGUgJ3Bvd2VyLXN1cHBseScgd2hpY2ggcmVm
ZXJyZWQgdG8gYQpHUElPIGVuYWJsZWQgcmVndWxhdG9yIHRoYXQgZHJpdmVzIERWREQuCgpTbyBp
dCBzZWVtcyB3ZSBtaXNzZWQgdG8gcGFzcyBBVkREIChub3Qgc29mdHdhcmUgY29udHJvbGxlZCBp
biBvdXIKY2FzZSwgYnV0IHdlIG5lZWQgdG8gZGVzY3JpYmUgaXQgaW4gZHRzIGFueXdheSkuCgpE
b2VzIHRoaXMgbWVhbiB3ZSBjYW5ub3QgdXNlIHNpbXBsZS1wYW5lbCBmb3IgdGhpcyBwYXJ0aWN1
bGFyIHBhbmVsCmFuZCB3ZSBzaG91bGQgYWRkIGEgc2VwYXJhdGUgZHJpdmVyIGZvciBpdD8KClRo
YW5rcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
