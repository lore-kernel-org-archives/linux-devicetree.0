From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: Add LVDS decoder to R-Car V3M
 Eagle
Date: Fri, 9 Mar 2018 11:43:32 +0300
Message-ID: <fd5245a5-5a65-f5f4-6d25-fc5b70060fbe@cogentembedded.com>
References: <1520522643-11756-1-git-send-email-jacopo+renesas@jmondi.org>
 <1520522643-11756-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1520522643-11756-4-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, airlied@linux.ie, horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org, niklas.soderlund@ragnatech.se, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

SGVsbG8hCgpPbiAzLzgvMjAxOCA2OjI0IFBNLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cgo+IFRoZSBS
LUNhciBWM00gRWFnbGUgYm9hcmQgaW5jbHVkZXMgYSB0cmFuc3BhcmVudCBMVkRTIGRlY29kZXIs
IGNvbm5lY3RlZAo+IHRvIHRoZSBvbi1jaGlwIExWRFMgZW5jb2RlciBvdXRwdXQgb24gb25lIHNp
ZGUgYW5kIHRvIEhETUkgZW5jb2Rlcgo+IEFEVjc1MTF3IG9uIHRoZSBvdGhlciBvbmUuCj4gCj4g
QXMgdGhlIGRlY29kZXIgZG9lcyBub3QgbmVlZCBhbnkgY29uZmlndXJhdGlvbiBpdCBoYXMgYmVl
biBzby1mYXIKPiBvbWl0dGVkIGZyb20gRFRTLiBOb3cgdGhhdCBhIGRyaXZlciBmb3IgdHJhbnNw
YXJlbnQgTFZEUyBkZWNvZGVyIGlzCj4gYXZhaWxhYmxlLCBkZXNjcmliZSBpdCBpbiBEVCBhcyB3
ZWxsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1v
bmRpLm9yZz4KPiAtLS0KPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk3MC1l
YWdsZS5kdHMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKystLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDI5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk3MC1lYWdsZS5kdHMgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NzAtZWFnbGUuZHRzCj4gaW5kZXggYzBmZDE0NC4uMGQ2
MmI0MCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NzAt
ZWFnbGUuZHRzCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTcwLWVh
Z2xlLmR0cwo+IEBAIC00Miw2ICs0MiwzMyBAQAo+ICAgCQkJfTsKPiAgIAkJfTsKPiAgIAl9Owo+
ICsKPiArCWx2ZHNfZGVjb2RlciB7CgogICAgSHlwaGVucyBhcmUgcHJlZmVycmVkIHRvIHVuZGVy
c2NvcmVkIGluIHRoZSBub2RlIG5hbWVzLgoKPiArCQljb21wYXRpYmxlID0gInRoaW5lLHRoYzYz
bHZkMTAyNCI7ClsuLi5dCgpNQlIsIFNlcmdlaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
