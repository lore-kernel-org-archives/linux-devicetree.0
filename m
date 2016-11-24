From: zhangfei <zhangfei.gao@linaro.org>
Subject: Re: [PATCH 4/6] dt-bindings: change hi6220-reset.txt according to
 reset-hi6220.c
Date: Thu, 24 Nov 2016 08:41:19 +0800
Message-ID: <b5451df3-2af5-1236-f1f4-a70ac2de9a3b@linaro.org>
References: <1479800961-6249-1-git-send-email-zhangfei.gao@linaro.org>
 <1479800961-6249-5-git-send-email-zhangfei.gao@linaro.org>
 <2314383.qiZ3Cq7QsP@wuerfel> <20161123230637.m4cvc2l4huxlf5dd@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161123230637.m4cvc2l4huxlf5dd@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Xinliang Liu <xinliang.liu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, Philipp Zabel <p.zabel@pengutronix.de>, Jiancheng Xue <xuejiancheng@hisilicon.com>, linux-arm-kernel@lists.infradead.org, Xia Qing <saberlily.xia@hisilicon.com>
List-Id: devicetree@vger.kernel.org

SGksIFJvYgoKCk9uIDIwMTblubQxMeaciDI05pelIDA3OjA2LCBSb2IgSGVycmluZyB3cm90ZToK
PiBPbiBUdWUsIE5vdiAyMiwgMjAxNiBhdCAwOTo0ODozMkFNICswMTAwLCBBcm5kIEJlcmdtYW5u
IHdyb3RlOgo+PiBPbiBUdWVzZGF5LCBOb3ZlbWJlciAyMiwgMjAxNiAzOjQ5OjE5IFBNIENFVCBa
aGFuZ2ZlaSBHYW8gd3JvdGU6Cj4+PiAgIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4+PiAgIC0gY29t
cGF0aWJsZTogc2hvdWxkIGJlIG9uZSBvZiB0aGUgZm9sbG93aW5nOgo+Pj4gLSAgLSAiaGlzaWxp
Y29uLGhpNjIyMC1zeXNjdHJsIiwgInN5c2NvbiIgOiBGb3IgcGVyaXBoZXJhbCByZXNldCBjb250
cm9sbGVyLgo+Pj4gLSAgLSAiaGlzaWxpY29uLGhpNjIyMC1tZWRpYWN0cmwiLCAic3lzY29uIiA6
IEZvciBtZWRpYSByZXNldCBjb250cm9sbGVyLgo+Pj4gLS0gcmVnOiBzaG91bGQgYmUgcmVnaXN0
ZXIgYmFzZSBhbmQgbGVuZ3RoIGFzIGRvY3VtZW50ZWQgaW4gdGhlCj4+PiAtICBkYXRhc2hlZXQK
Pj4+ICsgIC0gImhpc2lsaWNvbixoaTYyMjAtcmVzZXQtc3lzY3RybCIgOiBGb3IgcGVyaXBoZXJh
bCByZXNldCBjb250cm9sbGVyLgo+Pj4gKyAgLSAiaGlzaWxpY29uLGhpNjIyMC1yZXNldC1tZWRp
YWN0cmwiIDogRm9yIG1lZGlhIHJlc2V0IGNvbnRyb2xsZXIuCj4+PiArLSBoaXNpLHJzdC1zeXNj
b246IHBoYW5kbGUgb2YgdGhlIHJlc2V0J3Mgc3lzY29uLgo+Pj4gICAtICNyZXNldC1jZWxsczog
MSwgc2VlIGJlbG93Cj4+Pgo+PiBQbGVhc2Uga2VlcCB0aGUgb2xkIHN0cmluZ3MgYXJvdW5kIGZv
ciBjb21wYXRpYmlsaXR5Lgo+IFdoeSBhcmUgdGhlc2UgZXZlbiBjaGFuZ2luZz8gVGhlIGNvbW1p
dCBtZXNzYWdlIHNob3VsZCBzYXkgd2h5LgpIYXZlIHNlbmQgW1JGQyBWMjpQQVRDSCAwLzJdIGFk
ZCByZXNldC1oaTM2NjAKTm90IHRvdWNoaW5nIHRoaXMgZmlsZSBhbnkgbW9yZS4KT25seSBoYW5k
bGUgaGkzNjYwLgoKQnV0IGhpNjIyMCBjYW4gZGlyZWN0bHkgdXNlIHRoZSBkcml2ZXIuCk9ubHkg
bmVlZCBsaXN0IHJlc2V0IGluZm8gdG8gaGk2MjIwLmR0cywgc2FtZSBhcyBoaTM2NjAuCkxpa2UK
KyAgICAgICBpb21jdV9yc3Q6IGlvbWN1X3JzdF9jb250cm9sbGVyIHsKKyAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiaGlzaWxpY29uLGhpMzY2MC1yZXNldCI7CisgICAgICAgICAgICAgICAj
cmVzZXQtY2VsbHMgPSA8MT47CisgICAgICAgICAgICAgICBoaXNpLHJzdC1zeXNjb24gPSA8Jmlv
bWN1PjsKKyAgICAgICAgICAgICAgIGhpc2kscmVzZXQtYml0cyA9IDwweDIwIDB4OCAgICAgICAg
ICAgICAvKiAwOiBpMmMwICovCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgy
MCAweDEwICAgICAgICAgICAgLyogMTogaTJjMSAqLworICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDB4MjAgMHgyMCAgICAgICAgICAgIC8qIDI6IGkyYzIgKi8KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAweDIwIDB4ODAwMDAwMD47ICAgICAvKiAzOiBpMmM2ICov
CisgICAgICAgfTsKClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
