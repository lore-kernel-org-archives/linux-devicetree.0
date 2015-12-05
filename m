From: Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: [PATCH v2 03/10] drm/hisilicon: Add hisilicon DRM master driver
Date: Sat, 5 Dec 2015 09:25:25 +0800
Message-ID: <CAGd==06=v52p+NeHUH_0WHBTmaN4QMtswY7B+T3LaS8qOSyc6A@mail.gmail.com>
References: <1448707145-69348-1-git-send-email-xinliang.liu@linaro.org>
 <1448707145-69348-4-git-send-email-xinliang.liu@linaro.org>
 <CAL_Jsq+cr7sQ1eus8Yi-mCMDq9PCZbFTSoPqt9P4a_m-JGKo0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAL_Jsq+cr7sQ1eus8Yi-mCMDq9PCZbFTSoPqt9P4a_m-JGKo0g@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linuxarm <linuxarm@huawei.com>, dri-devel <dri-devel@lists.freedesktop.org>, Wei Xu <xuwei5@hisilicon.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, zourongrong@huawei.com, Yiping Xu <xuyiping@hisilicon.com>, Jonathan Corbet <corbet@lwn.net>, Wang Fei <w.f@huawei.com>, lijianhua@huawei.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bintian Wang <bintian.wang@huawei.com>, Chen Feng <puck.chen@hisilicon.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Andy Green <andy.green@linaro.org>, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, Haojian Zhuang <haojian.zhuang@linaro.org>
List-Id: devicetree@vger.kernel.org

T24gNCBEZWNlbWJlciAyMDE1IGF0IDAwOjIxLCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
PiB3cm90ZToKPiBPbiBTYXQsIE5vdiAyOCwgMjAxNSBhdCA0OjM4IEFNLCBYaW5saWFuZyBMaXUg
PHhpbmxpYW5nLmxpdUBsaW5hcm8ub3JnPiB3cm90ZToKPj4gQWRkIERSTSBtYXN0ZXIgZHJpdmVy
IGZvciBoaTYyMjAgU29DIHdoaWNoIHVzZWQgaW4gSGlLZXkgYm9hcmQuCj4+IEFkZCBkdW1iIGJ1
ZmZlciBmZWF0dXJlLgo+PiBBZGQgcHJpbWUgZG1hYnVmIGZlYXR1cmUuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IFhpbmxpYW5nIExpdSA8eGlubGlhbmcubGl1QGxpbmFyby5vcmc+Cj4+IFNpZ25lZC1v
ZmYtYnk6IFhpbndlaSBLb25nIDxrb25nLmtvbmd4aW53ZWlAaGlzaWxpY29uLmNvbT4KPj4gU2ln
bmVkLW9mZi1ieTogQW5keSBHcmVlbiA8YW5keS5ncmVlbkBsaW5hcm8ub3JnPgo+PiAtLS0KPgo+
PiArc3RhdGljIGludCBoaXNpX2dlbV9jbWFfZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpm
aWxlLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
ZHJtX21vZGVfY3JlYXRlX2R1bWIgKmFyZ3MpCj4+ICt7Cj4+ICsgICAgICAgaW50IG1pbl9waXRj
aCA9IERJVl9ST1VORF9VUChhcmdzLT53aWR0aCAqIGFyZ3MtPmJwcCwgOCk7Cj4KPiBCVFcsIGlz
IGFyZ3MtPmJwcCBzdXBwb3NlZCB0byBiZSBiaXRzIG9yIGJ5dGVzPyBJJ20gdXNpbmcgeW91ciBk
dW1iIGJvCj4gc3VwcG9ydCBpbiBkcm1fZ3JhbGxvYyB3aGljaCBkb2VzIGJ5dGVzIGFzIHRoYXQg
aXMgd2hhdAo+IGdyYWxsb2NfZHJtX2dldF9icHAgcmV0dXJucy4gVGhlIHZpcnRpby1ncHUgZHJp
dmVyIGRvZXMgYml0cy4gSSdtCj4gZ3Vlc3NpbmcgYml0cyBpcyBjb3JyZWN0LgoKeWVzLCBpdCBp
cyBiaXRzLiBBbmQgcGl0Y2ggaXMgYnl0ZXMuCgo+Cj4gUm9iCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
