From: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/5] Update the OF unittest and some small fix
Date: Wed, 11 Mar 2015 08:36:49 +0000
Message-ID: <1426063014-211712-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series patches do some small fixes in drivers/of/unittest.c,
and update the Documenttion. 

At last, replace selftest with unittest in the c, dtsi 
and binding files.

* v2 <- v1:
	- According to Gaurav's advice. make the rename
	file patch correctly.
	
Wang Long (5):
  of/unittest: remove the duplicate of_changeset_init
  of/unittest: Fix the wrong expected value in
    of_selftest_property_string
  Documentation: update the of_selftest.txt
  Documentation: rename of_selftest.txt to of_unittest.txt
  of/unittest: replace 'selftest' with 'unittest'

 Documentation/devicetree/bindings/unittest.txt     |  44 +-
 .../{of_selftest.txt => of_unittest.txt}           |  35 +-
 drivers/of/unittest-data/tests-overlay.dtsi        | 108 ++--
 drivers/of/unittest.c                              | 703 ++++++++++-----------
 4 files changed, 445 insertions(+), 445 deletions(-)
 rename Documentation/devicetree/{of_selftest.txt => of_unittest.txt} (87%)

-- 
1.8.3.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
