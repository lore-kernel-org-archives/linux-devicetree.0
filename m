From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/3] Variable sized cell support
Date: Thu, 22 Sep 2011 12:26:34 +1000
Message-ID: <20110922022634.GE22223@yookeroo.fritz.box>
References: <1316637731-21872-1-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316637731-21872-1-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2011 at 01:42:08PM -0700, Anton Staaf wrote:
> This patch set adds, tests, and documents support for variable sized cells in
> cell arrays.  The new syntax is:
> 
>     property = /size/ [8|16|32|64] <0x00 .... 0x12>;
> 
> So cell arrays of 8, 16, 32, or 64-bits can now be created.  No padding is
> done on the resulting cell array.  So if three 8-bit cells are specified the
> resulting property will contain three bytes.
> 
> This patch set assumes that the character literals in cell lists patch has
> already been applied to your tree as it uses them in it's test case and the
> diff will not apply cleanly to TOT without the character literals patch because
> both patch sets modify the same locations in the parser.  You do not need to
> apply the character literal support in bytestrings patch however.

Nice.

Still wants a little polish, I think.  And some time to sit around
in case we have a better idea on the syntax, but a very good start.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
