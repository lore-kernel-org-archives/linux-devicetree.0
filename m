From: Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>
Subject: Re: [PATCH 0/5] OF: Fixes in preperation of DT overlays
Date: Wed, 06 Nov 2013 16:41:20 +0100
Message-ID: <527A6320.6040600@nsn.com>
References: <1383673816-29293-1-git-send-email-panto@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383673816-29293-1-git-send-email-panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ext Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

On 05/11/13 18:50, ext Pantelis Antoniou wrote:
> This patchset introduces a number of fixes that are required
> for the subsequent patches that add DT overlays support.
> 
> Most of them are trivial, adding small bits that are missing,
> or exporting functions that were private before.
> 
> Pantelis Antoniou (5):
>   OF: Clear detach flag on attach
>   OF: Introduce device tree node flag helpers.
>   OF: export of_property_notify
>   OF: Export all DT proc update functions
>   OF: Introduce utility helper functions

All patches there we use as they are since July on our MIPS64 platforms. So, for all 5 patches:
Tested-by: Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>

>  drivers/of/Makefile |   2 +-
>  drivers/of/base.c   |  77 ++++++++--------
>  drivers/of/util.c   | 253 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h  | 119 ++++++++++++++++++++++++
>  4 files changed, 413 insertions(+), 38 deletions(-)
>  create mode 100644 drivers/of/util.c
> 

-- 
Best regards,
Alexander Sverdlin.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
