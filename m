From: Liu Ying <Ying.Liu@freescale.com>
Subject: Re: [PATCH RFC v7 16/21] drm: panel: Add support for Himax HX8369A
 MIPI DSI panel
Date: Mon, 5 Jan 2015 18:05:06 +0800
Message-ID: <54AA61D2.1040002@freescale.com>
References: <1419910451-15268-1-git-send-email-Ying.Liu@freescale.com>
 <1419910451-15268-17-git-send-email-Ying.Liu@freescale.com>
 <20150105085424.GP2711@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150105085424.GP2711@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, linux-kernel@vger.kernel.org, a.hajda@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, andyshrk@gmail.com
List-Id: devicetree@vger.kernel.org

SGkgRGFuaWVsLAoKT24gMDEvMDUvMjAxNSAwNDo1NCBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToK
PiBPbiBUdWUsIERlYyAzMCwgMjAxNCBhdCAxMTozNDowNkFNICswODAwLCBMaXUgWWluZyB3cm90
ZToKPj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIEhpbWF4IEhYODM2OUEgTUlQSSBEU0kg
cGFuZWwuCj4+Cj4+IFJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcu
Y29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBMaXUgWWluZyA8WWluZy5MaXVAZnJlZXNjYWxlLmNvbT4K
Pj4gLS0tCj4+IHY2LT52NzoKPj4gICAqIEFkZHJlc3MgQW5kcnplaiBIYWpkYSdzIGZvbGxvd2lu
ZyBjb21tZW50cy4KPj4gICAqIFNpbXBsaWZ5IHRoZSByZXR1cm4gbG9naWMgaW4gaHg4MzY5YV9k
Y3Nfd3JpdGUoKS4KPj4gICAqIFJlcGxhY2UgdGhlIG1hY3JvIGh4ODM2OWFfZHNpX2luaXRfaGVs
cGVyKCkgd2l0aCBhIGZ1bmN0aW9uIGFycmF5IHRvIGltcHJvdmUKPj4gICAgIHRoZSBjb2RlIHF1
YWxpdHkuCj4+ICAgKiBIYW5kbGUgZXJyb3IgY2FzZXMgZHVyaW5nIGdldHRpbmcgZ3Bpb3MgaW4g
cHJvYmUoKS4KPj4gICAqIEFkZCAnUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFA
c2Ftc3VuZy5jb20+Jy4KPgo+IElmIHlvdSBvbmx5IHVwZGF0ZSBvbmUgcGF0Y2ggaW4gYSBiaWcg
c2VyaWVzIGl0J3MgaW1vIGJldHRlciB0byBqdXN0Cj4gcmVzZW5kIHRoYXQgb25lIHRvIGF2b2lk
IHNwYW1taW5nIHRoZSBtYWlsaW5nIGxpc3Qgd2l0aCBub2lzZS4gSW1vIGl0IGFsc28KPiBoZWxw
cyB0byBrZWVwIHRoZSBkaXNjdXNzaW9uIGFsbCBuaWNlbHkgZ3JvdXBlZCB0b2dldGhlci4KClRo
YW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLiAgSSB3b3VsZCB0cnkgdG8gbWFrZSBwZW9wbGUgaGFw
cHkgYWJvdXQKdGhlIHdheSB0aGUgc2VyaWVzIGlzIHN1Ym1pdHRlZCBmb3IgcmV2aWV3LgoKPgo+
IEluIGFueSBjYXNlIHBsZWFzZSBnaXZlIGEgc2hvcnQgb3ZlcnZpZXcgb2Ygd2hhdCBjaGFuZ2Vk
IGluIHRoZSBjb3Zlcgo+IGxldHRlciB3aGVuIHJlc2VuZGluZyB0aGUgZW50aXJlIHNlcmllcyBz
byB0aGF0IHBlb3BsZSBkb24ndCBoYXZlIHRvIGdvCj4gdGhyb3VnaCBhbGwgdGhlIGludmlkdWFs
IHBhdGNoZXMuCgpZZXMsIGFic29sdXRlbHkuICBJIGdhdmUgc2hvcnQgb3ZlcnZpZXdzIG9mIHdo
YXQgY2hhbmdlZCBpbiB0aGUgdmVyeQpiZWdpbm5pbmcgb2YgdGhlIGNvdmVyIGxldHRlcnMgZnJv
bSB2MiB0byB2OCBhbmQgSSB3aWxsIGRvIHRoaXMgaW4KZXZlcnkgbmVjZXNzYXJ5IGZvbGxvdy11
cCB2ZXJzaW9uLgoKUmVnYXJkcywKTGl1IFlpbmcKCj4gLURhbmllbAo+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
