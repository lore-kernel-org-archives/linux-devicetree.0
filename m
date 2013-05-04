From: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 2/5] ARM: dove: add DT parsing for legacy mv643xx_eth
Date: Sat, 4 May 2013 20:37:15 +0100
Message-ID: <CAGVrzcYq2yBcpkNZY_gfKrYxFGXwKiTUxSDtYQzcqPsfvRzf=Q@mail.gmail.com>
References: <1367519104-19677-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1367538519-23940-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1367538519-23940-3-git-send-email-sebastian.hesselbarth@gmail.com>
 <20130503050632.GC24965@lunn.ch>
 <20130504182935.GO31290@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1130915555285478628=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130504182935.GO31290-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
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
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============1130915555285478628==
Content-Type: multipart/alternative; boundary=f46d042dfeaf43f5c804dbe99840

--f46d042dfeaf43f5c804dbe99840
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le 4 mai 2013 19:30, "Jason Cooper" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> a =C3=A9crit :
>
> On Fri, May 03, 2013 at 07:06:32AM +0200, Andrew Lunn wrote:
> > Jason: what is the status of the ethernet driver conversion to DT?
> > Will it get merged this week, or is it material for the next merge
> > window?
>
> You'd have to ask Florian/David Miller.  I'm not sure wether David was
> able to pull that in for v3.10 or not.  He was pretty responsive to all
> of the other changes Florian posted.

Sorry for the delay, I do not think I will be able to work on these patches
in the next few weeks. I would appreciate if Sebastian or yourself could
follow up with the latest submission? Sebastian already sent me an updated
version which looks good enough to be sent for review

--f46d042dfeaf43f5c804dbe99840
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
Le 4 mai 2013 19:30, &quot;Jason Cooper&quot; &lt;<a href=3D"mailto:jason@l=
akedaemon.net">jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org</a>&gt; a =C3=A9crit=C2=A0:<br>
&gt;<br>
&gt; On Fri, May 03, 2013 at 07:06:32AM +0200, Andrew Lunn wrote:<br>
&gt; &gt; Jason: what is the status of the ethernet driver conversion to DT=
?<br>
&gt; &gt; Will it get merged this week, or is it material for the next merg=
e<br>
&gt; &gt; window?<br>
&gt;<br>
&gt; You&#39;d have to ask Florian/David Miller. =C2=A0I&#39;m not sure wet=
her David was<br>
&gt; able to pull that in for v3.10 or not. =C2=A0He was pretty responsive =
to all<br>
&gt; of the other changes Florian posted.</p>
<p dir=3D"ltr">Sorry for the delay, I do not think I will be able to work o=
n these patches in the next few weeks. I would appreciate if Sebastian or y=
ourself could follow up with the latest submission? Sebastian already sent =
me an updated version which looks good enough to be sent for review<br>

</p>

--f46d042dfeaf43f5c804dbe99840--

--===============1130915555285478628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1130915555285478628==--
