From: Alexander Amelkin <alexander@amelkin.msk.ru>
Subject: [PATCH 3/3] usb: max3421-hcd: Remove function name from dev_dbg calls
Date: Fri, 26 May 2017 14:32:42 +0300
Message-ID: <4642fe87795c3ec475f7c5ba6e67d025@amelkin.msk.ru>
References: <fe4f9b0f3a18d48dec6c0a8d79cae386@amelkin.msk.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_3fa6203445370441f3a8f0c1f71302f1"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fe4f9b0f3a18d48dec6c0a8d79cae386@amelkin.msk.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

--=_3fa6203445370441f3a8f0c1f71302f1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed

NOTE:
Please don't use the plain text here as a patch because it most probably 
is corrupted by my webmail client.
Attached is a copy of the following text guaranteed to have correct 
tabs/spaces.
-------------------------
 From b9a7559d24c0b2cb6e69124d861a943f79272681 Mon Sep 17 00:00:00 2001
 From: Alexander Amelkin <amelkin@fastwel.ru>
Date: Fri, 14 Apr 2017 18:01:58 +0300
Subject: [PATCH 3/3] usb: max3421-hcd: Remove function name from dev_dbg 
calls

The kernel dynamic debugging facility already has a
means for displaying the function name if the developer
wants to (the 'f' flag).

There is no need to hard-code output of the function
name into dev_dbg calls.

Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>
---
  drivers/usb/host/max3421-hcd.c | 18 ++++++++----------
  1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/max3421-hcd.c 
b/drivers/usb/host/max3421-hcd.c
index bd59c16..cfca8a2 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -706,8 +706,8 @@ max3421_select_and_start_urb(struct usb_hcd *hcd)
  			urb = list_first_entry(&ep->urb_list, struct urb,
  					       urb_list);
  			if (urb->unlinked) {
-				dev_dbg(&spi->dev, "%s: URB %p unlinked=%d",
-					__func__, urb, urb->unlinked);
+				dev_dbg(&spi->dev, "URB %p unlinked=%d",
+					urb, urb->unlinked);
  				max3421_hcd->curr_urb = urb;
  				max3421_hcd->urb_done = 1;
  				spin_unlock_irqrestore(&max3421_hcd->lock,
@@ -815,8 +815,8 @@ max3421_check_unlink(struct usb_hcd *hcd)
  		list_for_each_entry_safe(urb, next, &ep->urb_list, urb_list) {
  			if (urb->unlinked) {
  				retval = 1;
-				dev_dbg(&spi->dev, "%s: URB %p unlinked=%d",
-					__func__, urb, urb->unlinked);
+				dev_dbg(&spi->dev, "URB %p unlinked=%d",
+					urb, urb->unlinked);
  				usb_hcd_unlink_urb_from_ep(hcd, urb);
  				spin_unlock_irqrestore(&max3421_hcd->lock,
  						       flags);
@@ -912,8 +912,8 @@ max3421_handle_error(struct usb_hcd *hcd, u8 hrsl)
  		 * from; report error
  		 */
  		max3421_hcd->urb_done = hrsl_to_error[result_code];
-		dev_dbg(&spi->dev, "%s: unexpected error HRSL=0x%02x",
-			__func__, hrsl);
+		dev_dbg(&spi->dev, "unexpected error HRSL=0x%02x",
+			hrsl);
  		break;

  	case MAX3421_HRSL_TOGERR:
@@ -940,14 +940,12 @@ max3421_handle_error(struct usb_hcd *hcd, u8 hrsl)
  		else {
  			/* Based on ohci.h cc_to_err[]: */
  			max3421_hcd->urb_done = hrsl_to_error[result_code];
-			dev_dbg(&spi->dev, "%s: unexpected error HRSL=0x%02x",
-				__func__, hrsl);
+			dev_dbg(&spi->dev, "unexpected error HRSL=0x%02x", hrsl);
  		}
  		break;

  	case MAX3421_HRSL_STALL:
-		dev_dbg(&spi->dev, "%s: unexpected error HRSL=0x%02x",
-			__func__, hrsl);
+		dev_dbg(&spi->dev, "unexpected error HRSL=0x%02x", hrsl);
  		max3421_hcd->urb_done = hrsl_to_error[result_code];
  		break;

-- 
2.7.4


--=_3fa6203445370441f3a8f0c1f71302f1
Content-Transfer-Encoding: base64
Content-Type: text/x-diff; charset=us-ascii;
 name=0003-usb-max3421-hcd-Remove-function-name-from-dev_dbg-ca.patch
Content-Disposition: attachment;
 filename=0003-usb-max3421-hcd-Remove-function-name-from-dev_dbg-ca.patch;
 size=2614

RnJvbSBiOWE3NTU5ZDI0YzBiMmNiNmU2OTEyNGQ4NjFhOTQzZjc5MjcyNjgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4YW5kZXIgQW1lbGtpbiA8YW1lbGtpbkBmYXN0d2VsLnJ1
PgpEYXRlOiBGcmksIDE0IEFwciAyMDE3IDE4OjAxOjU4ICswMzAwClN1YmplY3Q6IFtQQVRDSCAz
LzNdIHVzYjogbWF4MzQyMS1oY2Q6IFJlbW92ZSBmdW5jdGlvbiBuYW1lIGZyb20gZGV2X2RiZyBj
YWxscwoKVGhlIGtlcm5lbCBkeW5hbWljIGRlYnVnZ2luZyBmYWNpbGl0eSBhbHJlYWR5IGhhcyBh
Cm1lYW5zIGZvciBkaXNwbGF5aW5nIHRoZSBmdW5jdGlvbiBuYW1lIGlmIHRoZSBkZXZlbG9wZXIK
d2FudHMgdG8gKHRoZSAnZicgZmxhZykuCgpUaGVyZSBpcyBubyBuZWVkIHRvIGhhcmQtY29kZSBv
dXRwdXQgb2YgdGhlIGZ1bmN0aW9uCm5hbWUgaW50byBkZXZfZGJnIGNhbGxzLgoKU2lnbmVkLW9m
Zi1ieTogQWxleGFuZGVyIEFtZWxraW4gPGFsZXhhbmRlckBhbWVsa2luLm1zay5ydT4KLS0tCiBk
cml2ZXJzL3VzYi9ob3N0L21heDM0MjEtaGNkLmMgfCAxOCArKysrKysrKy0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL2hvc3QvbWF4MzQyMS1oY2QuYyBiL2RyaXZlcnMvdXNiL2hvc3QvbWF4
MzQyMS1oY2QuYwppbmRleCBiZDU5YzE2Li5jZmNhOGEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Vz
Yi9ob3N0L21heDM0MjEtaGNkLmMKKysrIGIvZHJpdmVycy91c2IvaG9zdC9tYXgzNDIxLWhjZC5j
CkBAIC03MDYsOCArNzA2LDggQEAgbWF4MzQyMV9zZWxlY3RfYW5kX3N0YXJ0X3VyYihzdHJ1Y3Qg
dXNiX2hjZCAqaGNkKQogCQkJdXJiID0gbGlzdF9maXJzdF9lbnRyeSgmZXAtPnVyYl9saXN0LCBz
dHJ1Y3QgdXJiLAogCQkJCQkgICAgICAgdXJiX2xpc3QpOwogCQkJaWYgKHVyYi0+dW5saW5rZWQp
IHsKLQkJCQlkZXZfZGJnKCZzcGktPmRldiwgIiVzOiBVUkIgJXAgdW5saW5rZWQ9JWQiLAotCQkJ
CQlfX2Z1bmNfXywgdXJiLCB1cmItPnVubGlua2VkKTsKKwkJCQlkZXZfZGJnKCZzcGktPmRldiwg
IlVSQiAlcCB1bmxpbmtlZD0lZCIsCisJCQkJCXVyYiwgdXJiLT51bmxpbmtlZCk7CiAJCQkJbWF4
MzQyMV9oY2QtPmN1cnJfdXJiID0gdXJiOwogCQkJCW1heDM0MjFfaGNkLT51cmJfZG9uZSA9IDE7
CiAJCQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmbWF4MzQyMV9oY2QtPmxvY2ssCkBAIC04MTUs
OCArODE1LDggQEAgbWF4MzQyMV9jaGVja191bmxpbmsoc3RydWN0IHVzYl9oY2QgKmhjZCkKIAkJ
bGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHVyYiwgbmV4dCwgJmVwLT51cmJfbGlzdCwgdXJiX2xp
c3QpIHsKIAkJCWlmICh1cmItPnVubGlua2VkKSB7CiAJCQkJcmV0dmFsID0gMTsKLQkJCQlkZXZf
ZGJnKCZzcGktPmRldiwgIiVzOiBVUkIgJXAgdW5saW5rZWQ9JWQiLAotCQkJCQlfX2Z1bmNfXywg
dXJiLCB1cmItPnVubGlua2VkKTsKKwkJCQlkZXZfZGJnKCZzcGktPmRldiwgIlVSQiAlcCB1bmxp
bmtlZD0lZCIsCisJCQkJCXVyYiwgdXJiLT51bmxpbmtlZCk7CiAJCQkJdXNiX2hjZF91bmxpbmtf
dXJiX2Zyb21fZXAoaGNkLCB1cmIpOwogCQkJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm1heDM0
MjFfaGNkLT5sb2NrLAogCQkJCQkJICAgICAgIGZsYWdzKTsKQEAgLTkxMiw4ICs5MTIsOCBAQCBt
YXgzNDIxX2hhbmRsZV9lcnJvcihzdHJ1Y3QgdXNiX2hjZCAqaGNkLCB1OCBocnNsKQogCQkgKiBm
cm9tOyByZXBvcnQgZXJyb3IKIAkJICovCiAJCW1heDM0MjFfaGNkLT51cmJfZG9uZSA9IGhyc2xf
dG9fZXJyb3JbcmVzdWx0X2NvZGVdOwotCQlkZXZfZGJnKCZzcGktPmRldiwgIiVzOiB1bmV4cGVj
dGVkIGVycm9yIEhSU0w9MHglMDJ4IiwKLQkJCV9fZnVuY19fLCBocnNsKTsKKwkJZGV2X2RiZygm
c3BpLT5kZXYsICJ1bmV4cGVjdGVkIGVycm9yIEhSU0w9MHglMDJ4IiwKKwkJCWhyc2wpOwogCQli
cmVhazsKIAogCWNhc2UgTUFYMzQyMV9IUlNMX1RPR0VSUjoKQEAgLTk0MCwxNCArOTQwLDEyIEBA
IG1heDM0MjFfaGFuZGxlX2Vycm9yKHN0cnVjdCB1c2JfaGNkICpoY2QsIHU4IGhyc2wpCiAJCWVs
c2UgewogCQkJLyogQmFzZWQgb24gb2hjaS5oIGNjX3RvX2VycltdOiAqLwogCQkJbWF4MzQyMV9o
Y2QtPnVyYl9kb25lID0gaHJzbF90b19lcnJvcltyZXN1bHRfY29kZV07Ci0JCQlkZXZfZGJnKCZz
cGktPmRldiwgIiVzOiB1bmV4cGVjdGVkIGVycm9yIEhSU0w9MHglMDJ4IiwKLQkJCQlfX2Z1bmNf
XywgaHJzbCk7CisJCQlkZXZfZGJnKCZzcGktPmRldiwgInVuZXhwZWN0ZWQgZXJyb3IgSFJTTD0w
eCUwMngiLCBocnNsKTsKIAkJfQogCQlicmVhazsKIAogCWNhc2UgTUFYMzQyMV9IUlNMX1NUQUxM
OgotCQlkZXZfZGJnKCZzcGktPmRldiwgIiVzOiB1bmV4cGVjdGVkIGVycm9yIEhSU0w9MHglMDJ4
IiwKLQkJCV9fZnVuY19fLCBocnNsKTsKKwkJZGV2X2RiZygmc3BpLT5kZXYsICJ1bmV4cGVjdGVk
IGVycm9yIEhSU0w9MHglMDJ4IiwgaHJzbCk7CiAJCW1heDM0MjFfaGNkLT51cmJfZG9uZSA9IGhy
c2xfdG9fZXJyb3JbcmVzdWx0X2NvZGVdOwogCQlicmVhazsKIAotLSAKMi43LjQKCg==
--=_3fa6203445370441f3a8f0c1f71302f1--
