From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: drivers/of: crash on boot
Date: Wed, 18 May 2016 14:36:31 -0500
Message-ID: <CAL_JsqJsjh+Shk1nD5YQeQ=6B1MZOyEj5oX-q_xKH642toURdA@mail.gmail.com>
References: <573C8B6C.6030900@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <573C8B6C.6030900-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sasha Levin <sasha.levin-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 18, 2016 at 10:34 AM, Sasha Levin <sasha.levin-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Rhyland,
>
> I'm seeing a crash on boot that seems to have been caused by
> "drivers/of: Fix depth when unflattening devicetree":
>
> [   61.145229] ==================================================================
>
> [   61.147588] BUG: KASAN: stack-out-of-bounds in unflatten_dt_nodes+0x11d2/0x1290 at addr ffff88005b30777c

The following appears to fix it for me. Rhyland, please confirm.

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 7f38241..888ec2a 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -409,7 +409,7 @@ static int unflatten_dt_nodes(const void *blob,
        fpsizes[depth] = dad ? strlen(of_node_full_name(dad)) : 0;
        nps[depth+1] = dad;
        for (offset = 0;
-            offset >= 0;
+            offset >= 0, depth >= 0;
             offset = fdt_next_node(blob, offset, &depth)) {
                if (WARN_ON_ONCE(depth >= FDT_MAX_DEPTH))
                        continue;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
