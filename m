Return-Path: <linaro-kernel-bounces@lists.linaro.org>
Date: Wed, 16 Jul 2014 19:28:15 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 00/14] cpufreq: cpu0: Extend support beyond CPU0, V2
Message-ID: <20140716192815.786b1866@free-electrons.com>
In-Reply-To: <CAKohpo=bUMKa752fBXZTb0WPYMfJtuR5uk7z-YaXYV63fhJWtg@mail.gmail.com>
References: <cover.1404231535.git.viresh.kumar@linaro.org>
 <CAKohpomRttWnCBGEpR3cVsGYniJSnjWUnvtbg21AiYyrUnDjGw@mail.gmail.com>
 <53B4B0B3.9080000@codeaurora.org>
 <CAKohponRv6+rzJnO4cYFhXn6On1+4-KoxFSA2iU_nz130gvsug@mail.gmail.com>
 <20140703221609.11380.6884@quantum>
 <CAKohpomNv_xvcmx03pb8nj=3O33Qt-2Dj2B1q3U46mv5EBtUjA@mail.gmail.com>
 <CAKohpo=Z5gEHOC5q40q8dfQfoNP5-WyhjG1arV99zJiG2c+6Xg@mail.gmail.com>
 <CAKohpo=bUMKa752fBXZTb0WPYMfJtuR5uk7z-YaXYV63fhJWtg@mail.gmail.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-kernel>,
 <mailto:linaro-kernel-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-kernel>
List-Post: <mailto:linaro-kernel@lists.linaro.org>
List-Help: <mailto:linaro-kernel-request@lists.linaro.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-kernel>,
 <mailto:linaro-kernel-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linaro-kernel-bounces@lists.linaro.org
Sender: linaro-kernel-bounces@lists.linaro.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Tomasz Figa <t.figa@samsung.com>, Arvind Chauhan <arvind.chauhan@arm.com>, Rob Herring <rob.herring@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Michal Simek <michal.simek@xilinx.com>, Thomas P Abraham <thomas.ab@samsung.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Jason Cooper <jason@lakedaemon.net>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Gregory =?UTF-8?B?Q2zDqW1lbnQ=?= <gregory.clement@free-electrons.com>, Sachin Kamat <spk.linux@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

RGVhciBWaXJlc2ggS3VtYXIsCgpPbiBXZWQsIDE2IEp1bCAyMDE0IDIxOjMxOjU0ICswNTMwLCBW
aXJlc2ggS3VtYXIgd3JvdGU6Cj4gQ2MnaW5nIFRob21hcywKClRoYW5rcy4gQWxzbyBhZGRpbmcg
SmFzb24gQ29vcGVyLCBBbmRyZXcgTHVubiwgR3LDqWdvcnkgQ2xlbWVudCBhbmQKU2ViYXN0aWFu
IEhlc3NlbGJhcnQgKHRoZSBtdmVidSBwbGF0Zm9ybSBtYWludGFpbmVycywgd2hpY2ggaW5jbHVk
ZQpNYXJ2ZWxsIEFybWFkYSBYUCkuCgo+IE9uIDggSnVseSAyMDE0IDEwOjIwLCBWaXJlc2ggS3Vt
YXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPiB3cm90ZToKPiA+IE9uIDQgSnVseSAyMDE0IDA5
OjUxLCBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPiB3cm90ZToKPiA+PiBZ
ZWFoLCBoYXZpbmcgc29tZXRoaW5nIGxpa2Ugd2hhdCB5b3Ugc3VnZ2VzdGVkIGZyb20gRFQgaXMg
dGhlIHBlcmZlY3QKPiA+PiBzb2x1dGlvbiB0byBnZXQgb3ZlciB0aGlzLiBUaGUgb25seSByZWFz
b24gd2h5IEkgYW0gbm90IHRvdWNoaW5nIHRoYXQgaGVyZQo+ID4+IGlzIHRvIG5vdCBkZWxheSBv
dGhlciBwYXRjaGVzIGp1c3QgYmVjYXVzZSBvZiB0aGF0Lgo+ID4+Cj4gPj4gVGhlcmUgYXJlIHNl
cGFyYXRlIHRocmVhZHMgZ29pbmcgb24gZm9yIHRoYXQgYW5kIHByb2JhYmx5IHNvbWVib2R5Cj4g
Pj4gZWxzZSB3YXMgdHJ5aW5nIHRvIHB1c2ggZm9yIHRoYXQuCj4gPj4KPiA+PiBUaGF0J3MgaXQs
IG5vdGhpbmcgbW9yZS4gSSB3b3VsZCBkZWZpbml0ZWx5IGxpa2UgdG8gdXNlIHRob3NlIGJpbmRp
bmdzIGluc3RlYWQKPiA+PiAgb2YgdGhlIGNyYXp5IHJvdXRpbmVzIHdlIGFyZSB0cnlpbmcgaGVy
ZSwgb25jZSB0aGF0IGlzIGZpbmFsaXplZCA6KQo+ID4KPiA+IERvIHdlIGhhdmUgc29tZSBraW5k
IG9mIGFncmVlbWVudCBmb3IgdGhpcyB0ZW1wb3Jhcnkgc29sdXRpb24/IEFueXdheXMKPiA+IEkg
d2lsbCBraWNrIHRoZSBvdGhlciB0aHJlYWQgYWdhaW4gdG8gcmVzb2x2ZSB0aGUgYmluZGluZ3Mg
c29vbi4KPiAKPiBIaSBNaWtlL1JhZmFlbCwKPiAKPiBUaG9tYXMgaGFzIGEgZGVwZW5kZW5jeSBv
biB0aGUgcGF0Y2ggYWRkaW5nICJmaW5kX3NpYmxpbmdzKCkiOgo+IGh0dHA6Ly93d3cuc3Bpbmlj
cy5uZXQvbGlzdHMvYXJtLWtlcm5lbC9tc2czNDgwODAuaHRtbAo+IAo+IFdvdWxkIGl0IGJlIGZp
bmUgdG8gZ2V0IHRoaXMgdGVtcG9yYXJ5IHNvbHV0aW9uIChPbmx5IHdpdGhpbiBjcHVmcmVxLWNw
dTAKPiBmaWxlLCBzbyB0aGF0IGl0IGRvZXNuJ3QgYmVjb21lIGFuIEFQSSkgZm9yIG5vdyBhbmQg
dXBkYXRpbmcgaXQgbGF0ZXIgb25jZQo+IGJpbmRpbmdzIGFyZSBjbG9zZWQ/Cj4gCj4gSSBoYXZl
IHRyaWVkIHBpbmdpbmcgb24gdGhlIG90aGVyIHRocmVhZCBhcyB3ZWxsLCBidXQgbm8gb25lIHJl
cGxpZWQuCj4gQW5kIGl0IGxvb2tzIHRob3NlIGJpbmRpbmdzIGFyZSBnb2luZyB0byB0YWtlIHNv
bWUgdGltZSB0byBzZXR0bGUuCgpBbHRlcm5hdGl2ZWx5LCBJIGNvdWxkIHJlc3BpbiBteSBBcm1h
ZGEgWFAgc3BlY2lmaWMgY3B1ZnJlcSBkcml2ZXIsCnVudGlsIGEgcHJvcGVyIGNwdWZyZXEtZ2Vu
ZXJpYyBkcml2ZXIgaXMgc29ydGVkIG91dCwgaWYgdGhhdCdzIG5lZWRlZC4KU2luY2UgSSB3YXMg
dG9sZCBieSBWaXJlc2ggdGhhdCB0aGUgY3B1ZnJlcS1nZW5lcmljIGRyaXZlciBzdXBwb3J0aW5n
CmluZGVwZW5kZW50IHBlci1DUFUgY2xvY2tzIHdvdWxkIGJlIG1lcmdlZCBmb3IgMy4xNywgSSBi
YXNlZCBteSBjcHVmcmVxCmRldmVsb3BtZW50IG9uIHRoYXQuIFBsZWFzZSBsZXQgdXMga25vdyBx
dWlja2x5IGlmIHRoYXQncyBub3QgZ29pbmcgdG8KYmUgdGhlIGNhc2UsIHNvIHRoYXQgd2UgY2Fu
IGVuYWJsZSBjcHVmcmVxIG9uIEFybWFkYSBYUCBpbiAzLjE3LCBldmVuCmlmIGl0J3MgZG9uZSB3
aXRoIGEgc2VwYXJhdGUgY3B1ZnJlcSBkcml2ZXIsIHVudGlsIGNwdWZyZXEtZ2VuZXJpYwppc3N1
ZXMgZ2V0IHNvcnRlZCBvdXQuCgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRh
enpvbmksIENUTywgRnJlZSBFbGVjdHJvbnMKRW1iZWRkZWQgTGludXgsIEtlcm5lbCBhbmQgQW5k
cm9pZCBlbmdpbmVlcmluZwpodHRwOi8vZnJlZS1lbGVjdHJvbnMuY29tCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW5hcm8ta2VybmVsIG1haWxpbmcg
bGlzdApsaW5hcm8ta2VybmVsQGxpc3RzLmxpbmFyby5vcmcKaHR0cDovL2xpc3RzLmxpbmFyby5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW5hcm8ta2VybmVsCg==
