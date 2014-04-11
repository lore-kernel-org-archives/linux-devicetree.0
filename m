From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH RESEND 2/5] pinctrl: berlin: add a pinctrl driver for
 Marvell Berlin SoCs
Date: Fri, 11 Apr 2014 14:44:31 +0800
Message-ID: <20140411144431.04fb148d@xhacker>
References: <1397135274-10764-1-git-send-email-antoine.tenart@free-electrons.com>
 <1397135274-10764-3-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1397135274-10764-3-git-send-email-antoine.tenart@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Antoine =?UTF-8?B?VMOpbmFydA==?= <antoine.tenart@free-electrons.com>, "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: Jimmy Xu <zmxu@marvell.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alexandre.belloni@free-electrons.com" <alexandre.belloni@free-electrons.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgQW50b2luZSwKCk9uIFRodSwgMTAgQXByIDIwMTQgMDY6MDc6NTEgLTA3MDAKQW50b2luZSBU
w6luYXJ0IDxhbnRvaW5lLnRlbmFydEBmcmVlLWVsZWN0cm9ucy5jb20+IHdyb3RlOgoKLi4uCj4g
K3N0YXRpYyBpbnQgYmVybGluX3Bpbm11eF9lbmFibGUoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3Ry
bF9kZXYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBmdW5jdGlv
biwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGdyb3VwKQo+ICt7
Cj4gKyAgICAgICBzdHJ1Y3QgYmVybGluX3BpbmN0cmwgKnBjdHJsID0gcGluY3RybF9kZXZfZ2V0
X2RydmRhdGEocGN0cmxfZGV2KTsKPiArICAgICAgIHN0cnVjdCBiZXJsaW5fcGluY3RybF9ncm91
cCAqZ3JvdXBfZGVzYyA9IHBjdHJsLT5ncm91cHMgKyBncm91cDsKPiArICAgICAgIHN0cnVjdCBi
ZXJsaW5fcGluY3RybF9mdW5jdGlvbiAqZnVuY3Rpb25fZGVzYyA9Cj4gKyAgICAgICAgICAgICAg
IHBjdHJsLT5mdW5jdGlvbnMgKyBmdW5jdGlvbjsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgZmxh
Z3M7Cj4gKyAgICAgICB1MzIgcmVndmFsOwo+ICsKPiArICAgICAgIHNwaW5fbG9ja19pcnFzYXZl
KCZwY3RybC0+bG9jaywgZmxhZ3MpOwo+ICsKPiArICAgICAgIHJlZ3ZhbCA9IHJlYWRsKGdyb3Vw
X2Rlc2MtPnJlZyk7Cj4gKyAgICAgICByZWd2YWwgJj0gZ3JvdXBfZGVzYy0+bWFzazsKPiArICAg
ICAgIHJlZ3ZhbCB8PSBmdW5jdGlvbl9kZXNjLT5tdXh2YWwgPDwgZ3JvdXBfZGVzYy0+bHNiOwo+
ICsgICAgICAgd3JpdGVsKHJlZ3ZhbCwgZ3JvdXBfZGVzYy0+cmVnKTsKCkNvdWxkIHdlIHVzZSBy
ZWxheGVkIHZlcnNpb24gaW5zdGVhZD8KClRoYW5rcywKSmlzaGVuZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5n
IGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
