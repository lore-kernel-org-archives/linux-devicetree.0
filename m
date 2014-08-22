From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH 0/7] MIPS: Move device-tree files to a common location
Date: Fri, 22 Aug 2014 15:10:19 -0700
Message-ID: <CAL1qeaEaZx0KpMpTSGqZVMZZj1VrzGY3ffRbzEdy4Aks2yHciA@mail.gmail.com>
References: <1408651466-8334-1-git-send-email-abrestic@chromium.org>
	<CAGVrzcZobuL4z0WNX+Sz4p_uwaPL-S5yvEmgRUwZPJi4+qq0tg@mail.gmail.com>
	<53F7AEAC.90303@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53F7AEAC.90303@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, Rob Herring <robh+dt@kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, Qais Yousef <qais.yousef@imgtec.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, John Crispin <blogic@openwrt.org>, Mark Rutland <mark.rutland@arm.com>, Jayachandran C <jchandra@broadcom.com>, Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 22, 2014 at 1:57 PM, David Daney <ddaney.cavm@gmail.com> wrote:
> On 08/22/2014 01:42 PM, Florian Fainelli wrote:
>>
>> On Aug 21, 2014 3:05 PM, "Andrew Bresticker" <abrestic@chromium.org
>> <mailto:abrestic@chromium.org>> wrote:
>>  >
>>  > To be consistent with other architectures and to avoid unnecessary
>>  > makefile duplication, move all MIPS device-trees to arch/mips/boot/dts
>>  > and build them with a common makefile.
>>
>> I recall reading that the ARM organization for DTS files was a bit
>> unfortunate and should have been something like:
>>
>> arch/arm/boot/dts/<vendor>/
>>
>> Is this something we should do for the MIPS and update the other
>> architectures to follow that scheme?
>
>
> If we choose not to intermingle .dts files from all the vendors in a single
> directory, why do anything at all?  Currently the .dts files for a vendor
> are nicely segregated with the rest of the vendors code under a single
> directory.
>
> Personally I think things are fine as they are.  Any common code remaining
> in the Makefiles could be moved to the scripts directory for a smaller
> change.

Assuming we don't move them to a common location just to segregate
them again, it makes MIPS consistent with every other architecture
(not just ARM!) using DT.  It also makes it easier to introduce common
changes later on, like the 'dtbs' or 'dtbs_install' make targets.
