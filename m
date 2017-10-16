From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v4 0/9] Mediatek MT2712 clock and scpsys support
Date: Mon, 16 Oct 2017 14:42:14 +0800
Message-ID: <1508136134.20464.49.camel@mtksdaap41>
References: <1505793630-12590-1-git-send-email-weiyi.lu@mediatek.com>
         <20171012224540.GE18706@codeaurora.org>
         <ac7940d1-e23d-add2-b4b6-bd7cf66fea34@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ac7940d1-e23d-add2-b4b6-bd7cf66fea34@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Fri, 2017-10-13 at 16:50 +0200, Matthias Brugger wrote:
> 
> On 10/13/2017 12:45 AM, Stephen Boyd wrote:
> > On 09/19, Weiyi Lu wrote:
> >> This series is based on v4.14-rc1 and composed of
> >> clock control (PATCH 1-4) and scpsys control (PATCH 5-9)
> > 
> > What's the merge plan? Can I apply the clk ones to clk tree and
> > ignore the rest?
> > 
> 
> Yes, please do so. I'll take scpsys, which depends on the clock patches.
> 
> Regards,
> Matthias

Hi Stephen & Matthias,

I will start to separate this patch set into three series
(clk/scpsys/dts) when I send the next version.
