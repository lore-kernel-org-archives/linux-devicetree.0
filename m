From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 09/12] dtb: amd: Add KCS device tree node
Date: Tue, 09 Feb 2016 17:00:48 +0100
Message-ID: <15181064.RzzsN4CWec@wuerfel>
References: <1454954357-8395-1-git-send-email-Suravee.Suthikulpanit@amd.com> <4018438.bPuTyoUuqf@wuerfel> <56BA0A2B.5000705@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56BA0A2B.5000705@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Brijesh Singh <brijesh.singh@amd.com>, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, arm@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, leo.duran@amd.com, galak@codeaurora.org, thomas.lendacky@amd.com, brijeshkumar.singh@amd.com
List-Id: devicetree@vger.kernel.org

On Tuesday 09 February 2016 09:47:55 Brijesh Singh wrote:
> > 
> > I see we don't have a binding file for this, can you add one please?
> >
> There is binding file ipmi.txt [1]. Am I missing something ?
>  
> [1] http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/ipmi.txt

Sorry, my mistake: I was looking for "ipmi_kcs", which is not in there.

> > 
> > Why the strange name for the interrupt?
> > 
> 
> Now I don't remember the doc but sometime back while implementing BMC on Seattle I saw that interrupt was labeled as "ipmi_kcs"
> hence used the same name in DT. But if you want to use different name then let me know the string and will update it.
> 
> Theoretically IPMI system interface supports the following interface and any of these interfaces can be used by
> A57 to communicate with BMC:
> 
> * Keyboard controller style (KCS)
> * System Management Interface (SMIC)
> * Block transfer (BT)
> * SMBus system interface (SSIF)
> 
> AMD Seattle platform supports "KCS".
> 

The important part for interrupt/reg/... names is that you must use exactly the
names that are listed in the binding. If there is no name in there, it's better
not to add the name property.

The other point is that "ipmi_kcs" is a name that is picked really badly, as it
uses a '_' character while DT properties by convention use '-' between names,
and the name of the IRQ is the same as the device itself, which is really
not a useful way to disambiguate multiple interrupts in the same device, if
someone ever adds another irq line.

	Arnd
