From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 02/14] ARM: SPEAr13xx: DT: Add spics gpio controller nodes
Date: Tue, 13 Nov 2012 20:04:37 +0530
Message-ID: <CAKohpon=AVGZmR_cwUZ4=buw0kr3JVtXh51BtXteWkJ7E-f_bQ@mail.gmail.com>
References: <cover.1352608333.git.viresh.kumar@linaro.org>
 <58a7d91cab20b924784fb5a09e16ca08e6f13318.1352608333.git.viresh.kumar@linaro.org>
 <CACRpkdZkgmLF8TxFCZSubP+g+6_ofZugArKtE9=dYTZfemstrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1522225714898991474=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZkgmLF8TxFCZSubP+g+6_ofZugArKtE9=dYTZfemstrw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: arnd@arndb.de, devicetree-discuss@lists.ozlabs.org, spear-devel@list.st.com, arm@kernel.org, olof@lixom.net, sr@denx.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1522225714898991474==
Content-Type: multipart/alternative; boundary=f46d04426cd04f208e04ce615173

--f46d04426cd04f208e04ce615173
Content-Type: text/plain; charset=ISO-8859-1

On Nov 13, 2012 7:38 PM, "Linus Walleij" <linus.walleij@linaro.org> wrote:
>
> On Sun, Nov 11, 2012 at 5:39 AM, Viresh Kumar <viresh.kumar@linaro.org>
wrote:
>
> > From: Shiraz Hashim <shiraz.hashim@st.com>
> >
> > SPEAr platform provides a provision to control chipselects of ARM PL022
Prime
> > Cell spi controller through its system registers, which otherwise
remains under
> > PL022 control which some protocols do not want.
>
> So I guess this platform us utilizing the cs_control field of the
> PL022 platform data to do the actual magic, right?

Correct.

> > This patch adds spics controller nodes in device tree for various
SPEAr13xx
> > SoCs.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Shiraz Hashim <shiraz.hashim@st.com>
> > Reviewed-by: Vipin Kumar <vipin.kumar@st.com>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> (...)
> >         ahb {
> > +               spics: spics@e0700000{
> > +                       compatible = "st,spear-spics-gpio";
> > +                       reg = <0xe0700000 0x1000>;
> > +                       st-spics,peripcfg-reg = <0x3b0>;
> > +                       st-spics,sw-enable-bit = <12>;
> > +                       st-spics,cs-value-bit = <11>;
> > +                       st-spics,cs-enable-mask = <3>;
> > +                       st-spics,cs-enable-shift = <8>;
> > +                       gpio-controller;
> > +                       #gpio-cells = <2>;
> > +               };
> > +
>
> Are these bindings documented?

The main patch waiting for ur comments is 1/14.

> Apart from that remark:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

--f46d04426cd04f208e04ce615173
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Nov 13, 2012 7:38 PM, &quot;Linus Walleij&quot; &lt;<a href=3D"mailto:li=
nus.walleij@linaro.org">linus.walleij@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sun, Nov 11, 2012 at 5:39 AM, Viresh Kumar &lt;<a href=3D"mailto:vi=
resh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; From: Shiraz Hashim &lt;<a href=3D"mailto:shiraz.hashim@st.com">s=
hiraz.hashim@st.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; SPEAr platform provides a provision to control chipselects of ARM=
 PL022 Prime<br>
&gt; &gt; Cell spi controller through its system registers, which otherwise=
 remains under<br>
&gt; &gt; PL022 control which some protocols do not want.<br>
&gt;<br>
&gt; So I guess this platform us utilizing the cs_control field of the<br>
&gt; PL022 platform data to do the actual magic, right?</p>
<p>Correct.</p>
<p>&gt; &gt; This patch adds spics controller nodes in device tree for vari=
ous SPEAr13xx<br>
&gt; &gt; SoCs.<br>
&gt; &gt;<br>
&gt; &gt; Cc: Linus Walleij &lt;<a href=3D"mailto:linus.walleij@linaro.org"=
>linus.walleij@linaro.org</a>&gt;<br>
&gt; &gt; Signed-off-by: Shiraz Hashim &lt;<a href=3D"mailto:shiraz.hashim@=
st.com">shiraz.hashim@st.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Vipin Kumar &lt;<a href=3D"mailto:vipin.kumar@st.com=
">vipin.kumar@st.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@li=
naro.org">viresh.kumar@linaro.org</a>&gt;<br>
&gt; (...)<br>
&gt; &gt; =A0 =A0 =A0 =A0 ahb {<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spics: spics@e0700000{<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quo=
t;st,spear-spics-gpio&quot;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0xe0700=
000 0x1000&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 st-spics,peripcfg-r=
eg =3D &lt;0x3b0&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 st-spics,sw-enable-=
bit =3D &lt;12&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 st-spics,cs-value-b=
it =3D &lt;11&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 st-spics,cs-enable-=
mask =3D &lt;3&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 st-spics,cs-enable-=
shift =3D &lt;8&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio-controller;<br=
>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #gpio-cells =3D &lt=
;2&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
&gt; &gt; +<br>
&gt;<br>
&gt; Are these bindings documented?</p>
<p>The main patch waiting for ur comments is 1/14.</p>
<p>&gt; Apart from that remark:<br>
&gt; Acked-by: Linus Walleij &lt;<a href=3D"mailto:linus.walleij@linaro.org=
">linus.walleij@linaro.org</a>&gt;<br>
&gt;<br>
&gt; Yours,<br>
&gt; Linus Walleij<br>
</p>

--f46d04426cd04f208e04ce615173--


--===============1522225714898991474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1522225714898991474==--
