Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAC4C352BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 17:10:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF7242078A
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 17:10:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKeaJsx/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391235AbgDNRK2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 13:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732059AbgDNRK0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 13:10:26 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD2AC061A0C;
        Tue, 14 Apr 2020 10:10:26 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o81so8260041wmo.2;
        Tue, 14 Apr 2020 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bu1W45bcgQFVSHHvrZnu1OhprTvQ/cBAqXoUBxCGTks=;
        b=JKeaJsx/IVZ0S/IqlJRc6hZ/M5bhRIbOkZXhcYLqG96PL7JNdXqqM6J7cmtwsfJUjz
         2m3rgZAtofnVHEErj8K9XEzwJaavr9k/lh+oTZuUXb5WrMsNaMC00vCA4lPuhwP4vCem
         yvdbXE3Zk5iHyH9tRgyBV+tE34mmXpJ7LMjNDWlggVq27f4X7QrQzBAFMU8M3HAZ9Ehf
         u6KKtlH3pSE27PlfOZf4j9uGZN1G8VHjKdiHfDG0S9jEg/qKzgdwK04yBtV8OkWcn2FS
         oDQxLtjWyyK414Qpu6JrxM9sbYv2UqTVsnSHye5LFKmnl0KqoQbkpbFrsxJVXIViQ0vO
         6yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bu1W45bcgQFVSHHvrZnu1OhprTvQ/cBAqXoUBxCGTks=;
        b=KAt5zM8do1UI/B5pNaL4qwhp5qqsZEf7WSSop0ai6ekAS+M9X3EytwNLCLW5lbekqv
         t2V0AfoDApUqA9UewgLH6upRWdupaRvLmhSaUtcMKPmxgDQwkBK3R/wiZsBDXpvhdI2j
         k0VZGEFPLAY3ldNXYoiEZSRbOnM1XGGmnxTg0JcBqBYrJPANgdI0slrAQJ6vsKLx0yfg
         wxEj+a+j6CijozHHwK1NiFMksG6o0ZnIExRMOa19uffvCwNHpjelj/91AmSDzdJAa99j
         ZPR7VC1/oELFBK3XgGehA2wHTeWino2USOHpsSaAGsgrYFfLp+ALdWxLhEM7k2iTgmHN
         Mckw==
X-Gm-Message-State: AGi0PuaKXbqNILfWC+bE39L8lrxYzZYJqzuou1LNDerQ+9Ti1x3YBcOm
        WxDD0BDXfXUYQ2RBl6TWUsU=
X-Google-Smtp-Source: APiQypI+KQxMP3i3+MDgFxrK5E1p7XsqlGmODv79VinHxIAjnqkas/fyHZzHEec9cQybaQtmap7HBw==
X-Received: by 2002:a1c:9aca:: with SMTP id c193mr805632wme.38.1586884212134;
        Tue, 14 Apr 2020 10:10:12 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id o28sm5240239wra.84.2020.04.14.10.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 10:10:10 -0700 (PDT)
Date:   Tue, 14 Apr 2020 19:10:10 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 07/14] clk: tegra: Implement Tegra210 EMC clock
Message-ID: <20200414171010.GB15932@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-8-thierry.reding@gmail.com>
 <8dc000fb-8867-cf8f-8204-a9e1e79a4811@gmail.com>
 <20200414143424.GG3593749@ulmo>
 <92eb73ba-73e4-f9f1-bb22-9b515e32cee6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline
In-Reply-To: <92eb73ba-73e4-f9f1-bb22-9b515e32cee6@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 06:18:29PM +0300, Dmitry Osipenko wrote:
> 14.04.2020 17:34, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Apr 09, 2020 at 09:24:31PM +0300, Dmitry Osipenko wrote:
> >> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> ...
> >>> +static long tegra210_clk_emc_round_rate(struct clk_hw *hw, unsigned =
long rate,
> >>> +					unsigned long *prate)
> >>> +{
> >>> +	struct tegra210_clk_emc *emc =3D to_tegra210_clk_emc(hw);
> >>> +	struct tegra210_clk_emc_provider *provider =3D emc->provider;
> >>> +	unsigned int i;
> >>> +
> >>> +	if (!provider || !provider->configs || provider->num_configs =3D=3D=
 0)
> >>> +		return clk_hw_get_rate(hw);
> >>
> >> This still looks wrong to me. Nobody should be able to get EMC clock
> >> until provider is registered.
> >=20
> > The EMC clock is mostly orthogonal to the provider. The provider really
> > only allows you to actually change the frequency. The clock will still
> > remain even if the provider goes away, it just will loose the ability to
> > change rate.
>=20
> It's not only about changing the clock rate, but also about rounding the
> rate and etc.

The code will currently just return the configured rate when no provider
is available. It's going to always round to that one rate and it will
refuse to set another one. The EMC clock is basically going to function
as a fixed clock while no provider is attached.

> Besides, you won't be able to change the rate until provider is
> registered, which might be a quite big problem by itself.

Until the provider is registered, there's just no way to change the
rate. You always need to write MC and EMC registers in order to change
the rate, so trying to change it when the MC/EMC drivers aren't
available isn't going to work.

> >> This is troublesome, especially given that you're allowing the EMC
> >> driver to be compiled as a loadable module. For example, this won't wo=
rk
> >> with the current ACTMON driver because it builds OPP table based on the
> >> clk-rate rounding during the driver's probe, so it won't be able to do
> >> it properly if provider is "temporarily" missing.
> >>
> >> ... I think that in a longer run we should stop manually building the
> >> ACTMON's OPP table and instead define a proper OPP table (per-HW Speedo
> >> ID, with voltages) in a device-tree. But this is just a vague plans for
> >> the future for now.
> >=20
> > This code only applies to Tegra210 and we don't currently support ACTMON
> > on Tegra210. I'm also not sure we'll ever do because using interconnects
> > to describe paths to system memory and then using ICC requests for each
> > driver to submit memory bandwidth requests seems like a better way of
> > dealing with this problem than using ACTMON to monitor activity because
> > that only allows you to react, whereas we really want to be able to
> > allocate memory bandwidth upfront.
>=20
> You absolutely have to have the ACTMON support if you want to provide a
> good user experience because interconnect won't take into account the
> dynamic CPU memory traffic. Without ACTMON support CPU will turn into a
> "turtle" if memory runs on a lowest freq, while CPU needs the highest.

Can we not guess a bandwidth based on the CPU frequency? Yes, that's
perhaps going to be an overestimation if the CPU doesn't actually access
memory, but that's better than nothing at all.

Also, at this point I'm less worried about power consumption rather than
making Tegra210 devices perform useful tasks. Yes, eventually we'll want
to fine-tune power consumption, but it's going to take a bit of work to
get there. In the meantime, giving people a way to set an EMC frequency
other than that set on boot is going to make them very happy.

> Secondly, the interconnect could underestimate the memory BW requirement
> because memory performance depends quite a lot on the memory-accessing
> patterns and it's not possible to predict it properly. Otherwise you may
> need to always overestimate the BW, which perhaps is not what anyone
> would really want to have.

Overestimating might be a good starting point, though. At this point I'm
mostly concerned about being able to change the memory frequency at all
because many systems are mostly unusable at the boot EMC frequency.

Like I said, if ACTMON really does prove to be useful I'm all for adding
support on Tegra210, but I don't think trying to do everything all at
once is a very good plan. So I'm trying to get there in incremental
steps.

> I'm not sure why you're resisting to do it all properly from the start,
> it looks to me that it will take you just a few lines of code (like in a
> case of the T20/30 EMC).

I'm not trying to resist anything. I'm just saying that all of the
issues that you're bringing up aren't an immediate concern.

My main concerns right now are to: a) allow people to change the EMC
frequency (and hopefully soon also allow the EMC frequency to be changed
based on bandwidth demands by memory client drivers) and b) not bloat
the kernel more than it has to (while my configuration isn't tweaked,
it's pretty standard and the resulting image is roughly 20 MiB; adding
the Tegra210 EMC driver adds another 64 KiB).

And if we really do want to add ACTMON support later on, you already
suggested a better way of moving forward, so it sounds to me like that
would be a nice incremental improvement, certainly much better than
bloating the kernel even further by requiring this to be built-in and
preventing it from being unloaded.

Thierry

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V7m4ACgkQ3SOs138+
s6Em4w/9FNIpaqlBNPaffejDRoFi8gSCtTpS700LImB1P8xffbHSrrAGNzhnUN6h
NK9mJp5ZtIxNawa+OgVyTqLMBvEhLnlbqNXypj2v0KjMEnWldZNO0i6kZ0B74WDx
j3LHJyhnap8VZYdxGafGCn3mx91XRfmfkXpt/RXR4AFhBCh+tS6MLXm9oKYVElRq
vydnkirSA55jAZaLObaTfji9z+UdkjQQOXr8D49Ef4qfFPXTSCfCLGrrNCBV8RMb
AjbIRCNPsJ0JMb99wEc/3iR82MkLFOqQZ/W76iYFpKZjqzOgePoENndse6VFa710
E4lZ1iG/Mu+FT38tKDFpgfScTTJq8sGLdgPbCbIjDl2ltlX+JoM8qCuEvSrAQq9i
P1BTYXS7LR5n74BqMSB+s1TS9/KvDOe0rZb91JmrpSPrNZJsN0NKCZwJXrdftAQu
RL7HombQdmrSdmv9fqLK7JdDOaWr0K/2PyuUyX0Zd6SsdxtvpW6hZKye+Ca05QCe
N3lcZnJVAlSGGF/wcp6NkY1lXr9AtqTyJoXpHra0yu1QyCTZgqK0ZPJdVC4ot7/N
SOx0/tp2tWaMJr5xVud7JeUnrM5wgIMK09bOkE9Dsh3DM52EB5s2DgeE7cLCzuzL
JH0FgfsIyx9Fb+fwUnJmLoRvA/1uadd6LOZErg8nqtZyvFksA/M=
=XN3P
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
