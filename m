From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: [PATCH] Rename _B to _XBYTE in libfdt_env.h.
Date: Tue, 10 Apr 2012 09:39:57 -0500
Message-ID: <E1SHcEf-0007wV-VH@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


OK.  Let's review how development works, by convention, in the Open
Source Community.  For starters, it's not my itch to scratch, as I don't
care about Cygwin.  As follow up, here's a public posting of the patch
for review.

Thanks for understanding,
jdl

------- Forwarded Message

Return-Path: andree182-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Delivery-Date: Tue Apr 10 04:42:59 2012
Return-path: <andree182-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Envelope-to: jdl-CYoMK+44s/E@public.gmane.org
Delivery-date: Tue, 10 Apr 2012 04:42:59 -0500
Received: from mail-qc0-f174.google.com ([209.85.216.174])
	by jdl.com with esmtp (Exim 4.72)
	(envelope-from <andree182-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>)
	id 1SHXbG-0003H3-CM
	for jdl-CYoMK+44s/E@public.gmane.org; Tue, 10 Apr 2012 04:42:59 -0500
Received: by qcro28 with SMTP id o28so3406084qcr.5
        for <jdl-CYoMK+44s/E@public.gmane.org>; Tue, 10 Apr 2012 02:42:51 -0700 (PDT)
Received: by 10.224.53.6 with SMTP id k6mr13439024qag.25.1334050971671; Tue,
 10 Apr 2012 02:42:51 -0700 (PDT)
MIME-Version: 1.0
Sender: andree182-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Received: by 10.229.230.18 with HTTP; Tue, 10 Apr 2012 02:42:31 -0700 (PDT)
In-Reply-To: <E1SHExs-0001cI-6E-CYoMK+44s/E@public.gmane.org>
References: <E1SEpdZ-0000dW-8Z-CYoMK+44s/E@public.gmane.org> <1333434921-14153-1-git-send-email-andree-/tK0A0Qp8GRaa/9Udqfwiw@public.gmane.org>
 <E1SHExs-0001cI-6E-CYoMK+44s/E@public.gmane.org>
From: =?ISO-8859-1?Q?Andrej_Krut=E1k?= <andree-/tK0A0Qp8GRaa/9Udqfwiw@public.gmane.org>
Date: Tue, 10 Apr 2012 11:42:31 +0200
X-Google-Sender-Auth: Shpb895xEpu8vb2twHQiSB32YTQ
Message-ID: <CAFnc+wXNyeBeUifgTXWdrMQ5vkze+sW-QpM4N16KQ1wQw5r=SQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] Rename _B to _XBYTE in libfdt_env.h.
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Content-Type: multipart/alternative; boundary=20cf3074d9a8475ab904bd4ff20c
Received-SPF: pass
X-SPF-Guess: pass
X-Spam-Score: 1.5

- --20cf3074d9a8475ab904bd4ff20c
Content-Type: text/plain; charset=ISO-8859-1

Ok, here is the version against your git repo head.
If there are any more problems, please do the one-line sed yourself, as
this probably costs us both significantly more time compared to if you did
it yourself.


Best regards,

Andrej



The _B macro is also defined by cygwin in ctype.h.
Rename _B to _XBYTE to better avoid name collisions.

Signed-off-by: Andrej Krutak <andree-/tK0A0Qp8GRaa/9Udqfwiw@public.gmane.org>
- ---
 libfdt/libfdt_env.h |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
index da952e7..e8d2992 100644
- --- a/libfdt/libfdt_env.h
+++ b/libfdt/libfdt_env.h
@@ -5,25 +5,26 @@
 #include <stdint.h>
 #include <string.h>

- -#define _B(n)    ((unsigned long long)((uint8_t *)&x)[n])
+#define _XBYTE(n)    ((unsigned long long)((uint8_t *)&x)[n])
 static inline uint16_t fdt16_to_cpu(uint16_t x)
 {
- -    return (_B(0) << 8) | _B(1);
+    return (_XBYTE(0) << 8) | _XBYTE(1);
 }
 #define cpu_to_fdt16(x) fdt16_to_cpu(x)

 static inline uint32_t fdt32_to_cpu(uint32_t x)
 {
- -    return (_B(0) << 24) | (_B(1) << 16) | (_B(2) << 8) | _B(3);
+    return (_XBYTE(0) << 24) | (_XBYTE(1) << 16) | (_XBYTE(2) << 8) |
_XBYTE(3);
 }
 #define cpu_to_fdt32(x) fdt32_to_cpu(x)

 static inline uint64_t fdt64_to_cpu(uint64_t x)
 {
- -    return (_B(0) << 56) | (_B(1) << 48) | (_B(2) << 40) | (_B(3) << 32)
- -        | (_B(4) << 24) | (_B(5) << 16) | (_B(6) << 8) | _B(7);
+    return (_XBYTE(0) << 56) | (_XBYTE(1) << 48) | (_XBYTE(2) << 40)
+        | (_XBYTE(3) << 32) | (_XBYTE(4) << 24) | (_XBYTE(5) << 16)
+        | (_XBYTE(6) << 8) | _XBYTE(7);
 }
 #define cpu_to_fdt64(x) fdt64_to_cpu(x)
- -#undef _B
+#undef _XBYTE

 #endif /* _LIBFDT_ENV_H */
- -- 
1.7.4.1



On Mon, Apr 9, 2012 at 3:49 PM, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:

> > The _B macro is also defined by cygwin in ctype.h.
> > Rename _B to _XBYTE to better avoid name collisions.
> >
> > Signed-off-by: Andrej Krutak <andree-/tK0A0Qp8GRaa/9Udqfwiw@public.gmane.org>
> > ---
> >  scripts/dtc/libfdt/libfdt_env.h |   11 ++++++-----
> >  1 files changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/scripts/dtc/libfdt/libfdt_env.h
> b/scripts/dtc/libfdt/libfdt_env.h
> > index 449bf60..4ec8565 100644
> > --- a/scripts/dtc/libfdt/libfdt_env.h
> > +++ b/scripts/dtc/libfdt/libfdt_env.h
>
> This patch is against the kernel _copy_ of the DTC sources.
> Technically, we'll need it against the upstream sources
> as found here:
>
>    git://git.jdl.com/software/dtc.git
>
> Later, the patch will appear in the kernel when it updates
> with a newer source drop.
>
> Thanks,
> jdl


------- End of Forwarded Message
