From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: Merging device trees at runtime for module-based
	systems
Date: Wed, 31 Oct 2012 22:36:08 -0600
Message-ID: <5091FC38.2020806@wwwdotorg.org>
References: <5087B919.2010006@gmail.com> <508AD8F9.8030105@wwwdotorg.org>
	<5091AD78.3060701@gmail.com> <5091BAAA.5010809@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <5091BAAA.5010809@firmworks.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Mitch Bradley <wmb@firmworks.com>
Cc: u-boot@lists.denx.de, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 10/31/2012 05:56 PM, Mitch Bradley wrote:
> On 10/31/2012 1:00 PM, Daniel Mack wrote:
>> cc devicetree-discuss. Here's a reference to the full thread:
>>
>>   http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/145221/
>>
>> On 26.10.2012 20:39, Stephen Warren wrote:
>>> On 10/24/2012 03:47 AM, Daniel Mack wrote:
>>>> Hi,
>>>>
>>>> a project I'm involved in uses a module/baseboard combo, and components
>>>> on either board are described in DT. I'm currently using separate dts
>>>> files which build upon each other with include statements, which works
>>>> fine for development.
>>>>
>>>> In production though, we will certainly have running changes (and hence
>>>> different versions) over the lifetime of the product for both the
>>>> baseboard and the module, and the hardware has support for identifying
>>>> the versions of both sides at runtime.
...
>> I start to believe that the cleanest solution to this would be to
>> have full DTC functionality in U-Boot and compile the tree
> 
> ... which is exactly the way that Open Firmware does it, since the
> invention of the device tree.  The model is that the boot firmware,
> which needs to know the system configuration to do its job anyway,
> exports that configuration via the device tree.

Doesn't OF generate the DT from internal data structures (although I
don't know where those come from...), whereas what Daniel mentions above
is more like the bootloader having access to a bunch of .dts fragments,
selecting the appropriate subset of those to use, parsing them into an
internal data structure (i.e. running dtc), and then generating a DTB
from it. The overall result is that the bootloader causes a DTB to be
generated at run-time, so at that level it's the same, but the
implementation seems pretty different.
