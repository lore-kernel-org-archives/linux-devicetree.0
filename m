From: Christo Radev <christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Wed, 4 May 2016 06:32:14 -0700 (PDT)
Message-ID: <4704fa35-9a2a-4e6e-8fd4-f4778405c598@googlegroups.com>
References: <1461827998-12192-1-git-send-email-oliver@schinagl.nl>
 <CAGb2v66E2TuN3+tYaAbniV3q67waDZOfqKAW14VJz6xZFomZ=Q@mail.gmail.com>
 <57285162.2000704@schinagl.nl>
 <CAGb2v66r9m7qVW6BszeT2wqs0KyEr4x5ivTJYqu2Fes=R9-Ltw@mail.gmail.com>
 <CANCTEQgjiuQXcaw=3Dr5kUsTPc3nsDQf2odwzs4nHvrkREAqrg@mail.gmail.com>
 <5729F07C.3080308@schinagl.nl>
 <948be370-4401-43cb-862e-d4376755a75d@googlegroups.com>
 <5729F6D6.8030100@schinagl.nl>
Reply-To: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_569_961777076.1462368734284"
Return-path: <linux-sunxi+bncBD7ORYHCVECRBYPTU64QKGQEDMJZ4ZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <5729F6D6.8030100-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, radoslav.kolev-1W28NRE8jL9DPfheJLI6IQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_569_961777076.1462368734284
Content-Type: multipart/alternative;
	boundary="----=_Part_570_2029902893.1462368734284"

------=_Part_570_2029902893.1462368734284
Content-Type: text/plain; charset=UTF-8

Hi Oliver,

I do: that 
http://forum.armbian.com/index.php/topic/853-armbian-customization/page-2#entry7359
The syntax error seen there was fixed and the result is: 
http://forum.armbian.com/index.php/topic/853-armbian-customization/page-2#entry7361

The same tests was done on legacy kernel 3.4.111 modifying fex file and the 
result is the same: 
http://forum.armbian.com/index.php/topic/853-armbian-customization/page-2#entry7265


Best regards
Chris


On Wednesday, May 4, 2016 at 4:19:20 PM UTC+3, Olliver Schinagl wrote:
>
> Hey Christo,
>
> On 04-05-16 15:07, Christo Radev wrote:
>
> Hi Olliver,
>
> I have already test it a few weeks ago and definitely can say that 8-bit 
> bus did not work on A20-Olinuxino-Lime2-eMMC with mainline kernel.
> See may post here 
> <http://forum.armbian.com/index.php/topic/853-armbian-customization/page-2#entry7361>
> .
>
> I saw, but you forgot to define the pins for 4.x :)
>
> See my patch from earlier: 
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-September/368887.html
>
> Olliver
>
>
> Best regards
>
> Chris
>
> On Wednesday, May 4, 2016 at 3:52:17 PM UTC+3, Olliver Schinagl wrote: 
>>
>> Hey Radoslav, 
>>
>> On 04-05-16 14:30, Radoslav Kolev wrote: 
>> > 2016-05-03 10:25 GMT+03:00 Chen-Yu Tsai <we...-jdAy2FN1RRM@public.gmane.org>: 
>> >> On Tue, May 3, 2016 at 3:21 PM, Olliver Schinagl <oli...-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org> 
>> wrote: 
>> >>>>> +       bus-width = <4>; 
>> >>>> Only 4 bits? We normally see eMMC with 8 bits. 4 bits are some kind 
>> of 
>> >>>> embedded SD card. 
>> >>> On A20 as well? Our investigations so far have concluded that the A10 
>> and 
>> >>> A20 have those pins not mapped out to pads. The IP does support it 
>> however 
>> >>> we assume. 
>> >> You're right. My bad. First time A10/A20 sees eMMC support. 
>> > I can't say anything about A10/A20, but I have a board with A13 and 
>> > the same eMMC chip and it works fine in 8 bit mode. 
>> Yep, sun5i actually brings them all out to pads, the A20 however does 
>> not :( We first thought that the A20 would also be an 8bitter, because 
>> the mmc IP appears to be the same as sun5i, but initial tests show it is 
>> not. As for A10, it has older IP and it might not even support 8 bit 
>> mode, let alone bring out the pins. 
>>
>> But with A20's + eMMC being available via the lime2, others may repeat 
>> my experiments! The lime2 is 8 bit connected. 
>>
>> Olliver 
>> > 
>> > Regards, 
>> > Radoslav 
>>
>>
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_570_2029902893.1462368734284
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Oliver,<br><br>I do: that http://forum.armbian.com/inde=
x.php/topic/853-armbian-customization/page-2#entry7359<br>The syntax error =
seen there was fixed and the result is: http://forum.armbian.com/index.php/=
topic/853-armbian-customization/page-2#entry7361<br><br>The same tests was =
done on legacy kernel 3.4.111 modifying fex file and the result is the same=
: http://forum.armbian.com/index.php/topic/853-armbian-customization/page-2=
#entry7265<br><br><br>Best regards<br>Chris<br><br><br>On Wednesday, May 4,=
 2016 at 4:19:20 PM UTC+3, Olliver Schinagl wrote:<blockquote class=3D"gmai=
l_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;=
padding-left: 1ex;">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hey Christo,<br>
    <br>
    <div>On 04-05-16 15:07, Christo Radev wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">Hi Olliver,<br>
        <br>
        I have already test it a few weeks ago and definitely can say
        that 8-bit bus did not work on A20-Olinuxino-Lime2-eMMC with
        mainline kernel.<br>
        See may post <a href=3D"http://forum.armbian.com/index.php/topic/85=
3-armbian-customization/page-2#entry7361" target=3D"_blank" rel=3D"nofollow=
" onmousedown=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F=
%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-customization%2Fpage=
-2%23entry7361\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHJsEMhE0Sir_4R5oOoGR=
nKYa0slg&#39;;return true;" onclick=3D"this.href=3D&#39;http://www.google.c=
om/url?q\x3dhttp%3A%2F%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbia=
n-customization%2Fpage-2%23entry7361\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQj=
CNHJsEMhE0Sir_4R5oOoGRnKYa0slg&#39;;return true;">here</a>.<br>
      </div>
    </blockquote>
    I saw, but you forgot to define the pins for 4.x :)<br>
    <br>
    See my patch from earlier:
<a href=3D"http://lists.infradead.org/pipermail/linux-arm-kernel/2015-Septe=
mber/368887.html" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.hr=
ef=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Flists.infradead.org%2=
Fpipermail%2Flinux-arm-kernel%2F2015-September%2F368887.html\x26sa\x3dD\x26=
sntz\x3d1\x26usg\x3dAFQjCNG58Mu-lGULS_w3sxXaj81hwQG6Eg&#39;;return true;" o=
nclick=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Flist=
s.infradead.org%2Fpipermail%2Flinux-arm-kernel%2F2015-September%2F368887.ht=
ml\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNG58Mu-lGULS_w3sxXaj81hwQG6Eg&#39=
;;return true;">http://lists.infradead.org/<wbr>pipermail/linux-arm-kernel/=
<wbr>2015-September/368887.html</a><br>
    <br>
    Olliver<br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr"><br>
        Best regards<br>
        <br>
        Chris<br>
        <br>
        On Wednesday, May 4, 2016 at 3:52:17 PM UTC+3, Olliver Schinagl
        wrote:
        <blockquote class=3D"gmail_quote" style=3D"margin:0;margin-left:0.8=
ex;border-left:1px #ccc solid;padding-left:1ex">Hey
          Radoslav,
          <br>
          <br>
          On 04-05-16 14:30, Radoslav Kolev wrote:
          <br>
          &gt; 2016-05-03 10:25 GMT+03:00 Chen-Yu Tsai &lt;<a rel=3D"nofoll=
ow"></a><a>we...-jdAy2FN1RRM@public.gmane.org</a>&gt;:
          <br>
          &gt;&gt; On Tue, May 3, 2016 at 3:21 PM, Olliver Schinagl &lt;<a =
rel=3D"nofollow"></a><a>oli...-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org</a>&gt;
          wrote:
          <br>
          &gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 bus-width =3D &lt;4&g=
t;;
          <br>
          &gt;&gt;&gt;&gt; Only 4 bits? We normally see eMMC with 8
          bits. 4 bits are some kind of
          <br>
          &gt;&gt;&gt;&gt; embedded SD card.
          <br>
          &gt;&gt;&gt; On A20 as well? Our investigations so far have
          concluded that the A10 and
          <br>
          &gt;&gt;&gt; A20 have those pins not mapped out to pads. The
          IP does support it however
          <br>
          &gt;&gt;&gt; we assume.
          <br>
          &gt;&gt; You&#39;re right. My bad. First time A10/A20 sees eMMC
          support.
          <br>
          &gt; I can&#39;t say anything about A10/A20, but I have a board
          with A13 and
          <br>
          &gt; the same eMMC chip and it works fine in 8 bit mode.
          <br>
          Yep, sun5i actually brings them all out to pads, the A20
          however does <br>
          not :( We first thought that the A20 would also be an 8bitter,
          because <br>
          the mmc IP appears to be the same as sun5i, but initial tests
          show it is <br>
          not. As for A10, it has older IP and it might not even support
          8 bit <br>
          mode, let alone bring out the pins.
          <br>
          <br>
          But with A20&#39;s + eMMC being available via the lime2, others
          may repeat <br>
          my experiments! The lime2 is 8 bit connected.
          <br>
          <br>
          Olliver
          <br>
          &gt;
          <br>
          &gt; Regards,
          <br>
          &gt; Radoslav
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_570_2029902893.1462368734284--

------=_Part_569_961777076.1462368734284--
