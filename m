From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v4 5/5] arm: exynos: Add MCPM call-back functions
Date: Fri, 2 May 2014 14:37:42 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1405021435420.980@knanqh.ubzr>
References: <1398528348-21214-6-git-send-email-a.kesavan@samsung.com>
 <1399044359-15784-1-git-send-email-a.kesavan@samsung.com>
 <alpine.LFD.2.11.1405021347500.980@knanqh.ubzr>
 <CAL1qeaHrP+i4EhOQKkSX7xFNyiyBiBfpsV3B0EHCFcrNzc6KLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL1qeaHrP+i4EhOQKkSX7xFNyiyBiBfpsV3B0EHCFcrNzc6KLQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>, daniel.lezcano@linaro.org, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, thomas.ab@samsung.com, Abhilash Kesavan <a.kesavan@samsung.com>, Dave Martin <Dave.Martin@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, inderpal.s@samsung.com
List-Id: devicetree@vger.kernel.org

On Fri, 2 May 2014, Andrew Bresticker wrote:

> >> +     /*
> >> +      * TODO: Turn off the clusters when all cores in the cluster
> >> +      * are down to achieve significant power savings.
> >> +      */
> >
> > This comment should actually be located right after the
> > "if (exynos_cluster_unused(cluster))" above.  That is where the cluster
> > control should be applied, assuming it'll be effective only when WFI is
> > executed.
> 
> Correct me if I'm wrong Samsung folks, but I thought it was not
> possible to apply cluster power control from a CPU within the cluster
> being powered down, i.e. a CPU in the other cluster must be the one to
> apply the cluster power control to power down the outbound cluster.

Is this true even for deep idle C-states?


Nicolas
