From: Scott Wood <oss@buserror.net>
Subject: Re: [RFC 3/5] powerpc/mpic: Add support for non-contiguous irq
 ranges
Date: Tue, 07 Aug 2018 16:03:36 -0500
Message-ID: <a20f27b15161164c829f771d2b085639f6709374.camel@buserror.net>
References: <1532684881-19310-1-git-send-email-Bharat.Bhushan@nxp.com>
         <1532684881-19310-4-git-send-email-Bharat.Bhushan@nxp.com>
         <20180807180938.GA13623@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807180938.GA13623@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Bharat Bhushan <Bharat.Bhushan@nxp.com>
Cc: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, galak@kernel.crashing.org, mark.rutland@arm.com, kstewart@linuxfoundation.org, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, keescook@chromium.org, tyreld@linux.vnet.ibm.com, joe@perches.com
List-Id: devicetree@vger.kernel.org

On Tue, 2018-08-07 at 12:09 -0600, Rob Herring wrote:
> On Fri, Jul 27, 2018 at 03:17:59PM +0530, Bharat Bhushan wrote:
> > Freescale MPIC h/w may not support all interrupt sources reported
> > by hardware, "last-interrupt-source" or platform. On these platforms
> > a misconfigured device tree that assigns one of the reserved
> > interrupts leaves a non-functioning system without warning.
> 
> There are lots of ways to misconfigure DTs. I don't think this is 
> special and needs a property.

Yeah, the system will be just as non-functioning if you specify a valid-but-
wrong-for-the-device interrupt number.

>  We've had some interrupt mask or valid 
> properties in the past, but generally don't accept those.

FWIW, some of them like protected-sources and mpic-msgr-receive-mask aren't
for detecting errors, but are for partitioning (though the former is obsolete
with pic-no-reset).

-Scott
