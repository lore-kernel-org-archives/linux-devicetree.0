From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/2] bus: imx-weim: support multiple address ranges
 per child node
Date: Thu, 6 Dec 2018 09:16:49 +0800
Message-ID: <20181206011647.GS3987@dragon>
References: <20181130205624.16227-1-TheSven73@googlemail.com>
 <20181130205624.16227-2-TheSven73@googlemail.com>
 <20181205075145.GN3987@dragon>
 <CAGngYiUvYHTRMvsS_4s8PVyPg5_sg4DhZZU4_k8US871oAWSvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGngYiUvYHTRMvsS_4s8PVyPg5_sg4DhZZU4_k8US871oAWSvQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 05, 2018 at 10:08:16AM -0500, Sven Van Asbroeck wrote:
> Hello Shawn, many thanks for the patch review, I really appreciate it !
> 
> On Wed, Dec 5, 2018 at 2:52 AM Shawn Guo <shawnguo@kernel.org> wrote:
> >
> > On Fri, Nov 30, 2018 at 03:56:23PM -0500, thesven73@gmail.com wrote:
> > > From: Sven Van Asbroeck <TheSven73@googlemail.com>
> > >
> > > Ensure that timing values for the child node are applied to
> > > all chip selects in the child's address ranges.
> > >
> >
> > I'm not sure about that.  Shouldn't we have another child node for
> > different chip select, something like below?
> >
> > &weim {
> >         acme@0,0 {
> >                 compatible = "acme,whatever";
> >                 reg = <0 0 0x100>, <0 0x400000 0x800>;
> >                 fsl,weim-cs-timing = <0x024400b1 0x00001010 0x20081100
> >                                       0x00000000 0xa0000240 0x00000000>;
> >         };
> >
> >         acme@1,400000 {
> >                 compatible = "acme,whatever";
> >                 reg = <1 0x400000 0x800>;
> >                 fsl,weim-cs-timing = <0x024400b1 0x00001010 0x20081100
> >                                       0x00000000 0xa0000240 0x00000000>;
> >         };
> >
> > Shawn
> 
> I am submitting patches for a device that spans chip selects :(
> And such a device needs multiple address changes with different chip selects.
> 
> Imagine we have an acme device, which contains a control and a fifo region,
> on different chip selects:
> 
> &weim {
>         acme@0 {
>                 compatible = "acme";
>                 reg = <0 0x0 0x100>, <1 0x0 0x100>;
>         };
> };
> 
> Now in probe we can access both regions:
> int acme_probe(struct platform_device *pdev)
> {
>         control_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         fifo_res =    platform_get_resource(pdev, IORESOURCE_MEM, 1);
>         /* all ok */
> }
> 
> But, if we have two separate child nodes, we also get two calls to probe(),
> which assumes two devices on the bus, and that is incorrect:
> 
> &weim {
>         acme@0 {
>                 compatible = "acme";
>                 reg = <0 0x0 0x100>;
>         };
>         acme@1 {
>                 compatible = "acme";
>                 reg = <1 0x0 0x100>;
>         };
> };
> 
> int acme_probe(struct platform_device *pdev)
> {
>         control_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         /* next call always fails */
>         fifo_res =    platform_get_resource(pdev, IORESOURCE_MEM, 1);
> }
> 
> For my patchset, Rob Herring suggested I made changes to the imx-weim driver
> to accommodate multi-chipselect devices.
> 
> See the conversation below between Rob Herring and myself:
> https://lkml.org/lkml/2018/11/30/390

Sorry, I wasn't aware of the discussion.  Now I understand the
background of the changes.  But can you please patch imx-weim bindings
doc (Documentation/devicetree/bindings/bus/imx-weim.txt) to accommodate
this new use scenario?

Shawn
