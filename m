Return-Path: <SRS0=jpoJ=K7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36169 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725749AbeHPLBQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Aug 2018 07:01:16 -0400
From: Esben Haabendal <esben.haabendal@gmail.com>
Subject: Re: [PATCH v3 0/3] i2c: imx: Fix and enable DMA support for LS1021A
References: <20180809123207.9732-1-esben.haabendal@gmail.com>
Date: Thu, 16 Aug 2018 10:04:28 +0200
In-Reply-To: <20180809123207.9732-1-esben.haabendal@gmail.com> (Esben
        Haabendal's message of "Thu, 9 Aug 2018 14:32:04 +0200")
Message-ID: <87in4ag2k3.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Esben Haabendal <esben.haabendal@gmail.com> writes:

> From: Esben Haabendal <eha@deif.com>
>
> This patch series fixes two race conditions and minor issues with tracking
> the stopped state when something goes wrong.
>
> With that in place, DMA support works with NXP LS1021A, so it is enabled in
> the last patch.
>
> Changes in v3:
>
> * Rebased to v4.18-rc8, dropping patch 1/4 which have been merged
> * Avoid unnecessary register write in patch 2/3
> * Removed unneeded braces in patch 3/3
>
> Changes in v2:
>
> * Fixed speling mistake in commit message
> * Rebased to v4.18-rc4
>
> Esben Haabendal (3):
>   i2c: imx: Fix race condition in dma read
>   i2c: imx: Simplify stopped state tracking
>   arm: dts: ls1021a: Enable I2C DMA support
>
>  arch/arm/boot/dts/ls1021a.dtsi |  6 ++++++
>  drivers/i2c/busses/i2c-imx.c   | 20 +++++++++-----------
>  2 files changed, 15 insertions(+), 11 deletions(-)

Uwe, will you take a look at this v3 of the series?  I made all changes
you requested with v2.

/Esben
