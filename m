Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5B6C54E49
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 14:08:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 420B8208D6
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 14:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588860487;
	bh=up72YqQmbXKsh+0pM1oCFb1Y0z05K3pNe8Mi871M7kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=eOSK5CJzNKAxGk4jV/aFikzMmpnUNXQdPX5UPupgZsjJwYWJzhzAGaq0lZTVjf+hR
	 E/7K73fHBlruso5DOccqi1q9A5qojejv4CkVEqdrbz8qCopmi+1Rea2m9fp8psCKYf
	 QbIwB1DHaIdcipjFCHA4C9pS6eaRO9wQczdW6kxI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgEGOH7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 10:07:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:60618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726268AbgEGOH7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 7 May 2020 10:07:59 -0400
Received: from Mani-XPS-13-9360 (unknown [157.46.59.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F03462084D;
        Thu,  7 May 2020 14:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588860478;
        bh=up72YqQmbXKsh+0pM1oCFb1Y0z05K3pNe8Mi871M7kc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jsUyk3GojI51408CO+VP69Uj5RZ4eJkVtRwanijT5SOihR0odMv6AqV9EZzz+J4vR
         T6Tr+k2nnIhLGKQQWLg10jhz8YQoFL9axsSFvzcb+NeN05rqb4r2Q3PvDv3Hw90MXl
         7te6rl2Rr1MRb/oDmEb64s1lK3JiRdPHtZK4Ev5U=
Date:   Thu, 7 May 2020 19:37:50 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com, andy.shevchenko@gmail.com,
        robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Subject: Re: [PATCH v3 0/2] Add CTS/RTS gpio support to STM32 UART
Message-ID: <20200507140750.GA2019@Mani-XPS-13-9360>
References: <20200420170204.24541-1-mani@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420170204.24541-1-mani@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Greg,

On Mon, Apr 20, 2020 at 10:32:02PM +0530, mani@kernel.org wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> Hello,
> 
> This patchset adds CTS/RTS gpio support to STM32 UART controller.
> Eventhough the UART controller supports using dedicated CTS/RTS gpios,
> sometimes we need to use different set of gpios for flow control.
> 
> This is necessary for the upcoming STM32MP1 based board called Stinger96
> IoT-Box. On that board, a bluetooth chip is connected to one of the UART
> controller but the CTS/RTS lines got swapped mistakenly. So this patchset
> serves as a workaround for that hardware bug and also supports the
> usecase of using any gpio for CTS/RTS functionality. As per the sugggestion
> provided by Andy for v1, I've now switched to mctrl_gpio driver.
> 
> This patchset has been validated with Stinger96 IoT-Box connected to Murata
> WiFi-BT combo chip.
> 

Are you planning to take this series for 5.8?

Thanks,
Mani

> Thanks,
> Mani
> 
> Changes in v3:
> 
> * Added Andy's reviewed-by tag
> * Fixed minor issues spotted by Fabrice
> 
> Changes in v2:
> 
> As per the review by Andy:
> 
> * Switched to mctrl_gpio driver instead of using custom CTS/RTS
>   implementation
> * Removed the use of software flow control terminology.
> 
> Manivannan Sadhasivam (2):
>   dt-bindings: serial: Document CTS/RTS gpios in STM32 UART
>   tty: serial: Add modem control gpio support for STM32 UART
> 
>  .../bindings/serial/st,stm32-uart.yaml        | 14 +++++
>  drivers/tty/serial/Kconfig                    |  1 +
>  drivers/tty/serial/stm32-usart.c              | 53 ++++++++++++++++++-
>  drivers/tty/serial/stm32-usart.h              |  1 +
>  4 files changed, 67 insertions(+), 2 deletions(-)
> 
> -- 
> 2.17.1
> 
