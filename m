From: Jianwei Wang <jianwei.wang.chn@gmail.com>
Subject: Re: [PATCH v14 3/6] drm/panel: simple: Add support for NEC
 NL4827HC19-05B 480x272 panel
Date: Fri, 14 Aug 2015 20:13:36 -0400
Message-ID: <CANk3uyBZuBOZNHqNmiRTcFAEH6BOXhD2sS=EKsY_EHfzjY406Q@mail.gmail.com>
References: <1438158605-28248-1-git-send-email-jianwei.wang.chn@gmail.com>
 <1438158605-28248-4-git-send-email-jianwei.wang.chn@gmail.com>
 <20150813122312.GC11095@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150813122312.GC11095@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, Xiubo Li <lixiubo@cmss.chinamobile.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Alison Wang <b18965@freescale.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, scottwood@freescale.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBBdWcgMTMsIDIwMTUgYXQgODoyMyBBTSwgVGhpZXJyeSBSZWRpbmcKPHRoaWVycnku
cmVkaW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBKdWwgMjksIDIwMTUgYXQgMDQ6MzA6
MDJQTSArMDgwMCwgSmlhbndlaSBXYW5nIHdyb3RlOgo+PiBUaGlzIGFkZHMgc3VwcG9ydCBmb3Ig
dGhlIE5FQyBOTDQ4MjdIQzE5LTA1QiA0ODB4MjcyIHBhbmVsIHRvIHRoZSBEUk0KPj4gc2ltcGxl
IHBhbmVsIGRyaXZlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQWxpc29uIFdhbmcgPGIxODk2NUBm
cmVlc2NhbGUuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBYaXVibyBMaSA8bGl4aXVib0BjbXNzLmNo
aW5hbW9iaWxlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmlhbndlaSBXYW5nIDxqaWFud2VpLndh
bmcuY2huQGdtYWlsLmNvbT4KPj4gQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Cj4+IC0tLQo+PiAgLi4uL2JpbmRpbmdzL3BhbmVsL25lYyxubDQ4MjdoYzE5
XzA1Yi50eHQgICAgICAgICAgfCAgNyArKysrKysKPj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1zaW1wbGUuYyAgICAgICAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKwo+
PiAgMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BhbmVsL25lYyxubDQ4MjdoYzE5
XzA1Yi50eHQKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wYW5lbC9uZWMsbmw0ODI3aGMxOV8wNWIudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BhbmVsL25lYyxubDQ4MjdoYzE5XzA1Yi50eHQKPj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMC4uMjBlOTQ3Mwo+PiAtLS0gL2Rldi9udWxsCj4+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wYW5lbC9uZWMsbmw0ODI3aGMx
OV8wNWIudHh0Cj4+IEBAIC0wLDAgKzEsNyBAQAo+PiArTkVDIExDRCBUZWNobm9sb2dpZXMsTHRk
LiBXUVZHQSBURlQgTENEIHBhbmVsCj4+ICsKPj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4+ICst
IGNvbXBhdGlibGU6IHNob3VsZCBiZSAibmVjLG5sNDgyN2hjMTlfMDViIgo+Cj4gVW5kZXJzY29y
ZXMgYXJlIGRlcHJlY2F0ZWQgaW4gY29tcGF0aWJsZSBzdHJpbmdzLCBzbyBJJ3ZlIGFwcGxpZWQg
dGhpcwo+IHdpdGggIm5lYyxubDQ4MjdoYzE5LTA1YiIuCj4KPiBUaGllcnJ5CgpPa2F5LCB0aGFu
a3MuCgpKaWFud2VpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
