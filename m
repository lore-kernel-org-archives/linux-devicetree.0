From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 6/9] dt-bindings: sun6i-dsi: Add R40 MIPI-DSI compatible (w/
 A64 fallback)
Date: Fri, 14 Jun 2019 00:22:38 +0530
Message-ID: <20190613185241.22800-7-jagan@amarulasolutions.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190613185241.22800-1-jagan@amarulasolutions.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

VGhlIE1JUEkgRFNJIGNvbnRyb2xsZXIgb24gQWxsd2lubmVyIFI0MCBpcyBzaW1pbGFyIG9uCnRo
ZSBvbmUgb24gQTY0IGxpa2UgZG9lc24ndCBhc3NvY2lhdGUgYW55IERTSV9TQ0xLIGdhdGluZy4K
ClNvLCBhZGQgUjQwIGNvbXBhdGlibGUgYW5kIGFwcGVuZCBBNjQgY29tcGF0aWJsZSBhcyBmYWxs
YmFjay4KCkNjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgpDYzogTWFyayBSdXRs
YW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFn
YW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvc3VueGkvc3VuNmktZHNpLnR4dCB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvc3VueGkvc3VuNmktZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQKaW5kZXggZDBjZTUxZmVh
MTAzLi40MzhmMWY5OTlhZWIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3VueGkvc3VuNmktZHNpLnR4dApAQCAtMTMsNiAr
MTMsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogICAtIGNvbXBhdGlibGU6IHZhbHVlIG11c3Qg
YmUgb25lIG9mOgogICAgICogYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaQogICAgICogYWxs
d2lubmVyLHN1bjUwaS1hNjQtbWlwaS1kc2kKKyAgICAqIGFsbHdpbm5lcixzdW44aS1yNDAtbWlw
aS1kc2ksIGFsbHdpbm5lcixzdW41MGktYTY0LW1pcGktZHNpCiAgIC0gcmVnOiBiYXNlIGFkZHJl
c3MgYW5kIHNpemUgb2YgbWVtb3J5LW1hcHBlZCByZWdpb24KICAgLSBpbnRlcnJ1cHRzOiBpbnRl
cnJ1cHQgYXNzb2NpYXRlZCB0byB0aGlzIElQCiAgIC0gY2xvY2tzOiBwaGFuZGxlcyB0byB0aGUg
Y2xvY2tzIGZlZWRpbmcgdGhlIERTSSBlbmNvZGVyCi0tIAoyLjE4LjAuMzIxLmdmZmM2ZmEwZTMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
