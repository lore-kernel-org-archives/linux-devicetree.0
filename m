From: Stuart Yoder <stuart.yoder@freescale.com>
Subject: RE: [PATCH] arm64: dts: Added syscon-reboot node for FSL's LS2085A
 SoC
Date: Fri, 30 Oct 2015 16:15:42 +0000
Message-ID: <CY1PR0301MB0748CE1C553E440C8369FC65872F0@CY1PR0301MB0748.namprd03.prod.outlook.com>
References: <1445650280-9966-1-git-send-email-German.Rivera@freescale.com>
 <20151027163441.GK3091@leverpostej>
 <CY1PR0301MB07480A8EC25BB6987883AE5687220@CY1PR0301MB0748.namprd03.prod.outlook.com>
 <41343887.dUfAz3IhqL@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <41343887.dUfAz3IhqL@wuerfel>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sharma Bhupesh <bhupesh.sharma@freescale.com>, Jose Rivera <German.Rivera@freescale.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Li Leo <LeoLi@freescale.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Arnd Bergmann [mailto:arnd@arndb.de]
> Sent: Friday, October 30, 2015 8:36 AM
> To: linux-arm-kernel@lists.infradead.org
> Cc: Yoder Stuart-B08248; Mark Rutland; devicetree@vger.kernel.org; Sharma Bhupesh-B45370; Rivera Jose-B46482;
> linux-kernel@vger.kernel.org; robh+dt@kernel.org; Li Yang-Leo-R58472
> Subject: Re: [PATCH] arm64: dts: Added syscon-reboot node for FSL's LS2085A SoC
> 
> On Tuesday 27 October 2015 18:25:04 Stuart Yoder wrote:
> > I think that comment "Currently supported enable-method is psci v0.2" is a statement of
> > intent, not what is available currently.   And the only plan I am aware of is PSCI
> > with UEFI based firmware.
> >
> > U-boot is a key firmware platform for us and has no PSCI implementation available.
> 
> I believe U-boot has supported PSCI since 2013. Maybe you just need to update
> to a newer version?

We are using a very recent u-boot.  U-boot for ARMv8, which is what this SoC is
based on, does not have PSCI as far as I can tell.  We (Freescale) plan to 
eventually have an EL3 firmware component that could remain resident for 
u-boot based systems, but it is a roadmap thing and I don't know when
we're going to get it.

So, for now, most straightforward thing is to get reboot functionality is
to expose the reset register via syscon-reboot in the DT...no new driver needed.

Once a PSCI component is available we'll move to it.

Thanks,
Stuart
