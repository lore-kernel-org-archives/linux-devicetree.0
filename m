Return-Path: <SRS0=F5di=HU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:41826 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751451AbeEADkp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Apr 2018 23:40:45 -0400
Received: by mail-ua0-f193.google.com with SMTP id a3so6770724uad.8
        for <devicetree@vger.kernel.org>; Mon, 30 Apr 2018 20:40:44 -0700 (PDT)
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com. [209.85.213.52])
        by smtp.gmail.com with ESMTPSA id m19-v6sm2903329vkm.53.2018.04.30.20.40.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Apr 2018 20:40:43 -0700 (PDT)
Received: by mail-vk0-f52.google.com with SMTP id q189-v6so6401916vkb.0
        for <devicetree@vger.kernel.org>; Mon, 30 Apr 2018 20:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <1524622328-30493-1-git-send-email-andy.yeh@intel.com> <1524622328-30493-3-git-send-email-andy.yeh@intel.com>
In-Reply-To: <1524622328-30493-3-git-send-email-andy.yeh@intel.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 01 May 2018 03:40:32 +0000
Message-ID: <CAAFQd5CbJQm4-DyR4fieBAAa9JDrDtmvc9gtwOXU3rXzbZ3njQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v8 2/2] media: dw9807: Add dw9807 vcm driver
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: "Yeh, Andy" <andy.yeh@intel.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org, jacopo@jmondi.org, Alan Chiang <alanx.chiang@intel.com>
List-ID: <devicetree@vger.kernel.org>

Hi Andy,

On Wed, Apr 25, 2018 at 11:04 AM Andy Yeh <andy.yeh@intel.com> wrote:

> From: Alan Chiang <alanx.chiang@intel.com>

> DW9807 is a 10 bit DAC from Dongwoon, designed for linear
> control of voice coil motor.

> This driver creates a V4L2 subdevice and
> provides control to set the desired focus.

> Signed-off-by: Andy Yeh <andy.yeh@intel.com>
> ---
> since v1:
> - changed author.
> since v2:
> - addressed outstanding comments.
> - enabled sequential write to update 2 registers in a single transaction.
> since v3:
> - addressed comments for v3.
> - Remove redundant codes and declare some variables as constant variable.
> - separate DT binding to another patch
> since v4:
> - sent patchset included DT binding with cover page
> since v6:
> - change the return code of i2c_check
> - fix long cols exceed 80 chars
> - remove #define DW9807_NAME since only used once
> since v7:
> - Remove some redundant type cast
> - Modify to meet the coding style
> - Replace a while loop by readx_poll_timeout function
> - Return the i2c error directly

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Thanks for addressing the comments.

Best regards,
Tomasz
