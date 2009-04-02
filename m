From: Johns Daniel <johns.daniel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Cannot compile the DTC itself
Date: Thu, 2 Apr 2009 14:46:59 -0500
Message-ID: <ba5d9360904021246g72afa876uc69ce188040b1e71@mail.gmail.com>
References: <ba5d9360904021207j32a13e43i9b6347147ccf7563@mail.gmail.com>
	<E1LpSjM-0005us-Nw@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <E1LpSjM-0005us-Nw-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 2, 2009 at 2:37 PM, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:
>> I get similar errors for dtc-v1.1.0 and dtc-v1.2.0:
>>
>> ...
>> =A0 =A0 =A0 =A0 =A0CC dtc-lexer.lex.o
>> dtc-lexer.lex.c: In function `yylex':
>> dtc-lexer.lex.c:762: warning: label `find_rule' defined but not used
>> dtc-lexer.l: At top level:
>> dtc-lexer.lex.c:1870: warning: 'yy_flex_realloc' defined but not used
>> =A0 =A0 =A0 =A0 =A0CC dtc-parser.tab.o
>> dtc-parser.tab.c: In function `yyparse':
>> dtc-parser.tab.c:1105: warning: implicit declaration of function `YYRHSL=
OC'
>> dtc-parser.tab.c:1105: error: request for member `first_line' in
>
> What version of flex are you using?

flex version 2.5.4 (the latest for my Linux distribution)

> Have you tried to install a recent version of flex?

No, not yet.

Thanks for the info! I suspected that, but could not find any evidence
to support my theory.
