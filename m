From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: Fix dtc bugs for 64-bit compile
Date: Wed, 11 Nov 2009 21:43:43 -0600
Message-ID: <E1N8Qb1-00032G-4l@jdl.com>
References: <20091112023002.GN3235@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20091112023002.GN3235-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org> 
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> I've just tested building dtc as an x86_64 binary on a 32-bit i386
> host by using:
> 	make CC="gcc -m64"
> This patch fixes a handful of minor bugs thus discovered:
> 
>  * There is a printf() type mismatch on 64-bit in value-labels.c
> 
>  * For the tests which use libdl, we were using the GNU make feature
> where it will find libdl.so given a dependency in the form '-ldl'.
> But this built-in make logic doesn't know we're compiling 64-bit so
> finds the 32-bit version of the library.  We avoid using this and
> instead explicitly pass -ldl to CC, which being the 64-bit version
> does know where to look.
> 
>  * To process dtc's asm output into .so files, run_tests.sh was
> directly invoking the (default instance of) the assembler and linker.
> Instead invoke these via the CC driver, and allow that to be overriden
> from the make environment.
> 
>  * The x86_64 assembler doesn't 0 fill with the .balign directive
> (presumably it is NOP filling).  That doesn't produce strictly
> incorrect trees, but it is confusing and confounds are testcases which
> do byte-by-byte comparison of the trees produced by asm output with
> direct dtb output (which does 0 pad where necessary, of course).  This
> patch uses the optional second argument to .balign to force gas to
> zero-fill instead.
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Applied.

jdl
