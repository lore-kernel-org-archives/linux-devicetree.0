From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: dtc: Enable more warnings
Date: Fri, 05 Mar 2010 15:43:04 -0600
Message-ID: <E1NnfIW-00071k-Dm@jdl.com>
References: <20100303052630.GQ23435@yookeroo> <20100304001218.GC4488@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20100304001218.GC4488@yookeroo> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> This patch turns on a bunch of extra gcc warnings, most of which are
> probably a good idea.  Of the new warnings -Wnested-externs and
> -Wstrict-prototypes need no code changes, we're already warning-clean.
> The remaining one, -Wmissing-prototypes requires trivial changes in
> some of the tests (making functions local).
> 
> This patch also rearranges the warnings flags into a separate make
> variable for convenience, and turns on -Werror, to really encourage
> people to keep the code warning-clean.
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Well, I'd like to apply this patch.  Doing so is actually effective!

$ make check 2>&1 | less
        CHK version_gen.h
         CC tests/testutils.o
cc1: warnings being treated as errors
tests/testutils.c: In sigint_:
tests/testutils.c:44: error: unused 
tests/testutils.c:44: error: unused 
tests/testutils.c: In test_:
tests/testutils.c:52: error: unused 
tests/testutils.c: In check_:
tests/testutils.c:113: error: comparison between signed and unsigned
tests/testutils.c:117: error: comparison between signed and unsigned
make: *** [tests/testutils.o] Error 1
propertyfunction argcparameter initfunction ucparameter siparameter handlerfunction 
