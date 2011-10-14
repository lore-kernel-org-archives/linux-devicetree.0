From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCHv6] mtd: gpio-nand: add device tree bindings
Date: Fri, 14 Oct 2011 15:43:37 +0100
Message-ID: <20111014144337.GB25079@totoro>
References: <1318374618-26573-1-git-send-email-jamie@jamieiles.com>
 <1318600108.12351.130.camel@sauron> <20111014142149.GA25079@totoro>
 <1318602329.12351.143.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1318602329.12351.143.camel@sauron>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 14, 2011 at 05:25:21PM +0300, Artem Bityutskiy wrote:
> On Fri, 2011-10-14 at 15:21 +0100, Jamie Iles wrote:
> > > the top of my head, it is logical when things go like this: I have a
> > > kernel with working platform data, but I can change that dynamically by
> > > feeding it a device tree configuration. Hmm?
> > 
> > I think in general platform data and device tree should be mutually 
> > exclusive.
> 
> OK, but would you please confirm this by pointing to some docs or
> discussions, or may be people from devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> could confirm that?

I found https://lwn.net/Articles/449058/ from Grant that I think covers 
it, but that's the best I could find written down!

Jamie
