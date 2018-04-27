From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 01/11] dt-bindings: display: renesas: Add R-Car M3-N HDMI
 TX DT bindings
Date: Fri, 27 Apr 2018 17:57:12 +0100
Message-ID: <20180427165722.19445-2-kieran.bingham+renesas@ideasonboard.com>
References: <20180427165722.19445-1-kieran.bingham+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180427165722.19445-1-kieran.bingham+renesas@ideasonboard.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

VGhlIE0zLU4gSERNSSBUWCBjb250cm9sbGVyIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgTTMtVyBh
bmQgSDMuIE5vCmV4dGVuc2lvbiB0byB0aGUgRFQgYmluZGluZ3MgYXJlIG5lZWRlZC4KCkFkZCBh
biBTb0Mtc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJpbmcgaW4gY2FzZSBkaWZmZXJlbmNlcyBiZXR3
ZWVuIHRoZSBJUAp2ZXJzaW9ucyBhcmUgZm91bmQgbGF0ZXIgYW5kIHJlcXVpcmUgbW9kZWwtc3Bl
Y2lmaWMgaGFuZGxpbmcuCgpTaWduZWQtb2ZmLWJ5OiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJp
bmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsZHctaGRtaS50eHQgICAgICAgfCAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGR3LWhkbWkudHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsZHct
aGRtaS50eHQKaW5kZXggM2E3MmExMDNhMThhLi5hNDFkMjgwYzNmOWYgMTAwNjQ0Ci0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGR3
LWhkbWkudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS9yZW5lc2FzLGR3LWhkbWkudHh0CkBAIC0xNCw2ICsxNCw3IEBAIFJlcXVpcmVkIHBy
b3BlcnRpZXM6CiAtIGNvbXBhdGlibGUgOiBTaGFsbCBjb250YWluIG9uZSBvciBtb3JlIG9mCiAg
IC0gInJlbmVzYXMscjhhNzc5NS1oZG1pIiBmb3IgUjhBNzc5NSAoUi1DYXIgSDMpIGNvbXBhdGli
bGUgSERNSSBUWAogICAtICJyZW5lc2FzLHI4YTc3OTYtaGRtaSIgZm9yIFI4QTc3OTYgKFItQ2Fy
IE0zLVcpIGNvbXBhdGlibGUgSERNSSBUWAorICAtICJyZW5lc2FzLHI4YTc3OTY1LWhkbWkiIGZv
ciBSOEE3Nzk2NSAoUi1DYXIgTTMtTikgY29tcGF0aWJsZSBIRE1JIFRYCiAgIC0gInJlbmVzYXMs
cmNhci1nZW4zLWhkbWkiIGZvciB0aGUgZ2VuZXJpYyBSLUNhciBHZW4zIGNvbXBhdGlibGUgSERN
SSBUWAogCiAgICAgV2hlbiBjb21wYXRpYmxlIHdpdGggZ2VuZXJpYyB2ZXJzaW9ucywgbm9kZXMg
bXVzdCBsaXN0IHRoZSBTb0Mtc3BlY2lmaWMKLS0gCjIuMTcuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
