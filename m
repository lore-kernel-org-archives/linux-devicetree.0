From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] This patch adds support for Sinovoip BPI-M3
 A83T based board.
Date: Thu, 3 Aug 2017 12:50:45 +0200
Message-ID: <CAPPFs5EUegzHVGOP6iwaa8bdCtkVR1KM_VYGdnCDNQdV0yUdEA@mail.gmail.com>
References: <1501716302-1009-1-git-send-email-embed3d@gmail.com> <CAGb2v65-jo4ejgrWOtWE1-yJMYOP=CXHux2Os-a99GRrXa3o=g@mail.gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="001a11430c7a1d76240555d72756"
Return-path: <linux-sunxi+bncBD257DPK24NRBBUARTGAKGQEHHPIFCY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v65-jo4ejgrWOtWE1-yJMYOP=CXHux2Os-a99GRrXa3o=g@mail.gmail.com>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--001a11430c7a1d76240555d72756
Content-Type: text/plain; charset="UTF-8"

Thanks for the infos!

I didn't know that someone is working on some patches for that board.

Philipp Rossak

On Aug 3, 2017 06:31, "Chen-Yu Tsai" <wens-jdAy2FN1RRM@public.gmane.org> wrote:

On Thu, Aug 3, 2017 at 7:25 AM, Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> It has 2G LPDDR3, UART, ethernet, USB, HDMI, USB Sata, MIPI DSI,
> mic, AP6212 Wifi, etc on it.
> It is paired with AXP813 PMIC which is almost same as AXP818.
>
> Signed-off-by: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> This Patch got somehow lost. This is a resubmit! The original patch
> could be found here: https://patchwork.ozlabs.org/patch/598497/

This didn't get merged because the original patch sets dealt with
a lot of stuff that wasn't settled.

Also, you should keep the author when resending patches.

Finally, I have a more complete version that I plan to send soon:

https://github.com/wens/linux/commit/240a2492b3379646e2f497d5ade701
4ff955f818

Note that the dts file name is changed to bananapi-m3, to match
what we have for most of the other bananapi boards.

ChenYu

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--001a11430c7a1d76240555d72756
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the infos!<div dir=3D"auto"><br></div><div dir=
=3D"auto">I didn&#39;t know that someone is working on some patches for tha=
t board.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Philipp R=
ossak</div><div class=3D"gmail_extra" dir=3D"auto"><br><div class=3D"gmail_=
quote">On Aug 3, 2017 06:31, &quot;Chen-Yu Tsai&quot; &lt;<a href=3D"mailto=
:wens-jdAy2FN1RRM@public.gmane.org">wens-jdAy2FN1RRM@public.gmane.org</a>&gt; wrote:<br type=3D"attribution"><block=
quote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div class=3D"quoted-text">On Thu, Aug 3, 2017 at 7:25 A=
M, Philipp Rossak &lt;<a href=3D"mailto:embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">embed3d-Re5JQEeQqe8@public.gmane.org=
m</a>&gt; wrote:<br>
&gt; From: Philipp Rossak &lt;<a href=3D"mailto:embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">embed3d@=
gmail.com</a>&gt;<br>
&gt;<br>
&gt; It has 2G LPDDR3, UART, ethernet, USB, HDMI, USB Sata, MIPI DSI,<br>
&gt; mic, AP6212 Wifi, etc on it.<br>
&gt; It is paired with AXP813 PMIC which is almost same as AXP818.<br>
&gt;<br>
&gt; Signed-off-by: Vishnu Patekar &lt;<a href=3D"mailto:vishnupatekar0510@=
gmail.com">vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt;<br>
&gt; This Patch got somehow lost. This is a resubmit! The original patch<br=
>
&gt; could be found here: <a href=3D"https://patchwork.ozlabs.org/patch/598=
497/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/<wb=
r>patch/598497/</a><br>
<br>
</div>This didn&#39;t get merged because the original patch sets dealt with=
<br>
a lot of stuff that wasn&#39;t settled.<br>
<br>
Also, you should keep the author when resending patches.<br>
<br>
Finally, I have a more complete version that I plan to send soon:<br>
<br>
<a href=3D"https://github.com/wens/linux/commit/240a2492b3379646e2f497d5ade=
7014ff955f818" rel=3D"noreferrer" target=3D"_blank">https://github.com/wens=
/linux/<wbr>commit/<wbr>240a2492b3379646e2f497d5ade701<wbr>4ff955f818</a><b=
r>
<br>
Note that the dts file name is changed to bananapi-m3, to match<br>
what we have for most of the other bananapi boards.<br>
<br>
ChenYu<br>
</blockquote></div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--001a11430c7a1d76240555d72756--
