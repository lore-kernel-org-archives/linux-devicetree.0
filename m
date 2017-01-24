From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] mtd: name the mtd device with an optional label
 property
Date: Tue, 24 Jan 2017 15:27:04 +0100
Message-ID: <20170124152704.03598ae5@bbrezillon>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
        <1484573225-19095-2-git-send-email-clg@kaod.org>
        <20170124151353.5bbffae0@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170124151353.5bbffae0@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 24 Jan 2017 15:13:53 +0100
Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> >  	if (mtd->dev.parent) {
> >  		if (!mtd->owner && mtd->dev.parent->driver)
> >  			mtd->owner = mtd->dev.parent->driver->owner;  
> 
> --->8---  
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 13f8052b9ff9..a12b68f941e3 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -385,6 +385,8 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
>                                    struct device_node *np)
>  {
>         mtd->dev.of_node = np;
> +
> +       of_property_read_string(np, "label", mtd->name);
>  }
>  
>  static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)

Sorry, I forgot to compile test this change. Here is a valid version:

--->8---
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 13f8052b9ff9..581057f8d9a5 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -24,6 +24,7 @@
 #include <linux/uio.h>
 #include <linux/notifier.h>
 #include <linux/device.h>
+#include <linux/of.h>
 
 #include <mtd/mtd-abi.h>
 
@@ -385,6 +386,8 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
                                   struct device_node *np)
 {
        mtd->dev.of_node = np;
+
+       of_property_read_string(np, "label", &mtd->name);
 }
 
 static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
