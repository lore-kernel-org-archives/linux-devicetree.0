Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68530C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:45:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4158B2075E
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s1FkhIfG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440865AbgDNPpe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 11:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2440812AbgDNPpb (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 11:45:31 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CA0C061A0C;
        Tue, 14 Apr 2020 08:45:30 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id a201so14167180wme.1;
        Tue, 14 Apr 2020 08:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Gjm3uAUeCbXIQTpKJuiYkVHGy2qmHJFqIvVfFVksQhg=;
        b=s1FkhIfG5/3hC9a0hKtFOz/0OHQ6L29lkb6rt38sxV2dTkPAdPfKUTJ74ZWBPrvsvi
         /xUCM29na0w0Qe1eCcf/89+CH+laP1gx1p/DqNcjMHT9kfcyyqXuG6aJovMuDSjAPNaW
         ZcwLQezJJvXBqyU2VnEAWvmFUR/Ub+r671RRHMfhspBEOHGes74S0a2odQ8X8W0TsEUn
         Sq4oPuAsN4Mme+LmGbARMbTwfgZYGJ6d+vzEHD0XiCaYsI8ZQGYTXCl1aZhPVU+Sd7hS
         oz7sxvW1obbkHWbMPNeBl/c5qAkJHetvCRvHJlG2ZoFDzdkI54PEaCcnGl2xpQVZ8cBo
         +/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Gjm3uAUeCbXIQTpKJuiYkVHGy2qmHJFqIvVfFVksQhg=;
        b=nYqFsEa4krxePvdzGUOkjdNYKdc6jwnndKmSwnvXDydbZtNx4Ssh335+5Q9cVdqYNk
         vtFRUFlHo3tDlQ34kNg40s9SUzn1USNPDl3SQ4F/JhEAtNqdH1SuvhJxtimrVy2Li+tp
         4adAmYZvxo3wOgNt68Qk3K73MIjwPPKRbRxuslkA08W48bAwwUMhewiyMREeZDxmyn2X
         28N5rrL4B8A08QHiuLIFtXY42+mSarS4hY9EZYzVBgiLlwFjOudCTWeztigoBsRLTPo8
         eqfXxJUbr3rZL4wtxSDj5FmoypHZK9vQ77OZLCd9tdjQBy6YmlfNvNcT7DMKvN3BnBl4
         ah3A==
X-Gm-Message-State: AGi0PuZoBizY8th8eViOI2NTGo7B1OiwykR1VoA1Q7fwqvLjmiGAmNsp
        NYEI9mgM6Z1FOVe/0t9yeQM=
X-Google-Smtp-Source: APiQypITBM2YX0drnVz147XZSIJao5kLHykEDecW3MC5k980NBs6/BB+fNlFc9K8cUNmPB6Co63PEA==
X-Received: by 2002:a05:600c:2210:: with SMTP id z16mr468382wml.151.1586879129691;
        Tue, 14 Apr 2020 08:45:29 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id 17sm16027111wmo.2.2020.04.14.08.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 08:45:27 -0700 (PDT)
Date:   Tue, 14 Apr 2020 17:45:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 10/14] memory: tegra: Add EMC scaling sequence code
 for Tegra210
Message-ID: <20200414154526.GP3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-11-thierry.reding@gmail.com>
 <682c661d-ea3a-7b9a-42f0-d5473b969aa2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7gQyIpR7q4QSXYu+"
Content-Disposition: inline
In-Reply-To: <682c661d-ea3a-7b9a-42f0-d5473b969aa2@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--7gQyIpR7q4QSXYu+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 05:18:51PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +static void tegra210_emc_r21021_set_clock(struct tegra210_emc *emc, u3=
2 clksrc)
> > +{
> > +	/*
> > +	 * This is the timing table for the source frequency. It does _not_
> > +	 * necessarily correspond to the actual timing values in the EMC at t=
he
> > +	 * moment. If the boot BCT differs from the table then this can happe=
n.
> > +	 * However, we need it for accessing the dram_timings (which are not
> > +	 * really registers) array for the current frequency.
> > +	 */
> > +	u32 tmp, cya_allow_ref_cc =3D 0, ref_b4_sref_en =3D 0, cya_issue_pc_r=
ef =3D 0;
> > +	struct tegra210_emc_timing *fake, *last =3D emc->last, *next =3D emc-=
>next;
> > +	u32 bg_regulator_switch_complete_wait_clks, bg_regulator_mode_change;
> > +	u32 opt_zcal_en_cc, opt_do_sw_qrst =3D 1, opt_dvfs_mode, opt_dll_mode;
> > +	u32 emc_zcal_wait_cnt_old, emc_zcal_wait_cnt_new, emc_dbg_active;
> > +	u32 opt_cc_short_zcal =3D 1, opt_short_zcal =3D 1, opt_war_200024907;
> > +	u32 tRTM, RP_war, R2P_war, TRPab_war, deltaTWATM, W2P_war, tRPST;
> > +	u32 adel =3D 0, compensate_trimmer_applicable =3D 0, mrw_req, value;
> > +	unsigned long next_timing_rate_mhz =3D next->rate / 1000, delay;
> > +	u32 tZQCAL_lpddr4 =3D 1000000, zq_wait_long, shared_zq_resistor;
> > +	s32 zq_latch_dvfs_wait_time, tZQCAL_lpddr4_fc_adj, nRTP;
> > +	u32 tFC_lpddr4 =3D 1000 * next->dram_timings[T_FC_LPDDR4];
> > +	u32 emc_auto_cal_config, auto_cal_en, mr13_catr_enable;
> > +	u32 zq_op, zcal_wait_time_clocks, zcal_wait_time_ps;
> > +	u32 emc_cfg, emc_sel_dpd_ctrl, emc_zcal_interval;
> > +	int next_push, next_dq_e_ivref, next_dqs_e_ivref;
> > +	u32 mr13_flip_fspwr, mr13_flip_fspop, is_lpddr3;
> > +	u32 enable_bglp_regulator, enable_bg_regulator;
> > +	u32 emc_dbg_o, emc_cfg_pipe_clk_o, emc_pin_o;
> > +	u32 ramp_up_wait =3D 0, ramp_down_wait =3D 0;
> > +	u32 save_restore_clkstop_pd =3D 1, dll_out;
> > +	u32 ref_delay_mult, ref_delay, dram_type;
> > +	static u32 fsp_for_next_freq;
> > +	/* In picoseconds. */
> > +	u32 source_clock_period, destination_clock_period;
> > +	u32 zqcal_before_cc_cutoff =3D 2400;
> > +	unsigned int i;
>=20
> What about to try to replace this massive egyptian construction with a
> single "u32 val;" ?

I actually tried that after condensing what this used to look like into
the above. The result was a huge failure because some of these temporary
values end up being reused, so I ended up writing bogus values into some
of these registers.

> > +	emc_readl(emc, EMC_CFG);
> > +	emc_auto_cal_config =3D emc_readl(emc, EMC_AUTO_CAL_CONFIG);
>=20
> And remove all the "dummy" variable assigns in the code?
>=20
> ...
> > emc_auto_cal_config =3D next->emc_auto_cal_config;
> ...> +	emc_zcal_interval =3D 0;
>=20
> And replace all "constant" variables with a raw value in place in the cod=
e?

Okay, I'll give this another try, hopefully this time I won't run into
the same problems as earlier.

Thierry

--7gQyIpR7q4QSXYu+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V2pYACgkQ3SOs138+
s6H0UBAAicSH5/f0DWGQgc7Jq0cl6eGEEK6JDuBnYiKwWIxZ9GhuhWYJyO2DCU22
CUz6FzX8kl5QH7FKz+8bnVqv8gryZGCbzZIFitBr/8WJPt+xiioxvY/X0DUyMxlf
rKsAfEj4ohLqCL8kA9IoM3Xt/6QJdJYg6ei5ETZrymHuO8SXlpC2BppqTkFYpwb0
DmNz6k72A2Jqx2i2a7si/rspGcA+Zkt2OsU4qJT3Eb7K2GBRXAPT3bR8x8AfvfHc
Pxvb3TcnXFuy6ng4dCWBYO/E8Bqn1dE35qqrDUL3yxnuVsxPS9tEOAaCqjytqcJ9
MIo8tAkX+MkZRQbAuJU2l/0f1dw9Ti5etb94f+zvAWqVEkCaFUTiZt+U2A1Jj7wN
JTtQq8t+kSZvTA4t0T83fBwmLkthzmACPANIq2kimRtOXVFKdTEvqhDc1MZmjYAp
3ZX0MZFwYOLinugnrHbDs1GUkBHFuOgBNdimFJ5OdFhZqwgK5GsvJDW8VebA0xfq
CLeyUPHRdi28SuGOistvHoap/82tTqDGRosby1PoFaq4ATOh6VfM3KmpEQkVCARO
REVlom7uSxvj1XopyGWdX34UAUrRsmsomVx1CGKnNPdZY+ERClX7t34z4sB4JdrA
cIiUFJKdcgdmYOfWhYE6BVjalTfYsWfXpAVsr/EQjPDvUAXdY6c=
=HUS/
-----END PGP SIGNATURE-----

--7gQyIpR7q4QSXYu+--
