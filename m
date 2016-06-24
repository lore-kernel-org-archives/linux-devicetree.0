From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] of: fix memory leak related to safe_name()
Date: Fri, 24 Jun 2016 15:38:27 -0500
Message-ID: <CAL_JsqK=h5EC4RR4xpn-JioAbdLfmQFNt8MJk=UF==WvDWy-wQ@mail.gmail.com>
References: <5762E732.1030908@gmail.com> <CA+7wUsziB9P24bXnSrLB_t-KOZ2CVj9p5xZYsCnr5DNZL8mg+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+7wUsziB9P24bXnSrLB_t-KOZ2CVj9p5xZYsCnr5DNZL8mg+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Malaterre <mathieu.malaterre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 17, 2016 at 2:51 AM, Mathieu Malaterre
<mathieu.malaterre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> v3 tested here multiple times ! memleak is now gone.
>
> Tested-by: Mathieu Malaterre <mathieu.malaterre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Thanks
>
> On Thu, Jun 16, 2016 at 7:51 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>>
>> Fix a memory leak resulting from memory allocation in safe_name().
>> This patch fixes all call sites of safe_name().

Applied, thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
