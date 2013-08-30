From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH] ARM: dts: vexpress: Add CCI node to TC2 device-tree
Date: Fri, 30 Aug 2013 17:36:20 +0100
Message-ID: <1377880580.10738.14.camel@hornet>
References: <1377872760.3655.48.camel@linaro1.home>
 <20130830161327.GA10045@e102568-lin.cambridge.arm.com>
 <CAOesGMhwqqOuSwVEukpfqM00BV2i=fQRhLUaf-wf-iVGR_mNbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOesGMhwqqOuSwVEukpfqM00BV2i=fQRhLUaf-wf-iVGR_mNbg@mail.gmail.com>
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
Cc: "Jon Medhurst (Tixy)" <tixy@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2013-08-30 at 17:30 +0100, Olof Johansson wrote:
> Shouldn't you be updating some vexpress_defconfig and probably
> multi_v7_defconfig to at least get some build coverage for this as
> well, by the way?

Yeah, I've been told not to kill vexpress_defconfig after all, so I'll
refresh it in the next cycle.

Pawel 
