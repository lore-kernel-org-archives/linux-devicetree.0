Return-Path: <dobatog@gmail.com>
Message-ID: <54D48711.8060903@gmail.com>
Date: Fri, 06 Feb 2015 10:19:13 +0100
From: Gabriel Dobato <dobatog@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ARM: dts: mvebu: add ethernet to the cm-a510 board
References: <E1YH5bU-0005mG-3L@bombadil.infradead.org> <54CB5267.5060004@gmail.com> <20150130113118.5523ed68@armhf> <54CB6440.1010002@gmail.com> <20150130124144.501cf81d@armhf> <54CB732F.7010409@gmail.com> <20150130133913.083d1ade@armhf> <54CB7E33.3080909@gmail.com> <54CE354F.5090106@gmail.com> <54D3EB26.9020909@gmail.com>
In-Reply-To: <54D3EB26.9020909@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------080206070602070804090901"
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jean-Francois Moine <moinejf@free.fr>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080206070602070804090901
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 05/02/15 23:13, Sebastian Hesselbarth wrote:
> Gabriel,
>
> great you can boot a recent kernel. I guess you had to quite heavily
> modify current dove-cm-a510.dts? Can you upload the one you use now
> to any pastebin and send the link? 

Hello Sebsatian,

Not, I only had to include eth (as Mr. Moine told me) and mdio because I 
mount rootfs via NFS.

> You didn't mention if you really use the sb-a510, i.e. the Compulab
> reference baseboard. Is it what you are using with your cm-a510? 

Yes, sorry for that, I am using SB-A510.

At this moment, thanks to the help of Moine, I am trying to get video 
output using the driver he made.

But I think it is only the beginning....

I wonder if it will there be driver support for the second ethernet 
(PCIE attached NIC), and the rest of features remained, for DT...

Before using DT, I tried to boot a simple uImage (without DT), but it 
did not boot

the last ouput in the kernel trade was:
...
/uncompressing linux... done, booting the kernel./

nothing else.... I wonder if there is a problem with the ID machine, I 
don't know...
The U-Boot used was the one provided by Compulab (Maybe the problem is 
on Uboot...)

G.D








--------------080206070602070804090901
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-cite-prefix">On 05/02/15 23:13, Sebastian
      Hesselbarth wrote:<br>
    </div>
    <blockquote cite="mid:54D3EB26.9020909@gmail.com" type="cite">Gabriel,
      <br>
      <br>
      great you can boot a recent kernel. I guess you had to quite
      heavily
      <br>
      modify current dove-cm-a510.dts? Can you upload the one you use
      now
      <br>
      to any pastebin and send the link?
    </blockquote>
    <br>
    Hello Sebsatian,<br>
    <br>
    Not, I only had to include eth (as Mr. Moine told me) and mdio
    because I mount rootfs via NFS.<br>
    <br>
    <blockquote type="cite">You didn't mention if you really use the
      sb-a510, i.e. the Compulab
      <br>
      reference baseboard. Is it what you are using with your cm-a510?
    </blockquote>
    <br>
    Yes, sorry for that, I am using SB-A510.<br>
    <br>
    At this moment, thanks to the help of Moine, I am trying to get
    video output using the driver he made.<br>
    <br>
    But I think it is only the beginning.... <br>
    <br>
    I wonder if it will there be driver support for the second ethernet
    (PCIE attached NIC), and the rest of features remained, for DT...<br>
    <br>
    Before using DT, I tried to boot a simple uImage (without DT), but
    it did not boot<br>
    <br>
    the last ouput in the kernel trade was:<br>
    ...<br>
    <i>uncompressing linux... done, booting the kernel.</i><br>
    <br>
    nothing else.... I wonder if there is a problem with the ID machine,
    I don't know... <br>
    The U-Boot used was the one provided by Compulab (Maybe the problem
    is on Uboot...)<br>
    <br>
    G.D<br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
  </body>
</html>

--------------080206070602070804090901--
