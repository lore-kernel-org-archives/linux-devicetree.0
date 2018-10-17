From: Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V13 0/4] C-SKY(csky) Linux Intc Driver
Date: Wed, 17 Oct 2018 17:59:45 +0800
Message-ID: <20181017095945.GA3383@guoren-Inspiron-7460>
References: <cover.1539696960.git.ren_guo@c-sky.com>
 <3fff53d8-fca0-fee4-ae3b-c8b08dc29a37@arm.com>
 <20181017015511.GA21519@guoren-Inspiron-7460>
 <3043b2ca-cfa2-db70-b24a-fc473139991c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3043b2ca-cfa2-db70-b24a-fc473139991c@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, will.deacon@arm.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Marc,

On Wed, Oct 17, 2018 at 09:29:45AM +0100, Marc Zyngier wrote:
> Hi Guo,
> 
> On 17/10/18 02:55, Guo Ren wrote:
> > Hi Marc,
> > 
> > On Tue, Oct 16, 2018 at 03:41:05PM +0100, Marc Zyngier wrote:
> >> Guo,
> >>
> >> On 16/10/18 15:08, Guo Ren wrote:
> >>> This is about 13th patchset for C-SKY linux intc drivers and it should pair
> >>> with 9th kernel patchset. Timer drivers are seperated according to
> >>> requirements.
> >>>
> >>> This version patch improve the comment in commit-msg and move the
> >>> changelog to the end with "---", so git am will ignore the changelog.
> >>>
> >>> Hope it could be merged into linux-4.20 and I'm very grateful to any help.
> >>
> >> I can't really see that happening, in all honesty. On its own, this code
> >> is not very useful (it cannot compile standalone), and I haven't seen a
> >> clear indication that the rest of the architecture code is going to be
> >> merged for 4.20.
> > Thank you very much for your frankness.
> > 
> >> If the arch code is actually being merged for 4.20, then please add my:
> >>
> >> 	Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>
> >>
> >> to these 4 patches, and get the whole thing merged in one go.
> >>
> > Got it, thx for the conditional Reviewed-by.
> 
> The Reviewed-by is not conditional, and you can apply it right now. What
> I meant is that I'm happy for you to get these irqchip patches merged
> with the rest of the architecture code.
Thank you and I agree that these patches should be merged with arch code
together.

Best Regards
 Guo Ren
