From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH v5 1/5] Add fdt read/write utility functions
Date: Thu, 22 Sep 2011 13:54:46 -0500
Message-ID: <E1R6oQ2-00016C-DY@jdl.com>
References: <1316711466-14199-1-git-send-email-sjg@chromium.org>
	<1316711466-14199-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1316711466-14199-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> This adds higher-level libfdt operations for reading/writing an fdt
> blob from/to a file, as well as a function to decode a data type string
> as will be used by fdtget, fdtput.
> 
> This also adds a few tests for the simple type argument supported by
> utilfdt_decode_type.
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


Applied.

This patch still had corrupted content here:

    142c42
    <  cmp_tests test_tree1.dtb $WRONG_TREE1
    ---
    >      cmp_tests test_tree1.dtb $WRONG_TREE1
    150c50
    <  case $ARG in
    ---
    >      case $ARG in

in this hunk:

    > --- a/tests/run_tests.sh
    > +++ b/tests/run_tests.sh
    > @@ -391,6 +391,10 @@ dtbs_equal_tests () {
    >  cmp_tests test_tree1.dtb $WRONG_TREE1
    >  }
    >  
    > +utilfdt_tests () {
    > +    run_test utilfdt_test
    > +}
    > +
    >  while getopts "vt:m" ARG ; do
    >  case $ARG in
    >  	"v")

Using 'git am --ignore-whitespace' allowed it to apply.

Thanks,
jdl
