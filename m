From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] of: Export of_irq_count for using in modules
Date: Thu, 6 Jun 2013 19:16:09 +0200
Message-ID: <CAHTX3dJUuZX-XL5QKFryqfTmR2ygXQRN3DojReAqUZ1ony4Bgw@mail.gmail.com>
References: <6aa29b1d109a46278a7f37b598defe07d6edfe60.1369921774.git.michal.simek@xilinx.com>
 <20130530201714.GE19834@game.jcrosoft.org>
 <51A85BEE.4000009@monstr.eu>
 <20130531110045.GF19834@game.jcrosoft.org> <51A8AC4B.906@monstr.eu>
 <20130531151601.GG19834@game.jcrosoft.org>
 <51A8D3A3.5030200@monstr.eu>
 <20130606082941.GH19834@game.jcrosoft.org>
 <51B04AA9.4070803@monstr.eu>
 <20130606144929.GI19834@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0385256562105167911=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130606144929.GI19834-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
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
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0385256562105167911==
Content-Type: multipart/alternative; boundary=001a11c2289a75199204de7f7881

--001a11c2289a75199204de7f7881
Content-Type: text/plain; charset=ISO-8859-1

2013/6/6 Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>

> On 10:39 Thu 06 Jun     , Michal Simek wrote:
> > On 06/06/2013 10:29 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > > On 18:45 Fri 31 May     , Michal Simek wrote:
> > >> On 05/31/2013 05:16 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > >>> On 15:57 Fri 31 May     , Michal Simek wrote:
> > >>>> On 05/31/2013 01:00 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > >>>>> On 10:14 Fri 31 May     , Michal Simek wrote:
> > >>>>>> Hi Jean-Christophe,
> > >>>>>>
> > >>>>>> On 05/30/2013 10:17 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > >>>>>>> On 15:49 Thu 30 May     , Michal Simek wrote:
> > >>>>>>>> Export of_irq_count for modules.
> > >>>>>>>
> > >>>>>>> can you explain why do you need to call of_irq_count
> > >>>>>>
> > >>>>>> I need to count number of irq written in the DTS node.
> > >>>>>> It is not fixed size that's why I need to proper way how to
> > >>>>>> find it out.
> > >>>>>>
> > >>>>>> I am using this loop.
> > >>>>>>        count = of_irq_count(pdev->dev.of_node);
> > >>>>>>        /* Alloc IRQ based on DTS to be sure that no other driver
> will use it */
> > >>>>>>        while (count--) {
> > >>>>>>                tmp->irq = irq_of_parse_and_map(pdev->dev.of_node,
> count);
> > >>>>>>                dev_info(&pdev->dev, "%d: Alloc irq: %d\n", count,
> tmp->irq);
> > >>>>>>                ret = request_irq(tmp->irq,
> zynq_remoteproc_interrupt, 0,
> > >>>>>>                                        dev_name(&pdev->dev),
> &pdev->dev);
> > >>>>>>                if (ret) {
> > >>>>>>                        ...
> > >>>>>>                }
> > >>>>>>        }
> > >>>>>>
> > >>>>>> But of course if you think that this is incorrect to export it
> > >>>>>> I can use what it is in of_irq_count body
> > >>>>>> 368 int of_irq_count(struct device_node *dev)
> > >>>>>> 369 {
> > >>>>>> 370         int nr = 0;
> > >>>>>> 371
> > >>>>>> 372         while (of_irq_to_resource(dev, nr, NULL))
> > >>>>>> 373                 nr++;
> > >>>>>> 374
> > >>>>>> 375         return nr;
> > >>>>>> 376 }
> > >>>>>>
> > >>>>>> Because of_irq_to_resource is exported for modules.
> > >>>>>> Or is there any better way how to loop over all interrupts in DT
> node?
> > >>>>>
> > >>>>> can just explain me why you need to call irq_of_parse_and_map in
> your driver?
> > >>>>>
> > >>>>> as the irq will be provided in the resources normally
> > >>>>
> > >>>> It is quite a long time I have written this driver on v3.1 or 3.3.
> > >>>> But is this better?
> > >>>>
> > >>>>  struct resource *res;
> > >>>>  int i = 0;
> > >>>>  do {
> > >>>>          res = platform_get_resource(pdev, IORESOURCE_IRQ, i++);
> > >>>>          if (res)
> > >>>>                  do something
> > >>>>  } while(res);
> > >>>>
> > >>>> Also what about of_irq_to_resource()? Is it deprecated and all
> drivers
> > >>>> shouldn't use it?
> > >>>>
> > >>>> I have no problem to rewrite the driver to use
> platform_get_resource.
> > >>> yeah it's better but be aware there is a but in DT that I'm working
> on to fix
> > >>> if you use irq that are registered by a pdev this will not work
> > >>>
> > >>> I hope to fix it for 3.11
> > >>> and already send an RFC that fix it
> > >>
> > >> ok. good to know. Btw: Let's return to my origin point why not to
> > >> export of_irq_count for modules?
> > >> Or opposite question if platform_get_resource is correct way
> > >> why to export of_irq_to_resource for modules?
> > >
> > > for old ppc drivers that are not converted yet to pdev
> > >
> > > if you can do so just use pdev resource I should have fix the pb or
> irq_domain
> > > hopefully for 3.11
> >
> > ok. It means it is currently deprecated.
> > I just wanted to be sure that I understand it correctly.
> >
> > I have changed my drivers not to use this function and using resources as
> > we discussed.
> >
> > btw: I have sent one email to device-tree ML about describing missing
> > connection between cpu and the first interrupt controller.
> > Can you please look at it and comment it?
> >
> https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-May/033955.html
>
> for the record as discussed with Grant I'm preparing to add a new property
> to handle interrupts so you will never have to use "interrupt-parent" any
> more
> and just do this
>
> interrupt-lines = <&aic 5 0 &pioA 4>
>
> it will be more like gpio and will allow to have irq from different
> interrupt-parent in the same node
>
> but wait a few I'll be really back next week as I'm half off this week
>


Good. I am definitely interested in this topic because we can connect
and test this pretty easily.
Also I hope there will be also description between interrupt controller
and cpu.
Anyway I will wait till you are back.

thanks,
Michal


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform

--001a11c2289a75199204de7f7881
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
2013/6/6 Jean-Christophe PLAGNIOL-VILLARD <span dir=3D"ltr">&lt;<a href=3D"=
mailto:plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org" target=3D"_blank">plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org</a>&g=
t;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 1=
0:39 Thu 06 Jun =A0 =A0 , Michal Simek wrote:<br>
&gt; On 06/06/2013 10:29 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:<br>
&gt; &gt; On 18:45 Fri 31 May =A0 =A0 , Michal Simek wrote:<br>
&gt; &gt;&gt; On 05/31/2013 05:16 PM, Jean-Christophe PLAGNIOL-VILLARD wrot=
e:<br>
&gt; &gt;&gt;&gt; On 15:57 Fri 31 May =A0 =A0 , Michal Simek wrote:<br>
&gt; &gt;&gt;&gt;&gt; On 05/31/2013 01:00 PM, Jean-Christophe PLAGNIOL-VILL=
ARD wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt; On 10:14 Fri 31 May =A0 =A0 , Michal Simek wrote:=
<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; Hi Jean-Christophe,<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; On 05/30/2013 10:17 PM, Jean-Christophe PLAGN=
IOL-VILLARD wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; On 15:49 Thu 30 May =A0 =A0 , Michal Sime=
k wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Export of_irq_count for modules.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; can you explain why do you need to call o=
f_irq_count<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; I need to count number of irq written in the =
DTS node.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; It is not fixed size that&#39;s why I need to=
 proper way how to<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; find it out.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; I am using this loop.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =A0 =A0 =A0 =A0count =3D of_irq_count(pdev-&g=
t;dev.of_node);<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =A0 =A0 =A0 =A0/* Alloc IRQ based on DTS to b=
e sure that no other driver will use it */<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =A0 =A0 =A0 =A0while (count--) {<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp-&gt;irq =
=3D irq_of_parse_and_map(pdev-&gt;dev.of_node, count);<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_info(&amp;=
pdev-&gt;dev, &quot;%d: Alloc irq: %d\n&quot;, count, tmp-&gt;irq);<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D reques=
t_irq(tmp-&gt;irq, zynq_remoteproc_interrupt, 0,<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_name(&amp;pdev-&gt;dev), &amp;pdev-&=
gt;dev);<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret) {<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0...<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =A0 =A0 =A0 =A0}<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; But of course if you think that this is incor=
rect to export it<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; I can use what it is in of_irq_count body<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; 368 int of_irq_count(struct device_node *dev)=
<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; 369 {<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; 370 =A0 =A0 =A0 =A0 int nr =3D 0;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; 371<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; 372 =A0 =A0 =A0 =A0 while (of_irq_to_resource=
(dev, nr, NULL))<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; 373 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nr++;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; 374<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; 375 =A0 =A0 =A0 =A0 return nr;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; 376 }<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; Because of_irq_to_resource is exported for mo=
dules.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; Or is there any better way how to loop over a=
ll interrupts in DT node?<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; can just explain me why you need to call irq_of_p=
arse_and_map in your driver?<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; as the irq will be provided in the resources norm=
ally<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; It is quite a long time I have written this driver on=
 v3.1 or 3.3.<br>
&gt; &gt;&gt;&gt;&gt; But is this better?<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; =A0struct resource *res;<br>
&gt; &gt;&gt;&gt;&gt; =A0int i =3D 0;<br>
&gt; &gt;&gt;&gt;&gt; =A0do {<br>
&gt; &gt;&gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0res =3D platform_get_resource(pdev=
, IORESOURCE_IRQ, i++);<br>
&gt; &gt;&gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0if (res)<br>
&gt; &gt;&gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0do something<br>
&gt; &gt;&gt;&gt;&gt; =A0} while(res);<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Also what about of_irq_to_resource()? Is it deprecate=
d and all drivers<br>
&gt; &gt;&gt;&gt;&gt; shouldn&#39;t use it?<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; I have no problem to rewrite the driver to use platfo=
rm_get_resource.<br>
&gt; &gt;&gt;&gt; yeah it&#39;s better but be aware there is a but in DT th=
at I&#39;m working on to fix<br>
&gt; &gt;&gt;&gt; if you use irq that are registered by a pdev this will no=
t work<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I hope to fix it for 3.11<br>
&gt; &gt;&gt;&gt; and already send an RFC that fix it<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; ok. good to know. Btw: Let&#39;s return to my origin point wh=
y not to<br>
&gt; &gt;&gt; export of_irq_count for modules?<br>
&gt; &gt;&gt; Or opposite question if platform_get_resource is correct way<=
br>
&gt; &gt;&gt; why to export of_irq_to_resource for modules?<br>
&gt; &gt;<br>
&gt; &gt; for old ppc drivers that are not converted yet to pdev<br>
&gt; &gt;<br>
&gt; &gt; if you can do so just use pdev resource I should have fix the pb =
or irq_domain<br>
&gt; &gt; hopefully for 3.11<br>
&gt;<br>
&gt; ok. It means it is currently deprecated.<br>
&gt; I just wanted to be sure that I understand it correctly.<br>
&gt;<br>
&gt; I have changed my drivers not to use this function and using resources=
 as<br>
&gt; we discussed.<br>
&gt;<br>
&gt; btw: I have sent one email to device-tree ML about describing missing<=
br>
&gt; connection between cpu and the first interrupt controller.<br>
&gt; Can you please look at it and comment it?<br>
&gt; <a href=3D"https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-=
May/033955.html" target=3D"_blank">https://lists.ozlabs.org/pipermail/devic=
etree-discuss/2013-May/033955.html</a><br>
<br>
</div></div>for the record as discussed with Grant I&#39;m preparing to add=
 a new property<br>
to handle interrupts so you will never have to use &quot;interrupt-parent&q=
uot; any more<br>
and just do this<br>
<br>
interrupt-lines =3D &lt;&amp;aic 5 0 &amp;pioA 4&gt;<br>
<br>
it will be more like gpio and will allow to have irq from different<br>
interrupt-parent in the same node<br>
<br>
but wait a few I&#39;ll be really back next week as I&#39;m half off this w=
eek<br></blockquote><div><br>=A0</div>Good. I am definitely interested in t=
his topic because we can connect<br></div><div class=3D"gmail_quote">and te=
st this pretty easily. <br>
</div><div class=3D"gmail_quote">Also I hope there will be also description=
 between interrupt controller<br>and cpu. <br></div><div class=3D"gmail_quo=
te">Anyway I will wait till you are back.<br><br></div><div class=3D"gmail_=
quote">
thanks,<br></div><div class=3D"gmail_quote">Michal<br></div><div class=3D"g=
mail_quote"><br clear=3D"all"></div><br>-- <br>Michal Simek, Ing. (M.Eng), =
OpenPGP -&gt; KeyID: FE3D1F91<br>w: <a href=3D"http://www.monstr.eu" target=
=3D"_blank">www.monstr.eu</a> p: +42-0-721842854<br>
Maintainer of Linux kernel - Microblaze cpu - <a href=3D"http://www.monstr.=
eu/fdt/" target=3D"_blank">http://www.monstr.eu/fdt/</a><br>Maintainer of L=
inux kernel - Xilinx Zynq ARM architecture<br>Microblaze U-BOOT custodian a=
nd responsible for u-boot arm zynq platform
</div></div>

--001a11c2289a75199204de7f7881--

--===============0385256562105167911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0385256562105167911==--
