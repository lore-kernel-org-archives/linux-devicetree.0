From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with
 idk-1110wr display
Date: Thu, 29 Aug 2019 11:08:19 +0000
Message-ID: <TY1PR01MB17706E2BF89687B4027F86E0C0A20@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1567074107-4899-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567074107-4899-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdW7asYJGC2+c-4=a6006K2WMjEAAigBLA+MTaFip03R+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAMuHMdW7asYJGC2+c-4=a6006K2WMjEAAigBLA+MTaFip03R+Q@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, DRI Development <dri-devel@lists.freedesktop.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Biju Das <biju.das@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>, Thierry Reding <thierry.reding@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>, "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
List-Id: devicetree@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAyOSBBdWd1c3Qg
MjAxOSAxMTo1MQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gYXJtNjQ6IGR0czogcmVuZXNh
czogQWRkIEhpSG9wZSBSWi9HMk0gYm9hcmQgd2l0aCBpZGstMTExMHdyIGRpc3BsYXkNCj4gDQo+
IEhpIEZhYnJpemlvLA0KPiANCj4gT24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMTI6MjIgUE0gRmFi
cml6aW8gQ2FzdHJvDQo+IDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+IHdyb3RlOg0K
PiA+IFRoZSBIaUhvcGUgUlovRzJNIGlzIGFkdmVydGlzZWQgYXMgY29tcGF0aWJsZSB3aXRoIHBh
bmVsIGlkay0xMTEwd3INCj4gPiBmcm9tIEFkdmFudGVjaCwgaG93ZXZlciB0aGUgcGFuZWwgaXNu
J3Qgc29sZCBhbG9uZ3NpZGUgdGhlIGJvYXJkLg0KPiA+IEEgbmV3IGR0cywgYWRkaW5nIGV2ZXJ5
dGhpbmcgdGhhdCdzIHJlcXVpcmVkIHRvIGdldCB0aGUgcGFuZWwgdG8NCj4gPiB3b3JrIHRoZSBI
aUhvcGUgUlovRzJNLCBpcyB0aGUgbW9zdCBjb252ZW5pZW50IHdheSB0byBzdXBwb3J0IHRoZQ0K
PiA+IEhpSG9wZSBSWi9HMk0gd2hlbiBpdCdzIGNvbm5lY3RlZCB0byB0aGUgaWRrLTExMTB3ci4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJv
QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAt
LS0gL2Rldi9udWxsDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3
NGExLWhpaG9wZS1yemcybS1leC1pZGstMTExMHdyLmR0cw0KPiANCj4gPiArJmdwaW8xIHsNCj4g
PiArICAgICAgIC8qDQo+ID4gKyAgICAgICAgKiBXaGVuIEdQMV8yMCBpcyBMT1cgTFZEUzAgaXMg
Y29ubmVjdGVkIHRvIHRoZSBMVkRTIGNvbm5lY3Rvcg0KPiA+ICsgICAgICAgICogV2hlbiBHUDFf
MjAgaXMgSElHSCBMVkRTMCBpcyBjb25uZWN0ZWQgdG8gdGhlIExUODkxOEwNCj4gPiArICAgICAg
ICAqLw0KPiA+ICsgICAgICAgbHZkcy1jb25uZWN0b3ItZW4tZ3Bpb3sNCj4gDQo+IE1pc3Npbmcg
c3BhY2UgYmVmb3JlIGN1cmx5IGJyYWNlLg0KDQpEb2gsIHRoYW5rIHlvdSBmb3Igc3BvdHRpbmcg
dGhpcywgSSdsbCBzZW5kIGEgdjIuDQoNCkNoZWVycywNCkZhYg0KDQo+IA0KPiBHcntvZXRqZSxl
ZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0K
PiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMy
IC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25z
IHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
LSBMaW51cyBUb3J2YWxkcw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
