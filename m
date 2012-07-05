From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH V2] dtc: Add ability to delete nodes and properties
Date: Thu, 5 Jul 2012 08:19:50 +0200
Message-ID: <20120705061950.GI17705@game.jcrosoft.org>
References: <1339542620-24590-1-git-send-email-swarren@wwwdotorg.org>
 <4FF35218.4030602@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FF35218.4030602-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
> On 06/12/2012 05:10 PM, Stephen Warren wrote:
> > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > dtc currently allows the contents of properties to be changed, and the
> > contents of nodes to be added to. There are situations where removing
> > properties or nodes may be useful. This change implements the following
> > syntax to do that:
> > 
> >     / {
> >         propname /delprop/;
> >         nodename /delnode/;
> >     };
> > 
> > or:
> > 
> >     &noderef /delnode/;
> > 
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > v2: Implemented in a significantly different fashion: Rather than actually
> > deleting nodes/properties as the DT is parsed, simply mark them deleted,
> > and skip deleted nodes during later processing. This allows implementation
> > without needing rework of various error-checks, such as duplicate labels.
> 
> David, Jon, does this look reasonable?
I need this on AT91 as Grant refused to have a 0 value on boolean

so this is my only ay to disable it

Best Regards,
J.
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
