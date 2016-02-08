From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCHv9 1/4] EDAC, altera: Add Altera L2 Cache and OCRAM EDAC
 Support
Date: Mon, 8 Feb 2016 17:16:27 +0100
Message-ID: <20160208161627.GH28980@pd.tnic>
References: <1453911203-30202-1-git-send-email-tthayer@opensource.altera.com>
 <20160208113919.GB28980@pd.tnic>
 <56B8BE0D.8070000@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56B8BE0D.8070000@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thor Thayer <tthayer@opensource.altera.com>
Cc: dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Feb 08, 2016 at 10:10:53AM -0600, Thor Thayer wrote:
> Understood. I did get a conditional ACK from Rob Herring on the DT portion
> of the patch from the last revision (as long as I made the changes he
> suggested which I did in this patch). There may be other comments though.

Ah, and I wasn't precise: there are also arch/arm/mach-socfpga/ changes
which I'm going to take through the EDAC tree *only* if ARM people ack
them.

And by "ARM people" and from looking at get_maintainer output I mean
Dinh and he's on CC ...

> Those are the only cases of irq but it would be good to be alerted if that
> is not the case. I will add. Thanks!

Yeah, it is a "just in case" thing - it might just as well be too
cautious and completely unnecessary so your decision.

> Yes, thanks. I was using the xgene code as an example but I missed the
> unregister (although it looks like the xgene's unregister affects sysfs
> instead of debugfs). I'm also moving the debugfs creation to the end of the
> probe since it is not critical and avoids an error path if creation fails.
> 
> I'll make the debugfs_remove_recursive() change as a separate patch in my
> next version.

Good, thanks!

Also, if something's not right in drivers/edac/debugfs.c wrt usability
and so on, feel free to propose changes. I've extracted it there because
I didn't want every driver to reinvent the wheel.

Thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
