Return-Path: <dobatog@gmail.com>
Message-ID: <54CE3460.8090900@gmail.com>
Date: Sun, 01 Feb 2015 15:12:48 +0100
From: Gabriel Dobato <dobatog@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ARM: dts: mvebu: add ethernet to the cm-a510 board
References: <E1YH5bU-0005mG-3L@bombadil.infradead.org> <54CB5267.5060004@gmail.com> <20150130113118.5523ed68@armhf> <54CB6440.1010002@gmail.com> <20150130124144.501cf81d@armhf> <54CB732F.7010409@gmail.com> <20150130133913.083d1ade@armhf> <54CB7E33.3080909@gmail.com>
In-Reply-To: <54CB7E33.3080909@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------060805060701090806030001"
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jean-Francois Moine <moinejf@free.fr>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------060805060701090806030001
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

> I'd be happy to take over, but I admit that my current lack of spare
> time would only allow me to support Gabriel and you.
>
> Let's wait for Gabriel's response on how he can help improving
> Dove mainline with his cm-a510 and baseboard.
>
> Sebastian 
Hello all,

First of all, I would like to give thanks all people like you for all 
your help and support. I really appreciate it.

DT is new for me, I have never worked using this kind of hardware 
description, so I am involving in many issues due to my lack of skills 
in this kind of structure.

At this moment, I am focusing in the update of the version of the kernel 
on the CM-A510 board (from 2.6 to 3.1x)in order to give more features to 
the system, but as I said before, I have lots of problems.

Thanks to the help and support of Jean-Francois Moine, I have achieved 
to boot the kernel completely and to mount the rootfs via NFS. I have a 
prompt, what has been a very big step for me.

> Nope. One dove.dtsi, one dove-cm-a510.dtsi, and one baseboard.dts 
> including dove-cm-a510.dtsi for every baseboard we stumble upon. 

In reference to the structure of .dts and .dtsi files, I agree with this 
kind of structure, of course, nobody as you can consider it better. I 
think the idea of make a dove-cm-a510.dtsi file and different 
baseboards.dts depending of the peripherals used is great. But as I say, 
maybe I am not the right person to decide it, Jean-Froncois Moine and 
you have better criteria.So, whatever you decide I would very happy to help.

At this moment, I am trying to configure the framebuffer, but as Moine 
told me,it seems there is not video driver support for this board in 
DT... :( .

Best regards, and thank you again...

G.D


--------------060805060701090806030001
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <blockquote type="cite">I'd be happy to take over, but I admit that
      my current lack of spare
      <br>
      time would only allow me to support Gabriel and you.
      <br>
      <br>
      Let's wait for Gabriel's response on how he can help improving
      <br>
      Dove mainline with his cm-a510 and baseboard.
      <br>
      <br>
      Sebastian
    </blockquote>
    Hello all,<br>
    <br>
    First of all, I would like to give thanks all people like you for
    all your help and support. I really appreciate it.<br>
    <br>
    DT is new for me, I have never worked using this kind of hardware
    description, so I am involving in many issues due to my lack of
    skills in this kind of structure.<br>
    <br>
    At this moment, I am focusing in the update of the version of the
    kernel on the CM-A510 board (from 2.6 to 3.1x)in order to give more
    features to the system, but as I said before, I have lots of
    problems.<br>
    <br>
    Thanks to the help and support of Jean-Francois Moine, I have
    achieved to boot the kernel completely and to mount the rootfs via
    NFS. I have a prompt, what has been a very big step for me.<br>
    <br>
    <pre wrap=""><blockquote type="cite"><font face="sans-serif">Nope. One dove.dtsi, one dove-cm-a510.dtsi, and one baseboard.dts
including dove-cm-a510.dtsi for every baseboard we stumble upon.</font>
</blockquote>
</pre>
    In reference to the structure of .dts and .dtsi files, I agree with
    this kind of structure, of course, nobody as you can consider it
    better. I think the idea of make a dove-cm-a510.dtsi file and
    different baseboards.dts depending of the peripherals used is great.
    But as I say, maybe I am not the right person to decide it,
    Jean-Froncois Moine and you have better criteria.So, whatever you
    decide I would very happy to help.<br>
    <br>
    At this moment, I am trying to configure the framebuffer, but as
    Moine told me,it seems there is not video driver support for this
    board in DT... :( . <br>
    <br>
    Best regards, and thank you again...<br>
    <br>
    G.D<br>
    <br>
  </body>
</html>

--------------060805060701090806030001--
