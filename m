Return-Path: <SRS0=YnW7=6Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16FEC3A5A9
	for <linux-devicetree@archiver.kernel.org>; Sat,  2 May 2020 17:57:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B55FB20775
	for <linux-devicetree@archiver.kernel.org>; Sat,  2 May 2020 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588442258;
	bh=mTuWCZAa2eGiBuWewJoSG7xCGCFn67pzWVcKgwM5pu8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=gXOI3rpB/wW91T+CXVooziFJi0qD4X2aG/KsHiBOHnUANg8bpG65MRKXgeVPpGzZ7
	 VwhwKdWQq+S31W3Q0bX93HeCHJhVZOIdpYBf52/nh60rkaLH6fZ5nxXIzoq06sE4hO
	 Uh3B0bLpY2FiGiD69CxmATg4nnaFj61I2G2ba/qM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgEBR5i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 2 May 2020 13:57:38 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:51202 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbgEBR5h (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 2 May 2020 13:57:37 -0400
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 042HvJ33003029
        for <devicetree@vger.kernel.org>; Sun, 3 May 2020 02:57:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 042HvJ33003029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588442240;
        bh=z5Quhr9h5cgi3WU7T9t6VC7H4V9c6k9XrytbSp1zItw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=H4Iqg81cFuNYfmBlBP+G4/pOlD4E9IRFcboA1J9tjOnH+PJSECYpd98/kZyuFoObf
         Qu/onxN1K4ZQxGHAWuc03utmxF2+ToPS7vkgBkRjquLAUIQBDfRfOmRSz6UIhBfm37
         9mpgikggaSiAsgH+YoblVeipZIbRc71gpjmsZ9ardXopfZAiKS85MSyzJ7FKjnKm/7
         Jp4h6rt8QA43mw1lAqCkLmSxHoZ0ckMBqckPY9c8KAje0XGwFDS/boEoex13b/5S0d
         yNHdYq+atTgbu+lZSTr0wQmUgIWwRHA9X2eqrU/zVNoVSkPuZI1mjjNDG2/NKFeYR3
         XE3q+oaHbuQSg==
X-Nifty-SrcIP: [209.85.221.170]
Received: by mail-vk1-f170.google.com with SMTP id 10so3525223vkr.7
        for <devicetree@vger.kernel.org>; Sat, 02 May 2020 10:57:19 -0700 (PDT)
X-Gm-Message-State: AGi0PuauaaaidI8ekVCq8j23XIGJubvkvKOEnhQztzKN/K3fP7uAp/vh
        jMzAScgWLuVHH4C0+pC2o8fC4MOae5xlds1/xpM=
X-Google-Smtp-Source: APiQypKYomKVcO4OH0pwqpuHcrwy9KnP3Q7rDIxM8ngj0npthNn5/wueWOrkFUHAATW5oU3Mx8fued+olOvIhf2k/dY=
X-Received: by 2002:a1f:2a13:: with SMTP id q19mr6215391vkq.73.1588442238317;
 Sat, 02 May 2020 10:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200501015147.32391-1-marek.behun@nic.cz> <CAK7LNARhK08CcDNij25PR0_r2A27Qx+psQp50_AgDJijexDAiA@mail.gmail.com>
 <20200501170816.2f95a2ad@nic.cz>
In-Reply-To: <20200501170816.2f95a2ad@nic.cz>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 3 May 2020 02:56:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNARo7tErhQzxsOktwrrBcu+W5Wz4VqadrcyiTRHeL6-F4w@mail.gmail.com>
Message-ID: <CAK7LNARo7tErhQzxsOktwrrBcu+W5Wz4VqadrcyiTRHeL6-F4w@mail.gmail.com>
Subject: Re: [PATCH] dtc: Use better check for libyaml
To:     Marek Behun <marek.behun@nic.cz>
Cc:     DTML <devicetree@vger.kernel.org>,
        Pavel Modilaynen <pavel.modilaynen@axis.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, May 2, 2020 at 12:08 AM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Fri, 1 May 2020 14:27:57 +0900
> Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > Is it possible to fix the .pc file instead?
> >
> > This is ugly, and I do not know what is the
> > point of pkg-config if it cannot detect the pkg correctly.
>
> I know this is ugly, though no more than some code in
> scripts/Makefile.build.


You missed to see the cost of parsing the Makefile.


scripts/dtc/Makefile is parsed every time
you run 'make'.

Even if you have nothing to recompile,
it builds the tiny program in background.

This happens for 'make mrproper' too.


>
> What do you mean fixing the pc file?


Maybe, file a bug report to your distribution
if the pc file is strangely installed?


> When the header is not present because libyaml-dev is not installed,
> but the library is present, then pkg-config just reports that the
> package exists, when asking with --exists, right?


So, on your system, yaml-0.1.pc exists even
if libyaml-dev is not installed.
In which situation does this happen?


The concept of pkg-config is to help
to build software that depends on other packages.

Obviously, pkg-config should take care of the headers
because pkg-config supports --cflags option.


It is weird to install the .pc file
when it is not possible to build the software
that depends on it.

In other words, the .pc file should be installed
by the dev package together with the headers,
libraries, and any other components needed to
compile the software that depends on it.


At least, this is true for Ubuntu.


The non-dev package installs only runtime libraries.

The dev package installs the .pc file and
all the components needed to build the program.



$ apt-file list libyaml-0-2
libyaml-0-2: /usr/lib/x86_64-linux-gnu/libyaml-0.so.2
libyaml-0-2: /usr/lib/x86_64-linux-gnu/libyaml-0.so.2.0.5
libyaml-0-2: /usr/share/doc/libyaml-0-2/changelog.Debian.gz
libyaml-0-2: /usr/share/doc/libyaml-0-2/copyright


$ apt-file list libyaml-dev
libyaml-dev: /usr/include/yaml.h
libyaml-dev: /usr/lib/x86_64-linux-gnu/libyaml.a
libyaml-dev: /usr/lib/x86_64-linux-gnu/libyaml.so
libyaml-dev: /usr/lib/x86_64-linux-gnu/pkgconfig/yaml-0.1.pc
libyaml-dev: /usr/share/doc/libyaml-dev/changelog.Debian.gz
libyaml-dev: /usr/share/doc/libyaml-dev/copyright



'make menuconfig' checks the ncurses dev package.

The same for libncurses5 vs libncurses5-dev.


$ apt-file list libncurses5
libncurses5: /lib/x86_64-linux-gnu/libncurses.so.5
libncurses5: /lib/x86_64-linux-gnu/libncurses.so.5.9
libncurses5: /usr/lib/x86_64-linux-gnu/libform.so.5
libncurses5: /usr/lib/x86_64-linux-gnu/libform.so.5.9
libncurses5: /usr/lib/x86_64-linux-gnu/libmenu.so.5
libncurses5: /usr/lib/x86_64-linux-gnu/libmenu.so.5.9
libncurses5: /usr/lib/x86_64-linux-gnu/libpanel.so.5
libncurses5: /usr/lib/x86_64-linux-gnu/libpanel.so.5.9


$ apt-file list libncurses5-dev
libncurses5-dev: /usr/bin/ncurses5-config
libncurses5-dev: /usr/include/curses.h
libncurses5-dev: /usr/include/cursesapp.h
libncurses5-dev: /usr/include/cursesf.h
libncurses5-dev: /usr/include/cursesm.h
libncurses5-dev: /usr/include/cursesp.h
libncurses5-dev: /usr/include/cursesw.h
libncurses5-dev: /usr/include/cursslk.h
libncurses5-dev: /usr/include/eti.h
libncurses5-dev: /usr/include/etip.h
libncurses5-dev: /usr/include/form.h
libncurses5-dev: /usr/include/menu.h
libncurses5-dev: /usr/include/nc_tparm.h
libncurses5-dev: /usr/include/ncurses.h
libncurses5-dev: /usr/include/ncurses_dll.h
libncurses5-dev: /usr/include/panel.h
libncurses5-dev: /usr/include/term.h
libncurses5-dev: /usr/include/term_entry.h
libncurses5-dev: /usr/include/termcap.h
libncurses5-dev: /usr/include/tic.h
libncurses5-dev: /usr/include/unctrl.h
libncurses5-dev: /usr/lib/x86_64-linux-gnu/libcurses.a
libncurses5-dev: /usr/lib/x86_64-linux-gnu/libcurses.so
libncurses5-dev: /usr/lib/x86_64-linux-gnu/libform.a
libncurses5-dev: /usr/lib/x86_64-linux-gnu/libform.so
libncurses5-dev: /usr/lib/x86_64-linux-gnu/libmenu.a
libncurses5-dev: /usr/lib/x86_64-linux-gnu/libmenu.so
libncurses5-dev: /usr/lib/x86_64-linux-gnu/libncurses++.a
libncurses5-dev: /usr/lib/x86_64-linux-gnu/libncurses.a
libncurses5-dev: /usr/lib/x86_64-linux-gnu/libncurses.so
libncurses5-dev: /usr/lib/x86_64-linux-gnu/libpanel.a
libncurses5-dev: /usr/lib/x86_64-linux-gnu/libpanel.so
libncurses5-dev: /usr/lib/x86_64-linux-gnu/pkgconfig/form.pc
libncurses5-dev: /usr/lib/x86_64-linux-gnu/pkgconfig/menu.pc
libncurses5-dev: /usr/lib/x86_64-linux-gnu/pkgconfig/ncurses++.pc
libncurses5-dev: /usr/lib/x86_64-linux-gnu/pkgconfig/ncurses.pc
libncurses5-dev: /usr/lib/x86_64-linux-gnu/pkgconfig/panel.pc
libncurses5-dev: /usr/share/doc/libncurses5-dev
libncurses5-dev: /usr/share/man/man1/ncurses5-config.1.gz



>
> Marek
>


-- 
Best Regards
Masahiro Yamada
