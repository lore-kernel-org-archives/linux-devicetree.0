From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: DT include files (was: [GIT PULL 2/2] ARM: imx: device tree
 changes for 3.14)
Date: Sat, 4 Jan 2014 09:10:58 +0800
Message-ID: <20140104011056.GA3282@S2101-09.ap.freescale.net>
References: <20131231054427.GA22383@S2101-09.ap.freescale.net>
 <20140102202108.GF19720@quad.lixom.net>
 <20140103023211.GA25079@S2101-09.ap.freescale.net>
 <CAOesGMheei8YgzfRp9pmQ0rT9zhJ2_hF56j5Y+jLSy5TadPZ-g@mail.gmail.com>
 <20140103030455.GB25079@S2101-09.ap.freescale.net>
 <CAOesGMihX-pLva-aBCHJ6TYfsN57MzRWiYFTnfKCXOKeja0uUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMihX-pLva-aBCHJ6TYfsN57MzRWiYFTnfKCXOKeja0uUg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, "arm@kernel.org" <arm@kernel.org>, Kumar Gala <galak@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 03, 2014 at 11:29:35AM -0800, Olof Johansson wrote:
> On Thu, Jan 2, 2014 at 7:04 PM, Shawn Guo <shawn.guo@linaro.org> wrote:
> > On Thu, Jan 02, 2014 at 06:41:30PM -0800, Olof Johansson wrote:
> >> Ok, then it's probably just the location of the header files that
> >> should be adjusted. Other subsystems have placed them under
> >> include/dt-bindings/<subsystem>, so that's likely a better place for
> >> these as well, don't you think?
> >
> > I had a little discussion with DT people when the headers were firstly
> > created.  These pinctrl headers are a little different from the headers
> > in include/dt-bindings/<subsystem>.  The latter are used by both kernel
> > and device tree sources, while the pinctrl headers are used by device
> > tree sources only, so I chose to put them just in the same folder as
> > dts files.  And DT people are fine with my take.
> 
> Since you don't provide references to this I had to go searching for
> it. All I find is some discussion from 8 months ago, and quite a bit
> of that seems to have been about changing bindings, and some about the
> preprocessor behavior. Also, the patches seem to have been too big to
> make it out on the lists.
> 
> I'd like a fresh look from DT people on this just to make sure no
> opinions have changed -- lots of things have changed in the last 8
> months w.r.t. DT.

Indeed, it's been quite a long time.  Let me restate my point.  The
include/dt-bindings is introduced as a folder to hold headers that are
referenced by both kernel and DTS.  That's why we create the folder in
the kernel include folder and have arch/arm/boot/dts/include/dt-bindings
being a symbol link to it.  All the headers in there need to be
duplicated between kernel and DTS tree, when we move DTS files into
a separated repository.  Putting DTS local headers into the folder is
absolutely unnecessary, and will only confuse people and bother
ourselves when moving DTS files out of kernel tree.

Shawn

> 
> I've pinged them on IRC, let's see if they wake up. Adding explicit cc too.
> 
> 
> -Olof
