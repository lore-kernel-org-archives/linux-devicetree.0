From: Chris Packham <judge.packham-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fwd: fdtdump and libfdt SEGV with corrupt file
Date: Mon, 11 Nov 2013 09:55:29 +1300
Message-ID: <CAFOYHZAVAWpaQnKMVD+EqV+FkvxzHbu-UxNqqQ6PExKd0a2Pyg@mail.gmail.com>
References: <CAFOYHZDmxB-EN9qG0B_tNK6XyQdLS_3G=_TGoo1psPKFi-Ht-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFOYHZDmxB-EN9qG0B_tNK6XyQdLS_3G=_TGoo1psPKFi-Ht-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

(resend to updated list address)

Hi,

Four our embedded device we use a FIT[1] image to encapsulate our
kernel, initrd etc. We use libfdt to do some verification on an image
before it is installed.

With a particular corrupt file we're seeing the following crash from
our application using libfdt (hopefully gmail doesn't munge the
formatting too much).

Program terminated with signal 11, Segmentation fault.
#0  0x0f7b1108 in _IO_acquire_lock_fct (fp=<value optimized out>) at
../libio/libioP.h:940
        in ../libio/libioP.h
--------------------------------------------------------------------------------
Thread Information:
* 1 Thread 6922  0x0f7b1108 in strlen () from /lib/libc.so.6
--------------------------------------------------------------------------------
Current Thread Local Variables:
No symbol table info available.
--------------------------------------------------------------------------------
Thread Backtraces:
Thread 1 (Thread 6922):
#0  0x0f7b1108 in strlen () from /lib/libc.so.6
#1  0x0fe741f0 in _fdt_string_eq (fdt=0x3002e000, offset=8,
name=0xfe753d2 "target", namelen=6, lenp=0x7fa41358) at
libfdt/fdt_ro.c:88
#2  fdt_get_property_namelen (fdt=0x3002e000, offset=8, name=0xfe753d2
"target", namelen=6, lenp=0x7fa41358) at libfdt/fdt_ro.c:274
#3  0x0fe742a0 in fdt_get_property (fdt=0x3002e000, nodeoffset=<value
optimized out>, name=<value optimized out>, lenp=0x7fa41358) at
libfdt/fdt_ro.c:288
...
(note dtc-v1.3.0 was being used for the above crash but the same
problem exists with dtc-v1.4.0)

Looking at the code I think this problem is related to _fdt_string_eq
doing the strlen on the data before the memcmp which would have
terminated early. I could fix my problem by reversing the calls to
strlen and memcmp but I suspect that would only mask harder to find
problems.

When I run fdtdump on the file I get a different crash

Program terminated with signal 11, Segmentation fault.
#0  0x0ff02108 in _IO_acquire_lock_fct (fp=<value optimized out>) at
../libio/libioP.h:940
        in ../libio/libioP.h
--------------------------------------------------------------------------------
Thread Information:
* 1 Thread 5448  0x0ff02108 in strlen () from /lib/libc.so.6
--------------------------------------------------------------------------------
Current Thread Local Variables:
No symbol table info available.
--------------------------------------------------------------------------------
Thread Backtraces:
Thread 1 (Thread 5448):
#0  0x0ff02108 in strlen () from /lib/libc.so.6
#1  0x0feccae8 in _IO_vfprintf_internal (s=0xffc48f8,
format=0x100022b9 "%*s%s", ap=0x7fceecb8) at vfprintf.c:1629
#2  0x0ff5dff0 in ___printf_chk (flag=1, format=0x100022b9 "%*s%s") at
printf_chk.c:36
#3  0x10000f20 in printf (argc=<value optimized out>, argv=<value
optimized out>)
    at /usr/include/bits/stdio2.h:104
#4  dump_blob (argc=<value optimized out>, argv=<value optimized out>)
at fdtdump.c:140
#5  main (argc=<value optimized out>, argv=<value optimized out>) at
fdtdump.c:224

Similar problem with an unbounded string. In this case I can't think
of an easy fix.

The corrupt file is around 16MB so I won't post it. I will see if I
can come up with a shorter file that shows the same problem.

Any thoughts on how to detect this corruption and/or avoid the
crashes? We're calling fdt_check_header to catch invalid files but the
corrupt file passes this check.

Thanks,
Chris

P.S. Is there a tarball release for v1.4.0?
http://www.jdl.com/software/ only goes up to v1.3.0.

--
[1] - http://git.denx.de/cgi-bin/gitweb.cgi?p=u-boot.git;a=blob;f=doc/uImage.FIT/howto.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
