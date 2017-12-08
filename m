From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [Patch v6 02/12] [media] s5p-mfc: Adding initial support for MFC v10.10
Date: Fri, 8 Dec 2017 14:25:39 +0100
Message-ID: <CAOFm3uHyNt3k+_n3SvSP-BNFeEeu1CO6PpEbxs9JU0MxsHm=Jg@mail.gmail.com>
References: <CGME20171208093637epcas1p217ea0e337333ebf6918bc0418753d2af@epcas1p2.samsung.com>
 <1512724105-1778-1-git-send-email-smitha.t@samsung.com> <1512724105-1778-3-git-send-email-smitha.t@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512724105-1778-3-git-send-email-smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Smitha T Murthy <smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kamil-MZ2JYD8fkKLYtjvyW6yDsg@public.gmane.org, jtp.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Smitha,

On Fri, Dec 8, 2017 at 10:08 AM, Smitha T Murthy <smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Adding the support for MFC v10.10, with new register file and
> necessary hw control, decoder, encoder and structural changes.
>
> CC: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Smitha T Murthy <smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
[]
> --- /dev/null
> +++ b/drivers/media/platform/s5p-mfc/regs-mfc-v10.h
> @@ -0,0 +1,36 @@
> +/*
> + * Register definition file for Samsung MFC V10.x Interface (FIMV) driver
> + *
> + * Copyright (c) 2017 Samsung Electronics Co., Ltd.
> + *     http://www.samsung.com/
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */

Have you considered using the new SPDX ids instead of this fine legalese? e.g.:

// SPDX-License-Identifier: GPL-2.0

This is much shorter and neater (unless you are a legalese lover of
course!)  Check also Thomas doc patches and Linus comments on why he
prefers the C++ comment style for these.

And even better could be this more compact form? I am a big fan of the
C++ style comments for these (and so is Linus)

// SPDX-License-Identifier: GPL-2.0
// Copyright (c) 2017 Samsung Electronics Co., Ltd.
// Register definition file for Samsung MFC V10.x Interface (FIMV) driver

You can also read this fine article from a fellow Samsung colleague
[1]. And if you ever consider doing this for all Samsung's past,
present and future contributions, you will have my deep gratitude

[1] https://blogs.s-osg.org/linux-kernel-license-practices-revisited-spdx/

-- 
Cordially
Philippe Ombredanne, your licensing helper elf
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
