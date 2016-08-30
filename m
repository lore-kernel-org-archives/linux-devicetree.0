From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 10/18] ARM: DT: STiH407: Add i2s_out pinctrl
 configuration
Date: Tue, 30 Aug 2016 11:24:13 +0100
Message-ID: <20160830102413.GU1661@dell>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
 <1472223413-7254-11-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1472223413-7254-11-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: ohad@wizery.com, devicetree@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-remoteproc@vger.kernel.org, patrice.chotard@st.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kraxel@redhat.com, dmaengine@vger.kernel.org, dan.j.williams@intel.com, bjorn.andersson@linaro.org, virtualization@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAyNiBBdWcgMjAxNiwgUGV0ZXIgR3JpZmZpbiB3cm90ZToKCj4gVGhpcyBwYXRjaCBh
ZGRzIHRoZSBwaW5jdHJsIGNvbmZpZyBmb3IgdGhlIGkyc19vdXQgcGlucwo+IHVzZWQgYnkgdGhl
IHVuaXBlcmlmIHBsYXllciBJUC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcm5hdWQgUG91bGlxdWVu
IDxhcm5hdWQucG91bGlxdWVuQHN0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBHcmlmZmlu
IDxwZXRlci5ncmlmZmluQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3N0
aWg0MDctcGluY3RybC5kdHNpIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKCkFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RpaDQwNy1w
aW5jdHJsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdGloNDA3LXBpbmN0cmwuZHRzaQo+IGlu
ZGV4IGE1MzhhZTUuLjBmYjVjOGEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Rp
aDQwNy1waW5jdHJsLmR0c2kKPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdGloNDA3LXBpbmN0
cmwuZHRzaQo+IEBAIC0xMDY3LDYgKzEwNjcsMjkgQEAKPiAgCQkJCX07Cj4gIAkJCX07Cj4gIAo+
ICsJCQlpMnNfb3V0IHsKPiArCQkJCXBpbmN0cmxfaTJzXzhjaF9vdXQ6IGkyc184Y2hfb3V0ewo+
ICsJCQkJCXN0LHBpbnMgewo+ICsJCQkJCQltY2xrID0gPCZwaW8zMyA1IEFMVDEgT1VUPjsKPiAr
CQkJCQkJbHJjbGsgPSA8JnBpbzMzIDcgQUxUMSBPVVQ+Owo+ICsJCQkJCQlzY2xrID0gPCZwaW8z
MyA2IEFMVDEgT1VUPjsKPiArCQkJCQkJZGF0YTAgPSA8JnBpbzMzIDQgQUxUMSBPVVQ+Owo+ICsJ
CQkJCQlkYXRhMSA9IDwmcGlvMzQgMCBBTFQxIE9VVD47Cj4gKwkJCQkJCWRhdGEyID0gPCZwaW8z
NCAxIEFMVDEgT1VUPjsKPiArCQkJCQkJZGF0YTMgPSA8JnBpbzM0IDIgQUxUMSBPVVQ+Owo+ICsJ
CQkJCX07Cj4gKwkJCQl9Owo+ICsKPiArCQkJCXBpbmN0cmxfaTJzXzJjaF9vdXQ6IGkyc18yY2hf
b3V0ewo+ICsJCQkJCXN0LHBpbnMgewo+ICsJCQkJCQltY2xrID0gPCZwaW8zMyA1IEFMVDEgT1VU
PjsKPiArCQkJCQkJbHJjbGsgPSA8JnBpbzMzIDcgQUxUMSBPVVQ+Owo+ICsJCQkJCQlzY2xrID0g
PCZwaW8zMyA2IEFMVDEgT1VUPjsKPiArCQkJCQkJZGF0YTAgPSA8JnBpbzMzIDQgQUxUMSBPVVQ+
Owo+ICsJCQkJCX07Cj4gKwkJCQl9Owo+ICsJCQl9Owo+ICsKPiAgCQkJc2VyaWFsMyB7Cj4gIAkJ
CQlwaW5jdHJsX3NlcmlhbDM6IHNlcmlhbDMtMCB7Cj4gIAkJCQkJc3QscGlucyB7CgotLSAKTGVl
IEpvbmVzCkxpbmFybyBTVE1pY3JvZWxlY3Ryb25pY3MgTGFuZGluZyBUZWFtIExlYWQKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
