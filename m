From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dtc: Refactor character literal parsing code
Date: Thu, 8 Sep 2011 13:22:50 +1000
Message-ID: <20110908032250.GM30278@yookeroo.fritz.box>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
	<1315437340-1661-2-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1315437340-1661-2-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

On Wed, Sep 07, 2011 at 04:15:38PM -0700, Anton Staaf wrote:
> Move the parsing of hex, octal and escaped characters from data.c
> to util.c where it can be used for character literal parsing within
> strings as well as for stand alone C style character literals.

[snip]
> +char get_oct_char(const char *s, int *i)

Probably make these static, since I can't really see a use for them
other than in the escape processing code.

> +{
> +	char x[4];
> +	char *endx;
> +	long val;
> +
> +	x[3] = '\0';
> +	strncpy(x, s + *i, 3);
> +
> +	val = strtol(x, &endx, 8);
> +
> +	assert(endx > x);
> +
> +	(*i) += endx - x;
> +	return val;
> +}
> +
> +char get_hex_char(const char *s, int *i)
> +{
> +	char x[3];
> +	char *endx;
> +	long val;
> +
> +	x[2] = '\0';
> +	strncpy(x, s + *i, 2);
> +
> +	val = strtol(x, &endx, 16);
> +	if (!(endx  > x))
> +		die("\\x used with no following hex digits\n");
> +
> +	(*i) += endx - x;
> +	return val;
> +}
> +
> +char get_escape_char(const char *s, int *i)

Yes, splitting this function off is quite nice.

[snip]
> +char get_escape_char_exact(const char *s, int len)
> +{
> +	int	j = 1; //skip intial "\"
> +	char	c = get_escape_char(s, &j);
> +
> +	if (j != len)
> +		die("Extra characters at end of character literal '%s' "
> +		    "(%d != %d)\n", s, j, len);
> +
> +	return c;
> +}

This I'm not a fan of.  Handling erroneous input with a die() in a
low-level helper like this is pretty nasty (I know there are other
instances of it).  I'd prefer to see the action handling the error in
the caller though, where it's better equipped to know a reasonable way
of informing the user.

Some more on error handling in comments on your next patch.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
