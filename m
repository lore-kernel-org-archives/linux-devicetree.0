From: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/2] Character literal parsing
Date: Tue, 28 Jun 2011 16:00:34 -0700
Message-ID: <CAF6FioXjabaB=ARKF_4rRVEkZ0mDWnfz5weGaDW6hLrkU8HGYg@mail.gmail.com>
References: <1308871239-32683-1-git-send-email-robotboy@chromium.org>
	<8yawrgb3smr.fsf@huya.qualcomm.com>
	<BANLkTi=iUqMwag-A6t1ubDgSAN9xqWuTMwLG32EKKWuwVbigyg@mail.gmail.com>
	<8yafwmz3pg3.fsf@huya.qualcomm.com>
	<BANLkTinDPNfXWUOWPR3HmZatE=ohzO0Ybg@mail.gmail.com>
	<BANLkTi=EEuuYSZdLeE1UFsdT=xuEZREkEs+R_FcdQo6JPA-fEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1608158318244027216=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTi=EEuuYSZdLeE1UFsdT=xuEZREkEs+R_FcdQo6JPA-fEQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============1608158318244027216==
Content-Type: multipart/alternative; boundary=0014853c90dea7f07e04a6cda2cb

--0014853c90dea7f07e04a6cda2cb
Content-Type: text/plain; charset=ISO-8859-1

Jon, what are your feelings on the proposed patch?  I'd love to get an
indication either way, should I continue to pursue this?

Thanks,
    Anton

On Fri, Jun 24, 2011 at 2:47 PM, Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:

>
>
> On Fri, Jun 24, 2011 at 2:34 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>wrote:
>
>> On Fri, Jun 24, 2011 at 3:11 PM, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> wrote:
>> > On Fri, Jun 24 2011, Anton Staaf wrote:
>> >
>> >> On Fri, Jun 24, 2011 at 1:02 PM, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> wrote:
>> >>
>> >>
>> >>     Does this mean that the dtc inside the kernel is going to be the
>> >>     required tool to use to build device trees?  This change doesn't
>> change
>> >>     the DTB format, so it's as much of a concern, but was wondering if
>> we're
>> >>     intending to keep things compatible.
>> >>
>> >>
>> >> To be honest, I don't know enough to say either way.  I am using the
>> character
>> >> literals in a device tree that is used to configure a single firmware
>> image for
>> >> multiple boards.  That device tree is not currently passed on to the
>> kernel.
>> >>
>> >> Your question makes me think that there are two device tree compilers
>> that I
>> >> should be paying attention to, is that the case?  Or was it a more
>> general
>> >> comment about diverging from a historic syntax for device tree source
>> files?
>> >
>> > Both, really.  There is a dtc at
>> > git://git.kernel.org/pub/scm/linux/kernel/git/galak/dtc.git but it
>> seems
>> > older than the one in the kernel.
>>
>> The kernel one is simply a copy of the upstream dtc.  You should craft
>> your patches against:
>>
>> git://git.jdl.com/software/dtc.git
>>
>> >
>> > Also, the dts form is defined in the ePAPR documents, and this would be
>> > a (minor) divergence from that.
>>
>> dts is not set in stone, and is certainly subject to enhancements
>> providing it doesn't break existing users.
>>
>>
> Adding character literals does not (as far as I can tell) conflict with any
> existing syntax.  All exiting dts files should compile to the exact same
> blobs with my patches.  And of coarse, all of the existing test cases pass
> cleanly.  It would also be a good idea for me to add test cases for
> character literals.  I will do that and update the patch set if we decide to
> accept the change to the syntax.
>
> -Anton
>
>

--0014853c90dea7f07e04a6cda2cb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Jon, what are your feelings on the proposed patch? =A0I&#39;d love to get a=
n indication either way, should I continue to=A0pursue=A0this?<div><br></di=
v><div>Thanks,<br>=A0 =A0 Anton</div><div><br><div class=3D"gmail_quote">On=
 Fri, Jun 24, 2011 at 2:47 PM, Anton Staaf <span dir=3D"ltr">&lt;<a href=3D=
"mailto:robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org">robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;"><div><div></div><div class=3D"h5"><br><br><=
div class=3D"gmail_quote">On Fri, Jun 24, 2011 at 2:34 PM, Grant Likely <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" target=3D"_=
blank">grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<div>On Fri, Jun 24, 2011 at 3:11 PM, David Brown &lt;<a href=3D"mailto:dav=
idb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" target=3D"_blank">davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org</a>&gt; wrote:<=
br>
&gt; On Fri, Jun 24 2011, Anton Staaf wrote:<br>
&gt;<br>
&gt;&gt; On Fri, Jun 24, 2011 at 1:02 PM, David Brown &lt;<a href=3D"mailto=
:davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" target=3D"_blank">davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org</a>&gt; wro=
te:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =A0 =A0 Does this mean that the dtc inside the kernel is going to =
be the<br>
&gt;&gt; =A0 =A0 required tool to use to build device trees? =A0This change=
 doesn&#39;t change<br>
&gt;&gt; =A0 =A0 the DTB format, so it&#39;s as much of a concern, but was =
wondering if we&#39;re<br>
&gt;&gt; =A0 =A0 intending to keep things compatible.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; To be honest, I don&#39;t know enough to say either way. =A0I am u=
sing the character<br>
&gt;&gt; literals in a device tree that is used to configure a single firmw=
are image for<br>
&gt;&gt; multiple boards. =A0That device tree is not currently passed on to=
 the kernel.<br>
&gt;&gt;<br>
&gt;&gt; Your question makes me think that there are two device tree compil=
ers that I<br>
&gt;&gt; should be paying attention to, is that the case? =A0Or was it a mo=
re general<br>
&gt;&gt; comment about diverging from a historic syntax for device tree sou=
rce files?<br>
&gt;<br>
&gt; Both, really. =A0There is a dtc at<br>
&gt; git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/galak/=
dtc.git" target=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/galak/dt=
c.git</a> but it seems<br>
&gt; older than the one in the kernel.<br>
<br>
</div>The kernel one is simply a copy of the upstream dtc. =A0You should cr=
aft<br>
your patches against:<br>
<div><br>
git://<a href=3D"http://git.jdl.com/software/dtc.git" target=3D"_blank">git=
.jdl.com/software/dtc.git</a><br>
<br>
&gt;<br>
</div><div>&gt; Also, the dts form is defined in the ePAPR documents, and t=
his would be<br>
&gt; a (minor) divergence from that.<br>
<br>
</div>dts is not set in stone, and is certainly subject to enhancements<br>
providing it doesn&#39;t break existing users.<br>
<font color=3D"#888888"><br></font></blockquote><div>=A0</div></div></div><=
/div>Adding character literals does not (as far as I can tell) conflict wit=
h any existing syntax. =A0All exiting dts files should compile to the exact=
 same blobs with my patches. =A0And of coarse, all of the existing test cas=
es pass cleanly. =A0It would also be a good idea for me to add test cases f=
or character literals. =A0I will do that and update the patch set if we dec=
ide to accept the change to the syntax.<div>

<br></div><font color=3D"#888888"><div>-Anton</div><div><br></div>
</font></blockquote></div><br></div>

--0014853c90dea7f07e04a6cda2cb--

--===============1608158318244027216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1608158318244027216==--
