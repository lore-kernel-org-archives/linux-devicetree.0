From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] ARM: sti: stih410-clocks: Add PROC_STFE as a critical
 clock
Date: Wed, 26 Oct 2016 14:00:22 +0100
Message-ID: <20161026130022.GB12618@dell>
References: <1476804957-24000-1-git-send-email-peter.griffin@linaro.org>
 <20161024085304.GE14477@dell>
 <20161024134416.GB10440@griffinp-ThinkPad-X1-Carbon-2nd>
 <20161025074257.GF8574@dell>
 <20161025093926.GA3206@griffinp-ThinkPad-X1-Carbon-2nd>
 <20161025100141.GH8574@dell>
 <20161025134940.GA3993@griffinp-ThinkPad-X1-Carbon-2nd>
 <20161026085141.GJ8574@dell>
 <20161026085620.GA5476@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161026085620.GA5476@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> > > > > If the clock is enabled when Linux boots, the Linux clock framework *needs*
> > > > > to assume the hardware may have been used in previous boot stages, and it should
> > > > > not attempt to disable the clock.
> > > > 
> > > > None of the boot loaders we use do this.
> > > 
> > > But the Linux kernel isn't just used by us. It is not uncommon for STB
> > > bootloaders to get information from the frontend as part of the boot process. 
> > 
> > Okay, this is the clincher.  Since we need to support non-standard
> > bootloaders, it's difficult to guarantee that the clock will be
> > disabled at boot.  For this reason, I believe that we can call this a
> > critical clock.

> That's good news as the STi maintainer already acked and applied the patch.

Matters not.  That's why we have `git rebase` and `git revert`. ;)

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
