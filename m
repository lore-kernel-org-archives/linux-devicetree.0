From: Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] media: ov5695: Add suport for registering sensor-related
Date: Fri, 27 Sep 2019 15:18:23 +0800
Message-ID: <20190927071824.18675-1-dongchun.zhu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bingbu.cao-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, shengnan.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, louis.kuo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

SGVsbG8sCgpUaGlzIHNlcmllcyBtb2RpZmllcyB0aGUgaW50ZXJmYWNlIG9mIGFzeW5jIHJlZ2lz
dGVyIFY0TDIgc3ViLWRldmljZSBpbnZva2VkIGluIHByb2JlIGZ1bmN0aW9uIGZvciBPVjU2OTUg
Q01PUyBzZW5zb3IuClRoZSBPbW5pdmlzaW9uIE9WNTY5NSBpbWFnZSBzZW5zb3Igd291bGQgYmUg
dXNlZCBpbiBjYW1lcmEgZmVhdHVyZXMgb24gQ3JPUyBhcHBsaWNhdGlvbi4KNS4wIE1lZ2EgUGl4
ZWwgTUlQSSBDYW1lcmEgTWRvdWxlIGFsc28gc3VwcG9ydHMgYXV0by1mb2N1cyBjb250cm9sIChB
RkMpIHdpdGggZW1iZWRkZWQgQUYgVkNNIERyaXZlci4KCkhlcmUgd2UgdXNlIHY0bDJfYXN5bmNf
cmVnaXN0ZXJfc3ViZGV2X3NlbnNvcl9jb21tb24oKSBpbnN0ZWFkIG9mIHY0bDJfYXN5bmNfcmVn
aXN0ZXJfc3ViZGV2KCkKdG8gcmVnaXN0ZXIgYSBzZW5zb3Igc3ViLWRldmljZSB0byB0aGUgYXN5
bmNocm9ub3VzIHN1Yi1kZXZpY2UgZnJhbWV3b3JrIGFuZCBwYXJzZSBzZXQgdXAKY29tbW9uIHNl
bnNvci1yZWxhdGVkIGRldmljZXMsIHN1Y2ggYXMgYWN0dWF0b3IuCgpUaGlzIGZ1bmN0aW9uIGlz
IGp1c3QgbGlrZcKgdjRsMl9hc3luY19yZWdpc3Rlcl9zdWJkZXYoKcKgd2l0aCB0aGUgZXhjZXB0
aW9uIHRoYXQgY2FsbGluZyBpdCB3aWxsIGFsc28gcGFyc2UKZmlybXdhcmUgaW50ZXJmYWNlcyBm
b3IgcmVtb3RlIHJlZmVyZW5jZXMgdXNpbmfCoHY0bDJfYXN5bmNfbm90aWZpZXJfcGFyc2VfZndu
b2RlX3NlbnNvcl9jb21tb24oKQphbmQgcmVnaXN0ZXJzIHRoZSBhc3luYyBzdWItZGV2aWNlcy4K
CkFmdGVyIGFwcGx5aW5nIHRoaXMgY2hhbmdlLCB3ZSBjYW4gc2VlIHRoZSBWQ00gbW92ZSB3aGVu
IGNoYW5naW5nIHRoZSBzY2VuZS4KCkRvbmdjaHVuIFpodSAoMSk6CiAgbWVkaWE6IGkyYzogb3Y1
Njk1OiBNb2RpZnkgdGhlIGZ1bmN0aW9uIG9mIGFzeW5jIHJlZ2lzdGVyIHN1YmRldgoKIGRyaXZl
cnMvbWVkaWEvaTJjL292NTY5NS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgotLSAKMi45LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
