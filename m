From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] of: support an enumerated-bus compatible value
Date: Tue, 03 Jul 2012 09:02:08 -1000
Message-ID: <4FF341B0.9090901@firmworks.com>
References: <4FF1C567.4060809@wwwdotorg.org> <4FF1D8F9.9040005@firmworks.com>
 <4FF1DDBD.9050106@wwwdotorg.org> <4FF1EA1A.9030307@firmworks.com>
 <4FF1F955.6030204@wwwdotorg.org>
 <6BC22F77-77D7-45DF-821A-6CA2DBADEA59@kernel.crashing.org>
 <4FF22031.3060206@wwwdotorg.org>
 <FE3C6687-727E-4191-9D37-9E71EBFEF0AE@kernel.crashing.org>
 <20120703104720.GB25995@sirena.org.uk>
 <F928AF0B-65CF-48D1-8DB5-4C27FD6AB82F@kernel.crashing.org>
 <20120703144242.GE25995@sirena.org.uk>
 <DF4AD962-D8A8-43AA-AF14-5DBF65505EDF@kernel.crashing.org>
 <4FF3138F.9090800@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FF3138F.9090800-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 7/3/2012 5:45 AM, Stephen Warren wrote:
> On 07/03/2012 09:43 AM, Segher Boessenkool wrote:
>>>> There is still no reason for the fake bus node to have a "compatible"
>>>> property though.  What could it possibly mean?  "This bus does not
>>>> exist at all but you access it in bla bla bla way"?  That just doesn't
>>>> make sense.  It doesn't exist, you do not access it, it has no
>>>> programming model, it has no "compatible" property.
>>>
>>> Well, as everyone keeps saying this seems to be a limitation of the
>>> current device tree rather than something that's actually sensible in
>>> and of itself.
>>
>> But that is my point: it is *not* a limitation of the device tree,
>> the device tree can describe the hardware just fine without doing
>> some weird "compatible" property.  The limitation is in the current
>> Linux kernel code; _it_ should be fixed, don't add decorations to
>> the device tree to work around shortcomings in a single OS.  The
>> device tree describes the structure of the hardware, not the structure
>> of the device model in the OS.
>
> No, it's definitely a DT limitation.
>
> DT assume that everything is addressable and hence you have to structure
> it as buses where all the nodes have children with addresses. That's
> what the proposed DT binding is doing.
>
> Note that addressability (there's some integer value, or list of integer
> values, that identifies a device) is entirely different from usability
> (the node exists and the driver for which can provide services to the
> drivers for other nodes). I think that point has been lost in the last
> few messages in this sub-thread.


Whether this is a device tree limitation or a usage issue is a semantic 
quibble.

The underlying reality is that the device tree is a hierarchical 
namespace (hence the "tree").  It has a set of rules that are 
straightforward for hardware whose addressing is fundamentally hierarchical.

Much hardware fits nicely in such a model; some does not.  It's possible 
to coerce "problem" hardware into the hierarchy, in the same way that 
it's possible to "mount" remote filesystems into a filesystem tree.  The 
problem is not that the tree structure doesn't support such "out of 
tree" usage, but rather that there is no one obviously-best way to do 
it.  Hence the discussion/argument that is going on here.

When designing the device tree, it was never my intent that the "reg" 
property absolutely had to describe the hardware exactly.  Rather, it 
was a "best practices" policy that happens to work well in a 
surprisingly-large set of cases.  The key observation is that, since the 
hardware "always" has some physical way of distinguishing between two 
devices (which is necessary in order to use the device), you might as 
well use some representation of that token as the unique address, in 
preference to an arbitrarily-assigned number.

I think that's a good rule that should be followed in most cases, but 
there can be situations where the hardware is just too weird, in which 
case "inventing" a number space is okay by me. I would hope, however, 
that the number space is tied to some external "reality", such as a data 
sheet or other system documentation.

Now, let's consider the specific example of these "regulator" things. 
It seems that they are accessed via a motley collection of GPIOs.  So 
one way to address them "physically" is to make the regulator node a 
child of a gpio.  Pick a specific gpio, for example the one connected to 
the device's "clk" input, and make the regulator node a child of the 
gpio pin node.  Then the regulator doesn't need a "reg" property because 
there is only one regulator under a given GPIO pin node.

Another way would be to focus not on the GPIOs themselves, but rather on 
the bus protocol implemented by the collection of GPIOs.  If this 
regulator is like the one's I'm dealing with at the moment, it's 
probably accessed via a serial protocol like I2C.  In that case, it 
would make sense to create an i2c device node with properties that tie 
it to a bit-banged driver bound to some specific GPIO pins (via 
non-hierarchical phandle-valued properties), then make the regulator 
device a child of that i2c node.  The regulator's "reg" property is then 
its I2C slave address, unambiguous within the context of that specific 
I2C bus implementation.  This scheme can deal with multiple regulators 
attached to the same set of GPIO pins (disambiguated by different I2C 
slave addresses), and with regulators attached to different GPIO pins 
(disambiguated by having different parent i2c nodes).

Of course, this just pushes the "problem" up a level - what is the 
parent and "reg" property for the i2c nodes?  The answer might be that 
the i2c node is subordinate to the GPIO subtree.

Perhaps this sort of structure is not well-supported by existing Linux 
driver and device discovery infrastructure.  If that is so, then maybe 
we should work on that front.  This sort of hardware structure - GPIOs 
implementing a serial protocol like I2C or SPI, connected to 
miscellaneous small off-SoC parts - is very common.

> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
