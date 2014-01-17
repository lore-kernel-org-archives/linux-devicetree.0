From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH v2 13/28] drm/i2c: tda998x: use irq for connection
	status and EDID read
Date: Fri, 17 Jan 2014 18:27:08 +0100
Message-ID: <20140117182708.3758acb1@armhf>
References: <20140109120412.7697d23c@armhf>
	<20140111181432.GB15937@n2100.arm.linux.org.uk>
	<52D18EE9.5030305@gmail.com> <20140112195113.316d0c98@armhf>
	<52D2EC5D.2010800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <52D2EC5D.2010800@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gU3VuLCAxMiBKYW4gMjAxNCAyMDoyNjoyMSArMDEwMApTZWJhc3RpYW4gSGVzc2VsYmFydGgg
PHNlYmFzdGlhbi5oZXNzZWxiYXJ0aEBnbWFpbC5jb20+IHdyb3RlOgoKPiBPbiAwMS8xMi8yMDE0
IDA3OjUxIFBNLCBKZWFuLUZyYW5jb2lzIE1vaW5lIHdyb3RlOgo+ID4gT24gU2F0LCAxMSBKYW4g
MjAxNCAxOTozNToyMSArMDEwMAo+ID4gU2ViYXN0aWFuIEhlc3NlbGJhcnRoIDxzZWJhc3RpYW4u
aGVzc2VsYmFydGhAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPj4gQXQgbGVhc3QgZm9yIHRoZSBE
VCBwYXJ0LCBJJ2Qgc3VnZ2VzdCB0byBub3QgYXNrIGZvciBpbnRlcnJ1cHQgZGlyZWN0bHkKPiA+
PiBidXQgdXNlIGEgcHJvcGVyIGdwaW9zIHByb3BlcnR5LiBUaGUgY2FuIG9mIGNvdXJzZSBiZSBj
b252ZXJ0ZWQgdG8KPiA+PiBwcml2LT5pbnRfaXJxIGluIHNvbWUgdGRhOTk4eF9kdF9wcm9iZS4K
PiA+Cj4gPiBNYXkgeW91IGdpdmUgbWUgbW9yZSBpbmZvcm1hdGlvbj8KPiAKPiBTdXJlLCBzZWUg
WzFdLgo+IAo+IFsxXSBodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1k
ZXZlbC8yMDEzLU1heS8wMzg4MjIuaHRtbAoKVGhhbmtzIGZvciB0aGUgbGluaywgYnV0IEkgc3Rp
bGwgZG9uJ3Qgc2VlIHRoZSBhZHZhbnRhZ2Ugb2YgdGhlIGdwaW8KKHdoaWNoIHZhbHVlPykgb3Zl
ciB0aGUgaXJxIG51bWJlci4KCi0tIApLZW4gYXIgYydoZW50YcOxCXwJICAgICAgKiogQnJlaXpo
IGhhIExpbnV4IGF0YXYhICoqCkplZgkJfAkJaHR0cDovL21vaW5lamYuZnJlZS5mci8KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
