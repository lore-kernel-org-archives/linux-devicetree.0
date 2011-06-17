From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 2/2] powerpc: add support for MPIC message register API
Date: Fri, 17 Jun 2011 11:58:28 -0500
Message-ID: <20110617115828.3cebd5c9@schlenkerla.am.freescale.net>
References: <1306869543-18812-1-git-send-email-meador_inge@mentor.com>
	<1306869543-18812-3-git-send-email-meador_inge@mentor.com>
	<1308288784.32158.30.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1308288784.32158.30.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, openmcapi-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 17 Jun 2011 15:33:04 +1000
Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:

> On Tue, 2011-05-31 at 14:19 -0500, Meador Inge wrote:
> > +void mpic_msgr_enable(struct mpic_msgr *msgr)
> > +{
> > +	out_be32(msgr->mer, in_be32(msgr->mer) | (1 << msgr->num));
> > +}
> > +EXPORT_SYMBOL(mpic_msgr_enable);
> 
> Why are all those exported non-GPL ? We have a policy of making new
> in-kernel APIs generally GPL only.

>From Documentation/DocBook/kernel-hacking.tmpl:

  <sect1 id="sym-exportsymbols-gpl">
   <title><function>EXPORT_SYMBOL_GPL()</function>   
    <filename class="headerfile">include/linux/module.h</filename></title>
                                                     
   <para>                                            
    Similar to <function>EXPORT_SYMBOL()</function> except that the
    symbols exported by <function>EXPORT_SYMBOL_GPL()</function> can
    only be seen by modules with a                   
    <function>MODULE_LICENSE()</function> that specifies a GPL
    compatible license.  It implies that the function is considered
    an internal implementation issue, and not really an interface.
   </para>                                           
  </sect1>

When did this change from "considered an internal implementation issue, and
not really an interface" to "all new interfaces"?

-Scott
