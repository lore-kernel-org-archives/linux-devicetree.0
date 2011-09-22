From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 1/5] Add fdt read/write utility functions
Date: Thu, 22 Sep 2011 12:07:34 -0700
Message-ID: <CAPnjgZ1in8v8TsAxY--=HwTS8=3EsS9i3Z7i7j7cU1iAKatnPA@mail.gmail.com>
References: <1316711466-14199-1-git-send-email-sjg@chromium.org>
	<1316711466-14199-2-git-send-email-sjg@chromium.org>
	<E1R6oQ2-00016C-DY@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <E1R6oQ2-00016C-DY-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jon,

On Thu, Sep 22, 2011 at 11:54 AM, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:
>> This adds higher-level libfdt operations for reading/writing an fdt
>> blob from/to a file, as well as a function to decode a data type string
>> as will be used by fdtget, fdtput.
>>
>> This also adds a few tests for the simple type argument supported by
>> utilfdt_decode_type.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>
>
> Applied.
>
> This patch still had corrupted content here:
>
> =A0 =A0142c42
> =A0 =A0< =A0cmp_tests test_tree1.dtb $WRONG_TREE1
> =A0 =A0---
> =A0 =A0> =A0 =A0 =A0cmp_tests test_tree1.dtb $WRONG_TREE1
> =A0 =A0150c50
> =A0 =A0< =A0case $ARG in
> =A0 =A0---
> =A0 =A0> =A0 =A0 =A0case $ARG in
>
> in this hunk:
>
> =A0 =A0> --- a/tests/run_tests.sh
> =A0 =A0> +++ b/tests/run_tests.sh
> =A0 =A0> @@ -391,6 +391,10 @@ dtbs_equal_tests () {
> =A0 =A0> =A0cmp_tests test_tree1.dtb $WRONG_TREE1
> =A0 =A0> =A0}
> =A0 =A0>
> =A0 =A0> +utilfdt_tests () {
> =A0 =A0> + =A0 =A0run_test utilfdt_test
> =A0 =A0> +}
> =A0 =A0> +
> =A0 =A0> =A0while getopts "vt:m" ARG ; do
> =A0 =A0> =A0case $ARG in
> =A0 =A0> =A0 "v")
>
> Using 'git am --ignore-whitespace' allowed it to apply.

Thanks for fixing that. It wasn't apparent in my git branch. I have
been thinking about adding 'git am' to my checking flow and it looks
like there are cases where it is needed, although I'm still not sure
why.

Regards,
Simon

>
> Thanks,
> jdl
>
