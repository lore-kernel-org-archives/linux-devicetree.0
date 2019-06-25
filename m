From: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [EXT] Re: [PATCH v3 2/2] drm/panel: Add support for Raydium
 RM67191 panel driver
Date: Tue, 25 Jun 2019 06:35:22 +0000
Message-ID: <1561444522.9328.90.camel@nxp.com>
References: <1561037428-13855-1-git-send-email-robert.chiras@nxp.com>
         <1561037428-13855-3-git-send-email-robert.chiras@nxp.com>
         <CAOMZO5DS2v15h9E=qKg2vKuFkBSQQwdBHA5Th5mZ+ca6DWgQsw@mail.gmail.com>
         <1561362278.9328.83.camel@nxp.com>
         <CAOMZO5CVPJqE0dR2PZvKem4WHztvTF=FT9K1x-b7TduH-yYb7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5CVPJqE0dR2PZvKem4WHztvTF=FT9K1x-b7TduH-yYb7A@mail.gmail.com>
Content-Language: en-US
Content-ID: <69D73729C5F450408E57281FD899F24F@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "festevam@gmail.com" <festevam@gmail.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sam@ravnborg.org" <sam@ravnborg.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "airlied@linux.ie" <airlied@linux.ie>
List-Id: devicetree@vger.kernel.org

T24gTHUsIDIwMTktMDYtMjQgYXQgMTM6MTIgLTAzMDAsIEZhYmlvIEVzdGV2YW0gd3JvdGU6DQo+
IENhdXRpb246IEVYVCBFbWFpbA0KPiANCj4gSGkgUm9iZXJ0LA0KPiANCj4gT24gTW9uLCBKdW4g
MjQsIDIwMTkgYXQgNDo0NCBBTSBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+
DQo+IHdyb3RlOg0KPiANCj4gPiANCj4gPiA+IA0KPiA+ID4gWW91IGRpZCBub3QgaGFuZGxlIHRo
ZSAicG93ZXIiIHJlZ3VsYXRvci4NCj4gPiBUaGVyZSBpcyBubyBuZWVkIGZvciBhIHBvd2VyIHJl
Z3VsYXRvci4NCj4gSSBhbSBzdXJlIHRoZSBwYW5lbCByZXF1aXJlcyBwb3dlciB0byBiZSBhcHBs
aWVkIHNvIHRoYXQgaXQgY2FuIHdvcmsNCj4gOi0pDQpZZXMsIG9mIGNvdXJzZSB0aGVyZSBhcmUg
cG93ZXIgbGluZXMgdG8gdGhlIHBhbmVsLiBJIHdpbGwgYWRkIHRoZW0gdG8NCnRoZSBuZXh0IHJl
dmlzaW9uLg0KPiANCj4gPiANCj4gPiA+IA0KPiA+ID4gQ2FuJ3QgeW91IHNpbXBseSByZW1vdmUg
dGhlbT8NCj4gPiBUaGUgcmVzZXQgZ3BpbyBwaW4gaXMgc2hhcmVkIGJldHdlZW4gdGhlIERTSSBk
aXNwbGF5IGNvbnRyb2xsZXIgYW5kDQo+IExvb2tpbmcgYXQgdGhlIGlteDhtcS1ldmsgc2NoZW1h
dGljcyBpdCBpcyBub3QgY2xlYXIgZm9yIG1lIHdoYXQgcGluDQo+IGluIHNoYXJlZCBiZXR3ZWVu
IHRoZSBPTEVEIGRpc3BsYXkgYW5kIHRvdWNoIHNjcmVlbi4NCj4gDQo+IENvdWxkIHlvdSBwbGVh
c2UgY2xhcmlmeSB3aGljaCBwaW4geW91IGFyZSByZWZlcnJpbmcgdG8/DQpJdCdzIGFib3V0IHRo
ZSBEU0lfRU4gcGluIG9uIHRoZSBEU0kgTENEIElGIHBoeXNpY2FsIHBvcnQgSjE1MDEuIFRoaXMN
CmdvZXMgaW50byBSU1RfQl8xVjggb24gdGhlIHBhbmVsIHBvcnQgd2hpY2ggaXMgdXNlZCBmb3Ig
Ym90aCBkaXNwbGF5DQphbmQgdG91Y2ggcmVzZXRzLg0KPiANCj4gPiANCj4gPiB0b3VjaCBjb250
cm9sbGVyLCBib3RoIGZvdW5kIG9uIHRoZSBzYW1lIHBhbmVsLiBTaW5jZSwgdGhlIHRvdWNoDQo+
ID4gZHJpdmVyDQo+ID4gYWxzbyBhY2Nlc2VzIHRoaXMgZ3BpbyBwaW4sIGluIHNvbWUgY2FzZXMg
dGhlIGRpc3BsYXkgY2FuIGJlIHB1dCB0bw0KPiA+IHNsZWVwLCBidXQgdGhlIHRvdWNoIGlzIHN0
aWxsIGFjdGl2ZS4gVGhpcyBpcyB3aHksIGR1cmluZyBzdXNwZW5kIEkNCj4gPiByZWxlYXNlIHRo
ZSBncGlvIHJlc291cmNlLCBhbmQgSSBoYXZlIHRvIHRha2UgaXQgYmFjayBpbiByZXN1bWUuDQo+
ID4gV2l0aG91dCB0aGlzIHJlbGVhc2UvYWNxdWlyZSBtZWNoYW5pc20gZHVyaW5nIHN1c3BlbmQv
cmVzdW1lLA0KPiA+IHN0cmVzcy0NCj4gPiB0ZXN0cyBzaG93ZWQgc29tZSBmYWlsdXJlczogdGhl
IHJlc3VtZSBmcmVlemVzIGNvbXBsZXRseS4NCj4gTG9va2luZyBhdCB0aGUgaW14OG1xLWV2ayBk
dHMgZnJvbSB0aGUgdmVuZG9yIHRyZWUgSSBzZWUgdGhhdCB0aGUNCj4gdG91Y2hzY3JlZW4gaXMg
bm90IHN1cHBvcnRlZCBpbiBtYWlubGluZSB5ZXQuDQo+IA0KPiBNYXliZSB0aGVyZSBpcyBhIGJl
dHRlciB3YXkgdG8gc29sdmUgdGhpcywgc28gd2hhdCBpZiB5b3UgZG9uJ3QNCj4gaW50cm9kdWNl
IHRoZSBzdXNwZW5kL3Jlc3VtZSBob29rcyBmb3Igbm93IGFuZCB0aGVuIHdlIHJldmlzaXQgdGhp
cw0KPiBhZnRlciB0aGUgdG91Y2hzY3JlZW4gZHJpdmVyIGlzIGFkZGVkPw0KWW91IGFyZSByaWdo
dC4gV2UgY2FuIGRvIHRoaXMgdG9vLiBJIHdpbGwgcmVtb3ZlIGl0IGZvciBub3cu
