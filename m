From: Liviu Dudau <liviu@dudau.co.uk>
Subject: Re: [PATCH v2 0/5]  arm64: Juno DT updates and new DT for Juno R1
Date: Mon, 18 May 2015 23:31:32 +0100
Message-ID: <20150518223132.GA946@bart.dudau.co.uk>
References: <1431970109-8902-1-git-send-email-Liviu.Dudau@arm.com>
 <4136868.8yCICAPH00@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4136868.8yCICAPH00@wuerfel>
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
Cc: "Jon Medhurst (Tixy)" <tixy@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Olof Johansson <olof@lixom.net>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 18, 2015 at 10:14:23PM +0200, Arnd Bergmann wrote:
> On Monday 18 May 2015 18:28:24 Liviu Dudau wrote:
> > This series restructures the Juno DT files and introduces the DT
> > for the new Juno R1. The board is an update of the Juno R0 with
> > support for PCIe, but the current series only brings the board to
> > parity with Juno R0. The series that enable the PCIe Generic Host
> > Bridge to be used on Juno R1 will be posted separately.
> > 
> > Changes from v1:
> >  - Moved memory node inside juno-base.dtsi as this is common between
> >    boards and unlikely to change soon.
> >  - Added "arm,juno-r1" as compatible string in juno-r1.dts at Jon Medhurst's
> >    suggestion.
> 
> Are you planning to send a pull request to arm@kernel.org for this when
> you're happy with the state, or should we pick up the patches from the
> list?

If I don't see any more comments in the next couple(?) of days then I will
send a pull request.

Many thanks,
Liviu

> 
> 	Arnd
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
