Return-Path: <SRS0=Fy5c=QS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37893 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbfBKWVO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Feb 2019 17:21:14 -0500
Date: Mon, 11 Feb 2019 14:21:10 -0800
From: "'dmitry.torokhov@gmail.com'" <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 2/2] Input: st1232 - handle common DT bindings
Message-ID: <20190211222110.GC149505@dtor-ws>
References: <1548757144-2222-1-git-send-email-matthias.fend@wolfvision.net>
 <1548757144-2222-2-git-send-email-matthias.fend@wolfvision.net>
 <VI1PR08MB37589A1C275E8D0A1224037B85640@VI1PR08MB3758.eurprd08.prod.outlook.com>
 <20190211084502.GC95126@dtor-ws>
 <c0732084-3baf-949a-83b3-154e2e93463b@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0732084-3baf-949a-83b3-154e2e93463b@ginzinger.com>
Sender: devicetree-owner@vger.kernel.org
To: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Cc: Matthias Fend <Matthias.Fend@wolfvision.net>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 11, 2019 at 09:51:58AM +0100, Martin Kepplinger wrote:
> On 11.02.19 09:45, 'dmitry.torokhov@gmail.com' wrote:
> > Hi Matthias,
> > 
> > On Mon, Feb 11, 2019 at 07:15:12AM +0000, Matthias Fend wrote:
> >> Hi Dmitry,
> >>
> >> You asked me if I could also include the conversion to touchscreen_report_pos() - which I did in this patch version.
> >> Is there anything else missing?
> > 
> > Sorry, gmail decided to mark the v2 patches as spam for some reason :(
> > I fished them out and applied.
> > 
> > Matthias, Martin, I noticed that the driver is still using MT-A
> > protocol. Could you convert it to the proper MT-B (slotted) protocol?
> > 
> 
> Yes, I thought about that actually. type A protocol is what matches the
> controller here... It stores touch points consecutively in memory, but I
> doubt that it tracks them (by keeping them at one position in its
> memory, for instance). But yes, I want to test that.

We still can do MT-B for such devices by employing in-kernel contact
tracking. See input_mt_assign_slots().

Thanks.

-- 
Dmitry
