From: Ian Campbell <ijc@hellion.org.uk>
Subject: Re: [PATCH] powerpc/44x/fsp2: correct dtb reg property for
 /sdhci@020c0000
Date: Fri, 21 Jul 2017 14:00:28 +0100
Message-ID: <1500642028.3330.8.camel@hellion.org.uk>
References: <20170715090302.23105-1-ijc@hellion.org.uk>
         <20170721125427.77668-1-ivan@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170721125427.77668-1-ivan@de.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ivan Mikhaylov <ivan@de.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-07-21 at 15:54 +0300, Ivan Mikhaylov wrote:
> Hi Ian,
> > Building the split device-tree tree[0] highlighted that upstream commit
> > 9eec6cb142bd ("powerpc/44x/fsp2: Add device tree for FSP2 board") introduced
> > this warning when building the device tree:
> > 
> > $ make CROSS_COMPILE=powerpc-linux-gnu- ARCH=powerpc fsp2.dtb
> >  CHK     scripts/mod/devicetable-offsets.h
> >  DTC     arch/powerpc/boot/fsp2.dtb
> > > > arch/powerpc/boot/fsp2.dtb: Warning (reg_format): "reg" property in /sdhci@020c0000 has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
> > 
> > This commit adds the second adress cell as zeroes to resolve the warning. Note:
> > I have no access to or information about this platform so this is purely a
> > guess as to the fix. An alternative would be to adjust #address-cells, but
> > whether that is correct or not depends on the platform.
> 
> Yes, this problem exists on this tag but it is already fixed and waiting for
> > review by this https://patchwork.kernel.org/patch/9819379/ . You can check it
> if you want, anyways it will go to powerpc next branch first.

Great, thanks for the info.
