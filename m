From: YT Shen <yt.shen@mediatek.com>
Subject: Re: [RFC 1/3] dt-bindings: drm/mediatek: Add display binding for
 Mediatek SoC MT2701
Date: Mon, 16 May 2016 18:27:02 +0800
Message-ID: <1463394422.28394.5.camel@mtksdaap41>
References: <1463053795-55455-1-git-send-email-yt.shen@mediatek.com>
 <1463053795-55455-2-git-send-email-yt.shen@mediatek.com>
 <1463065184.17225.2.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1463065184.17225.2.camel@mtksdaap41>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, weiqing.kong@mediatek.com, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, srv_heupstream@mediatek.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGkgWWluZ2pvZSwKCk9uIFRodSwgMjAxNi0wNS0xMiBhdCAyMjo1OSArMDgwMCwgWWluZ2pvZSBD
aGVuIHdyb3RlOgo+IE9uIFRodSwgMjAxNi0wNS0xMiBhdCAxOTo0OSArMDgwMCwgeXQuc2hlbkBt
ZWRpYXRlay5jb20gd3JvdGU6Cj4gPiBGcm9tOiBZVCBTaGVuIDx5dC5zaGVuQG1lZGlhdGVrLmNv
bT4KPiA+IAo+ID4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhl
IGRpc3BsYXkgc3Vic3lzdGVtIGluCj4gPiBNZWRpYXRlayBTb0MgTVQyNzAxCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IFlUIFNoZW4gPHl0LnNoZW5AbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gPiAg
Li4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgfCAgICAx
ICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21l
ZGlhdGVrLGRpc3AudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiA+IGluZGV4IGRiNmU3N2UuLjUzYjNjYzMg
MTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiA+IEBA
IC00MCw2ICs0MCw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9ja3Mp
Ogo+ID4gIAkibWVkaWF0ZWssPGNoaXA+LWRwaSIgICAgICAgIC0gRFBJIGNvbnRyb2xsZXIsIHNl
ZSBtZWRpYXRlayxkcGkudHh0Cj4gPiAgCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1tdXRleCIgLSBk
aXNwbGF5IG11dGV4Cj4gPiAgCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vZCIgICAgLSBvdmVyZHJp
dmUKPiA+ICsJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLWJscyIgICAtIGJhY2tsaWdodAo+ID4gIC0g
cmVnOiBQaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgZnVuY3Rpb24gYmxv
Y2sgcmVnaXN0ZXIgc3BhY2UKPiA+ICAtIGludGVycnVwdHM6IFRoZSBpbnRlcnJ1cHQgc2lnbmFs
IGZyb20gdGhlIGZ1bmN0aW9uIGJsb2NrIChyZXF1aXJlZCwgZXhjZXB0IGZvcgo+ID4gICAgbWVy
Z2UgYW5kIHNwbGl0IGZ1bmN0aW9uIGJsb2NrcykuCj4gCj4gCj4gSGksCj4gCj4gVGhpcyBvbmUg
aXMgaW4gY29uZmxpY3Qgd2l0aCAiU3VwcG9ydCBNZWRpYXRlayBTb2MgTVQyNzAxIGRpc3AgcHdt
Igo+IHNlcmllcyBXZWlxaW5nIHNlbnQgbGFzdCB3ZWVrLCB3aGljaCBhZGQgZGlzcC1ibHMgc3Vw
cG9ydCB0byBkaXNwbGF5IHB3bQo+IGRyaXZlci4KPiAKPiBKb2UuQwoKVGhhbmtzLCBJIHdpbGwg
cmVtb3ZlIHRoaXMgcGFydCBhbmQgdXBkYXRlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCgpSZWdh
cmRzLAp5dC5zaGVuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
