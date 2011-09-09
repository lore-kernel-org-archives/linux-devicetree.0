From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH v2 3/3] dtc: Support character literals in bytestrings
Date: Fri, 09 Sep 2011 09:22:37 -0500
Message-ID: <E1R21yX-0007Z1-T7@jdl.com>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
	<1315437340-1661-4-git-send-email-robotboy@chromium.org>
	<20110908035149.GO30278@yookeroo.fritz.box>
	<20110908070716.GC15955@ponder.secretlab.ca>
	<20110908130109.GW30278@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20110908130109.GW30278-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > > >     property = ['a' 2b '\r'];
> > > > 
> > > >     property = [61 2b 0d];

> > Does it matter much?  I'm happy with either.  Is there a downside to
> > the first syntax?
> 
> Well.. probably not.  I'm just nervous about adding anything in the
> lexically weird bytestring context.

As a general statement, it is often difficult for parsers
to establish enough look-ahead when lists of things are
simply placed side-by-side without some sort of connecting
syntax.  So a structure like "foo1 foo2 foo3" can be more prone
to S/R and R/R errors than something like "foo1, foo2, foo3".
No, that's not a hard and fast rule because prior context
can make it clear to a parsing rule set.  In this case,
the '[' can estabish that context and make it clear what
is intended as a list of values.  But if there were ever
any future notion of wanting to create a bracketed list
of values for another purpose, then a comma separated list
would be preferable.

jdl
