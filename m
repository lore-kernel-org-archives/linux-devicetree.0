From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drivers/amba: probe via device tree
Date: Sat, 21 May 2011 09:55:09 -0500
Message-ID: <4DD7D24D.2070604@gmail.com>
References: <1305829704-11774-1-git-send-email-robherring2@gmail.com>
	<20110519233958.GB18181@ponder.secretlab.ca>
	<4DD66B8A.5040404@gmail.com> <201105201621.03801.arnd@arndb.de>
	<4DD68614.6090209@gmail.com>
	<80f20ac921a33e9f0bf3e249f539a8ef@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <80f20ac921a33e9f0bf3e249f539a8ef-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/20/2011 11:00 PM, Segher Boessenkool wrote:
>> The ARM definition of AMBA encompasses a lot of things. It is the
>> definition of the AXI, AHB and APB buses.
>
> So the device tree, which describes the hardware, should call the buses
> axi, ahb or apb as appropriate, and describe the actual physical
> connections.
> The Linux kernel is free to ignore that if it so wishes.
>
>> It also has the definition of the peripheral ID register definitions
>> which primarily only ARM Ltd peripherals implement. You can have those
>> bus types yet not have any peripherals with the ID registers.
>
> The devices are identified in the device tree, you do not need to read
> the ID registers to find them. You should have some way of figuring out
> which devices have the AMBA ID block; maybe add something to the
> "compatible"
> property and have all devices that use this have this register block as the
> first entry in the "reg" property?
>

Identifying actual AMBA devices is already done. The question is how to 
scan the tree for them and how that relates to regular platform devices. 
The AMBA devices have a binding like this:

compatible = "arm,pl011", "arm,amba-device";
arm,amba-deviceid = <0x00341011>;

Rob
