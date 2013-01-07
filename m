From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] drm/exynos: Get HDMI version from device tree
Date: Mon, 7 Jan 2013 18:12:32 -0500
Message-ID: <CAOw6vbKqVnDt7PH1JTtG1cujnfzNOeK-eHhebpX9WSytnhwmBg@mail.gmail.com>
References: <1357591415-17092-1-git-send-email-seanpaul@chromium.org>
 <50EB4D11.7000407@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5187916818345306123=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50EB4D11.7000407-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: InKi Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============5187916818345306123==
Content-Type: multipart/alternative; boundary=bcaec54eeaeac98d9704d2baf6ee

--bcaec54eeaeac98d9704d2baf6ee
Content-Type: text/plain; charset=ISO-8859-1

On Jan 7, 2013 5:32 PM, "Stephen Warren" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>
> On 01/07/2013 01:43 PM, Sean Paul wrote:
> > Add a property to the hdmi node so we can specify the HDMI version in
> > the device tree instead of just defaulting to v1.4 with the existence of
> > the dt node.
>
> > diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
>
> > @@ -11,6 +11,8 @@ Required properties:
> >       c) pin function mode.
> >       d) optional flags and pull up/down.
> >       e) drive strength.
> > +- samsung,supports-hdmi-1.4: Define if device supports HDMI v1.4
> > +- samsung,supports-hdmi-1.3: Define if device supports HDMI v1.3
>
> Which device; the HDMI controller in the SoC, or the HDMI sink?
>

It's the controller.

> The HDMI sync reports what it supports in the EDID, so there shouldn't
> be a need to duplicate this in the device tree (besides, how can you
> know what the user plugged in without parsing the EDID?)

--bcaec54eeaeac98d9704d2baf6ee
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jan 7, 2013 5:32 PM, &quot;Stephen Warren&quot; &lt;<a href=3D"mailto:sw=
arren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org">swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 01/07/2013 01:43 PM, Sean Paul wrote:<br>
&gt; &gt; Add a property to the hdmi node so we can specify the HDMI versio=
n in<br>
&gt; &gt; the device tree instead of just defaulting to v1.4 with the exist=
ence of<br>
&gt; &gt; the dt node.<br>
&gt;<br>
&gt; &gt; diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmi.tx=
t b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt<br>
&gt;<br>
&gt; &gt; @@ -11,6 +11,8 @@ Required properties:<br>
&gt; &gt; =A0 =A0 =A0 c) pin function mode.<br>
&gt; &gt; =A0 =A0 =A0 d) optional flags and pull up/down.<br>
&gt; &gt; =A0 =A0 =A0 e) drive strength.<br>
&gt; &gt; +- samsung,supports-hdmi-1.4: Define if device supports HDMI v1.4=
<br>
&gt; &gt; +- samsung,supports-hdmi-1.3: Define if device supports HDMI v1.3=
<br>
&gt;<br>
&gt; Which device; the HDMI controller in the SoC, or the HDMI sink?<br>
&gt;</p>
<p dir=3D"ltr">It&#39;s the controller.</p>
<p dir=3D"ltr">&gt; The HDMI sync reports what it supports in the EDID, so =
there shouldn&#39;t<br>
&gt; be a need to duplicate this in the device tree (besides, how can you<b=
r>
&gt; know what the user plugged in without parsing the EDID?)<br>
</p>

--bcaec54eeaeac98d9704d2baf6ee--

--===============5187916818345306123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5187916818345306123==--
