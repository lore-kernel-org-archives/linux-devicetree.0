From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 0/6] Migrate PXA27x platforms to clock framework
Date: Fri, 25 Jul 2014 17:42:12 -0700
Message-ID: <20140726004212.4791.52407@quantum>
References: <1405353263-13424-1-git-send-email-robert.jarzmik@free.fr>
 <87k376vadk.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87k376vadk.fsf@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Robert Jarzmik (2014-07-21 11:23:51)
> Robert Jarzmik <robert.jarzmik@free.fr> writes:
> 
> > This is the second opus of this serie.
> 
> Ping ?

Hi Robert,

Overall the series looks good to me. The only problem I see is that
somewhere in the use of the PARENTS() macro there is a section mismatch
introduced. I spent about 5 minutes looking at it and gave up. This
problem introduces 26 section mismatch warnings building
colibri_pxa270_defconfig.

Once those are fixed up then I will be happy to take this series. Do you
want me to take all six patches through the clk tree, including the
arm/arm stuff?

Regards,
Mike

> 
> --
> Robert
