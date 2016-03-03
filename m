From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 1/2] clk: add lpc18xx creg clk driver
Date: Thu, 3 Mar 2016 12:13:45 -0800
Message-ID: <20160303201345.GD24999@codeaurora.org>
References: <1456351460-15483-1-git-send-email-manabian@gmail.com>
 <1456351460-15483-2-git-send-email-manabian@gmail.com>
 <20160302230159.12762.59247@quark.deferred.io>
 <CAGhQ9VzmTrDmKF+_8CRFgioyrXUOR9uOk-KADw2seEa16OP78A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGhQ9VzmTrDmKF+_8CRFgioyrXUOR9uOk-KADw2seEa16OP78A@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/03, Joachim Eastwood wrote:
> On 3 March 2016 at 00:01, Michael Turquette <mturquette@baylibre.com> wrote:
> >
> > This should be devm_clk_register with your struct device *dev passed
> > into it.
> 
> Since clk_register_creg_clk() is used both from early init and probe
> I'll need to change the function a bit.
> 
> I'll pass dev in as a parameter and either do clk_register() or
> devm_clk_register() depending on dev being NULL or not.
> Doesn't look like devm_clk_register() would like to be passed NULL for dev.
> 
> 
> I send out a new version tomorrow.
> 
> btw, this driver is a builtin_platform_driver. So is there a point in
> using devm_clk_register?
> 

Builtin drivers can still probe defer or fail for other reasons,
so just in case that happens it's better to use
devm_clk_register() to make sure we cleanup on the error path. It
may never actually happen in practice, but it's better to write
safe drivers.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
