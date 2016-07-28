From: Trent Piepho <tpiepho@kymetacorp.com>
Subject: Re: [PATCH v16 6/6] ARM: socfpga: fpga bridge driver support
Date: Thu, 28 Jul 2016 20:26:50 +0000
Message-ID: <1469737696.30803.152.camel@rtred1test09.kymeta.local>
References: <1454707803-27947-1-git-send-email-atull@opensource.altera.com>
	 <1454707803-27947-7-git-send-email-atull@opensource.altera.com>
	 <1465525089.15779.203.camel@rtred1test09.kymeta.local>
	 <CAC+thW3U_vEre0DovmK7t_oiK5v1evZCBPqpahf+e6aCvmhqLA@mail.gmail.com>
	 <alpine.DEB.2.02.1607281019100.1032@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1607281019100.1032@linuxheads99>
Content-Language: en-US
Content-ID: <386CA76A829DEC49930BFD4EF15396EA@kymetacorp.com>
Sender: linux-doc-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: Andrea Galbusera <gizero@gmail.com>, Rob Herring <robh+dt@kernel.org>, "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>, Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "monstr@monstr.eu" <monstr@monstr.eu>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "delicious.quinoa@gmail.com" <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>, Matthew Gerlach <mge>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDE2LTA3LTI4IGF0IDEwOjIxIC0wNTAwLCBhdHVsbCB3cm90ZToNCj4gPiA+DQo+
ID4gPiBUaGlzIGlzbid0IGdvaW5nIHdvcmsgaWYgbW9yZSB0aGFuIG9uZSBicmlkZ2UgaXMgdXNl
ZC4gIEVhY2ggYnJpZGdlIGhhcw0KPiA+ID4gaXRzIG93biBwcml2IGFuZCB0aHVzIHByaXYtPmwz
X3JlbWFwX3ZhbHVlLiAgRWFjaCBicmlkZ2UncyBwcml2IHdpbGwNCj4gPiA+IGhhdmUganVzdCB0
aGUgYml0IGZvciBpdCdzIG93biByZW1hcCBzZXQuICBUaGUgMm5kIGJyaWRnZSB0byBiZSBlbmFi
bGVkDQo+ID4gPiB3aWxsIHR1cm4gb2ZmIHRoZSAxc3QgYnJpZGdlIHdoZW4gaXQgcmUtd3JpdGUg
dGhlIGwzIHJlZ2lzdGVyLg0KPiA+IA0KPiA+IEkgY2FuIGNvbmZpcm0gdGhpcyBpcyBleGFjdGx5
IHdoYXQgaGFwcGVucyB3aXRoIHRhZw0KPiA+ICJyZWxfc29jZnBnYS00LjEuMjItbHRzaV8xNi4w
Ni4wMl9wciIgb2Ygc29jZnBnYS00LjEuMjItbHRzaSBicmFuY2gNCj4gPiBmcm9tIGFsdGVyYS1v
cGVuc291cmNlL2xpbnV4LXNvY2ZwZ2Egd2hpY2ggaW5jbHVkZXMgbW9yZSBvciBsZXNzIHRoZQ0K
PiA+IGNvZGUgaW4gdGhpcyBwYXRjaC4gSWYgeW91IGhhdmUgMiBicmlkZ2VzIChsdy1ocHMyZnBn
YSBhbmQgaHBzMmZwZ2EpDQo+ID4geW91IGVuZCB1cCB3aXRoIG9ubHkgb25lIG9mIHRoZW0gYmVp
bmcgdmlzaWJsZS4gRWFzaWx5IHNwb3QgYnkgbG9nZ2luZw0KPiA+IGwzX3JlbWFwX3ZhbHVlIGJl
aW5nIHBhc3NlZCB0byByZWdtYXBfd3JpdGUoKS4uLg0KPiA+IA0KPiANCj4gQW5hdG9saWoga2lu
ZGx5IHByb3ZpZGVkIGEgcGF0Y2ggZm9yIHRoaXMgaXNzdWUuICBJJ2xsIHB1c2ggaXQNCj4gdG8g
bXkgZ2l0aHViIHJlcG8gd2hlbiBJIGNhbi4NCg0KSSBzdGlsbCB0aGluayBhIGJldHRlciBzb2x1
dGlvbiB3b3VsZCBiZSB0byBhbGxvdyB0aGUgc3lzY29uIGRyaXZlcg0KbWFuYWdlIHNoYXJlZCBh
Y2Nlc3MuICBUaGUgcHVycG9zZSBvZiBzeXNjb24gaXMgdG8gbWFuYWdlIGFjY2VzcyB0byBhDQpz
aGFyZWQgcmVzb3VyY2UgZnJvbSBtdWx0aXBsZSBkZXZpY2VzLiAgQW5kIHJlZ21hcCBhbHJlYWR5
IGhhcyB0aGUNCmFiaWxpdHkgdG8gY2FjaGUgYSB3cml0ZS1vbmx5IHJlZ2lzdGVyIGFuZCBhbGxv
dyB0aHJlYWQgc2FmZSBhY2Nlc3MgdG8NCm1vZGlmeSBiaXRzIGluIHNhaWQgcmVnaXN0ZXIuICBU
aGUgcHJvYmxlbSBpcyBqdXN0IHRoZSBwYWluIG9mIHRyeWluZyB0bw0KZG8gYW55dGhpbmcgdG8g
c3lzY29uIERUIGJpbmRpbmdzLiAgU29tZXRoaW5nIGxpa2UgIndyaXRlLW9ubHkiIGluIHRoZQ0K
c3lzY29uIGJpbmRpbmcgdGhhdCBzZXRzIGEgY291cGxlIHZhbHVlcyBpbiB0aGUgcmVnbWFwX2Nv
bmZpZyBpcyBhbGwNCnRoYXQncyBuZWNlc3NhcnkuDQoNCk1pZ2h0IGFzIHdlbGwgbm90IHVzZSBz
eXNjb24gYXQgYWxsIGFuZCBoYXZlIHRoZSBicmlkZ2UgZHJpdmVyIG1hcCB0aGUNCmwzcmVncyBp
dHNlbGYsIHNpbmNlIGl0IGRvZXNuJ3QgcmVhbGx5IHVzZSBzeXNjb24gZm9yIGFueXRoaW5nLg0K
