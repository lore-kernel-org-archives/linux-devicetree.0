From: =?utf-8?B?UGF0cmljayBCcsO8bm4=?= <P.Bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH v2 2/5] ARM: dts: imx53: add srtc node
Date: Tue, 5 Dec 2017 14:20:39 +0000
Message-ID: <3BB206AB2B1BD448954845CE6FF69A8E01CB531C1F@NT-Mail07.beckhoff.com>
References: <20171205140646.30367-1-linux-kernel-dev@beckhoff.com>
 <20171205140646.30367-3-linux-kernel-dev@beckhoff.com>
 <CAOMZO5DiRa1aLFHiFv_-_3J9LLuq-J06FHLQ4o7=r8hrftEpqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5DiRa1aLFHiFv_-_3J9LLuq-J06FHLQ4o7=r8hrftEpqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-dev <linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Noel Vellemans <Noel.Vellemans-8UENEgx6w+makBO8gow8eQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =?utf-8?B?TG90aGFyIFdhw59tYW5u?= <LW@karo->
List-Id: devicetree@vger.kernel.org

PkZyb206IEZhYmlvIEVzdGV2YW0gW21haWx0bzpmZXN0ZXZhbUBnbWFpbC5jb21dDQo+U2VudDog
RGllbnN0YWcsIDUuIERlemVtYmVyIDIwMTcgMTU6MTQNCj5PbiBUdWUsIERlYyA1LCAyMDE3IGF0
IDEyOjA2IFBNLCAgPGxpbnV4LWtlcm5lbC1kZXZAYmVja2hvZmYuY29tPiB3cm90ZToNCj4NCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgIHNydGM6IHNydGNANTNmYTQwMDAgew0KPj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCxpbXg1My1ydGMiLCAi
ZnNsLGlteDI1LXJ0YyI7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiZnNsLGlteDUzLXJ0YyI7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJlZyA9IDwweDUzZmE0MDAwIDB4NDAwMD47DQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGludGVycnVwdHMgPSA8MjQ+Ow0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZ0emljPjsNCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjbGtzIElNWDVfQ0xLX1NSVENfR0FURT47DQo+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImlwZyI7DQo+DQo+
c3J0YyBub2RlIGhhcyBiZWVuIHJlbW92ZWQgaW4gbGludXgtbmV4dC4NCj4NCj5Zb3UgbmVlZCB0
byByZS1hZGQgaXQuDQpUaGFua3MgZm9yIHRoaXMgc3VwZXItZmFzdCByZXNwb25zZXMhDQpJIHdp
bGwgd2FpdCBhIGZldyBkYXlzIGZvciBtb3JlIHJldmlld2VycyBhbmQgdGhlbiBpbnRlZ3JhdGUg
eW91ciBjb21tZW50cyBpbiBhIHYzLiBJZiBub3RoaW5nIG1ham9yIHNob3cgdXAgSSB3aWxsIHdh
aXQgdW50aWwgdGhlIGlteDUzLmR0c2kgcmV2ZXJ0IGxhbmRlZCBpbiBMaW51cyB0cmVlLg0KDQpC
ZXN0IHJlZ2FyZHMsDQpQYXRyaWNrDQoNCkJlY2tob2ZmIEF1dG9tYXRpb24gR21iSCAmIENvLiBL
RyB8IE1hbmFnaW5nIERpcmVjdG9yOiBEaXBsLiBQaHlzLiBIYW5zIEJlY2tob2ZmDQpSZWdpc3Rl
cmVkIG9mZmljZTogVmVybCwgR2VybWFueSB8IFJlZ2lzdGVyIGNvdXJ0OiBHdWV0ZXJzbG9oIEhS
QSA3MDc1DQoNCg0K

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
