From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] drivers: of: Export of_reserved_mem_device_{init,release}
Date: Tue, 13 Jan 2015 12:23:27 +0100
Message-ID: <54B5002F.9030004@samsung.com>
References: <1420813745-130341-1-git-send-email-george_davis@mentor.com>
 <CAL_JsqJaT-Y7DHQS5ZZ0TP6r0iPDbUZwU-Kec5MSE7DOPgZxCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAL_JsqJaT-Y7DHQS5ZZ0TP6r0iPDbUZwU-Kec5MSE7DOPgZxCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "George G. Davis" <ggdavisiv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "George G. Davis" <george_davis-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On 2015-01-09 18:53, Rob Herring wrote:
> On Fri, Jan 9, 2015 at 8:29 AM, George G. Davis <ggdavisiv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Export of_reserved_mem_device_{init,release} so that modules
>> can initialize and release their assigned per-device cma_area.
> I believe the original intent was for the core bus code to call these
> functions. While the commit adding them says "automated assignment"
> that part did not go in. As it stands, there are no in tree users of
> these functions.
>
> Marek, comments?

Yes, my idea was to call it directly from platform bus code, but Grant
opposed, so right now the drivers need to do it on their own. Assuming
that those functions need to be called from drivers, then EXPORT_SYMPOL_GPL
is the correct approach.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
