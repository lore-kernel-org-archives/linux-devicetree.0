From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2.1 22/22] dt-bindings: tc358767: add HPD support
Date: Mon, 1 Apr 2019 13:13:08 +0300
Message-ID: <20190401101308.5643-1-tomi.valkeinen@ti.com>
References: <20190326103146.24795-23-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190326103146.24795-23-tomi.valkeinen@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, Lucas Stach <l.stach@pengutronix.de>, Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Jyri Sarha <jsarha@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Benoit Parrot <bparrot@ti.com>
Cc: devicetree@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
List-Id: devicetree@vger.kernel.org

QWRkIERUIHByb3BlcnR5IGZvciBkZWZpbmluZyB0aGUgcGluIHVzZWQgZm9yIEhQRC4KClNpZ25l
ZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+CkNjOiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZwpDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
LS0tCgoqIERyb3BwZWQgdGhlIGludGVycnVwdCBwcm9wZXJ0aWVzCiogUmVuYW1lZCBocGQtbnVt
IHRvIGhwZC1waW4KKiBBZGRlZCB0b3NoaWJhIHByZWZpeCBmb3IgaHBkLXBpbgoKIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Rvc2hpYmEsdGMzNTg3NjcudHh0ICAgICAg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90b3NoaWJhLHRjMzU4
NzY3LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS90b3NoaWJhLHRjMzU4NzY3LnR4dAppbmRleCBlM2Y2YWE2YTIxNGQuLjU4M2M1ZTlkYmU2YiAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL3Rvc2hpYmEsdGMzNTg3NjcudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90b3NoaWJhLHRjMzU4NzY3LnR4dApAQCAtMTIsNiArMTIs
NyBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAgICAgICAgIChhY3RpdmUgaGln
aCBzaHV0ZG93biBpbnB1dCkKICAtIHJlc2V0LWdwaW9zOiBPRiBkZXZpY2UtdHJlZSBncGlvIHNw
ZWNpZmljYXRpb24gZm9yIFJTVFggcGluCiAgICAgICAgICAgICAgICAgKGFjdGl2ZSBsb3cgc3lz
dGVtIHJlc2V0KQorIC0gdG9zaGliYSxocGQtcGluOiBUQzM1ODc2NyBHUElPIHBpbiBudW1iZXIg
dG8gd2hpY2ggSFBEIGlzIGNvbm5lY3RlZCB0byAoMCBvciAxKQogIC0gcG9ydHM6IHRoZSBwb3J0
cyBub2RlIGNhbiBjb250YWluIHZpZGVvIGludGVyZmFjZSBwb3J0IG5vZGVzIHRvIGNvbm5lY3QK
ICAgIHRvIGEgRFBJL0RTSSBzb3VyY2UgYW5kIHRvIGFuIGVEUC9EUCBzaW5rIGFjY29yZGluZyB0
byBbMV1bMl06CiAgICAgLSBwb3J0QDA6IERTSSBpbnB1dCBwb3J0Ci0tIApUZXhhcyBJbnN0cnVt
ZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5u
dXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
