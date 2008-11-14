From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: Machine config files
Date: Fri, 14 Nov 2008 14:11:32 -0600
Message-ID: <491DDB74.5070701@codemonkey.ws>
References: <200811140332.14093.paul@codesourcery.com>
	<f43fc5580811141104v3b6296b0i575693ba944badbb@mail.gmail.com>
	<491DD188.6000603@codemonkey.ws>
	<200811141351.40613.hollisb@us.ibm.com>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <200811141351.40613.hollisb@us.ibm.com>
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/pipermail/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: Hollis Blanchard <hollisb@us.ibm.com>
Cc: devicetree-discuss@ozlabs.org, qemu-devel@nongnu.org
List-Id: devicetree@vger.kernel.org

Hollis Blanchard wrote:
> We do; PLB, OPB, and EBC are all on-chip busses found on IBM PowerPC SoCs. For 
> example, you can see devices representing the UARTs and PCI controller in our 
> bamboo.dts file. Qemu only modifies the device tree at runtime with 
> information not known until then (memory size, clock frequency, etc).
>   

Yes, but you don't build the machine based on the device tree.  What 
would be useful would be to be able to simply write a device tree 
description and that would fully represent the board such that you 
didn't need a ppc440_bamboo.c file at all.

So what I'm getting at is, what is preventing us from being able to do 
this today?

Regards,

Anthony Liguori
