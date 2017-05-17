From: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v1 1/3] of: base: Provide of_graph_get_port_parent()
Date: Wed, 17 May 2017 21:02:42 +0100
Message-ID: <61138419-5781-bbec-7ac5-44524ad501ce@ideasonboard.com>
References: <cover.6800d0e1b9b578b82f68dec1b99b3a601d6e54ca.1495032810.git-series.kieran.bingham+renesas@ideasonboard.com>
 <56c9c74fa9e2879aea9e008d54d8b8d7b450b8ae.1495032810.git-series.kieran.bingham+renesas@ideasonboard.com>
 <CAL_JsqLvXH3kKV-DxWuNrAYGh8=L8Mdg5zcm2RsHZTpmi_8g-g@mail.gmail.com>
Reply-To: kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLvXH3kKV-DxWuNrAYGh8=L8Mdg5zcm2RsHZTpmi_8g-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kieran Bingham <kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17/05/17 17:36, Rob Herring wrote:
> On Wed, May 17, 2017 at 10:03 AM, Kieran Bingham <kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> From: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>>
>> When handling endpoints, the v4l2 async framework needs to identify the
>> parent device of a port endpoint.
>>
>> Adapt the existing of_graph_get_remote_port_parent() such that a caller
>> can obtain the parent of a port without parsing the remote-endpoint
>> first.
> 
> A similar patch is already applied as part of the ASoC graph card support.
> 
> Rob

Ah yes, a quick google finds it...
:  https://patchwork.kernel.org/patch/9658907/

Surprisingly similar patch ... and a familiar name.

Morimoto-san - you beat me to it :D !

Thanks Rob, (And Morimoto!)

--
Kieran
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
