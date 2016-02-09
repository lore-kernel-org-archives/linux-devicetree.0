From: Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [PATCH V2 09/12] dtb: amd: Add KCS device tree node
Date: Tue, 9 Feb 2016 10:11:38 -0600
Message-ID: <56BA0FBA.1010202@amd.com>
References: <1454954357-8395-1-git-send-email-Suravee.Suthikulpanit@amd.com>
 <4018438.bPuTyoUuqf@wuerfel> <56BA0A2B.5000705@amd.com>
 <15181064.RzzsN4CWec@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <15181064.RzzsN4CWec@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: brijesh.singh@amd.com, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, arm@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, leo.duran@amd.com, galak@codeaurora.org, thomas.lendacky@amd.com, brijeshkumar.singh@amd.com
List-Id: devicetree@vger.kernel.org

Hi,

On 02/09/2016 10:00 AM, Arnd Bergmann wrote:
> 
> The important part for interrupt/reg/... names is that you must use exactly the
> names that are listed in the binding. If there is no name in there, it's better
> not to add the name property.
> 
> The other point is that "ipmi_kcs" is a name that is picked really badly, as it
> uses a '_' character while DT properties by convention use '-' between names,
> and the name of the IRQ is the same as the device itself, which is really
> not a useful way to disambiguate multiple interrupts in the same device, if
> someone ever adds another irq line.
> 

Sure we will drop the name field. Thanks.

> 	Arnd
> 
