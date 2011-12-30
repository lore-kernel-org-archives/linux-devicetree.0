From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2 1/2] gpio: add a driver for the Synopsys DesignWare
 APB GPIO block
Date: Fri, 30 Dec 2011 14:25:25 -0600
Message-ID: <4EFE1E35.106@gmail.com>
References: <1324345431-12251-1-git-send-email-jamie@jamieiles.com>
 <20111230195955.GA3427@page>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111230195955.GA3427@page>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/30/2011 01:59 PM, Jamie Iles wrote:
> Grant, Linus,
> 
> On Tue, Dec 20, 2011 at 01:43:50AM +0000, Jamie Iles wrote:
>> The Synopsys DesignWare block is used in some ARM devices (picoxcell)
>> and can be configured to provide multiple banks of GPIO pins.  The first
>> bank (A) can also provide IRQ capabilities.
>>
>> v2:	- use Rob Herring's irqdomain in generic irq chip patches
>> 	- use reg property to indicate bank index
>> 	- support irqs on both edges based on LinusW's u300 driver
>>
>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
>> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
> 
> Is this driver okay by you guys?  I'd like to get this one in for 3.3 if 
> at all possible as it's the last patch that allows picoxcell to boot to 
> a semi useful state without out of tree patches and that would make 
> testing a lot easier!

We've got to sort out getting irq domains enabled on x86 and MIPS in
order to merge generic irq chip using domains. I'm not sure that will
get done in time.

Can you leave out the interrupt portion of the driver? Or that is needed
to get to a useful state.

Rob
