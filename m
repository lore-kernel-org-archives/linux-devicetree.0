From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v6 00/12] MT8173 DRM support
Date: Tue, 24 Nov 2015 11:11:52 +0100
Message-ID: <1448359912.3346.34.camel@pengutronix.de>
References: <1447868060-11620-1-git-send-email-p.zabel@pengutronix.de>
 <20151119084040.GL20799@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20151119084040.GL20799@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, YT Shen <yt.shen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

SGkgRGFuaWVsLAoKQW0gRG9ubmVyc3RhZywgZGVuIDE5LjExLjIwMTUsIDA5OjQwICswMTAwIHNj
aHJpZWIgRGFuaWVsIFZldHRlcjoKPiBPbiBXZWQsIE5vdiAxOCwgMjAxNSBhdCAwNjozNDowOFBN
ICswMTAwLCBQaGlsaXBwIFphYmVsIHdyb3RlOgo+ID4gSGksCj4gPiAKPiA+IGFub3RoZXIgdXBk
YXRlIHRvIHRoZSBNVDgxNzMgRFJNIHN1cHBvcnQgcGF0Y2hzZXQuIFNpbmNlIHRoZSBkZXZpY2Ug
dHJlZQo+ID4gYmluZGluZ3MgYXJlIG5vdyBpbiBvcmRlciwgSSBoYXZlIGRyb3BwZWQgdGhlIFJG
Qy4KPiA+IFRoZSBpcnEgaGFuZGxlciBpcyBzdGlsbCB3cml0aW5nIHRvIGhhcmR3YXJlIHJlZ2lz
dGVycywgYXMgb24gTVQ4MTczIHZibGFuawo+ID4gc3luY2hyb25pc2VkIHJlZ2lzdGVyIHVwZGF0
ZXMgbmVlZCBoZWxwIGZyb20gYSBzZXBhcmF0ZSBoYXJkd2FyZSBjb21tYW5kCj4gPiBxdWV1ZSB1
bml0LiBBIGRyaXZlciBmb3IgdGhhdCBpcyBjdXJyZW50bHkgYmVpbmcgd3JpdHRlbiwgc28gdGhp
cyB3aWxsIGJlCj4gPiBmaXhlZCBsYXRlci4KPiAKPiBJbW8gdGhpcyBpcyBtaW5vciBlbm91Z2gg
dGhhdCBpdCBzaG91bGRuJ3QgYmxvY2sgbWVyZ2luZywgYW5kIG90aGVyd2lzZQo+IHRoZSBkcml2
ZXIgbG9va3MgcmF0aGVyIG5lYXQuIE9uY2UgeW91IGhhdmUgYWNrcyBmb3IgdGhlIGFybS9jbGsg
cGFydHMgSQo+IHRoaW5rIHlvdSBzaG91bGQganVzdCBzZW5kIGEgcHVsbCByZXF1ZXN0cyBmb3Ig
dGhpcyB0byBEYXZlIGZvciA0LjUuIEFuZAo+IHllcywgdGhhdCBtZWFucyBBY2tlZC1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gKHRvbyBsYXp5Cj4gdG8gZG8gYSBm
dWxsIHJldmlldyBhZ2FpbikgZm9yIHRoZSBkcm0gc2lkZS4KPiAKPiBDaGVlcnMsIERhbmllbAoK
VGhhbmsgeW91LiBHaXZlbiBUb21hc3onIHJldmlldyBhbmQgdGhlIGZhY3QgdGhhdCB0aGlzIGRy
aXZlciBuZWVkcyB0aGUKbXRrLXNtaSBjb2RlLCBJIHRoaW5rIEknbGwgc3RpbGwgc2VuZCBhdCBs
ZWFzdCBvbmUgbW9yZSB2ZXJzaW9uLgpPbmNlIHJlYWR5LCBJJ2xsIGRvIGFzIHlvdSBzdWdnZXN0
LgoKcmVnYXJkcwpQaGlsaXBwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
