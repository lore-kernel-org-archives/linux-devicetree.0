From: Raul Piper <raulpblooper@gmail.com>
Subject: Right way to get the gpio values from the device tree in the device
	driver
Date: Thu, 18 Aug 2016 16:12:13 +0530
Message-ID: <CAEwN+MDzLOcskDZhMVkSv7OEaq5_gbdE9ar+hM_DL1mjkKEWjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6899749386643893940=="
Return-path: <kernelnewbies-bounces@kernelnewbies.org>
List-Unsubscribe: <https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies>,
	<mailto:kernelnewbies-request@kernelnewbies.org?subject=unsubscribe>
List-Archive: <http://lists.kernelnewbies.org/pipermail/kernelnewbies>
List-Post: <mailto:kernelnewbies@kernelnewbies.org>
List-Help: <mailto:kernelnewbies-request@kernelnewbies.org?subject=help>
List-Subscribe: <https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies>,
	<mailto:kernelnewbies-request@kernelnewbies.org?subject=subscribe>
Sender: kernelnewbies-bounces@kernelnewbies.org
Errors-To: kernelnewbies-bounces@kernelnewbies.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
List-Id: devicetree@vger.kernel.org

--===============6899749386643893940==
Content-Type: multipart/alternative; boundary=001a113ef2041bc7a2053a563c6c

--001a113ef2041bc7a2053a563c6c
Content-Type: text/plain; charset=UTF-8

Hello,

With reference to the example below what is the correct way to get the gpio
values from the device tree :

I modified the existing leds-ns2 device tree as below :



          blue-sata {

                   label = "ns2:blue:sata";

                   slow-gpio = <&gpio0 29 0>;

                   cmd-gpio = <&gpio0 30 0>;

+                 slow1-gpio=<&gpio 31 0>;

+                 cmd1-gpio=<&gpio 32 0>;

                   modes-map = <NS_V2_LED_OFF  0 1

                                NS_V2_LED_ON   1 0

                                NS_V2_LED_ON   0 0

                                NS_V2_LED_SATA 1 1>;

           };





And modified the driver by adding slow1 and cmd1 in all the structure (just
like slow and cmd)

But when I am trying to get the gpio number for slow1 and cmd1 I am getting
the below error(number gpio #31 and 32 are random numbers of gpio for
testing, does it matters?) :

error : leds-ns2:probe of ns2-leds failed with error -2.What does error
code -2 represents ?Is this a device tree parsing error?

ret = of_get_named_gpio(child, "slow1-gpio", 0);

                 if (ret < 0)

                         return ret;

same error if I try to get the cmd1-gpio


Thanks in advance !

Regards,

Rp

On Thu, Aug 4, 2016 at 9:23 AM, Raul Piper <raulpblooper@gmail.com> wrote:
> make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- <name of the dtb file>.dtb
>
> This compiles fine.
>
> On Thu, Aug 4, 2016 at 1:06 AM, Frank Rowand <frowand.list@gmail.com>
wrote:
>> On 07/25/16 04:17, Raul Piper wrote:
>>> Hi,
>>> Where can I find the example for the  dynamic Loading of the device
>>> tree and its corresponding device driver.
>>> How can I build the dts with or without the kernel source.
>>>
>>> I am getting this error whenever I am trying to build the below sample
>>> dts file using the dtc compiler.
>>>
>>> dtc -O dtb -o leds-ns2.dtb leds-ns2.dts
>>>
>>>
>>> Error: leds-ns2.dts:1.1-2 syntax error
>>
>> That is an error at line 1, columns 1-2. dtc does not understand cpp
>> directives, you need to process leds-ns2.dts with cpp. The Linux
>> build infrastructure does this for .dtb targets in makefiles.
>>
>>> FATAL ERROR: Unable to parse input tree
>>>
>>> Below is the content  of the leds-ns2.dts
>>>
>>> #include <dt-bindings/leds/leds-ns2.h>
>>>
>>>  ns2-leds {
>>>           compatible = "lacie,ns2-leds";
>>>
>>>           blue-sata {
>>>                   label = "ns2:blue:sata";
>>>                   slow-gpio = <&gpio0 29 0>;
>>>                   cmd-gpio = <&gpio0 30 0>;
>>>                   modes-map = <NS_V2_LED_OFF  0 1
>>>                                NS_V2_LED_ON   1 0
>>>                                NS_V2_LED_ON   0 0
>>>                                NS_V2_LED_SATA 1 1>;
>>>           };
>>>   };
>>>
>>> Thanks,
>>> R
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>

--001a113ef2041bc7a2053a563c6c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>With reference to the example below what is =
the correct way to get the gpio values from the device tree :<br><br>I modi=
fied the existing leds-ns2 device tree as below :<br><br>=C2=A0<br><br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blue-sata {<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;ns2:blue:sata&=
quot;;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0slow-gpio =3D &lt;&amp;gpio0 29 0&gt;;<br><br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-gpio =3D &lt;&amp;g=
pio0 30 0&gt;;<br><br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 slow1-gpio=3D&lt;&amp;gpio 31 0&gt;;<br><br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd1-gpio=3D&lt;&amp;gpio 32 0&gt;;<br><=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mod=
es-map =3D &lt;NS_V2_LED_OFF =C2=A00 1<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NS_V2_LED_ON =C2=A0 1 0<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 NS_V2_LED_ON =C2=A0 0 0<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NS_V2_LED_SATA 1 1&gt;;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0};<br><br>=C2=A0<br><br>=C2=A0<br><br>And modified the driver by adding =
slow1 and cmd1 in all the structure (just like slow and cmd)<br><br>But whe=
n I am trying to get the gpio number for slow1 and cmd1 I am getting the be=
low error(number gpio #31 and 32 are random numbers of gpio for testing, do=
es it matters?) :<br><br>error : leds-ns2:probe of ns2-leds failed with err=
or -2.What does error code -2 represents ?Is this a device tree parsing err=
or?<br><br>ret =3D of_get_named_gpio(child, &quot;slow1-gpio&quot;, 0);<br>=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &=
lt; 0)<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br><br>same error if I try to ge=
t the cmd1-gpio<br>=C2=A0<br><br>Thanks in advance !<br><br>Regards,<br><br=
>Rp<br><br>On Thu, Aug 4, 2016 at 9:23 AM, Raul Piper &lt;<a href=3D"mailto=
:raulpblooper@gmail.com">raulpblooper@gmail.com</a>&gt; wrote:<br>&gt; make=
 ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- &lt;name of the dtb file&gt;=
.dtb<br>&gt;<br>&gt; This compiles fine.<br>&gt;<br>&gt; On Thu, Aug 4, 201=
6 at 1:06 AM, Frank Rowand &lt;<a href=3D"mailto:frowand.list@gmail.com">fr=
owand.list@gmail.com</a>&gt; wrote:<br>&gt;&gt; On 07/25/16 04:17, Raul Pip=
er wrote:<br>&gt;&gt;&gt; Hi,<br>&gt;&gt;&gt; Where can I find the example =
for the =C2=A0dynamic Loading of the device<br>&gt;&gt;&gt; tree and its co=
rresponding device driver.<br>&gt;&gt;&gt; How can I build the dts with or =
without the kernel source.<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; I am getting thi=
s error whenever I am trying to build the below sample<br>&gt;&gt;&gt; dts =
file using the dtc compiler.<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; dtc -O dtb -o =
leds-ns2.dtb leds-ns2.dts<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; E=
rror: leds-ns2.dts:1.1-2 syntax error<br>&gt;&gt;<br>&gt;&gt; That is an er=
ror at line 1, columns 1-2. dtc does not understand cpp<br>&gt;&gt; directi=
ves, you need to process leds-ns2.dts with cpp. The Linux<br>&gt;&gt; build=
 infrastructure does this for .dtb targets in makefiles.<br>&gt;&gt;<br>&gt=
;&gt;&gt; FATAL ERROR: Unable to parse input tree<br>&gt;&gt;&gt;<br>&gt;&g=
t;&gt; Below is the content =C2=A0of the leds-ns2.dts<br>&gt;&gt;&gt;<br>&g=
t;&gt;&gt; #include &lt;dt-bindings/leds/leds-ns2.h&gt;<br>&gt;&gt;&gt;<br>=
&gt;&gt;&gt; =C2=A0ns2-leds {<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 compatible =3D &quot;lacie,ns2-leds&quot;;<br>&gt;&gt;&gt;<br>&gt;&g=
t;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blue-sata {<br>&gt;&gt;&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D &quot=
;ns2:blue:sata&quot;;<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 slow-gpio =3D &lt;&amp;gpio0 29 0&gt;;<br>&gt;&=
gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-=
gpio =3D &lt;&amp;gpio0 30 0&gt;;<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 modes-map =3D &lt;NS_V2_LED_OFF =C2=
=A00 1<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NS_V2_LED_ON =C2=
=A0 1 0<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NS_V2_LED_ON =
=C2=A0 0 0<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NS_V2_LED_SA=
TA 1 1&gt;;<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>&gt;&g=
t;&gt; =C2=A0 };<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Thanks,<br>&gt;&gt;&gt; R<=
br>&gt;&gt;&gt; --<br>&gt;&gt;&gt; To unsubscribe from this list: send the =
line &quot;unsubscribe devicetree&quot; in<br>&gt;&gt;&gt; the body of a me=
ssage to <a href=3D"mailto:majordomo@vger.kernel.org">majordomo@vger.kernel=
.org</a><br>&gt;&gt;&gt; More majordomo info at =C2=A0<a href=3D"http://vge=
r.kernel.org/majordomo-info.html">http://vger.kernel.org/majordomo-info.htm=
l</a><br>&gt;&gt;&gt;<br>&gt;&gt;<br></div>

--001a113ef2041bc7a2053a563c6c--


--===============6899749386643893940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernelnewbies mailing list
Kernelnewbies@kernelnewbies.org
https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies

--===============6899749386643893940==--
