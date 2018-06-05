From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v2 1/5] media: venus: add a routine to reset ARM9
Date: Tue, 5 Jun 2018 16:27:16 +0530
Message-ID: <20180605105716.GT16230@vkoul-mobl>
References: <1527884768-22392-1-git-send-email-vgarodia@codeaurora.org>
 <1527884768-22392-2-git-send-email-vgarodia@codeaurora.org>
 <894ab678-bc1d-da04-b552-d53301bd3980@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <894ab678-bc1d-da04-b552-d53301bd3980@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Vikash Garodia <vgarodia@codeaurora.org>, hverkuil@xs4all.nl, mchehab@kernel.org, robh@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, bjorn.andersson@linaro.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, acourbot@chromium.org
List-Id: devicetree@vger.kernel.org

On 02-06-18, 01:15, Stanimir Varbanov wrote:
> Hi Vikash,
> 
> On  1.06.2018 23:26, Vikash Garodia wrote:
> > Add a new routine to reset the ARM9 and brings it
> > out of reset. This is in preparation to add PIL
> > functionality in venus driver.
> 
> please squash this patch with 4/5. I don't see a reason to add a function
> which is not used. Shouldn't this produce gcc warnings?

Yes this would but in a multi patch series that is okay as subsequent
patches would use that and end result in no warning.

Splitting logically is good and typical practice in kernel to add the
routine followed by usages..

-- 
~Vinod
