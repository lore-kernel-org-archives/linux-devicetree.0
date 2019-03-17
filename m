From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 0/7] Timer & SPI support for Allwinner suniv F1C100s
Date: Mon, 18 Mar 2019 01:39:44 +0800
Message-ID: <2485e6c52810df376a0df6eb7f749f35b7b19044.camel@aosc.xyz>
References: <cover.1549875778.git.mesihkilinc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1549875778.git.mesihkilinc@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Mesih Kilinc <mesihkilinc@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

5ZyoIDIwMTktMDItMTHkuIDnmoQgMTI6MjEgKzAzMDDvvIxNZXNpaCBLaWxpbmPlhpnpgZPvvJoK
PiBUaGlzIGlzIGZvbGxvd3VwIHNlcmllcyBmb3IgRjFDMTAwcyBpbml0aWFsIHN1cHBvcnQgcGF0
Y2hzZXQuIAo+IEFsbCBwYXRjaGVzIG1lcmdlZCBleGNlcHQgcGF0Y2ggMSB+IDIgd2hpY2ggaXMg
cmVsYXRlZCB0byB0aW1lci4KPiBJIGFtIHJlc2VuZGluZyB0aG9zZSBzaW5jZSB0aGV5IGFyZSBh
bHJlYWR5IGhhdmUgQWNrZWQgdGFncy4KClBpbmcuCgpDb3VsZCB5b3UgcGxlYXNlIG1lcmdlIHRo
ZXNlIHRpbWVyLXJlbGF0ZWQgcGF0Y2hlcz8KClRoYW5rcyEKSWNlbm93eQoKPiAKPiBPdXIgZHQt
YmluZGluZ3MgZm9yIEYxQzEwMHMgYXJlIG1lcmdlZCwgd2UgY2FuIG5vdyB1c2UgdGhlbSBhdCBv
dXIgCj4gZGV2aWNlIHRyZWUgc291cmNlIC0gcGF0Y2ggMy4KPiAKPiBBbHNvIHRoaXMgc2VyaWVz
IGFkZCBzcGkgc3VwcG9ydCBhbmQgZW5hYmxlcyBzcGkgZmxhc2ggYXQgTGljaGVlLXBpCj4gTmFu
bwo+IGluIHBhdGNoIDQgfiA3LiBUaGlzIHBhdGNoZXMgYXJlIGJhc2VkIG9uIEljZW5vd3kncyB3
b3JrLgo+IAo+IFRoYW5rcyEKPiAKPiBNZXNpaCBLaWxpbmMgKDcpOgo+ICAgZHQtYmluZGluZ3M6
IHRpbWVyOiBBZGQgQWxsd2lubmVyIHN1bml2IHRpbWVyCj4gICBjbG9ja3NvdXJjZTogc3VuNGk6
IGFkZCBhIGNvbXBhdGlibGUgZm9yIHN1bml2Cj4gICBBUk06IGR0czogc3VuaXY6IEFkZCBkdC1i
aW5kaW5nIGhlYWRlcnMgZm9yIEYxQzEwMHMKPiAgIGR0LWJpbmRpbmdzOiBzcGk6IEFkZCBTdXBw
b3J0IGZvciBBbGx3aW5uZXIgRjFDMTAwcwo+ICAgQVJNOiBkdHM6IHN1bml2OiBBZGQgU1BJIGRl
dmljZS10cmVlIG5vZGVzCj4gICBBUk06IGR0czogc3VuaXY6IEFkZCBwaW5tdXggZm9yIFNQSTAg
YW5kIFNQSTEgb2YgRjFDMTAwcwo+ICAgQVJNOiBkdHM6IGYxYzEwMHM6IEFjdGl2YXRlIFNQSSBm
bGFzaCBvbiBMaWNoZWUgUGkgTmFubwo+IAo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkv
c3BpLXN1bjZpLnR4dCAgICAgICAgICB8ICA1ICstCj4gIC4uLi9iaW5kaW5ncy90aW1lci9hbGx3
aW5uZXIsc3VuNGktdGltZXIudHh0ICAgICAgIHwgIDQgKy0KPiAgYXJjaC9hcm0vYm9vdC9kdHMv
c3VuaXYtZjFjMTAwcy1saWNoZWVwaS1uYW5vLmR0cyAgfCAxMyArKysrKysKPiAgYXJjaC9hcm0v
Ym9vdC9kdHMvc3VuaXYtZjFjMTAwcy5kdHNpICAgICAgICAgICAgICAgfCA1Mwo+ICsrKysrKysr
KysrKysrKysrKystLS0KPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1zdW40aS5jICAgICAg
ICAgICAgICAgICAgfCAgNSArLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
