Return-Path: <sneeker.yeh@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1456155.YPH2fYoGgF@wuerfel>
References: <1418695828-605-1-git-send-email-Sneeker.Yeh@tw.fujitsu.com>
	<20141222155936.GB12815@saruman>
	<CAJ1gpc0uniw3F3O9nxTLHp9M2boxrOACYDB=fgruhLOLdqg9yA@mail.gmail.com>
	<1456155.YPH2fYoGgF@wuerfel>
Date: Sun, 4 Jan 2015 22:32:46 +0800
Message-ID: <CAJ1gpc2LLaeM=3y++i0L+5AA0gT4=VkPY1PiEo1zSattwkCyjQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: dwc3: add Fujitsu Specific Glue layer
From: Sneeker Yeh <sneeker.yeh@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c117c8941088050bd47229
To: Arnd Bergmann <arnd@arndb.de>
Cc: Felipe Balbi <balbi@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Grant Likely <grant.likely@linaro.org>, Alan Stern <stern@rowland.harvard.edu>, Paul Bolle <pebolle@tiscali.nl>, Hans de Goede <hdegoede@redhat.com>, Thomas Pugliese <thomas.pugliese@gmail.com>, David Mosberger <davidm@egauge.net>, Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, Andy Green <andy.green@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Sneeker Yeh <Sneeker.Yeh@tw.fujitsu.com>
List-ID: <devicetree@vger.kernel.org>

--001a11c117c8941088050bd47229
Content-Type: text/plain; charset=UTF-8

HI Arnd,

Thanks for reviewing this,

2014-12-30 18:12 GMT+08:00 Arnd Bergmann <arnd@arndb.de>:

> On Monday 29 December 2014 01:52:04 Sneeker Yeh wrote:
> > > > +static int dwc3_mb86s70_remove_child(struct device *dev, void
> *unused)
> > > > +{
> > > > +     struct platform_device *pdev = to_platform_device(dev);
> > > > +
> > > > +     of_device_unregister(pdev);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static u64 dwc3_mb86s70_dma_mask = DMA_BIT_MASK(32);
> > >
> > > why ? Use dma_coerce_mask_and_coherent().
> > >
> >
> > okay.
>
> Actually that is still wrong: we use dma_coerce_mask_and_coherent() to
> annotate drivers that have traditionally been forcing their own dma mask
> by some other means and that need to be changed to something proper (after
> finding out why they did it in the first place).
>

thanks,I remove this and test can be passed,
of_platform_populate() makes dwc3 owns a default one and don't have to
reference parent device's mask i set here.

if later i worry dwc3 might still not get a proper mask from
of_platform_populate() in our platform,
then i shall set a proper one via platform bus notifier somewhere else,
IIUC.


> Since this is about a child device, the correct interface is to use
> platform_device_register_full().
>
>
dwc3 core usually can be describe as sub node in platform glue device node:

usb3host0: mb86s70_usb3host0 {
    compatible = "fujitsu,mb86s70-dwc3";
    clocks = <&clock 0 1 1>;
    clock-names = "h_clk";
    #address-cells = <2>;
    #size-cells = <1>;
    ranges;

    dwc3@32200000 {
        compatible = "synopsys,dwc3";
        reg = <0 0x32200000 0x100000>;
        interrupts = <0 292 0x4>,
        <0 294 0x4>;
    };
};

so that make me able to use of_platform_populate() to create dwc3 device in
our platform glue device.


> Note that this will still only work on machines that have no dma offset,
> iommu, swiotlb, special coherency requirements, or ones that need a
> platform specific dma_map_ops. To make any of those work, the driver
> would need to be changed to pass the correct device pointer into any
> dma-mapping interfaces, so the settings can get set by the platform
> code. We will need to do that for arm64 I assume.
>

thanks for the teaching, for me it's gold and i'm always enjoying absorbing
these.

Much appreciate,
Sneeker



>
>         Arnd
>

--001a11c117c8941088050bd47229
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>HI Arnd,<br><br></div>Thanks for reviewing this,<br><=
div><div><div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">201=
4-12-30 18:12 GMT+08:00 Arnd Bergmann <span dir=3D"ltr">&lt;<a href=3D"mail=
to:arnd@arndb.de" target=3D"_blank">arnd@arndb.de</a>&gt;</span>:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><span class=3D"">On Monday 29 D=
ecember 2014 01:52:04 Sneeker Yeh wrote:<br>
&gt; &gt; &gt; +static int dwc3_mb86s70_remove_child(struct device *dev, vo=
id *unused)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_pla=
tform_device(dev);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0of_device_unregister(pdev);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static u64 dwc3_mb86s70_dma_mask =3D DMA_BIT_MASK(32);<br>
&gt; &gt;<br>
&gt; &gt; why ? Use dma_coerce_mask_and_coherent().<br>
&gt; &gt;<br>
&gt;<br>
&gt; okay.<br>
<br>
</span>Actually that is still wrong: we use dma_coerce_mask_and_coherent() =
to<br>
annotate drivers that have traditionally been forcing their own dma mask<br=
>
by some other means and that need to be changed to something proper (after<=
br>
finding out why they did it in the first place).<br></blockquote><div><br><=
/div><div>thanks,I remove this and test can be passed, <br></div><div>of_pl=
atform_populate() makes dwc3 owns a default one and don&#39;t have to refer=
ence parent device&#39;s mask i set here.<br><br></div><div>if later i worr=
y dwc3 might still not get a proper mask from of_platform_populate() in our=
 platform, <br></div><div>then i shall set a proper one via platform bus no=
tifier somewhere else, IIUC.<br><br></div><div></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Since this is about a child device, the correct interface is to use<br>
platform_device_register_full().<br>
<br></blockquote><div><br>dwc3 core usually can be describe as sub node in =
platform glue device node:<br><br>usb3host0: mb86s70_usb3host0 {<br>=C2=A0=
=C2=A0=C2=A0 compatible =3D &quot;fujitsu,mb86s70-dwc3&quot;;<br>=C2=A0=C2=
=A0=C2=A0 clocks =3D &lt;&amp;clock 0 1 1&gt;;<br>=C2=A0=C2=A0=C2=A0 clock-=
names =3D &quot;h_clk&quot;;<br>=C2=A0=C2=A0=C2=A0 #address-cells =3D &lt;2=
&gt;;<br>=C2=A0=C2=A0=C2=A0 #size-cells =3D &lt;1&gt;;<br>=C2=A0=C2=A0=C2=
=A0 ranges;<br><br>=C2=A0=C2=A0=C2=A0 dwc3@32200000 {<br>=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 compatible =3D &quot;synopsys,dwc3&quot;;<br>=C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0 reg =3D &lt;0 0x32200000 0x100000&gt;;<br>=C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 interrupts =3D &lt;0 292 0x4&gt;,<br>=C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 &lt;0 294 0x4&gt;;<br>=C2=A0=C2=A0=C2=A0=
 };<br>};<br><br></div><div>so that make me able to use of_platform_populat=
e() to create dwc3 device in our platform glue device.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
Note that this will still only work on machines that have no dma offset,<br=
>
iommu, swiotlb, special coherency requirements, or ones that need a<br>
platform specific dma_map_ops. To make any of those work, the driver<br>
would need to be changed to pass the correct device pointer into any<br>
dma-mapping interfaces, so the settings can get set by the platform<br>
code. We will need to do that for arm64 I assume.<br></blockquote><div><br>=
</div><div>thanks for the teaching, for me it&#39;s gold and i&#39;m always=
 enjoying absorbing these.<br><br></div><div>Much appreciate,<br></div><div=
>Sneeker<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<span class=3D""><font color=3D"#888888"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnd<br>
</font></span></blockquote></div><br></div></div></div></div></div>

--001a11c117c8941088050bd47229--
