From: Alexander Amelkin <alexander@amelkin.msk.ru>
Subject: [PATCH 2/3] usb: max3421-hcd: Fix crash on the driver removal
Date: Fri, 26 May 2017 14:30:56 +0300
Message-ID: <365366d9802b5b4ed1ec3a33d0ea0da3@amelkin.msk.ru>
References: <fe4f9b0f3a18d48dec6c0a8d79cae386@amelkin.msk.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_7a8d02ab58417f13238b6b5b1dbbbf60"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fe4f9b0f3a18d48dec6c0a8d79cae386@amelkin.msk.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

--=_7a8d02ab58417f13238b6b5b1dbbbf60
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed

NOTE:
Please don't use the plain text here as a patch because it most probably 
is corrupted by my webmail client.
Attached is a copy of the following text guaranteed to have correct 
tabs/spaces.
-------------------------
 From 8c4c65d3892df3721474023836216a02e03fb23e Mon Sep 17 00:00:00 2001
 From: Alexander Amelkin <amelkin@fastwel.ru>
Date: Fri, 14 Apr 2017 17:58:07 +0300
Subject: [PATCH 2/3] usb: max3421-hcd: Fix crash on the driver removal

The driver was calling kthread_stop inside a spin-locked
region while the thread was calling schedule() on a regular
basis. That resulted in panic due to 'scheduling while atomic'.

There was no need to get the spin-lock before stopping the
thread as thread stopping is asynchronous and the thread
only stops when it detects the stop flag set by kthread_stop(),
at which point it is not accessing any resources anyway.

Hence, this patch removes the spin-locking around the
kthread_stop() call.

Additionally, the allocated resources were not free'd in
the correct order. Some were not free'd at all. This patch
switches all resource allocations to devm_* functions
and also reorders deallocation to properly revert the
allocations (although not actually needed for devm-allocated
resources).

Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>
---
  drivers/usb/host/max3421-hcd.c | 29 +++++++++++++++--------------
  1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/max3421-hcd.c 
b/drivers/usb/host/max3421-hcd.c
index f600052..bd59c16 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1925,10 +1925,10 @@ max3421_probe(struct spi_device *spi)
  	max3421_hcd_list = max3421_hcd;
  	INIT_LIST_HEAD(&max3421_hcd->ep_list);

-	max3421_hcd->tx = kmalloc(sizeof(*max3421_hcd->tx), GFP_KERNEL);
+	max3421_hcd->tx = devm_kzalloc(&spi->dev, sizeof(*max3421_hcd->tx), 
GFP_KERNEL);
  	if (!max3421_hcd->tx)
  		goto error;
-	max3421_hcd->rx = kmalloc(sizeof(*max3421_hcd->rx), GFP_KERNEL);
+	max3421_hcd->rx = devm_kzalloc(&spi->dev, sizeof(*max3421_hcd->rx), 
GFP_KERNEL);
  	if (!max3421_hcd->rx)
  		goto error;

@@ -1946,8 +1946,8 @@ max3421_probe(struct spi_device *spi)
  		goto error;
  	}

-	retval = request_irq(spi->irq, max3421_irq_handler,
-			     IRQF_TRIGGER_LOW, "max3421", hcd);
+	retval = devm_request_irq(&spi->dev, spi->irq, max3421_irq_handler,
+	                          IRQF_TRIGGER_LOW, "max3421", hcd);
  	if (retval < 0) {
  		dev_err(&spi->dev, "failed to request irq %d\n", spi->irq);
  		goto error;
@@ -1976,7 +1976,6 @@ max3421_remove(struct spi_device *spi)
  {
  	struct max3421_hcd *max3421_hcd = NULL, **prev;
  	struct usb_hcd *hcd = NULL;
-	unsigned long flags;

  	for (prev = &max3421_hcd_list; *prev; prev = &(*prev)->next) {
  		max3421_hcd = *prev;
@@ -1990,12 +1989,20 @@ max3421_remove(struct spi_device *spi)
  			spi);
  		return -ENODEV;
  	}
-	spin_lock_irqsave(&max3421_hcd->lock, flags);
+
+	devm_free_irq(&spi->dev, spi->irq, hcd);
+
+	usb_remove_hcd(hcd);

  	kthread_stop(max3421_hcd->spi_thread);
-	*prev = max3421_hcd->next;

-	spin_unlock_irqrestore(&max3421_hcd->lock, flags);
+	devm_kfree(&spi->dev, max3421_hcd->rx);
+	max3421_hcd->rx = NULL;
+	devm_kfree(&spi->dev, max3421_hcd->tx);
+	max3421_hcd->tx = NULL;
+
+	*prev = max3421_hcd->next;
+	usb_put_hcd(hcd);

  #if defined(CONFIG_OF)
  	if (spi->dev.platform_data) {
@@ -2005,12 +2012,6 @@ max3421_remove(struct spi_device *spi)
  	}
  #endif

-	free_irq(spi->irq, hcd);
-
-	usb_remove_hcd(hcd);
-
-
-	usb_put_hcd(hcd);
  	return 0;
  }

-- 
2.7.4


--=_7a8d02ab58417f13238b6b5b1dbbbf60
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
 name=0002-usb-max3421-hcd-Fix-crash-on-the-driver-removal.patch
Content-Disposition: attachment;
 filename=0002-usb-max3421-hcd-Fix-crash-on-the-driver-removal.patch;
 size=3337

RnJvbSA4YzRjNjVkMzg5MmRmMzcyMTQ3NDAyMzgzNjIxNmEwMmUwM2ZiMjNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4YW5kZXIgQW1lbGtpbiA8YW1lbGtpbkBmYXN0d2VsLnJ1
PgpEYXRlOiBGcmksIDE0IEFwciAyMDE3IDE3OjU4OjA3ICswMzAwClN1YmplY3Q6IFtQQVRDSCAy
LzNdIHVzYjogbWF4MzQyMS1oY2Q6IEZpeCBjcmFzaCBvbiB0aGUgZHJpdmVyIHJlbW92YWwKClRo
ZSBkcml2ZXIgd2FzIGNhbGxpbmcga3RocmVhZF9zdG9wIGluc2lkZSBhIHNwaW4tbG9ja2VkCnJl
Z2lvbiB3aGlsZSB0aGUgdGhyZWFkIHdhcyBjYWxsaW5nIHNjaGVkdWxlKCkgb24gYSByZWd1bGFy
CmJhc2lzLiBUaGF0IHJlc3VsdGVkIGluIHBhbmljIGR1ZSB0byAnc2NoZWR1bGluZyB3aGlsZSBh
dG9taWMnLgoKVGhlcmUgd2FzIG5vIG5lZWQgdG8gZ2V0IHRoZSBzcGluLWxvY2sgYmVmb3JlIHN0
b3BwaW5nIHRoZQp0aHJlYWQgYXMgdGhyZWFkIHN0b3BwaW5nIGlzIGFzeW5jaHJvbm91cyBhbmQg
dGhlIHRocmVhZApvbmx5IHN0b3BzIHdoZW4gaXQgZGV0ZWN0cyB0aGUgc3RvcCBmbGFnIHNldCBi
eSBrdGhyZWFkX3N0b3AoKSwKYXQgd2hpY2ggcG9pbnQgaXQgaXMgbm90IGFjY2Vzc2luZyBhbnkg
cmVzb3VyY2VzIGFueXdheS4KCkhlbmNlLCB0aGlzIHBhdGNoIHJlbW92ZXMgdGhlIHNwaW4tbG9j
a2luZyBhcm91bmQgdGhlCmt0aHJlYWRfc3RvcCgpIGNhbGwuCgpBZGRpdGlvbmFsbHksIHRoZSBh
bGxvY2F0ZWQgcmVzb3VyY2VzIHdlcmUgbm90IGZyZWUnZCBpbgp0aGUgY29ycmVjdCBvcmRlci4g
U29tZSB3ZXJlIG5vdCBmcmVlJ2QgYXQgYWxsLiBUaGlzIHBhdGNoCnN3aXRjaGVzIGFsbCByZXNv
dXJjZSBhbGxvY2F0aW9ucyB0byBkZXZtXyogZnVuY3Rpb25zCmFuZCBhbHNvIHJlb3JkZXJzIGRl
YWxsb2NhdGlvbiB0byBwcm9wZXJseSByZXZlcnQgdGhlCmFsbG9jYXRpb25zIChhbHRob3VnaCBu
b3QgYWN0dWFsbHkgbmVlZGVkIGZvciBkZXZtLWFsbG9jYXRlZApyZXNvdXJjZXMpLgoKU2lnbmVk
LW9mZi1ieTogQWxleGFuZGVyIEFtZWxraW4gPGFsZXhhbmRlckBhbWVsa2luLm1zay5ydT4KLS0t
CiBkcml2ZXJzL3VzYi9ob3N0L21heDM0MjEtaGNkLmMgfCAyOSArKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QvbWF4MzQyMS1oY2QuYyBiL2RyaXZl
cnMvdXNiL2hvc3QvbWF4MzQyMS1oY2QuYwppbmRleCBmNjAwMDUyLi5iZDU5YzE2IDEwMDY0NAot
LS0gYS9kcml2ZXJzL3VzYi9ob3N0L21heDM0MjEtaGNkLmMKKysrIGIvZHJpdmVycy91c2IvaG9z
dC9tYXgzNDIxLWhjZC5jCkBAIC0xOTI1LDEwICsxOTI1LDEwIEBAIG1heDM0MjFfcHJvYmUoc3Ry
dWN0IHNwaV9kZXZpY2UgKnNwaSkKIAltYXgzNDIxX2hjZF9saXN0ID0gbWF4MzQyMV9oY2Q7CiAJ
SU5JVF9MSVNUX0hFQUQoJm1heDM0MjFfaGNkLT5lcF9saXN0KTsKIAotCW1heDM0MjFfaGNkLT50
eCA9IGttYWxsb2Moc2l6ZW9mKCptYXgzNDIxX2hjZC0+dHgpLCBHRlBfS0VSTkVMKTsKKwltYXgz
NDIxX2hjZC0+dHggPSBkZXZtX2t6YWxsb2MoJnNwaS0+ZGV2LCBzaXplb2YoKm1heDM0MjFfaGNk
LT50eCksIEdGUF9LRVJORUwpOwogCWlmICghbWF4MzQyMV9oY2QtPnR4KQogCQlnb3RvIGVycm9y
OwotCW1heDM0MjFfaGNkLT5yeCA9IGttYWxsb2Moc2l6ZW9mKCptYXgzNDIxX2hjZC0+cngpLCBH
RlBfS0VSTkVMKTsKKwltYXgzNDIxX2hjZC0+cnggPSBkZXZtX2t6YWxsb2MoJnNwaS0+ZGV2LCBz
aXplb2YoKm1heDM0MjFfaGNkLT5yeCksIEdGUF9LRVJORUwpOwogCWlmICghbWF4MzQyMV9oY2Qt
PnJ4KQogCQlnb3RvIGVycm9yOwogCkBAIC0xOTQ2LDggKzE5NDYsOCBAQCBtYXgzNDIxX3Byb2Jl
KHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCiAJCWdvdG8gZXJyb3I7CiAJfQogCi0JcmV0dmFsID0g
cmVxdWVzdF9pcnEoc3BpLT5pcnEsIG1heDM0MjFfaXJxX2hhbmRsZXIsCi0JCQkgICAgIElSUUZf
VFJJR0dFUl9MT1csICJtYXgzNDIxIiwgaGNkKTsKKwlyZXR2YWwgPSBkZXZtX3JlcXVlc3RfaXJx
KCZzcGktPmRldiwgc3BpLT5pcnEsIG1heDM0MjFfaXJxX2hhbmRsZXIsCisJICAgICAgICAgICAg
ICAgICAgICAgICAgICBJUlFGX1RSSUdHRVJfTE9XLCAibWF4MzQyMSIsIGhjZCk7CiAJaWYgKHJl
dHZhbCA8IDApIHsKIAkJZGV2X2Vycigmc3BpLT5kZXYsICJmYWlsZWQgdG8gcmVxdWVzdCBpcnEg
JWRcbiIsIHNwaS0+aXJxKTsKIAkJZ290byBlcnJvcjsKQEAgLTE5NzYsNyArMTk3Niw2IEBAIG1h
eDM0MjFfcmVtb3ZlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCiB7CiAJc3RydWN0IG1heDM0MjFf
aGNkICptYXgzNDIxX2hjZCA9IE5VTEwsICoqcHJldjsKIAlzdHJ1Y3QgdXNiX2hjZCAqaGNkID0g
TlVMTDsKLQl1bnNpZ25lZCBsb25nIGZsYWdzOwogCiAJZm9yIChwcmV2ID0gJm1heDM0MjFfaGNk
X2xpc3Q7ICpwcmV2OyBwcmV2ID0gJigqcHJldiktPm5leHQpIHsKIAkJbWF4MzQyMV9oY2QgPSAq
cHJldjsKQEAgLTE5OTAsMTIgKzE5ODksMjAgQEAgbWF4MzQyMV9yZW1vdmUoc3RydWN0IHNwaV9k
ZXZpY2UgKnNwaSkKIAkJCXNwaSk7CiAJCXJldHVybiAtRU5PREVWOwogCX0KLQlzcGluX2xvY2tf
aXJxc2F2ZSgmbWF4MzQyMV9oY2QtPmxvY2ssIGZsYWdzKTsKKworCWRldm1fZnJlZV9pcnEoJnNw
aS0+ZGV2LCBzcGktPmlycSwgaGNkKTsKKworCXVzYl9yZW1vdmVfaGNkKGhjZCk7CiAKIAlrdGhy
ZWFkX3N0b3AobWF4MzQyMV9oY2QtPnNwaV90aHJlYWQpOwotCSpwcmV2ID0gbWF4MzQyMV9oY2Qt
Pm5leHQ7CiAKLQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZtYXgzNDIxX2hjZC0+bG9jaywgZmxh
Z3MpOworCWRldm1fa2ZyZWUoJnNwaS0+ZGV2LCBtYXgzNDIxX2hjZC0+cngpOworCW1heDM0MjFf
aGNkLT5yeCA9IE5VTEw7CisJZGV2bV9rZnJlZSgmc3BpLT5kZXYsIG1heDM0MjFfaGNkLT50eCk7
CisJbWF4MzQyMV9oY2QtPnR4ID0gTlVMTDsKKworCSpwcmV2ID0gbWF4MzQyMV9oY2QtPm5leHQ7
CisJdXNiX3B1dF9oY2QoaGNkKTsKIAogI2lmIGRlZmluZWQoQ09ORklHX09GKQogCWlmIChzcGkt
PmRldi5wbGF0Zm9ybV9kYXRhKSB7CkBAIC0yMDA1LDEyICsyMDEyLDYgQEAgbWF4MzQyMV9yZW1v
dmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKIAl9CiAjZW5kaWYKIAotCWZyZWVfaXJxKHNwaS0+
aXJxLCBoY2QpOwotCi0JdXNiX3JlbW92ZV9oY2QoaGNkKTsKLQotCi0JdXNiX3B1dF9oY2QoaGNk
KTsKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi43LjQKCg==
--=_7a8d02ab58417f13238b6b5b1dbbbf60--
