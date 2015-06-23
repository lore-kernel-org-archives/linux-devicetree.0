From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] of: fix a build error to f_graph_get_endpoint_by_regs
 function
Date: Tue, 23 Jun 2015 16:08:47 +0900
Message-ID: <558905FF.7060502@samsung.com>
References: <1435040094-22793-1-git-send-email-inki.dae@samsung.com>
 <20150623164354.00844400@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20150623164354.00844400@canb.auug.org.au>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

SGkgU3RlcGhlbiwKCk9uIDIwMTXrhYQgMDbsm5QgMjPsnbwgMTU6NDMsIFN0ZXBoZW4gUm90aHdl
bGwgd3JvdGU6Cj4gSGkgSW5raSwKPiAKPiBPbiBUdWUsIDIzIEp1biAyMDE1IDE1OjE0OjUzICsw
OTAwIElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4+Cj4+IFRoaXMgcGF0
Y2ggZml4ZXMgdGhlIGJlbG93IGJ1aWxkIGVycm9yIHJlcG9ydGVkIGJ5IFN0ZXBoZW4sCj4+IAlo
dHRwczovL2xrbWwub3JnL2xrbWwvMjAxNS82LzIyLzY2NQo+IAo+IERvbid0IGRvIHRoaXMuICBQ
dXQgdGhlIGVycm9ycyBleHBsaWNpdGx5IGluIHRoZSBtYWlsLiAgbGttbC5vcmcgVVJMcwo+IGFy
ZSBwYXJ0aWN1bGFybHkgYmFkLgoKUG9zdGVkIGl0IGFnYWluLgoKVGhhbmtzLApJbmtpIERhZQoK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
