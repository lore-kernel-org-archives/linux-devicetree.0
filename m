From: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/3] replace 'selftest' with 'unittest' and update the document.
Date: Tue, 17 Mar 2015 03:19:57 +0000
Message-ID: <1426562400-102415-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series patches replace 'selftest' with 'unittest' in the 
OF unittest, and update the document.

the first patch comes from Gaurav Minocha, and i update it. because
it can not apply on linux 4.0-rc4 when using 'git am' command.


* v3 <- v2:
	- Rebase the patch on 4.0-rc4
	- Re-adjust the sequence of the patches

* v2 <- v1:
	- According to Gaurav's advice. make the rename
	file patch correctly.

Wang Long (3):
  of/unittest: replace 'selftest' with 'unittest'
  Documentation: rename of_selftest.txt to of_unittest.txt
  Documentation: update the of_unittest.txt

 Documentation/devicetree/bindings/unittest.txt     |  44 +-
 .../{of_selftest.txt => of_unittest.txt}           |  35 +-
 drivers/of/unittest-data/tests-overlay.dtsi        | 108 ++--
 drivers/of/unittest.c                              | 706 ++++++++++-----------
 4 files changed, 447 insertions(+), 446 deletions(-)
 rename Documentation/devicetree/{of_selftest.txt => of_unittest.txt} (87%)

-- 
1.8.3.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
