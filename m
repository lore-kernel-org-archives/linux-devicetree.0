From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] fdtoverlay, an overlay application tool
Date: Wed, 14 Jun 2017 17:51:10 +0300
Message-ID: <1497451872-15289-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

libfdt supports overlays, so it's trivial to create a tool
that applies them on a host using binary blobs.

fdtoverlay is that tool which given a base tree and a number
of overlays generates a target blob as the result.

Pantelis Antoniou (2):
  fdtoverlay: A tool that applies overlays
  tests: fdtoverlay unit test

 Documentation/manual.txt    |  14 ++++
 Makefile                    |   5 ++
 Makefile.utils              |   6 ++
 fdtoverlay.c                | 168 ++++++++++++++++++++++++++++++++++++++++++++
 tests/fdtoverlay-runtest.sh |  40 +++++++++++
 tests/run_tests.sh          |  27 ++++++-
 tests/tests.sh              |   1 +
 7 files changed, 260 insertions(+), 1 deletion(-)
 create mode 100644 fdtoverlay.c
 create mode 100644 tests/fdtoverlay-runtest.sh

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
