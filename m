From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Documentation: update the of_selftest.txt
Date: Fri, 6 Mar 2015 08:40:06 -0600
Message-ID: <CAL_JsqKrYXnnPdL+wvkCKZr-q6z-2Wa+PDEaz7ixxvtDNAE3jw@mail.gmail.com>
References: <1425355008-56957-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425355008-56957-1-git-send-email-long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 2, 2015 at 9:56 PM, Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
> Since the directory "drivers/of/testcase-data" is renamed
> to "drivers/of/unittest-data". so we should update the path
> in the of_selftest.txt.
>
> When the kernel is build with OF_SELFTEST enabled, the output

s/build/built/

s/SELF/UNIT/

> dtb is testcases.dtb instead of testcase.dtb, also update it
> (s/testcase/testcases/).
>
> Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/of_selftest.txt | 22 +++++++++++-----------

Please rename to of_unittest.txt as well and rename occurrences of
selftest to unittest.

Rob

>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/devicetree/of_selftest.txt b/Documentation/devicetree/of_selftest.txt
> index 57a808b..ffce144 100644
> --- a/Documentation/devicetree/of_selftest.txt
> +++ b/Documentation/devicetree/of_selftest.txt
> @@ -22,31 +22,31 @@ most of the device drivers in various use cases.
>
>  2. Test-data
>
> -The Device Tree Source file (drivers/of/testcase-data/testcases.dts) contains
> +The Device Tree Source file (drivers/of/unittest-data/testcases.dts) contains
>  the test data required for executing the unit tests automated in
> -drivers/of/selftests.c. Currently, following Device Tree Source Include files
> -(.dtsi) are included in testcase.dts:
> +drivers/of/unittest.c. Currently, following Device Tree Source Include files
> +(.dtsi) are included in testcases.dts:
>
> -drivers/of/testcase-data/tests-interrupts.dtsi
> -drivers/of/testcase-data/tests-platform.dtsi
> -drivers/of/testcase-data/tests-phandle.dtsi
> -drivers/of/testcase-data/tests-match.dtsi
> +drivers/of/unittest-data/tests-interrupts.dtsi
> +drivers/of/unittest-data/tests-platform.dtsi
> +drivers/of/unittest-data/tests-phandle.dtsi
> +drivers/of/unittest-data/tests-match.dtsi
>
>  When the kernel is build with OF_SELFTEST enabled, then the following make rule
>
>  $(obj)/%.dtb: $(src)/%.dts FORCE
>         $(call if_changed_dep, dtc)
>
> -is used to compile the DT source file (testcase.dts) into a binary blob
> -(testcase.dtb), also referred as flattened DT.
> +is used to compile the DT source file (testcases.dts) into a binary blob
> +(testcases.dtb), also referred as flattened DT.
>
>  After that, using the following rule the binary blob above is wrapped as an
> -assembly file (testcase.dtb.S).
> +assembly file (testcases.dtb.S).
>
>  $(obj)/%.dtb.S: $(obj)/%.dtb
>         $(call cmd, dt_S_dtb)
>
> -The assembly file is compiled into an object file (testcase.dtb.o), and is
> +The assembly file is compiled into an object file (testcases.dtb.o), and is
>  linked into the kernel image.
>
>
> --
> 1.8.3.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
