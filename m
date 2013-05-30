From: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Subject: Re: [U-Boot] [PATCH] fdt: Enhance dts/Makefile to be all things to
 all men
Date: Thu, 30 May 2013 09:05:53 +0200
Message-ID: <20130530070553.04EB4383069@gemini.denx.de>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
 <20130528210829.850203831A2@gemini.denx.de> <51A634B5.5060309@wwwdotorg.org>
 <20130529213347.821AE3831A5@gemini.denx.de> <51A6869F.1020004@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <51A6869F.1020004-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Stephen,

In message <51A6869F.1020004-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> you wrote:
>
> Since DT is supposed to be a HW description, it shouldn't be using cpp's
> built-in macros to compile in different ways; there really isn't a
> concept of the "target arch of compilation"; a .dts file should simply
> compile the same way everywhere. Different DTs represent different HW;

I am not 100% sure of that.  First, it's not correct to say "compiled
compile the same way everywhere" - it's not that "where" it compiled,
butthe "for which machine", i. e. which exact cross tool chain is
selected.

And I can well imagine DTs that include parts for specific IP blocks,
where the exact details might depend on the target architecture.  We
see an incresing number of cases where the same IP blocks are being
used in different architectures, even of different endianess, etc.
So even if this appears not useful or needed today, I think we should
not intentionally barr the way unless that would realy cause problems
to us.  

Or do you see a real potentiol of conflict with the classed "reserved
namespaces" in GCC with double underscores?

> we don't use a single DT with conditional compilation to represent
> different HW. This led Rob Herring (one of the kernel device tree
> maintainers) to propose the following rules for cpp usage on device trees:
> 
> https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-October/020831.html
> 
> One of which was:
> 
> - No gcc built-in define usage

I understand that was part of some discussion then.  But has it been
generally agreed on, and eventually even turned into a DT policy
document?

> Some history on why we needed to not-define, or un-define, some macros
> (such as the linux macro we're discussing here) can be found in:
> 
> http://linux-kernel.2935.n7.nabble.com/PATCH-V7-kbuild-create-a-rule-to-run-the-pre-processor-on-dts-files-td575632.html
> 
> The last few messages there end up mentioning -undef, which we/I ended
> up using. It looks like -ansi wasn't mentioned at all when discussing
> this issue.

"-x assembler-with-cpp" makes sense for other reasons, i. e. being
able to mark related lines incommonly used header files with
__ASSEMBLER__ and making sure that '#' gets only processed when in
column 1.  It does NOT solve the indetifier problem, though, as GCC
will still define "unix" and :linux" (and eventually more):

	-> gcc -E -dM -x assembler-with-cpp - < /dev/null | grep -v _
	#define unix 1
	#define linux 1

> However, I assert that -undef is better, since we end up without any
> pre-defined macros, which DT files shouldn't be using anyway. By my
> reading of the cpp manual link you send, -ansi simply stops
> non-conforming pre-defined macros from being defined, but doesn't stop
> them all being defined as -undef does. Hence, I prefer -undef.

Why do you want to stop something which doesn't hurt you, but might
eventually be useful in other cases?

No, I do not have any real such use cases at hand, but I can see that
it might be for example useful to auto-detect the certain properties
of the system we're building for.

> Oh, and another of Rob's proposed rules:

Agreed, another propsal...

> shouldn't be exposed. For this reason, create a specific include
> directory for use by dtc+cpp, and symlink dt-bindings from there to the
> actual location of include/dt-bindings/. For want of a better location,
> place this "include chroot" into the existing dts/ directory.
> 
> arch/*/boot/dts/include/dt-bindings -> ../../../../../include/dt-bindings

OT here, but: Don't you see a risk that such arch specific things
might become a problem soon?


Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org
The only way to get rid of a temptation is to yield to it.
                                                        - Oscar Wilde
