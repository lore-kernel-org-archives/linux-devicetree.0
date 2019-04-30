From: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH V2] of: fix clang -Wunsequenced for be32_to_cpu()
Date: Tue, 30 Apr 2019 09:29:12 -0700
Message-ID: <CAKwvOdntTmHBinCK0T_8OZ-2ksUHkQBvDyR8WrxZdW=+yu25dw@mail.gmail.com>
References: <46b3e8edf27e4c8f98697f9e7f2117d6@AcuMS.aculab.com>
 <20190430145624.30470-1-tranmanphong@gmail.com> <CAKwvOdmvA4sO7UsXW4DapO_HKodeWFwA_5FsNe_wVjneZBYYdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKwvOdmvA4sO7UsXW4DapO_HKodeWFwA_5FsNe_wVjneZBYYdg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phong Tran <tranmanphong@gmail.com>
Cc: robh+dt@kernel.org, Frank Rowand <frowand.list@gmail.com>, pantelis.antoniou@konsulko.com, David.Laight@aculab.com, hch@infradead.org, Nathan Chancellor <natechancellor@gmail.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 30, 2019 at 9:28 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Apr 30, 2019 at 7:58 AM Phong Tran <tranmanphong@gmail.com> wrote:
> >
> > Now, make the loop explicit to avoid clang warning.
> >
> > ./include/linux/of.h:238:37: warning: multiple unsequenced modifications
> > to 'cell' [-Wunsequenced]
> >                 r = (r << 32) | be32_to_cpu(*(cell++));
> >                                                   ^~
> > ./include/linux/byteorder/generic.h:95:21: note: expanded from macro
> > 'be32_to_cpu'
> >                     ^
> > ./include/uapi/linux/byteorder/little_endian.h:40:59: note: expanded
> > from macro '__be32_to_cpu'
> >                                                           ^
> > ./include/uapi/linux/swab.h:118:21: note: expanded from macro '__swab32'
> >         ___constant_swab32(x) :                 \
> >                            ^
> > ./include/uapi/linux/swab.h:18:12: note: expanded from macro
> > '___constant_swab32'
> >         (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
> >                   ^
> >
> > Signed-off-by: Phong Tran <tranmanphong@gmail.com>
>
> Thanks for the patch.
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/460
> Suggested-by: David Laight <David.Laight@ACULAB.COM>

sent too soon...
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
