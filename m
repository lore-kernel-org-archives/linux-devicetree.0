From: Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH 1/3] dt-bindings: clk: g12a: New binding for Meson-G12A SoC
Date: Wed, 11 Jul 2018 21:04:53 +0800
Message-ID: <f6f387ff-271b-9b4b-5b6e-072b4e56d840@amlogic.com>
References: <1531134767-29927-1-git-send-email-jian.hu@amlogic.com>
 <1531134767-29927-2-git-send-email-jian.hu@amlogic.com>
 <1531214976.2708.52.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531214976.2708.52.camel@baylibre.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: "Qianggui, song" <qianggui.song@amlogic.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org, "Bo.yang" <bo.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, linux-arm-kernel@lists.infradead.org, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, "Sunny.luo" <sunny.luo@amlogic.com>, linux-clk@vger.kernel.org, "Xingyu.chen" <xingyu.chen@amlogic.com>
List-Id: devicetree@vger.kernel.org

CgpPbiAyMDE4LzcvMTAgMTc6MjksIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gT24gTW9uLCAyMDE4
LTA3LTA5IGF0IDE5OjEyICswODAwLCBKaWFuIEh1IHdyb3RlOgo+PiBBZGQgbmV3IGJpbmRpbmcg
Zm9yIE1lc29uLUcxMkEgU29DIEV2ZXJ5dGhpbmctRWxzZSBwYXJ0Cj4gCj4gbml0cGljazogSSB3
b3VsZCBwcmVmZXIgaWYgdGhlIHdvcmRzICdjbG9jaycgYW5kICdjb250cm9sbGVyJyB3YXMgc29t
ZXdoZXJlIGluCj4gdGhlIGRlc2NyaXB0aW9uLgo+IAo+IE1heWJlICJhZGQgbmV3IGNsb2NrIGNv
bnRyb2xsZXIgY29tcGF0aWJsZSBmb3IgdGhlIEVFIGRvbWFpbiBvZiB0aGUgZzEyYSBTb0MiID8K
ClBhdGNoIDEgYW5kIDIgaGF2ZSBzcXVhc2hlZCwgdGhlIGNvbW1pdCBtZXNzYWdlIGZvY3VzZSB3
aGljaCBvbmXvvJ8KPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogSmlhbiBIdSA8amlhbi5odUBhbWxv
Z2ljLmNvbT4KPj4gLS0tCj4+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Ns
b2NrL2FtbG9naWMsZ3hiYi1jbGtjLnR4dCB8IDEgKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Nsb2NrL2FtbG9naWMsZ3hiYi1jbGtjLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLGd4YmItY2xrYy50eHQKPj4gaW5kZXggZTk1MDU5
OS4uMDgzMzAwNiAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Nsb2NrL2FtbG9naWMsZ3hiYi1jbGtjLnR4dAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvY2xvY2svYW1sb2dpYyxneGJiLWNsa2MudHh0Cj4+IEBAIC05LDYg
KzksNyBAQCBSZXF1aXJlZCBQcm9wZXJ0aWVzOgo+PiAgIAkJImFtbG9naWMsZ3hiYi1jbGtjIiBm
b3IgR1hCQiBTb0MsCj4+ICAgCQkiYW1sb2dpYyxneGwtY2xrYyIgZm9yIEdYTCBhbmQgR1hNIFNv
QywKPj4gICAJCSJhbWxvZ2ljLGF4Zy1jbGtjIiBmb3IgQVhHIFNvQy4KPj4gKwkJImFtbG9naWMs
ZzEyYS1jbGtjIiBmb3IgRzEyQSBTb0MuCj4+ICAgCj4+ICAgLSAjY2xvY2stY2VsbHM6IHNob3Vs
ZCBiZSAxLgo+PiAgIAo+IAo+IC4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
