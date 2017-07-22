From: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v7 3/3] clk: stm32h7: Add stm32h743 clock driver
Date: Sat, 22 Jul 2017 11:56:26 +0000
Message-ID: <3173625b-9183-41b2-228d-ef3a5271b4a9@st.com>
References: <1500474344-9832-1-git-send-email-gabriel.fernandez@st.com>
 <1500474344-9832-4-git-send-email-gabriel.fernandez@st.com>
 <d999fc79-7b14-da8e-965f-371cf4352dd1@mleia.com>
 <11c37627-a39b-7f2d-d0d4-af312eac8668@st.com>
 <c5264416-754b-6ec8-f9fb-3b0ac2ba3a58@mleia.com>
 <20170721203712.GH19878@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170721203712.GH19878-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Content-ID: <1322052012D2F547B4F74469550B107B-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>linu
List-Id: devicetree@vger.kernel.org

DQoNCk9uIDA3LzIxLzIwMTcgMTA6MzcgUE0sIFN0ZXBoZW4gQm95ZCB3cm90ZToNCj4gT24gMDcv
MjAsIFZsYWRpbWlyIFphcG9sc2tpeSB3cm90ZToNCj4+IEhpIEdhYnJpZWwsDQo+Pg0KPj4gT24g
MDcvMjAvMjAxNyAxMTozMSBBTSwgR2FicmllbCBGRVJOQU5ERVogd3JvdGU6DQo+Pj4gSGkgVmxh
ZGltaXIsDQo+Pj4NCj4+Pg0KPj4+IE9uIDA3LzE5LzIwMTcgMTE6MjAgUE0sIFZsYWRpbWlyIFph
cG9sc2tpeSB3cm90ZToNCj4+Pj4gSGVsbG8gR2FicmllbCwNCj4+Pj4NCj4+Pj4gT24gMDcvMTkv
MjAxNyAwNToyNSBQTSwgZ2FicmllbC5mZXJuYW5kZXpAc3QuY29tIHdyb3RlOg0KPj4+Pj4gRnJv
bTogR2FicmllbCBGZXJuYW5kZXogPGdhYnJpZWwuZmVybmFuZGV6QHN0LmNvbT4NCj4+Pj4+ICsN
Cj4+Pj4+ICsJcmNjOiByY2NANTgwMjQ0MDAgew0KPj4+PiAncmNjJyBhcyBhIGdlbmVyaWMgZGV2
aWNlIG5vZGUgbmFtZSBpcyBhd2t3YXJkLg0KPj4+Pg0KPj4+PiBJIGJlbGlldmUgdGhlIG1haW4g
ZnVuY3Rpb24gb2YgdGhlIGRldmljZSBpcyBjbG9jayBjb250cm9sbGVyICh1bmxpa2VseQ0KPj4+
PiBhIGdlbmVyaWMgcmVzZXQgY29udHJvbGxlciBjYW4gYmUgY29udmVydGVkIGludG8gYSBjbG9j
ayBjb250cm9sbGVyKSwNCj4+Pj4gdGhlIGxvY2F0aW9ucyBvZiB0aGUgZG9jdW1lbnQgYW5kIGRl
dmljZSBkcml2ZXIgYWxzbyBpbmRpY2F0ZSB0aGF0DQo+Pj4+IHByaW1hcmlseSBpdCBpcyBhIGNs
b2NrIGNvbnRyb2xsZXIsIHNvIEkgc3VnZ2VzdCB0byByZXBsYWNlIGRldmljZSBub2RlDQo+Pj4+
IG5hbWUgd2l0aCAnY2xvY2stY29udHJvbGxlcicgbGlrZSBiZWxvdzoNCj4+PiBJIHByZWZlciB0
byBrZWVwIHJjYyBub2RlIG5hbWUsIHRvIGJlIGNvaGVyZW50IHdpdGggdGhlIG90aGVyIFNUDQo+
Pj4gcGxhdGZvcm1zIChTVE0zMkY0L0Y3KQ0KPj4gdGhlIHRoaW5nIGlzLCBhIGRldmljZSBub2Rl
IG5hbWUgaXMgZXhwZWN0ZWQgdG8gY29tcGx5IHdpdGggZVBBUFIgb3INCj4+IHRoZSBkZXZpY2V0
cmVlIHNwZWNpZmljYXRpb24sIHdoaWNoIHNheXMNCj4+DQo+PiAJVGhlIG5hbWUgb2YgYSBub2Rl
IHNob3VsZCBiZSBzb21ld2hhdCBnZW5lcmljLCByZWZsZWN0aW5nDQo+PiAJdGhlIGZ1bmN0aW9u
IG9mIHRoZSBkZXZpY2UgYW5kIG5vdCBpdHMgcHJlY2lzZSBwcm9ncmFtbWluZyBtb2RlbC4NCj4+
DQo+PiBJZiBkZXZpY2V0cmVlIGFuZCBDQ0YgbWFpbnRhaW5lcnMgYXJlIGZpbmUgd2l0aCAncmNj
JywgSSB3b24ndCBvYmplY3QsDQo+PiBteSByb2xlIGlzIGp1c3QgdG8gZW1waGFzaXplIHRoZSBm
b3VuZCBpc3N1ZSBhbmQgcmVjb21tZW5kIHRvIHVzZSBhbm90aGVyDQo+PiBhbmQgbW9yZSBjb21t
b24gbmFtZSAnY2xvY2stY29udHJvbGxlcicsIGl0IGlzIGEgc2ltcGxlIGFuZCBmb3J0dW5hdGVs
eQ0KPj4gYmFja3dhcmQgY29tcGF0aWJsZSBjaGFuZ2UgdG8gb3RoZXIgU1QgcGxhdGZvcm1zIGFz
IHdlbGwuDQo+IFllcy4gSXQgc2hvdWxkIGJlIGdlbmVyaWMgc28gY2xvY2stY29udHJvbGxlciBv
cg0KPiBjbG9jay1yZXNldC1jb250cm9sbGVyIGlzIGFwcHJvcHJpYXRlIGhlcmUuDQo+DQpvayBp
IHdpbGwgY2hhbmdlIG9yZGVyLi4uIHJlc2V0LWNsb2NrLWNvbnRyb2xsZXIgbmFtZSB0byBtYXRj
aCB3aXRoIHJjYy4NCg0KQmVzdCBSZWdhcmRzDQpHYWJyaWVs
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
