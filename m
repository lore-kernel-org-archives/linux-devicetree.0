From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: base: improve of_get_next_child() kernel-doc
Date: Wed, 22 Apr 2015 23:10:50 -0500
Message-ID: <CAL_Jsq+M-KWU1Ld=zpd=0NrKrSPVFwtWAJuoxQ2L-UsJSLhT-w@mail.gmail.com>
References: <360c70ee4131ea8048b193bfff359360bb854fe3.1426766621.git.baruch@tkos.co.il>
 <CAL_JsqKvEYC9NUB2ZNgAgr7KrimT9ZmvGdxjJhNE+5uF9n+nkQ@mail.gmail.com>
 <20150328202939.GA12479@tarshish> <20150416164631.GL30380@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150416164631.GL30380@tarshish>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 16, 2015 at 11:46 AM, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:
> Hi Rob,
>
> On Sat, Mar 28, 2015 at 11:29:39PM +0300, Baruch Siach wrote:
>> On Tue, Mar 24, 2015 at 11:45:16PM -0500, Rob Herring wrote:
>> > On Thu, Mar 19, 2015 at 7:03 AM, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:
>> > > Add two new facts to of_get_next_child() documentation:
>> > >
>> > >    * of_get_next_child() returns NULL when there is not next child
>> > >
>> > >    * of_get_next_child() decrements the refcount of prev
>> > >
>> > > Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
>> >
>> > Applied. Thanks.
>>
>> Thanks. Which tree is this patch going through? I don't see it in current
>> -next (next-20150327).
>
> Ping?

Somehow I dropped this. Anyway, now it is applied and sent to Linus.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
