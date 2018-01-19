From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/3] Add R-Car V3M (R8A77970) support to the R-Car LVDS driver
Date: Fri, 19 Jan 2018 21:29:18 +0300
Message-ID: <20180119182918.538035039__3294.27478504858$1516386847$gmane$org@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

SGVsbG8hCgpIZXJlJ3MgdGhlIHNldCBvZiAzIHBhdGNoZXMgYWdhaW5zdCB0aGUgJ2RybS1uZXh0
JyBicmFuY2ggb2YgRGF2aWQgQWlybGllJ3MKJ2xpbnV4LmdpdCcgcmVwbyBwbHVzIHRoZSBwYXRj
aCBmaXhpbmcgTFZEUyBzdGFydHVwIGZvciBSLUNhciBnZW4yLzMgYW5kCkxhdXJlbnQgUGljbmFo
cnQncyBwYXRjaGVzIGNyZWF0aW5nIHRoZSBSLUNhciBMVkRTIGJyaWRnZSBkcml2ZXIgcG9zdGVk
CnJlY2VudGx5LiBUaGUgbWFpbiBwdXJwb3NlIG9mIHRoZXNlIHBhdGNoZXMgaXMgdG8gYWRkIHRo
ZSBSLUNhciBWM00gKFI4QTc3OTcwKQpzdXBwb3J0IHRvIHRoZSBSLUNhciBMVkRTIGRyaXZlciAt
LSB3ZSBoYXZlIHRvIGRvIHNvbWUgcmVmYWN0b3JpbmcgZmlyc3QgdG8KYWNoaWV2ZSB0aGlzIGdv
YWwuLi4KClsxLzNdIGRybTogcmNhci1kdTogbHZkczogcmVmYWN0b3IgTFZEUyBzdGFydHVwClsy
LzNdIERUOiBkaXNwbGF5OiByZW5lc2FzLGx2ZHM6IGRvY3VtZW50IFI4QTc3OTcwIGJpbmRpbmdz
ClszLzNdIGRybTogcmNhci1kdTogbHZkczogYWRkIFI4QTc3OTcwIHN1cHBvcnQKCk1CUiwgU2Vy
Z2VpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
