From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Adding selftest testdata dynamically into live tree
Date: Wed, 24 Sep 2014 11:03:46 -0700
Message-ID: <CA+rpMbKkS1D=QYSMftgZyTMbHS9+O=YjR+OL_RvzjJPjo2Ox6w@mail.gmail.com>
References: <542064F1.4000601@elproma.com.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542064F1.4000601-9tnw74Q4ehaHKKo6LODCOg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Janusz_U=C5=BCycki?= <j.uzycki-9tnw74Q4ehaHKKo6LODCOg@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 22, 2014 at 11:05 AM, Janusz U=C5=BCycki <j.uzycki@elproma.=
com.pl> wrote:
> Hi.
>
> On 3.17.0-rc6-next-20140922+ with CONFIG_OF_SELFTEST enabled
> zImage is recreated every time I call "make" despite I've not done
> any change in source files and zImage was the same.
> This is caused by the rm line:

I believe the make rule compiles test data without checking
whether the test data dts files have been changed or not.

I am not sure how to fix it. So, either direct me or feel free to
pick it. Thanks!

>   CALL    scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
>   DTC     drivers/of/testcase-data/testcases.dtb
>   DTB     drivers/of/testcase-data/testcases.dtb.S
>   AS      drivers/of/testcase-data/testcases.dtb.o
>   LD      drivers/of/of_selftest.o
>   LD      drivers/of/built-in.o
> rm drivers/of/testcase-data/testcases.dtb.S
> drivers/of/testcase-data/testcases.dtb
>   LD      drivers/built-in.o
>   LINK    vmlinux
>   LD      vmlinux.o
>
> best regards
> Janusz
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
