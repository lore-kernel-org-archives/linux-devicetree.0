Return-Path: <SRS0=Z42x=52=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3FEC2BB86
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 14:18:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 359B92082D
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 14:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzrJ1G+g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgDJOS4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Apr 2020 10:18:56 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36322 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbgDJOS4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Apr 2020 10:18:56 -0400
Received: by mail-lj1-f193.google.com with SMTP id n23so2108551ljg.3;
        Fri, 10 Apr 2020 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=csrvl1c+O62QiY1i5I2vPcapPdMbP20Dc619rzOjrHg=;
        b=PzrJ1G+gJpRmx0ywjb/789Cgg1GrSezUTE0/LfFzYMCsmYLNAHM3H+oGpUNICrgdXZ
         aXDTfyc0dgSMHiUT0s17XtuLyqQ06SYP5mE6aS8fnmTyIBM60Bg/jOLf7F6dna5NMsMR
         8n0Day9czPDgppvmia1qnyEtX0wPI2TIOWRzxq3STR0XS15woWHGVFLhBq8allCjGoKF
         ZQIpbIK2AkLA8IK/svBpH3HlGRA0XqhT0UrWCMZJD5OKCi+gJxXFaWst4tqCQZ86tJC6
         6Zzd/T/yvHS7hdvhNJUTqfZCPnRjhSDuBJ7RgbYfIIkJEGXucntlRS+tR6tOQ0y6+xdF
         kASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=csrvl1c+O62QiY1i5I2vPcapPdMbP20Dc619rzOjrHg=;
        b=djxDj9ouNA66rpMIvy9BtioKuQq42ZNOk25S/beRG4dYXE5cQAhshYWZvmxX0xk2Fm
         6xgF2fvaUFmYCNhHitEo7mJ2cDrNgP3UlgcRAhme/NmfBf5wCx8E0/Zytx87TC23eUmp
         UNd4d0rh1zEhnZqM5uTMKNlqiW2KI6UoLNSBuqsfCeglXpUwtjGqb09NY36cy4uT8lWn
         lex2DqaM1RqshSCKmRsJUEXqZF7Iuqn5DpcH8vDGFxQifIUwazVik7SpmohTCjpVYREg
         I4m9OhU8MObG1zUyLgmsfCHUUb3FLwVftLllKEy4axigNr8c9fXy35aWGBSCR/OOULJk
         v1Yw==
X-Gm-Message-State: AGi0PubEXeBXcu6ZoJc+rju8FzNlBCletfU+kuWpMZX8SYK5MZggiuN8
        aLdPQnr2aztk2wMprdNarSY=
X-Google-Smtp-Source: APiQypL8wSZ3+zuj3JdwrMxl2nUdiO7+MYxW0LLqG0DA915dib8zv1EuWcyyuRt5PD81k/AxqIRe1g==
X-Received: by 2002:a2e:b80d:: with SMTP id u13mr3126155ljo.166.1586528333328;
        Fri, 10 Apr 2020 07:18:53 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id u1sm1129675ljo.65.2020.04.10.07.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 07:18:52 -0700 (PDT)
Subject: Re: [PATCH v6 10/14] memory: tegra: Add EMC scaling sequence code for
 Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-11-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <682c661d-ea3a-7b9a-42f0-d5473b969aa2@gmail.com>
Date:   Fri, 10 Apr 2020 17:18:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200409175238.3586487-11-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
> +static void tegra210_emc_r21021_set_clock(struct tegra210_emc *emc, u32 clksrc)
> +{
> +	/*
> +	 * This is the timing table for the source frequency. It does _not_
> +	 * necessarily correspond to the actual timing values in the EMC at the
> +	 * moment. If the boot BCT differs from the table then this can happen.
> +	 * However, we need it for accessing the dram_timings (which are not
> +	 * really registers) array for the current frequency.
> +	 */
> +	u32 tmp, cya_allow_ref_cc = 0, ref_b4_sref_en = 0, cya_issue_pc_ref = 0;
> +	struct tegra210_emc_timing *fake, *last = emc->last, *next = emc->next;
> +	u32 bg_regulator_switch_complete_wait_clks, bg_regulator_mode_change;
> +	u32 opt_zcal_en_cc, opt_do_sw_qrst = 1, opt_dvfs_mode, opt_dll_mode;
> +	u32 emc_zcal_wait_cnt_old, emc_zcal_wait_cnt_new, emc_dbg_active;
> +	u32 opt_cc_short_zcal = 1, opt_short_zcal = 1, opt_war_200024907;
> +	u32 tRTM, RP_war, R2P_war, TRPab_war, deltaTWATM, W2P_war, tRPST;
> +	u32 adel = 0, compensate_trimmer_applicable = 0, mrw_req, value;
> +	unsigned long next_timing_rate_mhz = next->rate / 1000, delay;
> +	u32 tZQCAL_lpddr4 = 1000000, zq_wait_long, shared_zq_resistor;
> +	s32 zq_latch_dvfs_wait_time, tZQCAL_lpddr4_fc_adj, nRTP;
> +	u32 tFC_lpddr4 = 1000 * next->dram_timings[T_FC_LPDDR4];
> +	u32 emc_auto_cal_config, auto_cal_en, mr13_catr_enable;
> +	u32 zq_op, zcal_wait_time_clocks, zcal_wait_time_ps;
> +	u32 emc_cfg, emc_sel_dpd_ctrl, emc_zcal_interval;
> +	int next_push, next_dq_e_ivref, next_dqs_e_ivref;
> +	u32 mr13_flip_fspwr, mr13_flip_fspop, is_lpddr3;
> +	u32 enable_bglp_regulator, enable_bg_regulator;
> +	u32 emc_dbg_o, emc_cfg_pipe_clk_o, emc_pin_o;
> +	u32 ramp_up_wait = 0, ramp_down_wait = 0;
> +	u32 save_restore_clkstop_pd = 1, dll_out;
> +	u32 ref_delay_mult, ref_delay, dram_type;
> +	static u32 fsp_for_next_freq;
> +	/* In picoseconds. */
> +	u32 source_clock_period, destination_clock_period;
> +	u32 zqcal_before_cc_cutoff = 2400;
> +	unsigned int i;

What about to try to replace this massive egyptian construction with a
single "u32 val;" ?

...

> +	emc_readl(emc, EMC_CFG);
> +	emc_auto_cal_config = emc_readl(emc, EMC_AUTO_CAL_CONFIG);

And remove all the "dummy" variable assigns in the code?

...
> emc_auto_cal_config = next->emc_auto_cal_config;
...> +	emc_zcal_interval = 0;

And replace all "constant" variables with a raw value in place in the code?
