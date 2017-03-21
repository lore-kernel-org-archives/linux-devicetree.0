From: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Question regarding back compatibility for DT
Date: Tue, 21 Mar 2017 11:27:37 -0500
Message-ID: <CABGGisyuq6=3RTKZ7ceUjt_iFZVag0EMViqmXSKSg5bM2-o-Cw@mail.gmail.com>
References: <20170321155814.GA10342@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170321155814.GA10342@mai>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 21, 2017 at 10:58 AM, Daniel Lezcano
<daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Rob, dt people,
>
> is it acceptable a driver is changed using a new DT binding but becomes
> incompatible with the old DT files ?
>
> IOW, is it possible to change the DT and the driver without supporting the old
> DT format, forcing an update of the DT and the kernel ?

If you want a global rule, then no it is not okay. However, it depends
on the platform and it's users. I just ask that breaking compatibility
and why is highlighted in the commit message and the platform
maintainer is okay with it.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
