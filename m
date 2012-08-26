From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH REPOST] dtc: integrate gpp
Date: Sun, 26 Aug 2012 17:16:45 +0200
Message-ID: <20120826151645.GE6060@game.jcrosoft.org>
References: <1345608667-16494-1-git-send-email-swarren@wwwdotorg.org>
 <20120825084523.GD6060@game.jcrosoft.org>
 <d30e7f01-ead2-4b37-9bf9-ac4b5c18f936@email.android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d30e7f01-ead2-4b37-9bf9-ac4b5c18f936-2ueSQiBKiTY7tOexoI0I+QC/G2K4zDHf@public.gmane.org>
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
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 16:26 Sat 25 Aug     , Stephen Warren wrote:
> 
> 
> Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> 
> >On 22:11 Tue 21 Aug     , Stephen Warren wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> 
> >> I figured the easiest way to get named constants into dtc would be to
> >> re-use an existing C pre-processor implemntation. Surprisingly, I
> >could
> >> not find many /good/ possibilities for this. I eventually found one
> >called
> >> gpp. This patch is an extremely quick-and-dirty integration of gpp
> >into
> >> dtc in order to solicit some feedback. What do people think of this
> >> approach in general?
> >
> >I'm not sure it's rely the right way
> >
> >I does the support but we may just use gcc for as it's done for linker
> >script
> >but I will agree that with this dtc is standalone
> 
> A C-compiler's pre-processor gets confused by property names starting with #, which gpp at least can be configured not to (outside column 1 at least)
ok fine by me

Best Regards,
J.
