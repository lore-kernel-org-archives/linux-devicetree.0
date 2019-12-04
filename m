Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A463C2BC73
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 09:47:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C49E207DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 09:47:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pll/orGq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfLDJrx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 04:47:53 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41943 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbfLDJrx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 04:47:53 -0500
Received: by mail-wr1-f65.google.com with SMTP id c9so1283518wrw.8
        for <devicetree@vger.kernel.org>; Wed, 04 Dec 2019 01:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=nUdWcCxekLeFMDxvcujgfAEAbAWtlApWfV7PYiJfUJk=;
        b=Pll/orGq1IfyiAKUYWN6G2acirexQXuI5LIS2uQT6IlXhuW8X1vz7/Dn/gHgOaS6NK
         huaal0U4LwwRJzu70M7avAlqcfECyJUbP1xzsLbqhYHE0pKKVNaq4/zdJu73r1du0TQB
         wo3uf0zJeN/w6NoZllZo7EVKSUp6LF7rvA4LYxbI5OLKGKGj7ROn3ouPxZCoF44rQcnP
         0DtrZcw2+HTiqtkMO2Wpt+73mtY1d1sft0pCcLOZJc6ASQIv3irB2MWFPBQGYpjHTgzW
         rsDl+R3SFhTbvxla4nZmr0hE5i8K3OnD64QoKnxoC4rHv2dsNH3uIfNnldO8X6BWS4TP
         cYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=nUdWcCxekLeFMDxvcujgfAEAbAWtlApWfV7PYiJfUJk=;
        b=S3X3k2VtY/rnhQ1gm0Tihav8YLn3bCe62XRYA1wZEqdeRpS/cAm7x55hCnWTo6LY5w
         YM0Q4CaapicLhY2vh8Kfbnxuq4eFy4nGzCGg8YDuXpGmvwe0mxhYwBepxskhn6UIKDee
         Nuj0gHmr/6wPLgv0F29CY29JVDfVm50J2tJqgnQoix4NTkzJMo9MBwMgi5P+CKfMzXlw
         QONTG9VdO860ELwYtt/tKjwDPB6HCxDMsdQTPCAflUA918WoIMndqPJ8M56HP/hPTPHe
         JikxlWQO/P5V0v9HyTO5k4Bl4d2Tl346fUcvDjyb+HDyAHK1dEFfANAsd7ZqffvjTH86
         aDPw==
X-Gm-Message-State: APjAAAX8qh9y1WstdWM02VoSsrwhkFDhYbCE54N9HaZrALU97kYaQhrW
        Dzs9PoWUevCVz87e/I+YWzW8vw==
X-Google-Smtp-Source: APXvYqweyVggL0J5SQNi6hKbn22bvo4CUaUJ5obDRItJYXjMPgmMB/E2hFto2npEuG1XdZ4eBodgyA==
X-Received: by 2002:a5d:640d:: with SMTP id z13mr2913510wru.181.1575452870670;
        Wed, 04 Dec 2019 01:47:50 -0800 (PST)
Received: from dell ([2.27.167.28])
        by smtp.gmail.com with ESMTPSA id 60sm8178016wrn.86.2019.12.04.01.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 01:47:50 -0800 (PST)
Date:   Wed, 4 Dec 2019 09:47:41 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Chris Brandt <Chris.Brandt@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/6] ARM: dts: r7s72100: Add SPIBSC clocks
Message-ID: <20191204094741.GC3468@dell>
References: <20191203034519.5640-1-chris.brandt@renesas.com>
 <20191203034519.5640-3-chris.brandt@renesas.com>
 <CAMuHMdXUVdG_PMQEpz=QWLCaabfK8Mc41zFiymXJ4Rx_C2gzdg@mail.gmail.com>
 <TY1PR01MB1562F44E4FB80788922CE9BE8A420@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdX_sD+UHnOF+bdbT99zfK1V92+1kVzGnb9JXJyBd-Y5-w@mail.gmail.com>
 <20191204083821.GA3468@dell>
 <CAMuHMdXC+=2nH51ASu0u3WUchjM5bC_bROgcYM-OrsM7OgZpbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXC+=2nH51ASu0u3WUchjM5bC_bROgcYM-OrsM7OgZpbg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 04 Dec 2019, Geert Uytterhoeven wrote:

> Hi Lee,
> 
> On Wed, Dec 4, 2019 at 9:38 AM Lee Jones <lee.jones@linaro.org> wrote:
> > On Tue, 03 Dec 2019, Geert Uytterhoeven wrote:
> > > On Tue, Dec 3, 2019 at 7:58 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> > > > On Tue, Dec 3, 2019, Geert Uytterhoeven wrote:
> > > > > > +                       reg = <0x3fefa000 0x100>, <0x18000000
> > > > > > + 0x4000000>;
> > > > >
> > > > > The second region conflicts with the XIP flash@18000000 in
> > > > > arch/arm/boot/dts/r7s72100-gr-peach.dts.
> > > > > Yes, I know it is the same device ;-)
> > > >
> > > > Is that just an FYI?? Or do you have some suggestion??
> > >
> > > Can the flash subnode be compatible with "mtd-rom", even if the parent node
> > > is kept disabled?
> > >
> > > > > > +                       clock-critical = <4>; /* spibsc0 */
> > > > >
> > > > > Iff we go this clock-critical route, I think this should be specified in the
> > > > > board-specific .dts instead of in the SoC-specific .dtsi.
> > > >
> > > > OK, that's fine. It makes more sense to be in the .dts because it's a board
> > > > design decision. I will remove it from the patch.
> > > >
> > > > The one 'tricky' thing is that the <4> is the index into the number of clocks.
> > > >
> > > > So in the Renesas BSP where it includes the VDC5 LCD controllers,
> > > >
> > > > clock-output-names = "i2c0", "i2c1", "i2c2", "i2c3", "vdc50", "vdc51", "spibsc0", "spibsc1";
> > > >
> > > > the <4> needs to become a <6>.
> > >
> > > Unless you pass "clkidx" instead of "i" to of_clk_detect_critical() in [1],
> > > and use "clock-critical = <R7S72100_CLK_SPIBSC0>" in DT?
> > >
> > > Unfortunately the exact semantics of clock-critical were never documented.
> > > Lee?
> >
> > /**
> >  * of_clk_detect_critical() - set CLK_IS_CRITICAL flag from Device Tree
> >  * @np: Device node pointer associated with clock provider
> >  * @index: clock index
> >  * @flags: pointer to top-level framework flags
> >  *
> >  * Detects if the clock-critical property exists and, if so, sets the
> >  * corresponding CLK_IS_CRITICAL flag.
> >  *
> >  * Do not use this function. It exists only for legacy Device Tree
> >  * bindings, such as the one-clock-per-node style that are outdated.
> >  * Those bindings typically put all clock data into .dts and the Linux
> >  * driver has no clock data, thus making it impossible to set this flag
> >  * correctly from the driver. Only those drivers may call
> >  * of_clk_detect_critical from their setup functions.
> >  *
> >  * Return: error code or zero on success
> >  */
> >
> > If this meets the criteria, the API is pretty simple/self
> > explanatory.  What are you having trouble with?
> 
> What exactly is the "index" parameter?  This value is matched against
> the values of the "clock-critical" (array) property, but it is described
> nowhere in the DT bindings.
> stih407-clock.dtsi seems to assume this value is an index into the
> clock-output-names array?
> Can we use it as a value of "clock-indices" instead?

of_clk_detect_critical(), the consumer of the device tree property
'clock-critical', is a helper.  Neither deliver any auto-magical
functionality.  Simply providing an index into the property will not
do anything useful.  It's up to the vendor's clock driver to handle.

The vendor driver can call of_clk_detect_critical() with *any* index
it sees fit.  If it matches a number listed in the 'clock-critical'
array, the CLK_IS_CRITICAL flag is set in the flags pointed to by the
3rd function parameter.

Take a look at some of the call sites in drivers/clk/st/* for further
clarification.

> > > Thanks!
> > >
> > > [1] "[PATCH 1/6] clk: renesas: mstp: Add critical clock from device
> > > tree support"
> > >     https://lore.kernel.org/linux-renesas-soc/20191203034519.5640-2-chris.brandt@renesas.com/
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
