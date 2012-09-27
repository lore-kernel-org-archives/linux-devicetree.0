From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH V2 2/2] dtc: cpp co-existence: add support for #line
 directives
Date: Thu, 27 Sep 2012 17:07:46 +1000
Message-ID: <20120927070746.GL31993@truffula.fritz.box>
References: <1348676285-1777-1-git-send-email-swarren@wwwdotorg.org>
 <1348676285-1777-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1348676285-1777-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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

On Wed, Sep 26, 2012 at 10:18:05AM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Line control directives of the following formats are supported:
>     #line LINE "FILE"
>     # LINE "FILE" [FLAGS]
> 
> This allows dtc to consume the output of pre-processors, and to provide
> error messages that refer to the original filename, including taking
> into account any #include directives that the pre-processor may have
> performed.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Nice.  Two small changes I'd like to see:

> +<*>^"#"(line{WS}|" "){WS}*[0-9]+{WS}+{STRING}({WS}+[0-9]+)? {

I think this can be done slightly more cleanly as:
^"#"(line)?{WS}+[0-9]+{WS}+{STRING}({WS}+[0-9]+)?

[snip]
> diff --git a/tests/propname_escapes.dts b/tests/propname_escapes.dts
> index 9f70618..9f5793d 100644
> --- a/tests/propname_escapes.dts
> +++ b/tests/propname_escapes.dts
> @@ -1,5 +1,12 @@
>  /dts-v1/;
>  
> +/* common format */
> +#line 3 "foo.dts"
> +/* newer gcc format */
> +# 6 "bar.dts"
> +/* newer gcc sometimes uses */
> +# 9 "baz.dts" 1
> +

I'd prefer a separate testcase for the line directives, rather than
piggybacking on the propnodename escaping testcase.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
