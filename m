From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] of: Introduce of_node_get_match_data() helper
Date: Fri, 9 Jun 2017 10:30:00 +0300
Message-ID: <7ff6bd21-19f0-7e0c-18bf-e835e7d4319e@mentor.com>
References: <1493142007-29347-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493142007-29347-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Geert,

On 04/25/2017 08:40 PM, Geert Uytterhoeven wrote:
> If CONFIG_OF=n, code using
> 
>     info = of_match_node(matchs, np)->data;
> 
> fails to compile:
> 
>     warning: dereferencing ‘void *’ pointer
>     error: request for member ‘data’ in something not a structure or union

IMHO firstly all the cases like one above must be fixed in place, in
parallel do an overall conversion of subcases:

-	of_id = of_match_node(some_dt_ids, dev->of_node);
+	of_id = of_match_device(some_dt_ids, dev);

> Follow the example set by of_device_get_match_data(), and introduce a
> new helper of_node_get_match_data().  This will allow to increase
> compile-testing coverage later.

Unfortunately the proposed of_node_get_match_data() is not so similar
to the of_device_get_match_data(), the latter one has only one input
argument in opposite to of_match_device(), which is truly convenient.

> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

The change itself is good.

Reviewed-by: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
