From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] fdtdump: Make output prettier
Date: Wed, 14 Jun 2017 17:53:47 +0300
Message-ID: <1497452030-15588-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

fdtdump output can be very hard to read;

This patch makes sure that escaped characters are correctly detected
as strings and that output respects a given column width.

Pantelis Antoniou (3):
  util: Add method for escape output handling
  fdtdump: Prettify output of properties
  manual: Document prettification fdtdump options

 Documentation/manual.txt |   2 +
 fdtdump.c                | 103 ++++++++++++++++++++++++++++++++++++++++++++---
 util.c                   |  70 +++++++++++++++++++++++++++++++-
 util.h                   |  35 ++++++++++++++++
 4 files changed, 204 insertions(+), 6 deletions(-)

-- 
2.1.4
