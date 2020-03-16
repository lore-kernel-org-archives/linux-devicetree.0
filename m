Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CE5C10DCE
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 01:07:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 841E020674
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 01:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584320876;
	bh=w8UFak9mwRktB8j1PIcCa8pAcucASI3uNlGd9Kq4HpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hg6/lRqk7CjL9L3mdbyUlxckBVBvhOYC1+IDNN7MQ3Jm6DkM1j2n00law8i80JfIj
	 2WDe9f5MUcNQvxChYUue4n+XyBLtixtqJ0Ggw5s8onP8ZlbNyhcfgWinny8oBf88NQ
	 2XOuyvSFrvdpISuM7e2anrDdO+vRdpxbnEPQqs+U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729303AbgCPBH4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 15 Mar 2020 21:07:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:54656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729300AbgCPBHz (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 15 Mar 2020 21:07:55 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8FD2205ED;
        Mon, 16 Mar 2020 01:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584320875;
        bh=w8UFak9mwRktB8j1PIcCa8pAcucASI3uNlGd9Kq4HpE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hfE5VSZ74YXxfdd/Cx4j1B32EaJXUvcc1w1Nv1p6ZwFqzs94GLGZvRs7WmvuvGPNY
         RSGf2Lu9hpTZ4PdUQB03eHjyFdbhQNpsPGrl/QN9kZitIQPn0slA7DpPT1lMk0r+8A
         xQw4cMOgoPZa//zwT3JrogfFL8CabpPiyYxkJUsE=
Date:   Mon, 16 Mar 2020 09:07:49 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     otavio.salvador@ossystems.com.br, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: fsl: Add TechNexion boards
Message-ID: <20200316010748.GJ17221@dragon>
References: <20200310180825.10111-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310180825.10111-1-festevam@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Mar 10, 2020 at 03:08:21PM -0300, Fabio Estevam wrote:
> Add entries for the TechNexion boards.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied all, thanks.
