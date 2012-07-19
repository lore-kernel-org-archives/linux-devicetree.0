From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [DTC] Compilation issue on Red-hat host systems
Date: Thu, 19 Jul 2012 13:26:33 +1000
Message-ID: <20120719032633.GC8100@truffala.fritz.box>
References: <CALdT2jzsyC9TuXRgZxRP-zJjyfihUN_u2uXF=bSER3ARpPot3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALdT2jzsyC9TuXRgZxRP-zJjyfihUN_u2uXF=bSER3ARpPot3Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: jagan <402jagan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 16, 2012 at 03:29:49PM +0530, jagan wrote:
> Hi,
> 
> I am building dtc as follows
>         $ git clone git://jdl.com/software/dtc.git
>         $ cd dtc
>         $ make
> I got the below error while doing make
> convert-dtsv0-lexer.lex.c:684: warning: no previous prototype for 'yylex'
> make: *** [convert-dtsv0-lexer.lex.o] Error 1
> 
> Can anyone help me, I am I missing any PATH setup

It's almost certainly an issue with the particular version of flex
generating code which triggers warnings we have enabled.  What does
"flex --version" say.  As a workaround you can remove
-Wstrict-prototypes from 'WARNINGS' in the Makefile.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
