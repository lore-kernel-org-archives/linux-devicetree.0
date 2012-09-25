From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] ARM: use C pre-processor with dtc
Date: Tue, 25 Sep 2012 14:59:11 -0500
Message-ID: <1348603151.5565.20@snotra>
References: <20120925195127.GA19350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="Flowed"; DelSp="Yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120925195127.GA19350-GFdadSzt00ze9xe1eoZjHA@public.gmane.org> (from
 broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org on Tue Sep 25 14:51:27 2012)
Content-Disposition: inline
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
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/25/2012 02:51:27 PM, Mark Brown wrote:
> On Tue, Sep 25, 2012 at 02:35:46PM -0500, Scott Wood wrote:
> 
> > Do you have an example of where you'd actually benefit from this?
> > I'd think most things could either be done reasonably well with
> > what's built into DTC (see what we've done in
> > arch/powerpc/boot/dts/fsl), or would need math expression support in
> > DTC (or has that been added?).
> 
> The constant example is the magic numbers we need to embed into DTs  
> for
> things like interrupt modes, making them human readable would be a  
> real
> win.

Wasn't there a patch for named constant support in dtc a while back?
Hmm:  
https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-January/011184.html

I'm not sure that going down the CPP path is better than the  
possibility of named constants having a different syntax from  
macros/functions.  It would be one thing if someone were actively  
working on the latter, but this paralysis seems to be a case of the  
perfect being the enemy of the good.

-Scott
