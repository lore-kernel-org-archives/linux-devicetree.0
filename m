Return-Path: <SRS0=Fy5c=QS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46139 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbfBKIpG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Feb 2019 03:45:06 -0500
Date: Mon, 11 Feb 2019 00:45:02 -0800
From: "'dmitry.torokhov@gmail.com'" <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 2/2] Input: st1232 - handle common DT bindings
Message-ID: <20190211084502.GC95126@dtor-ws>
References: <1548757144-2222-1-git-send-email-matthias.fend@wolfvision.net>
 <1548757144-2222-2-git-send-email-matthias.fend@wolfvision.net>
 <VI1PR08MB37589A1C275E8D0A1224037B85640@VI1PR08MB3758.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR08MB37589A1C275E8D0A1224037B85640@VI1PR08MB3758.eurprd08.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
To: Matthias Fend <Matthias.Fend@wolfvision.net>
Cc: Martin Kepplinger <martin.kepplinger@ginzinger.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Matthias,

On Mon, Feb 11, 2019 at 07:15:12AM +0000, Matthias Fend wrote:
> Hi Dmitry,
>
> You asked me if I could also include the conversion to touchscreen_report_pos() - which I did in this patch version.
> Is there anything else missing?

Sorry, gmail decided to mark the v2 patches as spam for some reason :(
I fished them out and applied.

Matthias, Martin, I noticed that the driver is still using MT-A
protocol. Could you convert it to the proper MT-B (slotted) protocol?

Thanks.

-- 
Dmitry
