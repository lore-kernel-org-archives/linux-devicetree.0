From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH V4 5/6] dw-hdmi: add support for multi byte register width
 access
Date: Sat, 08 Nov 2014 11:19:42 +0800
Message-ID: <545D8BCE.1030202@rock-chips.com>
References: <1415360068-8606-1-git-send-email-andy.yan@rock-chips.com>	
 <1415360125-8655-1-git-send-email-andy.yan@rock-chips.com>
 <1415360707.2776.1.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415360707.2776.1.camel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, rmk+kernel@arm.linux.org.uk, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

Ck9uIDIwMTTlubQxMeaciDA35pelIDE5OjQ1LCBMdWNhcyBTdGFjaCB3cm90ZToKPiBBbSBGcmVp
dGFnLCBkZW4gMDcuMTEuMjAxNCwgMTk6MzUgKzA4MDAgc2NocmllYiBBbmR5IFlhbjoKPj4gT24g
cm9ja2NoaXAgcmszMjg4LCBvbmx5IHdvcmQoMzItYml0KSBhY2Nlc3NlcyBhcmUKPj4gcGVybWl0
dGVkIGZvciBoZG1pIHJlZ2lzdGVycy4gIEJ5dGUgd2lkdGggYWNjZXNzICh3cml0ZWIsCj4+IHJl
YWRiKSBnZW5lcmF0ZXMgYW4gaW1wcmVjaXNlIGV4dGVybmFsIGFib3J0Lgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+IC0tLQo+PiAgIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvZHdfaGRtaS5jIHwgNDkgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9kd19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R3X2hkbWkuYwo+PiBpbmRleCBk
Zjc2YThjLi45ODY3NjQyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R3
X2hkbWkuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R3X2hkbWkuYwo+PiBAQCAt
MTI2LDE5ICsxMjYsNDIgQEAgc3RydWN0IGR3X2hkbWkgewo+IFsuLi5dCj4+ICsJdTMyIHZhbDsK
Pj4gKwo+PiArCWlmICghb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJyZWctaW8td2lkdGgiLCAm
dmFsKSkgewo+PiArCQlzd2l0Y2ggKHZhbCkgewo+PiArCQljYXNlIDQ6Cj4+ICsJCQloZG1pLT53
cml0ZSA9IGR3X2hkbWlfd3JpdGVsOwo+PiArCQkJaGRtaS0+cmVhZCA9IGR3X2hkbWlfcmVhZGw7
Cj4+ICsJCQloZG1pLT5yZWdfc2hpZnQgPSAyOwo+PiArCQkJYnJlYWs7Cj4+ICsJCWRlZmF1bHQ6
Cj4+ICsJCQloZG1pLT53cml0ZSA9IGR3X2hkbWlfd3JpdGViOwo+PiArCQkJaGRtaS0+cmVhZCA9
IGR3X2hkbWlfcmVhZGI7Cj4+ICsJCQloZG1pLT5yZWdfc2hpZnQgPSAwOwo+PiArCQkJYnJlYWs7
Cj4+ICsJCX0KPj4gKwl9IGVsc2Ugewo+PiArCQloZG1pLT53cml0ZSA9IGR3X2hkbWlfd3JpdGVi
Owo+PiArCQloZG1pLT5yZWFkID0gZHdfaGRtaV9yZWFkYjsKPj4gKwkJaGRtaS0+cmVnX3NoaWZ0
ID0gMDsKPj4gKwl9Cj4+ICAgCj4+ICAgCWRkY19ub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShucCwg
ImRkYy1pMmMtYnVzIiwgMCk7Cj4+ICAgCWlmIChkZGNfbm9kZSkgewo+IFRoaXMgc2hvdWxkIHRo
cm93IGFuIGVycm9yIGlmIHRoZSBwcm9wZXJ0eSB2YWx1ZSBpbiBkZXZpY2V0cmVlIGlzIG5vdAo+
IHJlY29nbml6ZWQuIFRoaXMgY291bGQgYmUgc2ltcGxpZmllZCBsaWtlIHRoaXM6Cj4KPiAJdTMy
IHZhbCA9IDE7Cj4KPiAJLy8gdGhpcyB3b24ndCB0b3VjaCB2YWwgaWYgaXQgY2FuJ3QgZmluZCB0
aGUgcHJvcGVydHkKPiAJb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJyZWctaW8td2lkdGgiLCAm
dmFsKQo+Cj4KPiAJc3dpdGNoICh2YWwpIHsKPiAJY2FzZSA0Ogo+IAkJaGRtaS0+d3JpdGUgPSBk
d19oZG1pX3dyaXRlbDsKPiAJCWhkbWktPnJlYWQgPSBkd19oZG1pX3JlYWRsOwo+IAkJaGRtaS0+
cmVnX3NoaWZ0ID0gMjsKPiAJCWJyZWFrOwo+IAljYXNlIDE6Cj4gCQloZG1pLT53cml0ZSA9IGR3
X2hkbWlfd3JpdGViOwo+IAkJaGRtaS0+cmVhZCA9IGR3X2hkbWlfcmVhZGI7Cj4gCQloZG1pLT5y
ZWdfc2hpZnQgPSAwOwo+IAkJYnJlYWs7Cj4gCWRlZmF1bHQ6Cj4gCQlkZXZfZXJyKGRldiwgInVu
cmVjb2duaXplZCB2YWx1ZSBmb3IgcmVnLWlvLXdpZHRoIik7Cj4gCQkvLyBlcnJvciBoYW5kbGlu
Zwo+IAl9Cj4KPiBBbHNvIHRoZSBEVCBiaW5kaW5nIGRvYyBmb3IgdGhpcyBwcm9wZXJ0eSBpcyBt
aXNzaW5nLgo+Cj4gUmVnYXJkcywKPiBMdWNhcwp0aGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbiwg
SSB3aWxsIHRha2UgaXQuCnRoaXMgcHJvcGVyaXR5IGlzIG9wdGlvbmFsLCBJIHdpbGwgYWRkIGl0
IHRvIERUIGJpbmRpbmcgZG9jCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkZXZlbCBtYWlsaW5nIGxpc3QKZGV2ZWxAbGludXhkcml2ZXJwcm9qZWN0Lm9y
ZwpodHRwOi8vZHJpdmVyZGV2LmxpbnV4ZHJpdmVycHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcml2ZXJkZXYtZGV2ZWwK
