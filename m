From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: RE: [RFC PATCH] dtc: Add support for named constants
Date: Tue, 30 Aug 2011 15:04:08 -0600 (MDT)
Message-ID: <alpine.DEB.2.00.1108301459340.26173@utopia.booyaka.com>
References: <1314139400-31984-1-git-send-email-swarren@nvidia.com>
	<20110830042316.GH4254@yookeroo.fritz.box>
	<74CDBE0F657A3D45AFBB94109FB122FF04B3279D55@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04B3279D55-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, rnayak-l0cyMroinI0@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Arnaud Lacombe <lacombar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 30 Aug 2011, Stephen Warren wrote:

> David Gibson wrote at Monday, August 29, 2011 10:23 PM:
> > On Tue, Aug 23, 2011 at 04:43:20PM -0600, Stephen Warren wrote:
> > > You may define constants as follows:
> > >
> > > /define/ $TWO 2;
> > > /define/ $FOUR 4;
> > > /define/ $OTHER $FOUR;
> > >
> > > And properties may use these values as follows:
> > >
> > > foo = <1 $TWO 3 $FOUR 5>;
> ...
> > > Note 2: I'd prefer the syntax of /define/ to be:
> > >
> > > /define/ TWO 2;

Some preprocessing support would be very useful for us on OMAP, where we 
have some register bitfields that we'd like to use symbolic names for.

One question, though.  Documentation/devicetree/booting-without-of.txt[1] 
says:

   It is also suggested that you pipe your source file through cpp (gcc
   preprocessor) so you can use #include's, #define for constants, 
   etc...

Is it no longer recommended to use cpp for this purpose?


- Paul

1. http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/devicetree/booting-without-of.txt;h=7c1329de0596a34ce81d60f214d46a43933f05c0;hb=HEAD#l1119
