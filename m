From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: mali-midgard: Add resets property
Date: Tue, 11 Dec 2018 10:58:23 -0600
Message-ID: <CAL_JsqK9nDaOOe3yjHAdaH92ds=_cudbq-wQee+YBPaCHEE-HQ@mail.gmail.com>
References: <20181210132227.29262-1-narmstrong@baylibre.com>
 <20181210132227.29262-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181210132227.29262-2-narmstrong@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBEZWMgMTAsIDIwMTggYXQgNzoyMiBBTSBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gVGhlIEFtbG9naWMgQVJNIE1hbGkgTWlkZ2FyZCBy
ZXF1aXJlcyByZXNldCBjb250cm9scyB0byBwb3dlciBvbiBhbmQKPiBzb2Z0d2FyZSByZXNldCB0
aGUgR1BVLCBhZGRzIHRoZXNlIGFzIG9wdGlvbmFsIGluIHRoZSBiaW5kaW5ncy4KPgo+IFNpZ25l
ZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiAtLS0K
PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJk
LnR4dCB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlk
Z2FyZC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxp
LW1pZGdhcmQudHh0Cj4gaW5kZXggMThhMmNkZTJlNWYzLi4yNGQ4M2VjOTUyZjEgMTAwNjQ0Cj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRn
YXJkLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJt
LG1hbGktbWlkZ2FyZC50eHQKPiBAQCAtMzcsNiArMzcsOCBAQCBPcHRpb25hbCBwcm9wZXJ0aWVz
Ogo+ICAtIG9wZXJhdGluZy1wb2ludHMtdjIgOiBSZWZlciB0byBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvb3BwL29wcC50eHQKPiAgICBmb3IgZGV0YWlscy4KPgo+ICstIHJlc2V0
cyA6IFBoYW5kbGUgdG8gdGhlIHJlc2V0IGNvbnRyb2xzIGZvciB0aGUgTWFsaSBNaWRnYXJkIGRl
dmljZS4KCkhvdyBtYW55PyBTb3VuZHMgbGlrZSAxLCBidXQgdGhlIGR0cyBoYXMgMi4gVGhlcmUn
cyBhbHNvIGEgc2ltaWxhcgpwYXRjaCBmb3IgQWxsd2lubmVyWzFdLiBJIGRvbid0IHdhbnQgdG8g
c2VlIGEgZGlmZmVyZW50IG51bWJlciBvZgpyZXNldHMgYW5kIGRpZmZlcmVudCBuYW1lcyBmb3Ig
ZWFjaCB2ZW5kb3IuIFNvIGZpcnN0IGZpZ3VyZSBvdXQgaG93Cm1hbnkgcmVzZXRzIHRoZSBJUCBi
bG9jayBoYXMuIFlvdSdsbCBoYXZlIHRvIGZpbmQgc29tZW9uZSB3aXRoIGFjY2Vzcwp0byB0aGUg
VFJNLgoKUm9iCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xMDAzNjU0
LwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
