From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] Add character literal parsing in bytestrings
Date: Wed, 20 Jul 2011 23:40:06 +1000
Message-ID: <20110720134006.GJ6399@yookeroo.fritz.box>
References: <1308871239-32683-1-git-send-email-robotboy@chromium.org>
	<1308871239-32683-2-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1308871239-32683-2-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

On Thu, Jun 23, 2011 at 04:20:38PM -0700, Anton Staaf wrote:
> This adds support for parsing simple (non-escaped) 'x' character
> literal syntax in bytestrings.  For example:
> 
>     property = ['a' 2b 'c'];
> 
> is equivalent to:
> 
>     property = [61 2b 62];

Hrm.  I like the idea of being able to encode character literals.
However I'm dubious as to whether the bytestring syntax is the right
place to encode them.

Bytestrings are quite lexically strange, they are quite different from
the < ... > cell syntax: the things inside default to hex, and spacing
is irrelevant ([abcd] is equivalent to [ab cd], [a bc] is a syntax
error and *not* equivalent to [0a bc]).  This makes me worry about
possible ambiguities or other parsing problems if we put something
other than exactly 2 digit hex bytes in there - not that I can see any
definite ambiguities in this proposal.

I have for some time been intending to introduce some variant of the
< > syntax which allows for different sized entries (1, 2 or 8 bytes
instead of the default 4).  I just haven't thought of a nice syntax
for it yet.  Character literals would fit just fine into that scheme.

The other possibility would be to allow something like 'abcd' without
any special context to be a non-NULL-terminated "string".  I'm also a
bit dubious about that on the "be like C" principle, which has served
us pretty well in the past.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
