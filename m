From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 5/6] ARM: dts: Add basic dts include files for Samsung
 S3C64xx SoCs
Date: Fri, 25 Jan 2013 11:15:48 -0800
Message-ID: <016c01cdfb30$64f80430$2ee80c90$@samsung.com>
References: <1358039458-31960-1-git-send-email-tomasz.figa@gmail.com>
 <20130114150531.GE21142@e102568-lin.cambridge.arm.com>
 <20130116105957.GA1963@linaro.org> <3747315.IyCCRDXgbD@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <3747315.IyCCRDXgbD@flatron>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Dave Martin' <dave.martin@linaro.org>
Cc: 'Lorenzo Pieralisi' <lorenzo.pieralisi@arm.com>, 'Mark Rutland' <Mark.Rutland@arm.com>, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, kwangwoo.lee@gmail.com, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, mcuelenaere@gmail.com, augulis.darius@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Tomasz Figa wrote:

[...]

> > Well, the number of CPU types does not grow rapidly.  It will be much
> > less than one per SoC -- so keeping the list up to date shouldn't be
> > that much effort.
> >
> > For ARM1176JZF-S, it could make sense for the comatible list to be
> >
> > 	"arm,arm1176jzf-s", "arm,arm1176"
> >
> > ...since the differences between 1176 variants are software probeable
> > (i.e., whether there is an FPU or not).  AFAIK the J, Z apply to all
> > ARM1176, and the -S (synthesisable RTL) is nothing to do with software.
> > The kernel probably only really needs to know "arm,arm1176".
> 
> OK. So the conclusion is that I should change the cpus node to following:
> 
>        cpus {
>                cpu {

cpu@0 { ?

>                        compatible = "arm,arm1176jzf-s", "arm,arm1176";
>                };
>        };
> 
> Am I right?
> 
I think so :-)

- Kukjin
