From: Laura Abbott <labbott-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Subject: [RFC][PATCH 0/2] Devicetree bindings for Ion
Date: Tue,  6 Oct 2015 13:47:11 -0700
Message-ID: <1444164433-9107-1-git-send-email-labbott@fedoraproject.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Andrianov <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>, arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Riley Andrews <riandrews-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Laura Abbott <laura-0PSzFVTn/CLa5EbDDlwbIw@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tom Gall <tom.gall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, romlem-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Feng Tang <feng.tang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Laura Abbott <laura-0PSzFVTn/CLa5EbDDlwbIw@public.gmane.org>


Hi,

At the last Plumbers and Linaro Connect, there was some discussion
related to Ion. One of the items that came up towards eventually
getting Ion out of staging was some concept of stable devicetree
bindings. This is a proof of concept for bindings.

Most of this is based on previously submitted work
(https://lkml.org/lkml/2015/6/30/425 thank you Andrew Andrianov for
getting this started!) and also the
out of tree qcom bindings (available somewhere on codeaurora.org).
As the title indicates, this is an RFC and the purpose here is to
get feedback on if these bindings would potentially work. If there
are platforms out there that don't use devicetree, the bindings
would hopefully also serve as a guide for how to setup the platform
data for heaps like CMA.

One of the big things this series improves on is giving a standard
mechanism for defining and allocating memory for all heap types.
DMA/CMA is handled as well as memory for carveout and chunk heaps.

Further TODO:
- Need to fixup include paths so heap types can be cleanly included
  in DTS files
- Figure out callbacks or similar for support custom platform heaps

Laura Abbott (2):
  WIP: Devicetree bindings for Ion
  staging: ion: Add files for parsing the devicetree (WIP)

 drivers/staging/android/ion/Kconfig        |  10 ++
 drivers/staging/android/ion/Makefile       |   7 +-
 drivers/staging/android/ion/devicetree.txt |  53 +++++++++
 drivers/staging/android/ion/ion_of.c       | 185 +++++++++++++++++++++++++++++
 drivers/staging/android/ion/ion_of.h       |   3 +
 5 files changed, 255 insertions(+), 3 deletions(-)
 create mode 100644 drivers/staging/android/ion/devicetree.txt
 create mode 100644 drivers/staging/android/ion/ion_of.c
 create mode 100644 drivers/staging/android/ion/ion_of.h

-- 
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
