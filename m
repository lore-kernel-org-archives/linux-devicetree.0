From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH v1] ARM: dts: imx6sl-evk: keep sw4 always on
Date: Wed, 4 Jul 2018 08:56:06 +0200
Message-ID: <20180704085606.78bb104b@karo-electronics.de>
References: <CAOMZO5BjOEGWv2dC-bp0BYHq+PhLssEKic+o7ock8_1Dobd=sQ@mail.gmail.com>
 <AM3PR04MB131507901BFEE1A5E426EECBF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <CAOMZO5D8tjnjbwMdLGd7KF7_4PwqRWX8XH8kdcF3-5e-r2YQEA@mail.gmail.com>
 <AM3PR04MB1315E7AED2BCE2265E6C443DF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <CAOMZO5D8v4KM9S4ooHTDbA+vc8BZN_eO_wDuOPA+8Hcq-SmLDw@mail.gmail.com>
 <AM3PR04MB1315C7C7CFF990615732FFBCF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <CAOMZO5AM5VRS7UiWuvAQ8vvTB8OM+iwofuYrbsL_yB9e0Z9Kyg@mail.gmail.com>
 <AM3PR04MB13155B8D567ABEF7EF03249AF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <CAOMZO5BdtxKjQge5ONpnjr1yNVeTJf4u8Gh-fPqpHz7G9ipOTg@mail.gmail.com>
 <1530526335.15665.13.camel@nxp.com> <20180703053843.GC4348@dragon>
 <AM3PR04MB131542D42FCD798FDBBA54BFF5420@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <CAOMZO5BY99f5jjU+73=8WjqwBKr_q2S1mvx90URZUBkgOVn9YA@mail.gmail.com>
 <1530697336.15665.43.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1530697336.15665.43.camel@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robin Gong <yibin.gong@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Anson Huang <anson.huang@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiBXZWQsIDQgSnVsIDIwMTggMDE6NDI6NTQgKzAwMDAgUm9iaW4gR29uZyB3cm90ZToK
PiBPbiDkuowsIDIwMTgtMDctMDMgYXQgMDg6MTAgLTAzMDAsIEZhYmlvIEVzdGV2YW0gd3JvdGU6
Cj4gPiBIaSBBbnNvbiwKPiA+IAo+ID4gT24gVHVlLCBKdWwgMywgMjAxOCBhdCA0OjQ0IEFNLCBB
bnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4KPiA+IHdyb3RlOgo+ID4gCj4gPiA+IAo+
ID4gPiBJdCBpcyBOT1QgZWFzeSB0byBpZGVudGlmeSB3aGljaCBzd2l0Y2ggaXMgY3JpdGljYWwg
b3IgTk9ULCBhbmQKPiA+ID4gZGlmZmVyZW50IHBsYXRmb3Jtcwo+ID4gPiBoYXZlIGRpZmZlcmVu
dCBib2FyZCBkZXNpZ24sIGl0IHdpbGwgaW50cm9kdWNlIG1hbnkgcGxhdGZvcm0KPiA+ID4gc3Bl
Y2lmaWVkIGNvZGUsIHNvIEkgdGhpbmsKPiA+ID4ganVzdCByZXZlcnQgdGhlIHBmdXplMTAwIHN3
aXRjaCBlbmFibGUvZGlzYWJsZSBwYXRjaCBzaG91bGQgYmUgT0sKPiA+ID4gZm9yIG5vdy4KPiA+
IEkgaGF2ZSBzZW50IHRoZSBwZnV6ZTEwMCByZWd1bGF0b3IgcGF0Y2ggcmV2ZXJ0IGFuZCBpdCBp
cyBsaW51eC1uZXh0Cj4gPiBub3cuIFNob3VsZCBwcm9iYWJseSByZWFjaCA0LjE4LXJjNC4KPiA+
IAo+ID4gPiAKPiA+ID4gQWZ0ZXIgYSBjb3VwbGUgb2YgcmVsZWFzZSBjeWNsZXMsIGFkZCB0aGUg
cGZ1emUxMDAgc3dpdGNoCj4gPiA+IGVuYWJsZS9kaXNhYmxlIHBhdGNoCj4gPiA+IGJhY2sgdG8g
c3VwcG9ydCB0aGlzIGZlYXR1cmUsIEkgYmVsaWV2ZSB1c2VycyBzaG91bGQgc3dpdGNoIHRvIG5l
dwo+ID4gPiBkdGIgd2l0aCAicmVndWxhdG9yLWFsd2F5cy1vbiIKPiA+ID4gZXhpc3RpbmcgYWxy
ZWFkeS4KPiA+IFRoYXQgd2lsbCBzdGlsbCBicmVhayBvbGQgZHRiIGNvbXBhdGliaWxpdHkuCj4g
PiAKPiA+IFlvdSBjYW5ub3QgZm9yY2UgdXNlcnMgdG8gdXNlICJyZWd1bGF0b3ItYWx3YXlzLW9u
IiBhbmQgdGhlIG9sZCBkdGJzCj4gPiBuZWVkIHRvIGFsd2F5cyB3b3JrLgo+ID4gCj4gPiBTbyB3
aGF0ZXZlciBuZXcgZmVhdHVyZSB5b3UgbmVlZCB0byBpbnRyb2R1Y2UgaXQgbmVlZHMgdG8gYmUg
ZG9uZSBpbgo+ID4gc3VjaCBhIHdheSB0aGF0IHRoZSBleGlzdGluZyBkdGIncyB3aWxsIGNvbnRp
bnVlIHdvcmtpbmcuCj4gQnV0IGFjdHVhbGx5IGV4aXN0aW5nIGR0YiBpcyBub3QgcmlnaHQgc2lu
Y2UgdGhlIGNyaXRpY2FsIHBvd2VyIHJhaWwKPiBtaXNzaW5nICdyZWd1bGF0b3ItYWx3YXlzLW9u
Jy4gSXQncyBhIGZpeCBwYXRjaCBmb3IgZHRzLCBub3QgcmVsYXRlZAo+IHdpdGggZm9sbG93aW5n
IGR0Yi9rZXJuZWwgYnJlYWsgcnVsZXMsIGp1c3QgYSBzaW1wbGUgZHRzIHBhdGNoLiBXaHkKPiBz
aG91bGQgd2UgbWFrZSBwcm9taXNlIGZvciB0aGUgd3JvbmcgZHRicz8KPgpCZWNhdXNlIHRoZXkg
YXJlIGxpdmluZyBpbiB0aGUgb3V0c2lkZSB3b3JsZCBvbiByZWFsIGRldmljZXMuCgoKTG90aGFy
IFdhw59tYW5uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hcm0ta2VybmVsCg==
