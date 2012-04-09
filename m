From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH] dtc: Basic integer expressions
Date: Mon, 09 Apr 2012 08:43:42 -0500
Message-ID: <E1SHEsg-0001Z3-6r@jdl.com>
References: <1333508160-7015-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1333508160-7015-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Written by David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>. Additions by me:
> * Ported to ToT dtc.
> * Renamed cell to integer throughout.
> * Implemented value range checks.
> * Allow U/L/UL/LL/ULL suffix on literals.
> * Enabled the commented test.
> 
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
> v3:
> * Fix printf warning by s/%ld/%zd/
> * Support plain "U" as an integer literal suffix
> * Fix misplaced semi-colons in grammar
> * Support integer expressions for /memreserve/ and /incbin/ too
> * Modify eval_literal to check U/L suffixes after strtoull call,
>   using strspn/strlen
> * Remove mention of libfdt from comment in tests/integer-expressions.c
> * Add comment to explain integer_prim range check
> v2:
> * s/cell/integer/ throughout.
> * Allow signed-extended values to pass the overall cell range check.
> * Allow L/UL/LL/ULL suffix on literals. This is purely for compatibility
>   with C, and has no effect on dtc's processing.
> * Enabled the 3 disabled tests.


Applied.

jdl
