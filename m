Return-Path: <SRS0=RDbo=FO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ot0-f174.google.com ([74.125.82.174]:32903 "EHLO
        mail-ot0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751825AbeBTN0a (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 20 Feb 2018 08:26:30 -0500
Received: by mail-ot0-f174.google.com with SMTP id i6so2531189otf.0
        for <devicetree@vger.kernel.org>; Tue, 20 Feb 2018 05:26:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1519130288-12666-1-git-send-email-mayhs11saini@gmail.com>
References: <1519130288-12666-1-git-send-email-mayhs11saini@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Feb 2018 10:26:28 -0300
Message-ID: <CAOMZO5D=MH03ww2PrRQeqkUBnE6gkg6czSyGhtRj1wf647f6Tw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6dl: Include correct dtsi file for Engicam
 i.CoreM6 DualLite/Solo RQS
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: shyam saini <mayhs11saini@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, Jagan Teki <jagan@amarulasolutions.com>, Shyam Saini <shyam@amarulasolutions.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Feb 20, 2018 at 9:38 AM, shyam saini <mayhs11saini@gmail.com> wrote:
> From: Shyam Saini <shyam@amarulasolutions.com>
>
> This patch fixes the wrongly included dtsi file which
> was breaking mainline support for Engicam i.CoreM6 DualLite/Solo RQS.
>
> As per the board name, the correct file should be imx6dl.dtsi instead
> of imx6q.dtsi
>
> Reported-by: Michael Trimarchi <michael@amarulasolutions.com>
> Suggested-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Shyam Saini <shyam@amarulasolutions.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
