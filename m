From: "Robert Sciuk" <robert.sciuk@exfo.com>
Subject: RE: fpga driver on custom PPC target platform (P4080) ...
Date: Mon, 7 Nov 2011 13:48:26 -0500
Message-ID: <2DD52030B5146141BEB762A11AE97C4C0100CB11@SPQCEXC05.exfo.com>
References: <2DD52030B5146141BEB762A11AE97C4C0100C735@SPQCEXC05.exfo.com>
 <CAOZdJXWjS4t9cOKRB3rxy0iCFAYRyEgg6kfQwvydUQSyO1ttoA@mail.gmail.com>
 <2DD52030B5146141BEB762A11AE97C4C0100C8C1@SPQCEXC05.exfo.com>
 <20111105004050.GA1384@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-class: urn:content-classes:message
In-reply-to: <20111105004050.GA1384@truffala.fritz.box>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: David Gibson <david@gibson.dropbear.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, Tabi Timur-B04825 <B04825@freescale.com>
List-Id: devicetree@vger.kernel.org

> > Ah,  my compatible attribute was wrong:
> >
> > 	Compatible = "nxp,pca9539";
> >
> > 	Should have been:
> >
> > 	Compatible = "nxp,pca953x";
> >
> > The tree now seems to bind the i2c gpio drivers properly ... on to
> > the localbus mappings!
> 
> Ah.  In that case the drivers should probably be extended to recognize
> the first compatible.  "wildcard" compatible strings are a bad idea,
> unfortunately there are some already in the wild, as you've seen.  We
> should try to phase them out though.
> 
> --
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_
> _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

Thanks, David

It did occur that a specific binding should be preferred over a generic one 

Rob.
