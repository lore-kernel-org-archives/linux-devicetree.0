From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 REPOST] dtc: Add support for named integer constants
Date: Thu, 5 Jan 2012 13:27:01 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17761F17D5@HQMAIL01.nvidia.com>
References: <1323720257-23847-1-git-send-email-swarren@nvidia.com>
 <CAPnjgZ3Rnbu6qZponnbQ8bRgABb-58HG-yYSxRu2FZfvwPnMJw@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1751860874@HQMAIL01.nvidia.com>
 <CAPnjgZ19s-O2m3CnrfSNLhg4hA61kKiwFym7pOTZ=C7kG+SVbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ19s-O2m3CnrfSNLhg4hA61kKiwFym7pOTZ=C7kG+SVbA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Simon Glass wrote at Tuesday, January 03, 2012 5:46 PM:
> On Mon, Dec 12, 2011 at 12:23 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > Simon Glass wrote at Monday, December 12, 2011 1:19 PM:
> >> On Mon, Dec 12, 2011 at 12:04 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> >> > You may define constants as follows:
> >> >
> >> > /define/ TWO 2;
> >> > /define/ FOUR 4;
> >> > /define/ OTHER FOUR;
> >> >
> >> > And properties may use these values as follows:
> >> >
> >> > foo = <1 TWO 3 FOUR 5>;
> >> >
> >> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> > ---
> >> > I posted this back in early September. I'd like to ask again that this
> >> > feature be merged into dtc; there are many situations where it'd allow
> >> > .dts files to be simplified.
> >>
> >> Yes I agree, it is very useful.
> >>
> >> I get conflicts with this - does it need a rebase?
> >
> > Yes, I should have mentioned this patch is still based on the same commit
> > it was 3 months ago, and HEAD has moved forward since. If it's deemed
> > conceptually acceptable, I'll rebase it to HEAD.
> >
> > (For reference, it's based on ed8fee1 "Add missing tests to .gitignore".)
> 
> I haven't seen any other comments. Is this going in? Constants would be useful.

I took a quick look at rebasing this on HEAD today. There are some non-
trivial conflicts with Anton's recent patch to support variable-sized
elements in arrays. In particular, my patch relied on the cellval token,
allowing it to reference a symbol or a literal, but Anton's patch has
removed that token from the grammar.

So, I'm still willing to rebase my patch, but given the non-trivial nature
of doing so, I'd like prior confirmation from Jon and David that the syntax
is acceptable, and so my work won't be in vain.

For reference, here's the test .dts file from my patch:

+/dts-v1/;
+
+/define/ VAR1 0xdeadbeef;
+/define/ VAR2 VAR1;
+
+/ {
+	var1 = <VAR1>;
+	var2 = <VAR2>;
+};
+
+/define/ OTHER 0xdeadbeef;

-- 
nvpublic
