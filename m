From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [U-Boot] [PATCH] fdt: Enhance dts/Makefile to be all things to
 all men
Date: Wed, 29 May 2013 16:52:15 -0600
Message-ID: <51A6869F.1020004@wwwdotorg.org>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
 <20130528210829.850203831A2@gemini.denx.de> <51A634B5.5060309@wwwdotorg.org>
 <20130529213347.821AE3831A5@gemini.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130529213347.821AE3831A5-C2Gvrrd9BC/j/ljBK/0BTg@public.gmane.org>
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
To: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Cc: u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/29/2013 03:33 PM, Wolfgang Denk wrote:
> Dear Stephen,
> 
> In message <51A634B5.5060309-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> you wrote:
>>
>>> I think this is not a good way to address this issue.  The GCC
>>> documentation (section "System-specific Predefined Macros" [1])
>>> desribes how this should be handled.  The "correct" (TM) way to fix
>>> this is by adding "-ansi" or any "-std" option that requests strict
>>> conformance to the compiler/preprocessor command line.
>>>
>>> [1] http://gcc.gnu.org/onlinedocs/cpp/System_002dspecific-Predefined-Macros.html#System_002dspecific-Predefined-Macros
>>
>> -ansi at least was considered when the Linux kernel patches for dtc+cpp
>> support were being developed, but it was rejected. While it possibly
> 
> Can you provide references?  I'd like to understand why it was
> rejected - it seems to be the "official" approach to the problem.
> 
>> does solve this specific issue fine, there were other more general
>> problems; IIRC (and I might not) it completely changes the way macro
>> expansion happens, which results in it being pretty useless. Hence, "-x
>> assembler-with-cpp" was chosen over e.g. "-ansi".
> 
> Again, do you have any reference?  "completely changes the way macro
> expansion happens" sounds terribly dangerous, so it would be better to
> know about that exactly...

Sorry, I was thinking about -traditional-cpp, not -ansi. We had
considered -traditional-cpp as a workaround because DT uses property
names that start with #, and this triggered cpp to treat them as macro
names, which went wrong. However, due to -traditional-cpp being quite
different from ISO cpp, we selected -x assembler-with-cpp instead, which
both implements an ISO cpp, but also only handles pre-processing
directives with the # in column 1.

Now, let's discuss -ansi vs. -undef some more.

Since DT is supposed to be a HW description, it shouldn't be using cpp's
built-in macros to compile in different ways; there really isn't a
concept of the "target arch of compilation"; a .dts file should simply
compile the same way everywhere. Different DTs represent different HW;
we don't use a single DT with conditional compilation to represent
different HW. This led Rob Herring (one of the kernel device tree
maintainers) to propose the following rules for cpp usage on device trees:

https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-October/020831.html

One of which was:

- No gcc built-in define usage

I don't see any disagreement with that bullet point in the thread, and
indeed it makes sense to me for the reasons I outlined above.

Some history on why we needed to not-define, or un-define, some macros
(such as the linux macro we're discussing here) can be found in:

http://linux-kernel.2935.n7.nabble.com/PATCH-V7-kbuild-create-a-rule-to-run-the-pre-processor-on-dts-files-td575632.html

The last few messages there end up mentioning -undef, which we/I ended
up using. It looks like -ansi wasn't mentioned at all when discussing
this issue.

However, I assert that -undef is better, since we end up without any
pre-defined macros, which DT files shouldn't be using anyway. By my
reading of the cpp manual link you send, -ansi simply stops
non-conforming pre-defined macros from being defined, but doesn't stop
them all being defined as -undef does. Hence, I prefer -undef.

Oh, and another of Rob's proposed rules:

- No kernel kconfig option usage

Would also imply that U-Boots config headers shouldn't be accessible
when compiling device trees. The last few kernel patches I sent to
enable dtc+cpp usage were specifically aimed at limiting the set of
headers that DT files can use to those specifically part of the DT
bindings, and not general Linux headers, For example, see the following
Linux kernel commit:

==========
kbuild: create an "include chroot" for DT bindings

The recent dtc+cpp support allows header files and C pre-processor
defines/macros to be used when compiling device tree files. These
headers will typically define various constants that are part of the
device tree bindings.

The original patch which set up the dtc+cpp include path only considered
using those headers from device tree files. However, most are also
useful for kernel code which needs to interpret the device tree.

In both the DT files and the kernel, I'd like to include the DT-related
headers in the same way, for example, <dt-bindings/gpio/tegra-gpio.h>.
That will simplify any text which discusses the DT header locations.

Creating a <dt-bindings/> for kernel source to use is as simple as
placing files into include/dt-bindings/.

However, when compiling DT files, the include path should be restricted
so that only the dt-bindings path is available; arbitrary kernel headers
shouldn't be exposed. For this reason, create a specific include
directory for use by dtc+cpp, and symlink dt-bindings from there to the
actual location of include/dt-bindings/. For want of a better location,
place this "include chroot" into the existing dts/ directory.

arch/*/boot/dts/include/dt-bindings -> ../../../../../include/dt-bindings

Some headers used by device tree files may not be useful to the kernel;
they may be used simply to aid in constructing the DT file (e.g. macros
to create a node), but not define any information that the kernel needs
to share. These may be placed directly into arch/*/boot/dts/ along with
the DT files themselves.
==========
