From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 0/3] Add clock driver for Actions S900 SoC
Date: Sat, 4 Nov 2017 15:34:04 +0530
Message-ID: <20171104100404.GA23738@linaro.org>
References: <1509479663-8985-1-git-send-email-manivannan.sadhasivam@linaro.org>
 <62797b3b-a622-48a1-9dc5-3cc2b5c7afd3@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <62797b3b-a622-48a1-9dc5-3cc2b5c7afd3@suse.de>
Sender: linux-clk-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org, rdunlap@infradead.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, liuwei@actions-semi.com
List-Id: devicetree@vger.kernel.org

On Sat, Nov 04, 2017 at 05:05:31PM +0800, Andreas Färber wrote:
> Hi Mani,
> 
> Am 01.11.2017 um 03:54 schrieb Manivannan Sadhasivam:
> > This series adds clock driver for Actions Semi OWL series
> > S900 SoC with relevant clock bindings and device tree data.
> > 
> > This series also addresses the review comments from previous
> > submission happened last year.
> > 
> > https://patchwork.kernel.org/patch/9254471/
> 
> Interesting - I had searched for any S500/S900 patches before starting
> to work on this but came up empty on LAKML.
>
Even I'm also not able to find the patch submission in LKML. But found that
in patchwork. 
> It seems you missed at least one review comment from 2016 about the
> example indentation, so please double-check for anything Stephen already
> pointed out.
> 
Agree. Will incorporate in next revision. Can't blame checkpatch for this ;-)
> > Driver has been validated on Bubblegum-96 board.
> > 
> > Thanks,
> > Mani
> > 
> > Manivannan Sadhasivam (3):
> >   arm64: dts: actions: add s900 clock controller nodes
> >   clk: owl: add clock driver for Actions S900 SoC
> >   Documentation: add Actions S900 clock bindings
> 
> Please reverse the patch order.
> 
Ack.
> Have you checked S500 code whether the S900 vs. common split is correct?
> 
Will look at both S500 and S700.
> Many thanks for your work on this,
> 
I should thank you for getting the SoC support in :-)

-Mani
> Andreas
> 
> -- 
> SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
> GF: Felix Imendörffer, Jane Smithard, Graham Norton
> HRB 21284 (AG Nürnberg)
