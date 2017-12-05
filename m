From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v3 03/15] dt-bindings: display: sun4i-drm: Add LVDS properties
Date: Tue,  5 Dec 2017 16:10:15 +0100
Message-ID: <17851ba6277b69aa9cd81de5eead62bfed271661.1512486553.git-series.maxime.ripard@free-electrons.com>
References: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard@free-electrons.com>
References: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, jernej.skrabec@siol.net, plaes@plaes.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, icenowy@aosc.io
List-Id: devicetree@vger.kernel.org

U29tZSBjbG9ja3MgYW5kIHJlc2V0cyBzdXBwb3NlZCB0byBkcml2ZSB0aGUgTFZEUyBsb2dpYyBp
biB0aGUgZGlzcGxheQplbmdpbmUgaGF2ZSBiZWVuIG92ZXJsb29rZWQgd2hlbiB0aGUgZHJpdmVy
IHdhcyBmaXJzdCBpbnRyb2R1Y2VkLgoKQWRkIHRob3NlIGFkZGl0aW9uYWwgcmVzb3VyY2VzIHRv
IHRoZSBiaW5kaW5nLCBhbmQgd2UnbGwgZGVhbCB3aXRoIHRoZSBBQkkKc3RhYmlsaXR5IGluIHRo
ZSBjb2RlLgoKU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVl
LWVsZWN0cm9ucy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvc3VueGkvc3VuNGktZHJtLnR4dCB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9zdW54aS9zdW40aS1kcm0udHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3VueGkvc3VuNGktZHJtLnR4dAppbmRleCA1MGNjNzJlZTEx
NjguLmQ0MjU5YTRmNTE3MSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvc3VueGkvc3VuNGktZHJtLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW40aS1kcm0udHh0CkBAIC0xMjEsNiAr
MTIxLDE0IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiBPbiBTb0NzIG90aGVyIHRoYW4gdGhlIEEz
MyBhbmQgVjNzLCB0aGVyZSBpcyBvbmUgbW9yZSBjbG9jayByZXF1aXJlZDoKICAgIC0gJ3Rjb24t
Y2gxJzogVGhlIGNsb2NrIGRyaXZpbmcgdGhlIFRDT04gY2hhbm5lbCAxCiAKK09uIFNvQ3MgdGhh
dCBzdXBwb3J0IExWRFMgKGFsbCBTb0NzIGJ1dCB0aGUgQTEzLCBIMywgSDUgYW5kIFYzcyksIHlv
dQorbmVlZCBvbmUgbW9yZSByZXNldCBsaW5lOgorICAgLSAnbHZkcyc6IFRoZSByZXNldCBsaW5l
IGRyaXZpbmcgdGhlIExWRFMgbG9naWMKKworQW5kIG9uIHRoZSBTb0NzIG5ld2VyIHRoYW4gdGhl
IEEzMSAoc3VuNmkgYW5kIHN1bjhpIGZhbWlsaWVzKSwgeW91CituZWVkIG9uZSBtb3JlIGNsb2Nr
IGxpbmU6CisgICAtICdsdmRzLXBsbCc6IFRoZSBQTEwgdGhhdCBjYW4gYmUgdXNlZCB0byBkcml2
ZSB0aGUgTFZEUyBjbG9jaworCiBEUkMKIC0tLQogCi0tIApnaXQtc2VyaWVzIDAuOS4xCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
