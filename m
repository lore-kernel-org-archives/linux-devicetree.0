From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Wed, 24 Mar 2010 13:25:05 -0500
Message-ID: <4BAA5901.7000707@freescale.com>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>
	<fa686aa41003232307s39af071bn6377800951d6615c@mail.gmail.com>
	<ed82fe3e1003240505h59d29c83x6948f8b3b70c4570@mail.gmail.com>
	<90D93687-940F-47FB-8CEA-F3C065EA611D@kernel.crashing.org>
	<fa686aa41003241007mf6052d5s4643795f4a87cdcf@mail.gmail.com>
	<4BAA4C8A.70104@freescale.com>
	<fa686aa41003241110u75e9486dn503c6b039944708c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <fa686aa41003241110u75e9486dn503c6b039944708c@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:

> Thanks.  This is important information when talking about his.
> 
> You can also put it into an initrd and use the Linux firmware loader.

We may also need to support non-Linux operating systems that don't use an initrd.  For now, an initrd might work.  I don't know how I'll convince our BSP team to start using one, though.

> That would also neatly solve your GPL distribution issues.

True.

> Also, depending on U-Boot (or any other boot firmware) to correctly
> squirt the QE blob into
> the dtb at boot is risky.  Even when U-Boot is buggy, there is
> resistance to upgrading U-Boot
> on working boards because it could result in a bricked board.

Ok, that makes more sense, but we're not talking about upgrading U-Boot.  Once U-Boot has the capability to inject the QE blob into the DTB, then upgrading the QE blob won't require an upgrade to U-Boot.  The QE blob is still a QE blob.

> You're right, that wouldn't be very nice.  Try this syntax instead:
> 
> fsl,firmware = /incbin/("firmware-file-name.bin");

It's not a bad idea, but it would require firmware-file-name.bin to be distributed with the kernel itself, otherwise building the DTB will be complicated.  The path to firmware-file-name.bin would need to be hard-coded in the DTS.

> You've got the distribution problem that needs to be solved regardless
> because it cannot be part of U-Boot either.  How do you plan to handle
> QE firmware distribution and loading?

Today, we just put the QE blob somewhere in flash, and then U-Boot is told about like this:

#define CONFIG_SYS_QE_FW_ADDR	0xfff00000

Then we have GPL code in U-Boot that uploads it.  

But you do have a point -- once we embed the QE blob in the DTB, whether it's a DTB created by DTC or updated by U-Boot, we might already have a GPL issue.  I'll have to get back to you on that one.

-- 
Timur Tabi
Linux kernel developer at Freescale
