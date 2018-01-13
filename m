From: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] media: ov9650: add device tree binding
Date: Sun, 14 Jan 2018 01:10:37 +0900
Message-ID: <CAC5umyjhoZkvca+fgm-YfA666MDWh4gSDqdu5oxqYQmt6pHTyA@mail.gmail.com>
References: <1515344064-23156-1-git-send-email-akinobu.mita@gmail.com>
 <1515344064-23156-3-git-send-email-akinobu.mita@gmail.com>
 <CGME20180112141549epcas2p18e8981052885dbaaf8a0be2ac8410082@epcas2p1.samsung.com>
 <20180108093513.nvr2e7vbt7imai2p@paasikivi.fi.intel.com> <438bc4cb-6486-8013-80aa-9e2253941fb8@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <438bc4cb-6486-8013-80aa-9e2253941fb8-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jacopo Mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, "H . Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2018-01-12 23:15 GMT+09:00 Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>:
> On 01/08/2018 10:35 AM, Sakari Ailus wrote:
>
>> I was going to say you're missing the MAINTAINERS entry for this newly
>> added file but then I noticed that the entire driver is missing an entry.
>> Still this file should have a MAINTAINERS entry added for it independently
>> of that, in the same patch.
>>
>> Cc Sylwester.
>
> I don't the hardware and I can't test the patches so Mita-san if you wish
> so please add yourself as a maintainer of whole driver.

Even if you don't have the hardware, you can help reviwing.  So if you
don't mind, I would like to add the following maintainer entry for this
driver.

OMNIVISION OV9650 SENSOR DRIVER
M:      Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
R:      Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
R:      Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
L:      linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
T:      git git://linuxtv.org/media_tree.git
S:      Maintained
F:      drivers/media/i2c/ov9650.c
F:      Documentation/devicetree/bindings/media/i2c/ov9650.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
