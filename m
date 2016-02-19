From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] ARM: dts: meson: Adding hwrev syscon node
Date: Fri, 19 Feb 2016 12:53:52 +0100
Message-ID: <2394082.bSJ4DLLTEt@wuerfel>
References: <1455730114-2547-1-git-send-email-romain.perier@gmail.com>
 <CAOQ7t2aqZj3STFsdTSQZMTK5U+8Oem8oFroxHKWkt=AeP+Zczg@mail.gmail.com>
 <CAD8Lp47LGUc3-MFpU+3iNjXJL0i4nLTY_49NUxFXeZ2SokDuaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD8Lp47LGUc3-MFpU+3iNjXJL0i4nLTY_49NUxFXeZ2SokDuaQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Drake <drake@endlessm.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-meson@googlegroups.com, Carlo Caione <carlo@endlessm.com>, Carlo Caione <carlo@caione.org>, Romain Perier <romain.perier@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday 18 February 2016 15:27:06 Daniel Drake wrote:
> On Thu, Feb 18, 2016 at 3:04 PM, Carlo Caione <carlo@caione.org> wrote:
> >> However, if some or all of the other devices actually are entirely
> >> made up of register ranges within cbus, that would indicate that
> >> cbus itself is not just a collection of random registers but something
> >> that could be considered a bus of itself in hardware, and then
> >> we could represent the other devices as children of this bus.
> >
> > I think that this is exactly the case. We are missing this cbus in the
> > DTS because (for lacking of proper documentation) we are not sure
> > about start / end / size.
> 
> Here's a hint from the vendor kernel
> https://github.com/endlessm/linux-meson/blob/master/arch/arm/mach-meson8b/iomapping.c#L87
> 
> Having a cbus bus node with child devices does sound like it would
> reflect this particular view of the hardware design. How would we then
> represent the hwrev registers under that?
> 
> I am also curious if this is the common practice. We were working with
> Exynos devices before, and even though many of the components are on
> the AXI bus there, there is no AXI bus representation in the DT. But
> now that I go digging, I see other SoCs that do have a DT bus
> representation very similar to what's being described, such as the apb
> and axi busses in mmp2.dtsi. Is one approach preferred over the other
> for new SoC support?

I would always prefer having the dts files describe the hardware as best
as they can.

	Arnd
