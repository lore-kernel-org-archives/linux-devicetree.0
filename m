From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 3/5] Documentation: Add device tree binding for
 Goldfish FB driver
Date: Thu, 26 Oct 2017 22:10:56 -0500
Message-ID: <20171027031056.scmky5n5vbbnldmc@rob-hp-laptop>
References: <1508510055-6167-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1508510055-6167-4-git-send-email-aleksandar.markovic@rt-rk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1508510055-6167-4-git-send-email-aleksandar.markovic@rt-rk.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, Raghu Gandham <raghu.gandham@mips.com>, Aleksandar Markovic <aleksandar.markovic@mips.com>, devicetree@vger.kernel.org, Goran Ferenc <goran.ferenc@mips.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Petar Jovanovic <petar.jovanovic@mips.com>, Miodrag Dinic <miodrag.dinic@mips.com>, James Hogan <james.hogan@mips.com>, Douglas Leung <douglas.leung@mips.com>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBPY3QgMjAsIDIwMTcgYXQgMDQ6MzM6MzZQTSArMDIwMCwgQWxla3NhbmRhciBNYXJr
b3ZpYyB3cm90ZToKPiBGcm9tOiBBbGVrc2FuZGFyIE1hcmtvdmljIDxhbGVrc2FuZGFyLm1hcmtv
dmljQG1pcHMuY29tPgo+IAo+IEFkZCBkb2N1bWVudGF0aW9uIGZvciBEVCBiaW5kaW5nIG9mIEdv
bGRmaXNoIEZCIGRyaXZlci4gVGhlIGNvbXBhdGlibGUKPiBzdHJpbmcgdXNlZCBieSBPUyBmb3Ig
YmluZGluZyB0aGUgZHJpdmVyIGlzICJnb29nbGUsZ29sZGZpc2gtZmIiLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE1pb2RyYWcgRGluaWMgPG1pb2RyYWcuZGluaWNAbWlwcy5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogR29yYW4gRmVyZW5jIDxnb3Jhbi5mZXJlbmNAbWlwcy5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogQWxla3NhbmRhciBNYXJrb3ZpYyA8YWxla3NhbmRhci5tYXJrb3ZpY0BtaXBzLmNvbT4KPiAt
LS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9nb29nbGUsZ29sZGZpc2gtZmIu
dHh0IHwgMTggKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9nb29nbGUsZ29sZGZpc2gtZmIudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2dvb2dsZSxnb2xkZmlzaC1m
Yi50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9nb29nbGUs
Z29sZGZpc2gtZmIudHh0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwLi45
Y2UwNjE1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2dvb2dsZSxnb2xkZmlzaC1mYi50eHQKPiBAQCAtMCwwICsxLDE4IEBA
Cj4gK0FuZHJvaWQgR29sZGZpc2ggZnJhbWVidWZmZXIKPiArCj4gK0FuZHJvaWQgR29sZGZpc2gg
ZnJhbWVidWZmZXIgZGV2aWNlIHVzZWQgYnkgQW5kcm9pZCBlbXVsYXRvci4KPiArCj4gK1JlcXVp
cmVkIHByb3BlcnRpZXM6Cj4gKwo+ICstIGNvbXBhdGlibGUgOiBzaG91bGQgY29udGFpbiAiZ29v
Z2xlLGdvbGRmaXNoLWZiIgo+ICstIHJlZyAgICAgICAgOiA8cmVnaXN0ZXJzIG1hcHBpbmc+Cj4g
Ky0gaW50ZXJydXB0cyA6IDxpbnRlcnJ1cHQgbWFwcGluZz4KPiArCj4gK0V4YW1wbGU6Cj4gKwo+
ICsJZ29sZGZpc2hfZmJAMWYwMDgwMDAgewoKVXNlIGdlbmVyaWMgbm9kZSBuYW1lczoKCmRpc3Bs
YXktY29udHJvbGxlckAuLi4KCldpdGggdGhhdCwKCkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgoKCj4gKwkJY29tcGF0aWJsZSA9ICJnb29nbGUsZ29sZGZpc2gtZmIiOwo+
ICsJCWludGVycnVwdHMgPSA8MHgxMD47Cj4gKwkJcmVnID0gPDB4MWYwMDgwMDAgMHgwIDB4MTAw
PjsKCkFuIGFkZHJlc3Mgb2Ygb25lIGNlbGwgYW5kIHNpemUgb2YgMiBjZWxscyBpcyBzdHJhbmdl
Li4uCgo+ICsJCWNvbXBhdGlibGUgPSAiZ29vZ2xlLGdvbGRmaXNoLWZiIjsKPiArCX07Cj4gLS0g
Cj4gMi43LjQKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
