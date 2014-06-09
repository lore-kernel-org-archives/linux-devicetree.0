Return-Path: <houcheng@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAVeFuKGyGXQtD9XwqQ=V1M4-tHQLBF5j5i3+-eGCawS0iJNew@mail.gmail.com>
References: <1402189798-7665-1-git-send-email-houcheng@gmail.com>
	<CAAVeFuKGyGXQtD9XwqQ=V1M4-tHQLBF5j5i3+-eGCawS0iJNew@mail.gmail.com>
Date: Mon, 9 Jun 2014 11:28:27 +0800
Message-ID: <CAL8JtxAi6qWhNAQyeqFbq4Ab8eLUqW12pom4sE0LWR9LYGOqDw@mail.gmail.com>
Subject: Re: [RFC PATCH] gpio: Add a defer reset object to send board specific reset
From: Houcheng Lin <houcheng@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b6788bef89a0204fb5ecdbe
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>
List-ID: <devicetree@vger.kernel.org>

--047d7b6788bef89a0204fb5ecdbe
Content-Type: text/plain; charset=UTF-8

On 2014/06/08 20:58, Alexandre Courbot wrote:
> Interesting approach to a long-standing problem. I had my own
> embarrassing attempt at it (power sequences), and more recently Olof
> (CC'd) sent something related for the MMC bus
> (http://www.spinics.net/lists/devicetree/msg18900.html - I'm not sure
> what has become of this patch?). And there are certainly other
> attempts that I don't know of. So, let's say that this time we do it
> for real. There are some points I like in your approach, like the fact
> that it is completely bus-agnostic. But although it will certainly not
> end up being as controversial as the power sequences have been, I am
> not sure everybody will agree to use the DT this way...

Thanks a lot for your reply. I not sure if DT people like this approach to
use
DT. As most poeple use DT as a script to describe a hardware board: cpu,
buses, memory, address mappings and devices. But I think the DT file can
also
be a interface between hardware and software engineers. From the software
engineer's view to a board, he may not get clear informed that this board's
some chip need a special reset signal when bus is on. From the hardware
engineer's view, every devices may works well on bootloader but not in
Linux.
The DT file can serve as note between the two engineers, and a defered
reset
object specify in DT file level can a useful note in this situation.

>> Example dts File
>> ----------------
>>     usb-ehci-chip@1211000{
>>         usb-phy = <&usb2_phy>;
>>         defer_reset_vbus {
>>             compatible = "defer-reset";
>>             reset-gpios = <&gpx3 5 1>;
>>             reset-init = <0>;
>>             reset-end = <1>;
>>             delay = <5>;
>>         };
>>     };
>
> Here I am not convinced that everybody will like the fact that this
> appears as a device of its own, with its own compatible property.
> Let's see what the DT people think of it.
Yes, this patch need DT people agree to use DT in this way.
>
> +       /* setup parameters */
> +       of_property_read_u32_array(dnode, "reset-init", reset_init,
count);
> +       of_property_read_u32_array(dnode, "reset-end", reset_end, count);
> +       of_property_read_u32(dnode, "delay", &delay);
> +
> +       /* reset init */
> +       for (i = 0; i < count; i++) {
> +               gpio = of_get_named_gpio(dnode, "reset-gpios", i);
>
> Quick note: please make use of the gpiod interface in your code.
> (include/linux/gpio/consumer.h and Documentation/gpio/consumer.txt).
> That will simplify it a great deal and will force you to actually
> request the GPIOs, which you omitted here.
I ommitted this and will add code to use consumer.h in next version.
> +static int gdr_probe(struct platform_device *pdev)
> +{
> +       struct list_head *pos;
> +
> +       pr_debug("gpio defer reset probe\n");
> +       list_for_each(pos, &deferred_reset_list) {
> +               struct platform_device *pd;
> +               struct defer_reset_private *prv = list_entry(
> +                       pos, struct defer_reset_private, next);
> +               if (prv->issued)
> +                       continue;
> +               pd = of_find_device_by_node(
> +                       prv->node->parent);
> +               if (pd->dev.driver != 0) {
> +                       gdr_issue_reset(pdev, prv->node);
> +                       prv->issued = 1;
>
> Is there anything that prevents you from removing (and freeing) the
> items from the list once the reset is issued?

Nothing prevents the removing and freeing. The resources claimed by this
driver are no depend to others and should be release immediately after
usage.
The free of resources will be added in next version.

>
>
>> +               }
>> +       }
>> +       list_for_each(pos, &deferred_reset_list) {
>> +               struct defer_reset_private *prv = list_entry(pos,
>> +                       struct defer_reset_private, next);
>> +               if (!prv->issued)
>> +                       return -EPROBE_DEFER;
>> +       }
>> +       return 0;
>
> If you can remove your defer_reset_private instances as they are
> processed you can simple return 0 if the list is empty, or
> -EPROBE_DEFER otherwise. And probably get rid of your "issued" member
> too.
>
> Also, once everything is processed, it would be nice to de-register your
device.

Yes, the driver only need a list to keep all pending deferred reset. Once
a reset is issued, the corresponding deferred-reset object in list can be
removed and that the member "issued" can no longer needed. When list empty,
de-register this device from kernel.

>
> Before doing a more thorough review, I'd like to discuss the basic
> idea. All the previous attempts at implementing an out-of-bus reset
> mechanism are strong evidence that something like this is needed.
> Having a generic mechanism would be a great plus. I am not convinced
> that using a dummy device instance is the right thing to do though.
> Also depending on the bus or device you might desire a different
> timing for issuing the reset: e.g. I know of a modem on a discoverable
> bus (MMC) that will only let itself be probed after the reset is
> applied.

On some hardware board's resetting signal's timing sequence depends on
initialization of a device. Pull the reseting logic onto the device level
fits
the original hardware and no need to modify the chip driver's source code.

However, this mechanism is encasulated as a dummy, pseudo device in kerne.
By
nature, it should be a system type/errata, bus feature or kernel feature. I
am
not sure if it is okay that a kernel feature code can registers a driver,
run
probe code and de-register driver. Is there any suggestion ?

>
> Maybe something ought to be implemented at a deeper level, like the
> bus (as in, all of them) of even the device layer?
>
> Alex.

Thanks a lot for spending time and giving comments.

Best regards,
Houcheng Lin

--047d7b6788bef89a0204fb5ecdbe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br>On 2014/06/08 20:58, Alexan=
dre Courbot wrote:<br>&gt; Interesting approach to a long-standing problem.=
 I had my own<br>&gt; embarrassing attempt at it (power sequences), and mor=
e recently Olof<br>
&gt; (CC&#39;d) sent something related for the MMC bus<br>&gt; (<a href=3D"=
http://www.spinics.net/lists/devicetree/msg18900.html">http://www.spinics.n=
et/lists/devicetree/msg18900.html</a> - I&#39;m not sure<br>&gt; what has b=
ecome of this patch?). And there are certainly other<br>
&gt; attempts that I don&#39;t know of. So, let&#39;s say that this time we=
 do it<br>&gt; for real. There are some points I like in your approach, lik=
e the fact<br>&gt; that it is completely bus-agnostic. But although it will=
 certainly not<br>
&gt; end up being as controversial as the power sequences have been, I am<b=
r>&gt; not sure everybody will agree to use the DT this way... <br><br>Than=
ks a lot for your reply. I not sure if DT people like this approach to use =
<br>
DT. As most poeple use DT as a script to describe a hardware board: cpu, <b=
r>buses, memory, address mappings and devices. But I think the DT file can =
also <br>be a interface between hardware and software engineers. From the s=
oftware <br>
engineer&#39;s view to a board, he may not get clear informed that this boa=
rd&#39;s <br>some chip need a special reset signal when bus is on. From the=
 hardware <br>engineer&#39;s view, every devices may works well on bootload=
er but not in Linux. <br>
The DT file can serve as note between the two engineers, and a defered rese=
t <br>object specify in DT file level can a useful note in this situation.<=
br><br>&gt;&gt; Example dts File<br>&gt;&gt; ----------------<br>&gt;&gt;=
=C2=A0=C2=A0=C2=A0=C2=A0 usb-ehci-chip@1211000{<br>
&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb-phy =3D &lt;&a=
mp;usb2_phy&gt;;<br>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 defer_reset_vbus {<br>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;defer-reset&quot;;<b=
r>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 reset-gpios =3D &lt;&amp;gpx3 5 1&gt;;<br>&gt;&gt;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-init =3D &l=
t;0&gt;;<br>
&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 reset-end =3D &lt;1&gt;;<br>&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delay =3D &lt;5&gt;;<br>&gt;&gt;=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>&gt;&gt;=C2=A0=C2=A0=
=C2=A0=C2=A0 };<br>&gt;<br>&gt; Here I am not convinced that everybody will=
 like the fact that this<br>&gt; appears as a device of its own, with its o=
wn compatible property.<br>
&gt; Let&#39;s see what the DT people think of it.<br>Yes, this patch need =
DT people agree to use DT in this way.<br>&gt;<br>&gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /* setup parameters */<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 of_property_read_u32_array(dnode, &quot;reset-init&quot;, rese=
t_init, count);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of_property_read_u32_array(dnode=
, &quot;reset-end&quot;, reset_end, count);<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 of_property_read_u32(dnode, &quot;delay&quot;, &amp;delay);=
<br>&gt; +<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* reset init */<b=
r>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i &lt; count; i+=
+) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 gpio =3D of_get_named_gpio(dnode, &quot;reset-gpios&quot;, =
i);<br>&gt;<br>&gt; Quick note: please make use of the gpiod interface in y=
our code.<br>&gt; (include/linux/gpio/consumer.h and Documentation/gpio/con=
sumer.txt).<br>
&gt; That will simplify it a great deal and will force you to actually<br>&=
gt; request the GPIOs, which you omitted here.<br>I ommitted this and will =
add code to use consumer.h in next version.<br>&gt; +static int gdr_probe(s=
truct platform_device *pdev)<br>
&gt; +{<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head *pos=
;<br>&gt; +<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_debug(&quot;gp=
io defer reset probe\n&quot;);<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 list_for_each(pos, &amp;deferred_reset_list) {<br>&gt; +=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struc=
t platform_device *pd;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct defer_reset_private *prv =3D list_entry(<br>&gt; +=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pos, struct defer=
_reset_private, next);<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (prv-&gt;issued)<br>&gt; +=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 pd =3D of_find_device_by_node(<br>&gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prv-&gt;node-&gt;parent);<br>&gt; +=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (pd-&gt;dev.driver !=3D 0) {<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdr_issue_reset(pdev, prv-&gt;node);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prv-&gt;iss=
ued =3D 1;<br>&gt;<br>&gt; Is there anything that prevents you from removin=
g (and freeing) the<br>&gt; items from the list once the reset is issued?<b=
r><br>Nothing prevents the removing and freeing. The resources claimed by t=
his <br>
driver are no depend to others and should be release immediately after usag=
e. <br>The free of resources will be added in next version.<br><br>&gt;<br>=
&gt;<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each(po=
s, &amp;deferred_reset_list) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct defer_reset_private *prv =3D list_entry(pos,<b=
r>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struc=
t defer_reset_private, next);<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!prv-&gt;issued)=
<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -EPROBE_DEFER;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>&gt;&gt; +=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return 0;<br>&gt;<br>&gt; If you can remove your d=
efer_reset_private instances as they are<br>&gt; processed you can simple r=
eturn 0 if the list is empty, or<br>&gt; -EPROBE_DEFER otherwise. And proba=
bly get rid of your &quot;issued&quot; member<br>
&gt; too.<br>&gt;<br>&gt; Also, once everything is processed, it would be n=
ice to de-register your device.<br><br>Yes, the driver only need a list to =
keep all pending deferred reset. Once <br>a reset is issued, the correspond=
ing deferred-reset object in list can be<br>
removed and that the member &quot;issued&quot; can no longer needed. When l=
ist empty, <br>de-register this device from kernel.<br><br>&gt;<br>&gt; Bef=
ore doing a more thorough review, I&#39;d like to discuss the basic<br>
&gt; idea. All the previous attempts at implementing an out-of-bus reset<br=
>&gt; mechanism are strong evidence that something like this is needed.<br>=
&gt; Having a generic mechanism would be a great plus. I am not convinced<b=
r>
&gt; that using a dummy device instance is the right thing to do though.<br=
>&gt; Also depending on the bus or device you might desire a different<br>&=
gt; timing for issuing the reset: e.g. I know of a modem on a discoverable<=
br>
&gt; bus (MMC) that will only let itself be probed after the reset is<br>&g=
t; applied.<br><br>On some hardware board&#39;s resetting signal&#39;s timi=
ng sequence depends on <br>initialization of a device. Pull the reseting lo=
gic onto the device level fits <br>
the original hardware and no need to modify the chip driver&#39;s source co=
de. <br><br>However, this mechanism is encasulated as a dummy, pseudo devic=
e in kerne. By <br>nature, it should be a system type/errata, bus feature o=
r kernel feature. I am <br>
not sure if it is okay that a kernel feature code can registers a driver, r=
un <br>probe code and de-register driver. Is there any suggestion ? <br><br=
>&gt;<br>&gt; Maybe something ought to be implemented at a deeper level, li=
ke the<br>
&gt; bus (as in, all of them) of even the device layer?<br>&gt;<br>&gt; Ale=
x.<br><br>Thanks a lot for spending time and giving comments.<br><br>Best r=
egards,<br>Houcheng Lin<br><br><br><br>
</div></div>

--047d7b6788bef89a0204fb5ecdbe--
