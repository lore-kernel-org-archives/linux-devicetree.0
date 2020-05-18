Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5551C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 18:12:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACFB420715
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 18:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589825541;
	bh=NQw4ZObIGoQdINO2P1VDbgPOV1A0PLlO2tt8UT5hEUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KVQq+nan2AgpYagBopaXJw9G33Ts40bx+Ui0c6hhJWNMFQOwuiRD132FWxXGqUlQD
	 PISVzqCCMtrEzsCa79cJYmHGegWuRie02PP3LBEjfMdRX40Ww258Idg9xaOwcLwLw5
	 EqC9tY85TY5SgqbeuUSIVoZ7lsRvkZ20fgbSP1TM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732691AbgERSMU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 14:12:20 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:41987 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728848AbgERSMU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 14:12:20 -0400
Received: by mail-il1-f195.google.com with SMTP id 18so1874571iln.9
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 11:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wza7y0iWSmQunc9aAsvn/ABnmr/MQ8TpkPd34EycxTs=;
        b=aZ9H9hjtgyELGaNfoeMq0SQlt2/uKdNrAMfnQ/ZsgABYIHejA9bSCudKaEcQygzP0t
         wTzNfT9BGeVmsnf7NqYxEdVD5eznTe08RyMinkLoHYmatSulTMlJsFa6Zgh5kv0ywtgw
         qEx53NjmY65rTekRh783PzGPzn8SEbGvvJ6Bd9eyLL/mepymAd6OGfeNBGYbZG0y3k/k
         CRFt13ndqAu/6aEbgE+rPi4U+T0JbVCQZDAbc60Fx5j+e5bOzjfztrFfnAGeryzlSHoA
         lJbiwcJkOtCcYYHVY5i9Dl5FuKbtsCuNCCQs/h4XoNetbAuMT9DmpKSvf6TOoipbyy/k
         mCUQ==
X-Gm-Message-State: AOAM532otKtBlZU3i6SICcFRds6TisMi8tuTB+z8g2mnSy+x+UuV20Kt
        zWJ9oMBX2t3LKkMktRFhuw==
X-Google-Smtp-Source: ABdhPJxRuz2c7uilqkp6Yz7wsrwWTC5DyQruXesuSs2L9u16dXm49HJmPCUrA+N2gnuqLeLFa3yW+w==
X-Received: by 2002:a92:8cd6:: with SMTP id s83mr18470530ill.133.1589825538604;
        Mon, 18 May 2020 11:12:18 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id p1sm4087313ioh.38.2020.05.18.11.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 11:12:17 -0700 (PDT)
Received: (nullmailer pid 15457 invoked by uid 1000);
        Mon, 18 May 2020 18:12:16 -0000
Date:   Mon, 18 May 2020 12:12:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Michal Simek <monstr@monstr.eu>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-mtd@lists.infradead.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 6/8] dt-bindings: mtd: Document ARASAN NAND bindings
Message-ID: <20200518181216.GA15399@bogus>
References: <20200508171339.8052-1-miquel.raynal@bootlin.com>
 <20200508171339.8052-7-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508171339.8052-7-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri,  8 May 2020 19:13:37 +0200, Miquel Raynal wrote:
> Document the Arasan NAND controller bindings.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/mtd/arasan,nand-controller.yaml  | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
