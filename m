From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Use yylloc instead of yyloc
Date: Sun, 15 Nov 2009 23:39:13 +1100
Message-ID: <20091115123913.GA3234@yookeroo.seuss>
References: <20091112001404.GI3235@yookeroo.seuss> <E1N8QaJ-00031X-GU@jdl.com>
	<4AFD5AD6.6060906@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4AFD5AD6.6060906-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lukasz Wojcik <zbr-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 13, 2009 at 02:10:46PM +0100, Lukasz Wojcik wrote:
> Jon Loeliger wrote:
> >>Jon, fix for the typo the FreeBSD folks noticed.  Please apply.
> >>
> >>yylloc is the correct way to get token positioning information.  yyloc
> >>is a bison internal variable that only works by accident.
> >>
> >>Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> >>
> >>Index: dtc/dtc-parser.y
> >>===================================================================
> >>--- dtc.orig/dtc-parser.y	2009-11-12 11:11:15.000000000 +1100
> >>+++ dtc/dtc-parser.y	2009-11-12 11:11:20.000000000 +1100
> >>@@ -175,7 +175,7 @@ propdata:
> >> 			if ($6 != 0)
> >> 				if (fseek(file->file, $6, SEEK_SET) != 0)
> >>-					srcpos_error(&yyloc,
> >>+					srcpos_error(&yylloc,
> >> 						     "Couldn't seek to offset %
> >>llu in \"%s\": %s",
> >> 						     (unsigned long long)$6,
> >> 						     $4.val,
> >>
> >>
> >
> >Applied.
> >
> >jdl
> Thanks a lot for your quick fix. I have one observation to share though:
> After applying newest fix, i did the tests around incbin feature. I have
> modified original incbin.dts (from ./tests/ subdir) as follows :
> 
> ---diff---
> 5c5
> <     incbin-partial = /incbin/("incbin.bin", 0xfffffffffffffff,
> 0xffffffffffffffff);
> ---
> >     incbin-partial = /incbin/("incbin.bin", 13, 17);
> 
> ---eofdiff---

Um.. I can't really read plain-mode diffs, which way around is that
change?

> Trying to run following command:
> 
> ./dtc -O dtb -o incbin.dtb -b 0 -p 1024 incbin.dts
> 
> ..produces output:
> 
> Error: incbin.dts 5:1 - 1:1 Couldn't seek to offset
> 1152921504606846975 in "incbin.bin": Invalid argument
> 
> I'm just wondering where exactly does location 5:1 - 1:1 point. It seems to
> be a bit unclear. Wouldn't it be enough to just specify line number ? Thanks
> again.

I believe that's line 5, column 1 to line 1 column 1.  Clearly the
ending position is wrong - I don't think we properly initialize the
ending position information anywhere.  I have a patch in my queue that
does that, and also makes the display format more consistent with what
gcc and bison use.  That series of patches hasn't been merged because
it conflicts with some other stuff Jon was working on.  Maybe we
should revisit it though.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
