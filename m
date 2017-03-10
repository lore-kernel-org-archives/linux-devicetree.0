From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCHv3 07/15] atmel-isi: remove dependency of the soc-camera
 framework
Date: Fri, 10 Mar 2017 14:01:19 +0200
Message-ID: <20170310120119.GG3220@valkosipuli.retiisi.org.uk>
References: <20170306145616.38485-1-hverkuil@xs4all.nl>
 <20170306145616.38485-8-hverkuil@xs4all.nl>
 <20170310103920.GW3220@valkosipuli.retiisi.org.uk>
 <e9f9a41c-c1bb-dfca-646c-c0c24e99d939@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e9f9a41c-c1bb-dfca-646c-c0c24e99d939-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Fri, Mar 10, 2017 at 12:25:54PM +0100, Hans Verkuil wrote:
> Slight problem with this. If I make this change, then the of_node_put below
> changes as well:
> 
> @@ -1193,7 +1176,7 @@ static int isi_graph_init(struct atmel_isi *isi)
>  done:
>         if (ret < 0) {
>                 v4l2_async_notifier_unregister(&isi->notifier);
> -               of_node_put(isi->entity.node);
> +               of_node_put(isi->entity.asd.match.of.node);
>         }
> 
> And I get this compiler warning:
> 
>   CC [M]  drivers/media/platform/atmel/atmel-isi.o
> drivers/media/platform/atmel/atmel-isi.c: In function ‘isi_graph_init’:
> drivers/media/platform/atmel/atmel-isi.c:1179:15: warning: passing argument 1 of ‘of_node_put’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
>    of_node_put(isi->entity.asd.match.of.node);
>                ^~~
> In file included from drivers/media/platform/atmel/atmel-isi.c:25:0:
> ./include/linux/of.h:130:20: note: expected ‘struct device_node *’ but argument is of type ‘const struct device_node *’
>  static inline void of_node_put(struct device_node *node) { }
>                     ^~~~~~~~~~~
> 
> 
> Any suggestions? Just keep the entity.node after all?

Yeah, makes sense, I didn't come to think of that.

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
