From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v3 0/6] Migrate PXA27x platforms to clock framework
Date: Thu, 04 Sep 2014 12:29:43 -0700
Message-ID: <20140904192943.11368.83896@quantum>
References: <1406753464-15000-1-git-send-email-robert.jarzmik@free.fr>
 <201408241408.19861.arnd@arndb.de> <20140903184956.11368.47800@quantum>
 <3966110.RPrxdc8FBm@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3966110.RPrxdc8FBm@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <zonque@gmail.com>, arm@kernel.org, olof@lixom.net, Eric Miao <eric.y.miao@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Arnd Bergmann (2014-09-03 12:33:31)
> On Wednesday 03 September 2014 11:49:56 Mike Turquette wrote:
> > > Right, makes sense. We have in the past done it either way for other
> > > platforms. When merging the patches through the clk subsystem, it still
> > > makes sense to let us know of those plans and ask for an Ack from
> > > the arm-soc maintainers, to be sure we can plan ahead in case there
> > > are other (conflicting) patch sets that are sent through arm-soc.
> > 
> > Do I have your Ack for the arch/arm patches?
> > 
> > [0] https://lkml.kernel.org/r/<1409758148-20104-1-git-send-email-tomeu.vizoso@collabora.com>
> 
> I have no objection to the change, but we might need to be careful in
> case we get a lot of conflicts.
> 
> How about making it a shared branch that you plan to send upstream
> but that we can also include in arm-soc to avoid conflicts if necessary?

Sounds good. I'll probably need to perform a bit of surgery on my tree
and rebase it in order to have the minimum set of patches that get
pulled into arm-soc.

Regards,
Mike

> 
>         Arnd
