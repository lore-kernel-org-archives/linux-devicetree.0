From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: at91: add Shutdown Controller (SHDWC) DT support
Date: Wed, 7 Mar 2012 21:16:06 +0000
Message-ID: <201203072116.07109.arnd@arndb.de>
References: <20120302192844.GB21255@game.jcrosoft.org>
 <201203071849.36867.arnd@arndb.de> <4F57BD04.5090002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F57BD04.5090002-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 07 March 2012, Rob Herring wrote:
> > 
> > I still don't understand: Doesn't the property already give the information?
> > In general, you should try to encode these things in specific properties instead of
> > checking the compatible property.
> > 
> 
> Or vice-versa, the compatible properties distinguish things enough that
> the property is not needed. If it is fixed in the SOC design, then you
> should distinguish things with the compatible property.

Well, one of the two, basically. I would suggest using special properties
in order to be prepared when other SOCs have the same requirement. If you
know for certain that each one will only ever be needed in one specific
SOC, then the compatible property is enough, but if it's likely that others
will have the same requirement in the future, I think it's much better
to have just a single check rather than a list of SOCs.

	Arnd
