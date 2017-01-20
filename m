From: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] Ensure that platform buses from overlays are functional
Date: Fri, 20 Jan 2017 21:57:43 +0100
Message-ID: <20170120205745.11851-1-alexander.sverdlin@nokia.com>
References: <CAL_JsqJZ__mUwRT14BmNQKaa_mAPsJm0iWP8sb6Oqs+_-Gu5hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJZ__mUwRT14BmNQKaa_mAPsJm0iWP8sb6Oqs+_-Gu5hw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series addresses an issue, which prevents one to add child devices to
a platform bus from an overlay if such a bus was in turn also created from
an overlay.

The root cause is missing OF_POPULATED_BUS flag for such buses and the
difference, in the way, how static and dynamic platform devices are
populated.

Second patch adds a couple of test cases which demonstrate the problem.

This series relies on the correct functioning of
of_unittest_apply_overlay() (previously sent "of/unittest: Swap arguments
of of_unittest_apply_overlay()").

Alexander Sverdlin (2):
  of/platform: dynamic: Use of_platform_bus_create() to create devices
  of/unittest: Test platform bus added from overlay

 drivers/of/platform.c                       | 11 ++++----
 drivers/of/unittest-data/tests-overlay.dtsi | 41 +++++++++++++++++++++++++++++
 drivers/of/unittest.c                       | 31 ++++++++++++++++++++++
 3 files changed, 78 insertions(+), 5 deletions(-)

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
