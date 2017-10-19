From: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: media: xilinx: fix typo in example
Date: Thu, 19 Oct 2017 23:22:39 +0900
Message-ID: <CAC5umyhkqORobZ779eWTA4ynZ3fdchTLO8zg5Q92Bfi5ppJ+aA@mail.gmail.com>
References: <1507824214-17744-1-git-send-email-akinobu.mita@gmail.com> <1546677.fKvj0pB9W9@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1546677.fKvj0pB9W9@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-10-19 1:08 GMT+09:00 Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>:
> Hi Akinobu,
>
> Thank you for the patch.
>
> On Thursday, 12 October 2017 19:03:34 EEST Akinobu Mita wrote:
>> Fix typo s/:/;/
>>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>> Signed-off-by: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Good catch.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>
> Should I take this patch in my tree ?

Yes, please do.
Could you also take a look at another patch that I sent at the same time
"media: xilinx-video: fix bad of_node_put() on endpoint error" ?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
