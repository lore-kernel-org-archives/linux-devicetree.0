From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v4 3/8] Documentation: devicetree: rockchip: Document GeekBox
Date: Wed, 16 Mar 2016 14:58:41 +0100
Message-ID: <1458136727-32075-4-git-send-email-afaerber@suse.de>
References: <1458136727-32075-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1458136727-32075-1-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

VXNlICJnZWVrYnV5aW5nLGdlZWtib3giIGNvbXBhdGlibGUgc3RyaW5nLgoKQWNrZWQtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgRsOkcmJl
ciA8YWZhZXJiZXJAc3VzZS5kZT4KLS0tCiB2MyAtPiB2NDogVW5jaGFuZ2VkCiAKIHYyIC0+IHYz
OiBVbmNoYW5nZWQKCiB2MjogTmV3IChIZWlrbykKIAogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9yb2NrY2hpcC50eHQgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXJtL3JvY2tjaGlwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vcm9ja2NoaXAudHh0CmluZGV4IDA3OGMxNGZjZGFhYS4uZjYzMzU5NWIxOTZjIDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3JvY2tjaGlwLnR4dAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3JvY2tjaGlwLnR4dApA
QCAtODcsNiArODcsMTAgQEAgUm9ja2NoaXAgcGxhdGZvcm1zIGRldmljZSB0cmVlIGJpbmRpbmdz
CiAJCSAgICAgImdvb2dsZSx2ZXlyb24tc3BlZWR5LXJldjMiLCAiZ29vZ2xlLHZleXJvbi1zcGVl
ZHktcmV2MiIsCiAJCSAgICAgImdvb2dsZSx2ZXlyb24tc3BlZWR5IiwgImdvb2dsZSx2ZXlyb24i
LCAicm9ja2NoaXAscmszMjg4IjsKIAorLSBHZWVrQnV5aW5nIEdlZWtCb3g6CisgICAgUmVxdWly
ZWQgcm9vdCBub2RlIHByb3BlcnRpZXM6CisgICAgICAtIGNvbXBhdGlibGUgPSAiZ2Vla2J1eWlu
ZyxnZWVrYm94IiwgInJvY2tjaGlwLHJrMzM2OCI7CisKIC0gUm9ja2NoaXAgUkszMzY4IGV2YjoK
ICAgICBSZXF1aXJlZCByb290IG5vZGUgcHJvcGVydGllczoKICAgICAgIC0gY29tcGF0aWJsZSA9
ICJyb2NrY2hpcCxyazMzNjgtZXZiLWFjdDg4NDYiLCAicm9ja2NoaXAscmszMzY4IjsKLS0gCjIu
Ni4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtcm9ja2NoaXAgbWFpbGluZyBsaXN0CkxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yb2Nr
Y2hpcAo=
