From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v4 0/7] Add basic support for emtrion emCON-MX6 modules
Date: Sat, 28 Apr 2018 10:34:46 +0800
Message-ID: <20180428023445.GA3693@dragon>
References: <20180420125108.14197-1-jan.tuerk@emtrion.com>
 <20180427132445.3458-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180427132445.3458-1-jan.tuerk@emtrion.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: jan.tuerk@emtrion.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBBcHIgMjcsIDIwMTggYXQgMDM6MjQ6MzVQTSArMDIwMCwgamFuLnR1ZXJrQGVtdHJp
b24uY29tIHdyb3RlOgo+IEZyb206IEphbiBUdWVyayA8amFuLnR1ZXJrQGVtdHJpb24uY29tPgo+
IAo+IENoYW5nZXMgZm9yIHY0Ogo+ICAgLSByZS1hcnJhbmdlIHRoZSBQYXRjaC1zZXJpZXMgdG8g
bWF0Y2ggdGhlIERULXN1Ym1pdHRpbmctcGF0Y2hlcwo+ICAgLSBBZGRpdGlvbmFsIHBhdGNoIGZv
ciB0aGUgRG9jdW1lbnRhdGlvbiBvZiB0aGUgbmV3IERULWJpbmRpbmdzCj4gCj4gW1BBVENIIHY0
IDEvN10gZHQtYmluZGluZ3M6IGRpc3BsYXk6IERvY3VtZW50IHRoZSBFRFQgZXQqIGRpc3BsYXlz
IGluIG9uZSBmaWxlLgo+ICAgLSBubyBjaGFuZ2UgKHJlLWFycmFuZ2VkIDMvNiA9PiAxLzcpCj4g
Cj4gW1BBVENIIHY0IDIvN10gZHJtL3BhbmVsOiBBZGQgc3VwcG9ydCBmb3IgdGhlIEVEVCBFVE0w
NzAwRzBCREg2Cj4gICAtIG5vIGNoYW5nZSAocmUtYXJyYW5nZWQgMS82ID0+IDIvNykKPiAKPiBb
UEFUQ0ggdjQgMy83XSBkcm0vcGFuZWw6IEFkZCBzdXBwb3J0IGZvciB0aGUgRURUIEVUTTA3MDBH
MEVESDYKPiAgIC0gbm8gY2hhbmdlIChyZS1hcnJhbmdlZCAyLzYgPT4gMy83KQoKUGxlYXNlIHNw
bGl0IHRoZSBzZXJpZXMgaW50byB0d28sIERSTSBkcml2ZXIgKGFib3ZlKSBhbmQgcGxhdGZvcm0g
cGFydAooYmVsb3cpLCB0byBhdm9pZCBwb3N0aW5nIG9uZSBwYXJ0IG92ZXIgYW5kIG92ZXIgYWdh
aW4gd2l0aCB6ZXJvCmNoYW5nZXMsIGJ1dCBvbmx5IGJlY2F1c2UgdGhlIG90aGVyIHBhcnQgbmVl
ZHMgdXBkYXRlLgoKU2hhd24KCj4gCj4gW1BBVENIIHY0IDQvN10gQVJNOiBkdHM6IGlteDogQWRk
IGFuIGNwdTAgbGFiZWwgZm9yIGlteDZkbCBkZXZpY2VzLgo+ICAgLSBubyBjaGFuZ2UKPiAKPiBb
UEFUQ0ggdjQgNS83XSBkdC1iaW5kaW5nczogYXJtOiBEb2N1bWVudCBlbXRyaW9uIGVtQ09OLU1Y
NiBiaW5kaW5ncwo+ICAgLSBzZXBhcmF0ZSBwYXRjaCBmb3IgdGhlIGVtdHJpb24gZW1DT04tTVg2
IERULWJpbmRpbmdzCj4gCj4gW1BBVENIIHY0IDYvN10gQVJNOiBkdHM6IEFkZCBzdXBwb3J0IGZv
ciBlbXRyaW9uIGVtQ09OLU1YNiBzZXJpZXMKPiAgIC0gYWxwaGFiZXRpY2FsbHkgc29ydCB0aGUg
RFQKPiAgIC0gbW92ZWQgZHVwbGljYXRlZCBBdmFyaSBiYXNlYm9hcmQgY29kZSBpbnRvIHNlcGFy
YXRlIGZpbGUuCj4gCj4gW1BBVENIIHY0IDcvN10gQVJNOiBpbXhfdjZfdjdfZGVmY29uZmlnOiBF
bmFibGUgREEwOTYzIFBNSUMgc3VwcG9ydC4KPiAgIC0gdW5jaGFnZWQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
