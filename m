From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 4/6] v4l: vsp1: Add DT support
Date: Thu, 03 Apr 2014 12:17:18 +0200
Message-ID: <533D352E.7050302@samsung.com>
References: <1396461690-2334-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <533C832C.3080608@gmail.com> <1484365.AL7arRdPNh@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1484365.AL7arRdPNh@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On 03/04/14 01:16, Laurent Pinchart wrote:
>>> @@ -534,6 +569,7 @@ static struct platform_driver vsp1_platform_driver = {
>>> > >   		.owner	= THIS_MODULE,
>>> > >   		.name	= "vsp1",
>>> > >   		.pm	= &vsp1_pm_ops,
>>> > > +		.of_match_table = of_match_ptr(vsp1_of_match),
>> > 
>> > Is of_match_ptr() really useful here, when vsp1_of_match[] array is always
>> > compiled in ?
>
> Would it be better to compile the vsp1_of_match[] array conditionally ? On the 
> other hand the driver is only useful (at least at the moment) on ARM Renesas 
> SoCs, which are transitioning to DT anyway.

Given that #ifdefs could be soon removed anyway (when the platform becomes
dt-only) I guess it's better not to introduce it now.

-- 
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
