Return-Path: <SRS0=byPw=N6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38500 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbeKTIn1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 20 Nov 2018 03:43:27 -0500
Received: by mail-pl1-f193.google.com with SMTP id e5so5203054plb.5
        for <devicetree@vger.kernel.org>; Mon, 19 Nov 2018 14:17:41 -0800 (PST)
Subject: Re: dtx_diff: "fatal error: imx6qp.dtsi: No such file or directory"
References: <alpine.LFD.2.21.1710290430280.4745@localhost.localdomain>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <bf3bbdd3-0d81-f525-71c5-6177eb865f7c@gmail.com>
Date: Mon, 19 Nov 2018 14:17:38 -0800
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.1710290430280.4745@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Robert,

On 10/29/17 1:52 AM, Robert P. J. Day wrote:
> 
>   not sure why i can't dtx_diff two .dts files if they're located
> outside of a kernel source tree -- the dtx_diff script certainly seems
> to suggest that's possible.
> 
>   with my kernel source tree at ~/k/git, i set things up with:
> 
>   $ PATH=$PATH:~/k/git/scripts/dtc
>   $ export ARCH=arm
> 
>   first test, which works just fine (comparing imx6q-sabresd.dts and
> imx6qp-sabresd.dts), first "cd"ing to the top of my kernel source
> git repo:
> 
>   $ cd ~/k/git
>   $ dtx_diff arch/arm/boot/dts/imx6q{,p}-sabresd.dts
> 
> appears to work fine, no need to use either of -s or -S to identify
> the source tree since, by default, the script assumes that's where
> you're located.
> 
>   next, "cd" down to that dts directory and try the same command
> again:
> 
>   $ cd arch/arm/boot/dts
>   $ dtx_diff imx6q{,p}-sabresd.dts
> 
> not surprisingly, it fails:
> 
> In file included from imx6qp.dtsi:43:0,
>                  from imx6qp-sabresd.dts:45:
> imx6q.dtsi:11:50: error: no include path in which to search for dt-bindings/interrupt-controller/irq.h
>  #include <dt-bindings/interrupt-controller/irq.h>
> 
>   but either of the following two variations works just fine, since
> you're identifying the location of the source tree git repo (that you
> just happen to be inside of):
> 
>   $ dtx_diff -S imx6q{,p}-sabresd.dts
>   $ dtx_diff -s ~/k/git imx6q{,p}-sabresd.dts
> 
> however, if i copy those two files to /tmp and try the comparison
> there, even if i identify the same kernel source directory:
> 
>   $ cp imx6q{,p}-sabresd.dts /tmp
>   $ cd /tmp
>   $ dtx_diff -s ~/k/git imx6q{,p}-sabresd.dts
> 
> ruh roh ...
> 
> imx6qp-sabresd.dts:45:10: fatal error: imx6qp.dtsi: No such file or
> directory
>  #include "imx6qp.dtsi"
>           ^~~~~~~~~~~~~

Since the include file is specified in quotes ("...") instead of
brackets (<...>) cpp is looking in the same directory as the .dts
file to find the .dtsi file.

If you copy all such files to /tmp/ then the dtx_diff will work.

For linux 4.20-rc3, the list of other files needed in tmp/ is:

$ ls -1
imx6q-pinfunc.h
imx6q-sabresd.dts
imx6q.dtsi
imx6qdl.dtsi
imx6qp-sabresd.dts
imx6qp.dtsi

-Frank


> compilation terminated.
> imx6q-sabresd.dts:15:10: fatal error: imx6q.dtsi: No such file or
> directory
>  #include "imx6q.dtsi"
>           ^~~~~~~~~~~~
> compilation terminated.
> 
>   obviously(?), the cpp include path is not being set correctly, but
> why not? i'm checking the dtx_diff script right now to see what's
> going into cpp_flags, but should this not work? should i not be
> allowed to compare two .dts files outside the boundaries of a kernel
> source tree as long as i provide a perfectly kernel source tree for it
> to use? or does one need to manually configure the header file search
> path for this?
> 
> rday
> 
