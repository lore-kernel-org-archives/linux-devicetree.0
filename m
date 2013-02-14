From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] [media] s5p-g2d: Add DT based discovery support
Date: Thu, 14 Feb 2013 20:36:23 +0530
Message-ID: <CAK9yfHyhbpK1GVN2FZSZq_GKFUDNz3zGsdwppbKpgFCb7P2P3Q@mail.gmail.com>
References: <1360128584-23167-1-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHzaDDD0XEywdv+P6gEapjHwxKEfwHzKKQuXWEPHeAFgCw@mail.gmail.com>
 <511C230B.5060302@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5312233710461916570=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <511C230B.5060302-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============5312233710461916570==
Content-Type: multipart/alternative; boundary=e89a8f83ae1b22015d04d5b09ad9

--e89a8f83ae1b22015d04d5b09ad9
Content-Type: text/plain; charset=ISO-8859-1

On Thursday, 14 February 2013, Sylwester Nawrocki <
sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 02/12/2013 06:30 PM, Sachin Kamat wrote:
>>
>> Hi Sylwester,
>>
>> On Wednesday, 6 February 2013, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
wrote:
>>>
>>>  This patch adds device tree based discovery support to G2D driver
>>>
>>>  Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>  ---
>>>  Based on for_v3.9 branch of below tree:
>>>  git://linuxtv.org/snawrocki/samsung.git
>>>
>>>  Changes since v1:
>>>  * Addressed review comments from Sylwester <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>.
>>>  * Modified the compatible string as per the discussions at [1].
>>>  [1] https://patchwork1.kernel.org/patch/2045821/
>>>
>>
>> Does this patch look good?
>
> It looks OK to me. I've sent a pull request including it, but it may
> happen it ends up only in 3.10.

Thanks. Hope it gets picked for 3.9 itself.

>
> I tried to test this patch today and I had to correct some clock
> definitions in the common clock API driver [1]. And we already have
> quite a few fixes to that patch series.
>
> Shouldn't you also provide a patch adding related OF_DEV_AUXDATA entry ?
> How did you test this one ?

I tested this without the common clock patches, with the mainline tree. It
did not require any auxdata  entry.
>
> When the new clocks driver gets merged (I guess it happens only in 3.10)
> I'd like to have the media devices' clock names cleaned up, instead of
> names like: {"sclk_fimg2d", "fimg2d"}, {"sclk_fimc", "fimc"},
> {"sclk_fimd"/"fimd"}, in clock-names property we could have common names,
> e.g. { "sclk", "gate" }. This could simplify a bit subsystems like
devfreq.

Yes. That makes sense.

>
> Also I noticed there are some issues caused by splitting mux + div + gate
> clocks into 3 different clocks. One solution to this might be to use the
> new composite clock type.

Ok.

>
> [1] http://www.spinics.net/lists/arm-kernel/msg214149.html
>

-- 
With warm regards,
Sachin

--e89a8f83ae1b22015d04d5b09ad9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, 14 February 2013, Sylwester Nawrocki &lt;<a href=3D"ma=
ilto:sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wro=
te:<br>&gt; On 02/12/2013 06:30 PM, Sachin Kamat wrote:<br>&gt;&gt;<br>&gt;=
&gt; Hi Sylwester,<br>
&gt;&gt;<br>&gt;&gt; On Wednesday, 6 February 2013, Sachin Kamat &lt;<a hre=
f=3D"mailto:sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:=
<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; =A0This patch adds device tree based disco=
very support to G2D driver<br>
&gt;&gt;&gt;<br>&gt;&gt;&gt; =A0Signed-off-by: Sachin Kamat &lt;<a href=3D"=
mailto:sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>&gt;&gt;=
&gt; =A0---<br>&gt;&gt;&gt; =A0Based on for_v3.9 branch of below tree:<br>&=
gt;&gt;&gt; =A0git://<a href=3D"http://linuxtv.org/snawrocki/samsung.git">l=
inuxtv.org/snawrocki/samsung.git</a><br>
&gt;&gt;&gt;<br>&gt;&gt;&gt; =A0Changes since v1:<br>&gt;&gt;&gt; =A0* Addr=
essed review comments from Sylwester &lt;<a href=3D"mailto:s.nawrocki@samsu=
ng.com">s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;.<br>&gt;&gt;&gt; =A0* Modified the c=
ompatible string as per the discussions at [1].<br>
&gt;&gt;&gt; =A0[1] <a href=3D"https://patchwork1.kernel.org/patch/2045821/=
">https://patchwork1.kernel.org/patch/2045821/</a><br>&gt;&gt;&gt;<br>&gt;&=
gt;<br>&gt;&gt; Does this patch look good?<br>&gt;<br>&gt; It looks OK to m=
e. I&#39;ve sent a pull request including it, but it may<br>
&gt; happen it ends up only in 3.10.<br><br>Thanks. Hope it gets picked for=
 3.9 itself.<br><br>&gt;<br>&gt; I tried to test this patch today and I had=
 to correct some clock<br>&gt; definitions in the common clock API driver [=
1]. And we already have<br>
&gt; quite a few fixes to that patch series.<br>&gt;<br>&gt; Shouldn&#39;t =
you also provide a patch adding related OF_DEV_AUXDATA entry ?<br>&gt; How =
did you test this one ?<br><br>I tested this without the common clock patch=
es, with the mainline tree. It did not require any auxdata =A0entry.<br>
&gt;<br>&gt; When the new clocks driver gets merged (I guess it happens onl=
y in 3.10)<br>&gt; I&#39;d like to have the media devices&#39; clock names =
cleaned up, instead of<br>&gt; names like: {&quot;sclk_fimg2d&quot;, &quot;=
fimg2d&quot;}, {&quot;sclk_fimc&quot;, &quot;fimc&quot;},<br>
&gt; {&quot;sclk_fimd&quot;/&quot;fimd&quot;}, in clock-names property we c=
ould have common names,<br>&gt; e.g. { &quot;sclk&quot;, &quot;gate&quot; }=
. This could simplify a bit subsystems like devfreq.<br><br>Yes. That makes=
 sense.<br>
<br>&gt;<br>&gt; Also I noticed there are some issues caused by splitting m=
ux + div + gate<br>&gt; clocks into 3 different clocks. One solution to thi=
s might be to use the<br>&gt; new composite clock type.<br><br>Ok.<br><br>
&gt;<br>&gt; [1] <a href=3D"http://www.spinics.net/lists/arm-kernel/msg2141=
49.html">http://www.spinics.net/lists/arm-kernel/msg214149.html</a><br>&gt;=
<br><br>-- <br><div>With warm regards,</div>
<div>Sachin</div><br>

--e89a8f83ae1b22015d04d5b09ad9--

--===============5312233710461916570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5312233710461916570==--
