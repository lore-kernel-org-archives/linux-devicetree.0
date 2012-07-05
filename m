From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC PATCH] dtc: integrate gpp
Date: Thu, 5 Jul 2012 08:17:40 +0200
Message-ID: <20120705061740.GH17705@game.jcrosoft.org>
References: <1339786432-6435-1-git-send-email-swarren@wwwdotorg.org>
 <4FEB7DFE.3030509@wwwdotorg.org> <4FF35238.5090501@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FF35238.5090501-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 14:12 Tue 03 Jul     , Stephen Warren wrote:
> On 06/27/2012 03:41 PM, Stephen Warren wrote:
> > On 06/15/2012 12:53 PM, Stephen Warren wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> I figured the easiest way to get named constants into dtc would be to
> >> re-use an existing C pre-processor implemntation. Surprisingly, I could
> >> not find many /good/ possibilities for this. I eventually found one called
> >> gpp. This patch is an extremely quick-and-dirty integration of gpp into
> >> dtc in order to solicit some feedback. What do people think of this
> >> approach in general?
> > 
> > David, Jon,
> > 
> > What do you think of integrating gpp (or is there some alternative that
> > would be better)? Does it seem a reasonable approach; should I work on
> > addressing the TODO items I mentioned in the patch, or give up on this?
> 
> Are there any comments on this? Thanks.

I'm looking for this too

can we have a clear statement on it?

Best Regards,
J.
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
