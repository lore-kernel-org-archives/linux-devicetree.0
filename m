From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drivers/of: add option to load a default Device Tree
Date: Thu, 23 Jun 2016 11:27:46 -0700
Message-ID: <576C2A22.2020103@gmail.com>
References: <1466607954-2821-1-git-send-email-franck.jullien@odyssee-systemes.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466607954-2821-1-git-send-email-franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jose.abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/22/16 08:05, Franck Jullien wrote:
> Even if a platform doesn't use a device tree during its
> boot process it can be useful to enable CONFIG_OF and get
> an empty device tree.
> 
> Then, devices can use device tree overlays to populate this
> default tree.


Hi Franck,

Can you elaborate on the problem that you are trying to
solve and the use cases that you are envisioning?

Thanks,

Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
