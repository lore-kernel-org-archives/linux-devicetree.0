From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: Remove spurious output on stderr
Date: Thu, 12 Apr 2012 08:45:57 +1000
Message-ID: <20120411224557.GA8024@truffala.fritz.box>
References: <1334170516-23473-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1334170516-23473-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 11, 2012 at 11:55:16AM -0700, Simon Glass wrote:
> Outputing to stderr is best avoided unless there is an error or warning to
> display. At present dtc always displays the name of the file it is compiling
> and the input/output formats. For example:
> 
> DTC: dts->dts  on file "-"
> 
> This can cause problems in some build systems. For example, U-Boot shows
> build errors for any boards which use dtc at present. It is typically the
> only message output during such a build. The C compiler does not output
> anything in general. The current dtc behaviour makes it difficult to
> provide a silent build in the normal case where nothing went wrong.
> 
> The -q flag is currently used to ignore warnings, and this message is not
> really a warning. If we inserted another level of quietness that just
> supresses non-warnings, then this would break the current behaviour of -q.
> 
> Therefore a new flag seems appropriate. Unfortunately both -v and -V are
> already used, so I have come up with the random choice of -a: "announce
> operation".
> 
> This also changes current behaviour, but hopefully in a good way. The main
> problem is that people will wonder whether dtc actually ran at all, since
> they are used to seeing the message. A quick check should confirm this, or
> the -a flag can be added if desired.
> 
> I'm hoping someone has a better solution.

Ugh.  Don't bother with the option, just remove the message.  I've
been half meaning to get rid of it for ages.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
