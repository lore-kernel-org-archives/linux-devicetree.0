From: Rob Herring <robherring2@gmail.com>
Subject: Re: HOWTO Undo/Revert of_platform_populate?
Date: Thu, 07 Mar 2013 18:07:53 -0600
Message-ID: <51392BD9.4010209@gmail.com>
References: <CAPybu_3LfWLYLSn52dgFDuBTASLvQ0_XWsywH=Avpma+4s921g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPybu_3LfWLYLSn52dgFDuBTASLvQ0_XWsywH=Avpma+4s921g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 03/07/2013 04:32 AM, Ricardo Ribalda Delgado wrote:
> Hi
> 
> I have an FPGA attached to the pci bus. The FPGA has an internal bus
> with multiple cores that are already supported in the kernel.
> 
> I have made a driver that populates those cores using a user provided
> device tree. I use the function of_platform_populate for that.
> 
> All this is working fine, but now I need a method to undo what
> of_platform_populate does when the fpga is reprogrammed.
> 
> I haven't found any function that does this in the api.
> 
> Before implementing my own I would like to know if am I missing something?

It's not possible in the current kernel. You need DT overlay support
that was posted recently.

Rob
