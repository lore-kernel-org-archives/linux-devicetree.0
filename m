From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Associating devices with multiple parents
Date: Thu, 16 Aug 2012 16:20:47 -0600
Message-ID: <CACxGe6uqWG7kRUL0o3qPCMDvG52UyqTMez+AT1yK55X-xgaRuQ@mail.gmail.com>
References: <502D4B28.4020108@wwwdotorg.org> <502D6A3A.7060808@firmworks.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6823820218307008836=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <502D6A3A.7060808-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
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
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============6823820218307008836==
Content-Type: multipart/alternative; boundary=f46d042f92528c3fdd04c7697439

--f46d042f92528c3fdd04c7697439
Content-Type: text/plain; charset=ISO-8859-1

On Aug 16, 2012 3:46 PM, "Mitch Bradley" <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
>
> Here is the situation:  We (OLPC) have an audio codec that is strongly
> associated with an audio controller, but it also has some registers that
> you get at with I2C.
>
> In some sense, the codec has two parents, the audio controller
> (connected via I2S) and the I2C controller.
>
> Is there an established Linux convention for expressing that dual-parent
> relationship for I2C?  The phandle schemes for cross-tree gpio, clk, and
> interrupt relationships obviously bear some resemblance to the problem,
> but I haven't seen anything for I2C.

Yes. Place the codec under the i2c controller and use a tope level audio
complex node with phandles to both the codec and i2s nodes.

Generally we've been choosing patent hood based on the path used to control
the device, as opposed to the data path. Another example is ETH phy devices
on an MDIO bus and the ETH MAC has a phandle to the phy(s).

g.

>
> (We actually have two devices with the same problem - the other is an
> LCD panel controller than wants to be a child of the display device, but
> also has some I2C registers accessed by an IC2 controller that's not
> part of the display controller.)
>

--f46d042f92528c3fdd04c7697439
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Aug 16, 2012 3:46 PM, &quot;Mitch Bradley&quot; &lt;<a href=3D"mailto:wm=
b@firmworks.com">wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Here is the situation: =A0We (OLPC) have an audio codec that is strong=
ly<br>
&gt; associated with an audio controller, but it also has some registers th=
at<br>
&gt; you get at with I2C.<br>
&gt;<br>
&gt; In some sense, the codec has two parents, the audio controller<br>
&gt; (connected via I2S) and the I2C controller.<br>
&gt;<br>
&gt; Is there an established Linux convention for expressing that dual-pare=
nt<br>
&gt; relationship for I2C? =A0The phandle schemes for cross-tree gpio, clk,=
 and<br>
&gt; interrupt relationships obviously bear some resemblance to the problem=
,<br>
&gt; but I haven&#39;t seen anything for I2C.</p>
<p dir=3D"ltr">Yes. Place the codec under the i2c controller and use a tope=
 level audio complex node with phandles to both the codec and i2s nodes.</p=
>
<p dir=3D"ltr">Generally we&#39;ve been choosing patent hood based on the p=
ath used to control the device, as opposed to the data path. Another exampl=
e is ETH phy devices on an MDIO bus and the ETH MAC has a phandle to the ph=
y(s).</p>

<p dir=3D"ltr">g.</p>
<p dir=3D"ltr">&gt;<br>
&gt; (We actually have two devices with the same problem - the other is an<=
br>
&gt; LCD panel controller than wants to be a child of the display device, b=
ut<br>
&gt; also has some I2C registers accessed by an IC2 controller that&#39;s n=
ot<br>
&gt; part of the display controller.)<br>
&gt;<br>
</p>

--f46d042f92528c3fdd04c7697439--

--===============6823820218307008836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6823820218307008836==--
