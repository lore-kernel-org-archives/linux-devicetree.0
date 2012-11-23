From: Shiraz Hashim <shiraz.hashim@st.com>
Subject: Re: [PATCH] gpio: stmpe: Add DT support for stmpe gpio
Date: Fri, 23 Nov 2012 18:00:48 +0530
Message-ID: <20121123123048.GM5384@localhost.localdomain>
References: <912d88b8906ce87cf5459cf3d5798e03bfce34c7.1353649737.git.viresh.kumar@linaro.org>
 <20121123103400.GO17471@gmail.com>
 <CAKohponW-Wd+Vrnj8mbdFMmJvwQgPq1jFCZRipBFoEhTknStHQ@mail.gmail.com>
 <20121123121413.GB22268@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121123121413.GB22268@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linus.walleij@linaro.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 23, 2012 at 12:14:13PM +0000, Lee Jones wrote:
> > >> +             if (np)
> > >> +                     of_property_read_u32(np, "st,norequest-mask",
> > >> +                                     &pdata->norequest_mask);
> > >
> > > Can you explain to me what this does?
> > 
> > You mean pdata->norequest_mask?  It marks few gpios as unusable.
> > Because these pads might be used by other blocks of stmpe.
> 
> I'm not sure if that should be set with DT or not.
> 
> Second opinion anyone?

This is a board dependent parameter which just informs gpio driver
about pins, which must not be requested. It may happen for a stmpe
variant where such gpio pins are multiplexed with some other
function.

Hence it must be part of DT itself.

--
regards
Shiraz
