From: Shiraz Hashim <shiraz.hashim@st.com>
Subject: Re: [PATCH V2 2/2] mfd: stmpe: Extend DT support in stmpe driver
Date: Fri, 23 Nov 2012 09:15:58 +0530
Message-ID: <20121123034557.GB5384@localhost.localdomain>
References: <f1d508c64a01dfd492a1ab1fda28af4b7647d8ab.1353560936.git.viresh.kumar@linaro.org>
 <b81641051dad9660b72b0028d001e5620d901160.1353560936.git.viresh.kumar@linaro.org>
 <20121122112451.GE4328@gmail.com>
 <CAKohpo=F91sZ7St3XVXqwAEgmSWXjAxxXwRs1RD5qPyW99P1vA@mail.gmail.com>
 <20121122154612.GC10986@gmail.com>
 <CAKohpok6v65TH5yZAthyxcH7bCVgF8A8m2bY_mp3yS_Y_yH1Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKohpok6v65TH5yZAthyxcH7bCVgF8A8m2bY_mp3yS_Y_yH1Xw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Lee Jones <lee.jones@linaro.org>
Cc: sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 22, 2012 at 10:31:48PM +0530, Viresh Kumar wrote:
> On 22 November 2012 21:16, Lee Jones <lee.jones@linaro.org> wrote:
> > The STMPE GPIO controller can't be used by Device Tree yet in
> > any case, because it doesn't have an IRQ domain. This is
> > compulsory, or it won't work. Have you tried to test this
> > functionality yet?
> 
> I don't have SPEAr board to test it anymore. I have moved out of
> ST now and working in linaro as ARM asignee. Just pushing these
> as an part time activity.
> 
> Though ST guys would have tested stmpe, but stmpe-gpio, i am not
> sure about.

Let me bring some more information here. I totally understand
Jones concerns, but the way stmpe (and may be other mfd devices)
are handled is this that the parent block (i.e. stmpe) decides on
the variants (say by probing device itself) and then prepares
associated data for the (probed) variant and creates a platform
device for the same.

For the interrupts case also, it is stmpe which registers the
irq domain. This is because, stmpe driver probes variant and
populates its platform data and stmpe-gpio may not be aware of the
variant it serves. At the same time, it (stmpe) needs few of the
(virtual) interrupts for its internal purpose also.

Hence stmpe passes irq_base to the stmpe-gpio driver while
allocating and registering irq domain by itself.

With this approach we have tested the functionality on SPEAr
platform.

--
regards
Shiraz
