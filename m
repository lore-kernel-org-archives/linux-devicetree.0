From: Bhupesh Sharma <bhupesh.sharma@nxp.com>
Subject: RE: [PATCH v4 0/2] ARM64: Enable SP805 WDT support for FSL LS2080A
Date: Tue, 19 Apr 2016 12:09:40 +0000
Message-ID: <VI1PR04MB12308B0964726B5D1A4492BE886C0@VI1PR04MB1230.eurprd04.prod.outlook.com>
References: <1451296884-7932-1-git-send-email-bhupesh.sharma@freescale.com>
 <570FBBD8.4030704@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <570FBBD8.4030704@arm.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>, Bhupesh Sharma <bhupesh.sharma@freescale.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "bhupesh.linux@gmail.com" <bhupesh.linux@gmail.com>, "arnd@arndb.de" <arnd@arndb.de>, "Catalin.Marinas@arm.com" <Catalin.Marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "stuart.yoder@freescale.com" <stuart.yoder@freescale.com>, "scottwood@freescale.com" <scottwood@freescale.com>, "arm@kernel.org" <arm@kernel.org>, "olof@lixom.net" <olof@lixom.net>, "LeoLi@freescale.com" <LeoLi@freescale.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Sorry for the delayed reply. I was on holidays.

> From: Marc Zyngier [mailto:marc.zyngier@arm.com]
> Sent: Thursday, April 14, 2016 9:19 PM
> 
> Hi Bhupesh,
> 
> On 28/12/15 10:01, Bhupesh Sharma wrote:
> > Hi Arnd, Kevin, Olof
> >
> > This is the v4 of patchset which adds the support for SP805 WDT on
> FSL
> > LS2080A and also adds the missing documentation of SP805 WDT device-
> tree bindings.
> >
> > Rebased against arm-soc/next/dt
> >
> > Changes since v3:
> > (v3 can be viewed here:
> > https://www.mail-
> archive.com/devicetree@vger.kernel.org/msg97249.html)
> > - Added Rob's Acked-by for patch 1/2.
> > - Sending to 'arm@kernel.org' list and also cc'ed Shawn Guo
> >
> > Changes since v2:
> > (v2 can be viewed here:
> > http://permalink.gmane.org/gmane.linux.ports.arm.kernel/463141)
> > - Addressed Rob's comments regarding the second mandatory CLK
> source's
> >   (WDOGCLK) name in the bindings.
> >
> > Changes since v1:
> > (v1 can be viewed here:
> > http://www.spinics.net/lists/devicetree/msg102487.html)
> >
> > - Addressed Rob and Mark's comments regarding the mandatory CLK
> > sources
> > - Removed interrupt property from the bindings for now (as discussed
> >   with Mark on IRC) till Will's patch proceeds further and enables
> >   handling the WDOG interrupts for each core connected to the same
> PPI
> >   line
> > (http://lists.infradead.org/pipermail/linux-arm-kernel/2015-
> December/3
> > 91616.html)
> 
> Will just pointed me to this series. I've recently posted a set of
> patches that should be able to deal with the quirkiness of your HW with
> regards to PPIs:
> 
> http://thread.gmane.org/gmane.linux.drivers.devicetree/163464
> 
> Could you please let me know if this works for you?
> 

Sure. I will have a look at the patchset and get back asap.

Regards,
Bhupesh
