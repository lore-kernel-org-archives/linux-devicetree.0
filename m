From: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH V2] of: fix clang -Wunsequenced for be32_to_cpu()
Date: Wed, 1 May 2019 11:13:01 -0700
Message-ID: <CAKwvOdnVrm9MyBkWL=yykX0td-c6uB3=Ymo0hr8wMQG1QESreg@mail.gmail.com>
References: <46b3e8edf27e4c8f98697f9e7f2117d6@AcuMS.aculab.com>
 <20190430145624.30470-1-tranmanphong@gmail.com> <CAKwvOdmvA4sO7UsXW4DapO_HKodeWFwA_5FsNe_wVjneZBYYdg@mail.gmail.com>
 <CAKwvOdntTmHBinCK0T_8OZ-2ksUHkQBvDyR8WrxZdW=+yu25dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKwvOdntTmHBinCK0T_8OZ-2ksUHkQBvDyR8WrxZdW=+yu25dw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, Frank Rowand <frowand.list@gmail.com>, pantelis.antoniou@konsulko.com
Cc: David.Laight@aculab.com, hch@infradead.org, Nathan Chancellor <natechancellor@gmail.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Phong Tran <tranmanphong@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 30, 2019 at 9:29 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Apr 30, 2019 at 9:28 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> > Thanks for the patch.
> > Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> > Link: https://github.com/ClangBuiltLinux/linux/issues/460
> > Suggested-by: David Laight <David.Laight@ACULAB.COM>
>
> sent too soon...
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

We'll also need this for stable, can the maintainers please add the
following tag if it's not too late:

Cc: stable@vger.kernel.org

to unbreak ppc back through at least 4.14.
-- 
Thanks,
~Nick Desaulniers
