From: "Robert Sciuk" <robert.sciuk-AJFDzwRlY/g@public.gmane.org>
Subject: RE: fpga driver on custom PPC target platform (P4080) ...
Date: Fri, 4 Nov 2011 14:19:36 -0400
Message-ID: <2DD52030B5146141BEB762A11AE97C4C0100C8C1@SPQCEXC05.exfo.com>
References: <2DD52030B5146141BEB762A11AE97C4C0100C735@SPQCEXC05.exfo.com>
 <CAOZdJXWjS4t9cOKRB3rxy0iCFAYRyEgg6kfQwvydUQSyO1ttoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Robert Sciuk <robert.sciuk-AJFDzwRlY/g@public.gmane.org>, Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> >
> > I *believe* you are not supposed to create separate nodes for reading
> > and writing.  I know that's how I2C works, but I think the I2C layer
> > takes care of that for you.
> >
> > If you look at other device trees, you'll see they only have one node
> > for any particular I2C device.
> >
> > --
> > Timur Tabi
> > Linux kernel developer at Freescale
> 
> 
> Thanks, Timur ... I've fixed the tree, and I'm tracking down the
> problems with addressing the nodes ...

Ah,  my compatible attribute was wrong:

	Compatible = "nxp,pca9539";

	Should have been:

	Compatible = "nxp,pca953x";

The tree now seems to bind the i2c gpio drivers properly ... on to the localbus mappings!

Rob.
