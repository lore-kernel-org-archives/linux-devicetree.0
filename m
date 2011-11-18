From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH 4/5] ARM: vexpress: Initial RS1 memory map support
Date: Fri, 18 Nov 2011 12:20:50 +0000
Message-ID: <1321618850.24216.324.camel@hornet.cambridge.arm.com>
References: <1321036026-23411-1-git-send-email-pawel.moll@arm.com>
 <1321036026-23411-5-git-send-email-pawel.moll@arm.com>
 <20111117153624.GR9581@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20111117153624.GR9581@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2011-11-17 at 15:36 +0000, Russell King - ARM Linux wrote:
> > +config ARCH_VEXPRESS_LEGACY
> > +	bool
> > +	select AUTO_ZRELADDR
> > +	select ARM_PATCH_PHYS_VIRT
> > +
> > +config ARCH_VEXPRESS_RS1
> > +	bool
> > +
> >
> This doesn't make sense.  Why should CA9x4 be forced to use the P2V stuff
> and the AUTO_ZRELADDR stuff?  Hint: it works fine today without.
> 
> > @@ -1,3 +1,3 @@
> > -   zreladdr-y	+= 0x60008000
> > -params_phys-y	:= 0x60000100
> > -initrd_phys-y	:= 0x60800000
> > +   zreladdr-y	+= 0x80008000
> > +params_phys-y	:= 0x80000100
> > +initrd_phys-y	:= 0x80800000
> 
> So is this the reason - you don't want to turn this into a config, so you
> want to force all the automatic zreladdr stuff on? 

Yes, exactly.

>  You do know that this
> will probably cause uboot to load the uImage at 0x80008000 instead of
> 0x60008000, and therefore we'll lose half the RAM on this board?

I missed that - I don't use uboot, so I don't build uImages.

As the ARCH_VEXPRESS_LEGACY will be no more (see my other response) I'll
revert the order, so the _RS1 will enforce P2V, AUTO_ZRELADDR and change
the zrealaddr-y & friends (as in: 0x6* when no _RS1, 0x8* when _RS1=y).
Is there any other way of having single binary kernel booting from both
0x60008000 and 0x80008000?

All comments appreciated as always, thanks!

Pawel
