From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] media: adv7604: Add support for
 i2c_new_secondary_device
Date: Mon, 29 Jan 2018 14:08:13 -0600
Message-ID: <20180129200813.ifaz2bkkxshiodga@rob-hp-laptop>
References: <1516625389-6362-1-git-send-email-kieran.bingham@ideasonboard.com>
 <1516625389-6362-2-git-send-email-kieran.bingham@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1516625389-6362-2-git-send-email-kieran.bingham@ideasonboard.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBKYW4gMjIsIDIwMTggYXQgMTI6NDk6NTZQTSArMDAwMCwgS2llcmFuIEJpbmdoYW0g
d3JvdGU6Cj4gRnJvbTogSmVhbi1NaWNoZWwgSGF1dGJvaXMgPGplYW4tbWljaGVsLmhhdXRib2lz
QHZvZGFseXMuY29tPgo+IAo+IFRoZSBBRFY3NjA0IGhhcyB0aGlydGVlbiAyNTYtYnl0ZSBtYXBz
IHRoYXQgY2FuIGJlIGFjY2Vzc2VkIHZpYSB0aGUgbWFpbgo+IEnCskMgcG9ydHMuIEVhY2ggbWFw
IGhhcyBpdCBvd24gScKyQyBhZGRyZXNzIGFuZCBhY3RzIGFzIGEgc3RhbmRhcmQgc2xhdmUKPiBk
ZXZpY2Ugb24gdGhlIEnCskMgYnVzLgo+IAo+IEFsbG93IGEgZGV2aWNlIHRyZWUgbm9kZSB0byBv
dmVycmlkZSB0aGUgZGVmYXVsdCBhZGRyZXNzZXMgc28gdGhhdAo+IGFkZHJlc3MgY29uZmxpY3Rz
IHdpdGggb3RoZXIgZGV2aWNlcyBvbiB0aGUgc2FtZSBidXMgbWF5IGJlIHJlc29sdmVkIGF0Cj4g
dGhlIGJvYXJkIGRlc2NyaXB0aW9uIGxldmVsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEplYW4tTWlj
aGVsIEhhdXRib2lzIDxqZWFuLW1pY2hlbC5oYXV0Ym9pc0B2b2RhbHlzLmNvbT4KPiBbS2llcmFu
OiBSZS1hZGFwdGVkIGZvciBtYWlubGluZV0KPiBTaWduZWQtb2ZmLWJ5OiBLaWVyYW4gQmluZ2hh
bSA8a2llcmFuLmJpbmdoYW1AaWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0KPiBCYXNlZCB1cG9uIHRo
ZSBvcmlnaW5hbCBwb3N0aW5nIDoKPiAgIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE0LzEwLzIy
LzQ2OQo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvYWR2NzYwNC50
eHQgICAgICB8IDE4ICsrKysrKy0KClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgoKSW4gdGhlIGZ1dHVyZSwgcGxlYXNlIHNwbGl0IGJpbmRpbmdzIHRvIHNlcGFyYXRl
IHBhdGNoLgoKPiAgZHJpdmVycy9tZWRpYS9pMmMvYWR2NzYwNC5jICAgICAgICAgICAgICAgICAg
ICAgICAgfCA2MCArKysrKysrKysrKysrKy0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNTUg
aW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
