From: Olliver Schinagl <o.schinagl-U3FVU11NWA554TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Fri, 15 Jul 2016 11:01:15 +0200
Message-ID: <b84d0f3e-ace7-849e-8c90-0435f665c366@ultimaker.com>
References: <1461827998-12192-1-git-send-email-oliver@schinagl.nl>
 <CANCTEQgjiuQXcaw=3Dr5kUsTPc3nsDQf2odwzs4nHvrkREAqrg@mail.gmail.com>
 <5729F07C.3080308@schinagl.nl>
 <948be370-4401-43cb-862e-d4376755a75d@googlegroups.com>
 <5729F6D6.8030100@schinagl.nl>
 <4704fa35-9a2a-4e6e-8fd4-f4778405c598@googlegroups.com>
 <572A0052.9060202@schinagl.nl>
 <2e745ef7-ddc0-40fc-b867-414543690276@googlegroups.com>
 <572A10B3.2020803@schinagl.nl>
 <4375220a-f939-4ed0-a6d7-2cf887b07509@googlegroups.com>
 <9fe7ebb6-6d74-4b73-b6d6-93b79650cdb6@googlegroups.com>
 <9745a80b-5444-43f7-b772-68684c96c9e5@googlegroups.com>
 <57322C8D.5060806@schinagl.nl>
 <8afbe753-4e74-4b30-ad7e-a12027d28264@googlegroups.com>
 <57323CAB.7090202@schinagl.nl>
 <f959ee5c-fa63-48f6-9819-4822c055b928@googlegroups.com>
 <6bfa242e-c0ce-4dc5-9144-b3f16d8fb75c@googlegroups.com>
 <5732EB34.6070203@schinagl.nl>
 <78b34fdb-bb6e-4043-8f5b-93bc551513c7@googlegroups.com>
 <6214e145-b408-70f1-bc6f-db066cbe94b1@schinagl.nl>
Reply-To: o.schinagl-U3FVU11NWA554TAoqtyWWQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------D6F746D86C942FF47A9467AA"
Return-path: <linux-sunxi+bncBD7M3SWL7UKRBXOMUK6AKGQEZBRPPUI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <6214e145-b408-70f1-bc6f-db066cbe94b1-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, radoslav.kolev-1W28NRE8jL9DPfheJLI6IQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--------------D6F746D86C942FF47A9467AA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Stefan,


On 15-07-16 10:57, Olliver Schinagl wrote:
> On 15-07-16 10:39, stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> Hi Olliver,
>>
>> Why are you using nRST signal?
>> What I mean is this pin is inactive on this eMMC chip. To use the signal
>> byte 162 of ECSD registers should be written.
> Then that sounds like a bug in the mmc layer I would say (or a missing=20
> attribute in the dts), we have a nRST signal it is wired, if the chip=20
> ignores it, then nothing lost, if the chip needs to be initialized=20
> with byte 162 of the ECSD register to make the nRST work, then that it=20
> sounds like it should be fixed there?
>
> By ommitting the nRST signal just because the chip isn't properly=20
> initialized sounds more like a work-around to me, but I could be wrong=20
> and see things wrong.
I just did a quick google query, and found the following post [0]. And=20
it appears it's a fuse in the eMMC chip to enable/disable this=20
functionality. I guess, but not sure, that our mmc driver in=20
u-boot/kernel does not use the reset flag properly (always high) if that=20
fuse has been enabled. I can imagine when using older u-boots this flag=20
isn't enabled, the fuse is not triggered yet and the pin is thus ignored?

>
> What do the mmc guys, who have far more experience here, say?
>
>>
>> On my board, this "reset" signal causes eMMC not to work.
> That supprises me, as afaik I was using it just fine...
>
> Olliver
>>
>> Best regards,
>> Stefan Mavrodiev
>

[0]=20
https://groups.google.com/forum/#!category-topic/beagleboard/u-boot/1XwSNdZ=
ii1Y

--=20
Met vriendelijke groeten, Kind regards, =E4=B8=8E=E4=BA=B2=E5=88=87=E7=9A=
=84=E9=97=AE=E5=80=99

Olliver Schinagl
Software Engineer
Research & Development
Ultimaker B.V.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--------------D6F746D86C942FF47A9467AA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Type=
">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <p>Stefan,<br>
    </p>
    <br>
    <div class=3D"moz-cite-prefix">On 15-07-16 10:57, Olliver Schinagl
      wrote:<br>
    </div>
    <blockquote
      cite=3D"mid:6214e145-b408-70f1-bc6f-db066cbe94b1-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org"
      type=3D"cite">On 15-07-16 10:39, <a class=3D"moz-txt-link-abbreviated=
" href=3D"mailto:stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>=
 wrote:
      <br>
      <blockquote type=3D"cite">Hi Olliver,
        <br>
        <br>
        Why are you using nRST signal?
        <br>
        What I mean is this pin is inactive on this eMMC chip. To use
        the signal
        <br>
        byte 162 of ECSD registers should be written.
        <br>
      </blockquote>
      Then that sounds like a bug in the mmc layer I would say (or a
      missing attribute in the dts), we have a nRST signal it is wired,
      if the chip ignores it, then nothing lost, if the chip needs to be
      initialized with byte 162 of the ECSD register to make the nRST
      work, then that it sounds like it should be fixed there?
      <br>
      <br>
      By ommitting the nRST signal just because the chip isn't properly
      initialized sounds more like a work-around to me, but I could be
      wrong and see things wrong.
      <br>
    </blockquote>
    I just did a quick google query, and found the following post [0].
    And it appears it's a fuse in the eMMC chip to enable/disable this
    functionality. I guess, but not sure, that our mmc driver in
    u-boot/kernel does not use the reset flag properly (always high) if
    that fuse has been enabled. I can imagine when using older u-boots
    this flag isn't enabled, the fuse is not triggered yet and the pin
    is thus ignored?<br>
    <br>
    <blockquote
      cite=3D"mid:6214e145-b408-70f1-bc6f-db066cbe94b1-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org"
      type=3D"cite">
      <br>
      What do the mmc guys, who have far more experience here, say?
      <br>
      <br>
      <blockquote type=3D"cite">
        <br>
        On my board, this "reset" signal causes eMMC not to work.
        <br>
      </blockquote>
      That supprises me, as afaik I was using it just fine...
      <br>
      <br>
      Olliver
      <br>
      <blockquote type=3D"cite">
        <br>
        Best regards,
        <br>
        Stefan Mavrodiev
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
    [0]
<a class=3D"moz-txt-link-freetext" href=3D"https://groups.google.com/forum/=
#!category-topic/beagleboard/u-boot/1XwSNdZii1Y">https://groups.google.com/=
forum/#!category-topic/beagleboard/u-boot/1XwSNdZii1Y</a><br>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Met vriendelijke groeten, Kind regards, =E4=B8=8E=E4=BA=B2=E5=88=87=E7=9A=
=84=E9=97=AE=E5=80=99

Olliver Schinagl
Software Engineer
Research &amp; Development
Ultimaker B.V.</pre>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--------------D6F746D86C942FF47A9467AA--
