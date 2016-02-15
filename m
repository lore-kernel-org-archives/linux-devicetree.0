From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH v10 03/13] drm/mediatek: Add DSI sub driver
Date: Mon, 15 Feb 2016 22:38:10 +0800
Message-ID: <CAGS+omBeiGvB1kmmiC5yg++_xFxk2LEmV_TyiQEv5kiFpguUvA@mail.gmail.com>
References: <1454527562-28154-1-git-send-email-p.zabel@pengutronix.de>
 <1454527562-28154-4-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1454527562-28154-4-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Archit Taneja <architt@codeaurora.org>, Jitao Shi <jitao.shi@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, dri-devel <dri-devel@lists.freedesktop.org>, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Sasha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tfiga@chromium.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

SGkgUGhpbGlwcCwKCkkgdHJpZWQgdXNpbmcgdGhpcyBkcml2ZXIgd2l0aCB0aGUgSml0YW8gU2hp
J3MgbGF0ZXN0IFBhcmFkZSBQUzg2NDAKZHJpdmVyIGZyb20gWzBdLCB3aGljaCBpcyBiYXNlZCBv
biBBcmNoaXQncyByZWNlbnQgRFJNL0RTSSBwYXRjaCBzZXQKWzFdLCBhbmQgdGhlIHBhcmFkZSBi
cmlkZ2UgZHJpdmVyIGZhaWxzIHRvIGZpbmQgaXRzIERTSSBob3N0IHVzaW5nCm9mX2ZpbmRfbWlw
aV9kc2lfaG9zdF9ieV9ub2RlKCkuCgpbMCBdaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
YXRjaC84MTk5MjgxLwpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC84Mjg5
MTgxLwoKVGhpcyBpcyBiZWNhdXNlIG10a19kc2lfcHJvYmUoKSBkb2VzIG5vdCBjYWxsIG1pcGlf
ZHNpX2hvc3RfcmVnaXN0ZXIoKQp0byBhZGQgaXRzZWxmIHRvIHRoZSBob3N0IGxpc3QuCgpPbmUg
bW9yZSBzbWFsbCBjb21tZW50IGJlbG93Li4uCgpPbiBUaHUsIEZlYiA0LCAyMDE2IGF0IDM6MjUg
QU0sIFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+IEZyb206
IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4KPiBUaGlzIHBhdGNoIGFkZCBhIGRybSBlbmNv
ZGVyL2Nvbm5lY3RvciBkcml2ZXIgZm9yIHRoZSBNSVBJIERTSSBmdW5jdGlvbgo+IGJsb2NrIG9m
IHRoZSBNZWRpYXRlayBkaXNwbGF5IHN1YnN5c3RlbSBhbmQgYSBwaHkgZHJpdmVyIGZvciB0aGUg
TUlQSSBUWAo+IEQtUEhZIGNvbnRyb2wgbW9kdWxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSml0YW8g
U2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHAgWmFi
ZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gLS0KPiBDaGFuZ2VzIHNpbmNlIHY5Ogo+ICAt
IGRvbid0IGNyYXNoIG9uIGNsZWFudXAgaWYgdGhlIGNvbm5lY3RvciBzZXR1cCB3YXMgZGVsZWdh
dGVkIHRvIHRoZSBicmlkZ2UKPiAgLSB2YXJpb3VzIGZpeGVzCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9LY29uZmlnICAgICAgIHwgICAzICsKPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL01ha2VmaWxlICAgICAgfCAgIDQgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMgfCAgIDIgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kcnYuaCB8ICAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgICAg
IHwgODY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5oICAgICB8ICA1OCArKysKCkV2ZXJ5dGhpbmcgZGVmaW5lZCBp
biBtdGtfZHNpLmggY2FuIGJlIG1vdmVkIHRvIG10a19kc2kuYywgYW5kIHRoZSAuaApmaWxlIGNh
biBiZSBkZWxldGVkLgoKLURhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
