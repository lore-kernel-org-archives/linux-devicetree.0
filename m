From: Phong Tran <tranmanphong@gmail.com>
Subject: Re: [PATCH] of: replace be32_to_cpu to be32_to_cpup
Date: Tue, 30 Apr 2019 21:44:19 +0700
Message-ID: <CAD3AR6EU53O_KDR=k6B6Ubrn4Cvec7Gn5xQVQssCA-KFb=uBRg@mail.gmail.com>
References: <20190430090044.16345-1-tranmanphong@gmail.com> <20190430133231.GA5646@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430133231.GA5646@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: robh+dt@kernel.org, frowand.list@gmail.com, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, natechancellor@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Tue, Apr 30, 2019 at 8:32 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Apr 30, 2019 at 04:00:44PM +0700, Phong Tran wrote:
> >
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index e240992e5cb6..1c35fc8f19b0 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -235,7 +235,7 @@ static inline u64 of_read_number(const __be32 *cell, int size)
> >  {
> >       u64 r = 0;
> >       while (size--)
> > -             r = (r << 32) | be32_to_cpu(*(cell++));
> > +             r = (r << 32) | be32_to_cpup(cell++);
> >       return r;
>
> This whole function looks odd.  It could simply be replaced with
> calls to get_unaligned_be64 / get_unaligned_be32.  Given that we have a
> lot of callers we can't easily do that, but at least we could try
> something like
>
It's risky. there are many callers of of_read_number().
There is suggestion from David
(https://lore.kernel.org/lkml/46b3e8edf27e4c8f98697f9e7f2117d6@AcuMS.aculab.com/)
only changing the loop.

> static inline u64 of_read_number(const __be32 *cell, int size)
> {
>         WARN_ON_ONCE(size < 1);
>         WARN_ON_ONCE(size > 2);
>
>         if (size == 1)
>                 return get_unaligned_be32(cell);
>         return get_unaligned_be64(cell);
> }

Thank you for your support.

Phong.
