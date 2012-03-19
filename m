From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] Don't use non-standard echo options for fdtget-runtest.sh
Date: Sun, 18 Mar 2012 19:26:58 -0700
Message-ID: <CAPnjgZ3Lw=y2wmQ-D72+dqwHxB2fGA2ggcW4GNfrfMo16n9wSA@mail.gmail.com>
References: <1332122193-8323-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1332122193-8323-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi John,

On Sun, Mar 18, 2012 at 6:56 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> fdtget-runtest.sh currently uses the "-e" option to echo, for interpreting
> string escapes. =A0But this option is only understood by some versions of
> echo - the one in bash does, but the one in dash does not. =A0In fact sin=
ce
> I reworked the fdtget tests a while back, we no longer need the escape
> expanding feature of echo here, so this patch simple removes the -e to
> fix the problem (the testsuite now passes when /bin/sh is dash).
>
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

This was put in for this test:

    # Test multiple arguments
    run_fdtget_test "MyBoardName\nmemory" -ts $dtb / model /memory device_t=
ype

Without the -e the test fails for me... Do I need a later patch that
has not been applied? I tried with de6b762.

Regards,
Simon

> ---
> =A0tests/fdtget-runtest.sh | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/tests/fdtget-runtest.sh b/tests/fdtget-runtest.sh
> index 982fbe1..dac7f9a 100755
> --- a/tests/fdtget-runtest.sh
> +++ b/tests/fdtget-runtest.sh
> @@ -8,7 +8,7 @@ rm -f $LOG $EXPECT
> =A0trap "rm -f $LOG $EXPECT" 0
>
> =A0expect=3D"$1"
> -echo -e $expect >$EXPECT
> +echo $expect >$EXPECT
> =A0shift
>
> =A0verbose_run_log_check "$LOG" $VALGRIND $DTGET "$@"
> --
> 1.7.9.1
>
