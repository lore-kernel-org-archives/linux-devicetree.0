From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/1] Fix segfault in DTC
Date: Wed, 26 Sep 2012 09:30:54 +1000
Message-ID: <20120925233054.GL9800@truffula.fritz.box>
References: <1348526885-2113-1-git-send-email-mmayer@broadcom.com>
 <1348595889-6495-1-git-send-email-mmayer@broadcom.com>
 <1348595889-6495-2-git-send-email-mmayer@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1348595889-6495-2-git-send-email-mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
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
To: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 25, 2012 at 10:58:09AM -0700, Markus Mayer wrote:
> Prior to this change, an empty input file would cause a segfault, because
> yylloc had never been initialized. There was never any characters for the
> lexer to match, so YY_USER_ACTION was never executed before the parse error
> was detected.
> 
> When the parser printed the error message, it tried to include the name of
> the file, but the structure holding the file name (yylloc.file, referenced
> as pos->file) had never been initialized.
> 
> Without the fix:
> 
> $ ./dtc /dev/null
> DTC: dts->dts  on file "/dev/null"
> Segmentation fault (core dumped)
> 
> $ gdb dtc core
> Program terminated with signal 11, Segmentation fault.
>     at scripts/dtc/srcpos.c:194
> 194			fname = pos->file->name;
> (gdb) bt
>     at scripts/dtc/srcpos.c:194
>     fmt=0x40d769 "%s", va=0x7fffbf027148) at scripts/dtc/srcpos.c:220
>     at scripts/dtc/dtc-parser.tab.c:1920
>     at scripts/dtc/treesource.c:38
>     at scripts/dtc/dtc.c:203
> (gdb) p *pos
> $1 = {first_line = 0, first_column = 0, last_line = 0, last_column = 0,
>   file = 0x0}

Which dtc version did you observe this with?  I'm unable to reproduce
the SEGV with current git.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
