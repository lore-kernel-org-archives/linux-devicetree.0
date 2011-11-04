From: "Robert Sciuk" <robert.sciuk-AJFDzwRlY/g@public.gmane.org>
Subject: RE: fpga driver on custom PPC target platform (P4080) ...
Date: Fri, 4 Nov 2011 12:42:48 -0400
Message-ID: <2DD52030B5146141BEB762A11AE97C4C0100C86F@SPQCEXC05.exfo.com>
References: <2DD52030B5146141BEB762A11AE97C4C0100C735@SPQCEXC05.exfo.com>
 <CAOZdJXWjS4t9cOKRB3rxy0iCFAYRyEgg6kfQwvydUQSyO1ttoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-reply-to: <CAOZdJXWjS4t9cOKRB3rxy0iCFAYRyEgg6kfQwvydUQSyO1ttoA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



> > It appears that I'm not correctly creating the pca9539 nodes as of
> yet (I'll be adding the phandles shortly). =A0Any pointers for pca9539
> driver nodes would be appreciated, as I took these from a similar tree,
> but not the 95xx driver. =A0I'll match them up with the code in the
> morning ...
> =

> I *believe* you are not supposed to create separate nodes for reading
> and writing.  I know that's how I2C works, but I think the I2C layer
> takes care of that for you.
> =

> If you look at other device trees, you'll see they only have one node
> for any particular I2C device.
> =

> --
> Timur Tabi
> Linux kernel developer at Freescale


Thanks, Timur ... I've fixed the tree, and I'm tracking down the problems w=
ith addressing the nodes ...
