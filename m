From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Thu, 12 Feb 2009 09:33:59 -1000
Message-ID: <499479A7.5090902@firmworks.com>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>	<1234378228.28751.79.camel@slate.austin.ibm.com>	<20090212040138.GD31142@yookeroo.seuss>	<87iqng0x3t.fsf@pike.pond.sub.org>	<1234461162.20305.16.camel@slate.austin.ibm.com>
	<87fxijwkpn.fsf@pike.pond.sub.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <87fxijwkpn.fsf-A7mx1g9ivIOttUaS3K59qNi2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>
> We want a machine configuration: a tree describing configurable devices
> and their configurable properties.
>   


Regarding configurable devices in Open Firmware:

The baseline usage model for configurable devices was that the firmware 
is responsible for establishing a consistent system configuration, 
possibly based on user-modifiable variables in non-volatile storage.  It 
reports the actual configuration to the OS via the device tree.

For cases where the choice needs to deferred until later, or perhaps 
changed dynamically, a device tree property reports the set of 
possibilities.  In cases where the firmware has already set up the 
devices, it reports the current choice via another property.

The device tree hierarchy serves as the "name space" framework for these 
properties.  Obviously, you need to specify the device for which the 
choice set applies.  The device tree is a coherent naming model for that 
purpose.

Obviously the hierarchical model has problems for highly-configurable 
chipsets in which a setting can result in a wholesale rearrangement of 
the overall connectivity, but it seems to me that board-design 
constraints usually make that a non-problem. The wiring on a given board 
generally forces the choice at that level, so the firmware for that 
board need not report that as a configurable choice.
> For PowerPC, we also want a machine description: a tree describing those
> devices and properties that the kernel can't easily and safely probe.
>   

The gist of the above sentence seems to presuppose that, if the kernel 
can probe, it should.  That's not the only way of thinking about the 
problem.  As a practical matter, the firmware usually needs to do a fair 
amount of probing too, in order to locate the console display and the 
boot devices.  In the process, the firmware usually discovers pretty 
much the entire machine configuration.  If the OS has to repeat the 
process from scratch, it slows down the boot process.  So the IEEE1275 
design supports the model where the firmware can do all the probing, 
handing off a complete system description to the OS.  The OS startup 
code can walk the tree and attach device drivers for what it finds, then 
arrange to handle insert/remove events from hot-pluggable buses.
