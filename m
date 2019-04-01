From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 0/2] drm/bridge: ti-tfp410: Handle bus-format for 24/12 lines
 selection
Date: Mon, 1 Apr 2019 15:41:41 +0300
Message-ID: <20190401124143.17179-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com, a.hajda@samsung.com, jsarha@ti.com
Cc: airlied@linux.ie, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

SGksCgpUaGUgVEZQNDEwIHN1cHBvcnRzIDI0IGJpdCwgc2luZ2xlLWVkZ2UgYW5kIDEyIGJpdCwg
ZHVhbC1lZGdlIG1vZGVzLgpEZXBlbmRpbmcgb24gaG93IG1hbnkgd2lyZXMgYXJlIHVzZWQgKDI0
LzEyKSB0aGUgZHJpdmVyIGNhbiBzZXQgdGhlIGNvcnJlY3QKYnVzX2Zvcm1hdC4KCkluIGNhc2Ug
dGhlIGJ1cy13aWR0aCBpcyBub3Qgc3BlY2lmaWVkIChvbGQgRFQgYmxvYnMpIGFzc3VtZSAyNCBs
aW5lcyBhcyB0aGUKZHJpdmVyIGFzc3VtZWQgdGhhdCBpbiB0aGUgcGFzdCBhbmQgYWxsIGJvYXJk
cyB1c2luZyB0ZnA0MTAgdWF2ZSB0aGlzIHNldHVwLgoKUmVnYXJkcywKUGV0ZXIKLS0tClBldGVy
IFVqZmFsdXNpICgyKToKICBkdC1iaW5kaW5nczogZGlzcGxheTogdGZwNDEwOiBBZGQgYnVzLXdp
ZHRoIHBhcmFtZXRlciBwcm9wZXJ0eQogIGRybS9icmlkZ2U6IHRpLXRmcDQxMDogU2V0IHRoZSBi
dXNfZm9ybWF0CgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLHRmcDQxMC50eHQgICAg
ICAgfCAxMCArKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jICAg
ICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI2IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tIApQZXRlcgoKVGV4YXMgSW5zdHJ1bWVudHMg
RmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1
c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
