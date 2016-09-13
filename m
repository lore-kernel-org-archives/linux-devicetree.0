From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 00/19] Add support for FDMA DMA controller and slim
 core rproc found on STi chipsets
Date: Tue, 13 Sep 2016 10:31:07 +0100
Message-ID: <20160913093107.GA10953@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1473081421-16555-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473081421-16555-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Vinod & Bjorn,

[..]

On Mon, 05 Sep 2016, Peter Griffin wrote:

> v8 actions some review feedback from Bjorn to the slim rproc driver, and also includes
> a patch which fixes a recursive Kconfig error which is triggered when st_fdma selects
> slim_rproc driver. The series has also been rebased on v4.8-rc3.
> 
> v9 actions some review feedback from Bjorn, Lee and Vinod. See below. Importantly a bug
> was found during testing now that the platform boots without clk_ignore_unused parameter
> whereby the clocks would not be enabled properly before firmware loading was attempted.
> 
> regards,
> 
> Peter.
> 
> Changes since v8:
>  - Add MODULE_ALIAS (Vinod)
>  - devm_kzalloc to devm_kcalloc (Vinod)
>  - quisce tasklet initialised by vchan_init() (Vinod)
>  - Don't make SLIM rproc user selectable (Bjorn)
>  - slim_rproc: Ensure clocks enabled before firmware load (Peter)
>  - Various code style nits / commit message change (Lee)
>  - Separate patch for '\n' kconfig removal (Vinod)

I hate to send a ping, but do you think we can merge this fdma series? It has gone
through quite a few review rounds now.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
