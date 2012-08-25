From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH REPOST] dtc: integrate gpp
Date: Sat, 25 Aug 2012 10:45:23 +0200
Message-ID: <20120825084523.GD6060@game.jcrosoft.org>
References: <1345608667-16494-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1345608667-16494-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22:11 Tue 21 Aug     , Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> I figured the easiest way to get named constants into dtc would be to
> re-use an existing C pre-processor implemntation. Surprisingly, I could
> not find many /good/ possibilities for this. I eventually found one called
> gpp. This patch is an extremely quick-and-dirty integration of gpp into
> dtc in order to solicit some feedback. What do people think of this
> approach in general?
> 
> Issues:
> * Fails some test-cases, related to dependency file generation, reading from
>   stdin and include search paths.
> 
> TODO:
> * Needs to be split into many smaller patches, such as:
>   + Add unmodified upstream gpp.c.
>   + Various different modifications to gpp.c to make it compile within dtc.
>     Some of these might be able to go back upstream to gpp.
> * Need a way to call gpp as a library, rather than faking a command-line for
>   it. Perhaps this could go upstream too.
> * Need to use a pipe instead of a temp file to pass the result from gpp to
>   dtc. Or, if we rework gpp as a library, some intra-process way of streaming
>   the output between processing steps. Perhaps this could go upstream too, if
>   they accept the gpp-as-a-library concept.
> * Need some better fixes for the const issues instead of xstrdup().
> * Need to implement search paths for gpp includes.
> * Probably more I forget; I originally prototyped this a while back.
> * Test suite failure fixes, although at least some would be addressed by the
>   points above.
> ---
> Note: This patch is based on a slightly stale copy of dtc, plus some local
> patches for other work I've sent, some of which has been accepted upstream
> already, and some note. If this approach appeals to anyone, I will of course
> rebase this.

I'm not sure it's rely the right way

I does the support but we may just use gcc for as it's done for linker script
but I will agree that with this dtc is standalone

Best Regards,
