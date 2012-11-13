From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] MIPS: BCM63XX: add simple Device Tree includes for all SoCs
Date: Tue, 13 Nov 2012 09:56:56 -0800
Message-ID: <50A289E8.4030407@gmail.com>
References: <1352638249-29298-1-git-send-email-jonas.gorski@gmail.com>
 <1352638249-29298-3-git-send-email-jonas.gorski@gmail.com>
 <50A1D290.3050409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50A1D290.3050409-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/12/2012 08:54 PM, Stephen Warren wrote:
> On 11/11/2012 05:50 AM, Jonas Gorski wrote:
>> Add simple Device Tree include files for all currently supported SoCs.
>> These will be populated with device definitions as driver support
>> gets added.
>
>>   arch/mips/bcm63xx/dts/bcm6328.dtsi |   30 ++++++++++++++++++++++++++++++
>>   arch/mips/bcm63xx/dts/bcm6338.dtsi |   30 ++++++++++++++++++++++++++++++
>>   arch/mips/bcm63xx/dts/bcm6345.dtsi |   30 ++++++++++++++++++++++++++++++
>>   arch/mips/bcm63xx/dts/bcm6348.dtsi |   30 ++++++++++++++++++++++++++++++
>>   arch/mips/bcm63xx/dts/bcm6358.dtsi |   33 +++++++++++++++++++++++++++++++++
>>   arch/mips/bcm63xx/dts/bcm6368.dtsi |   33 +++++++++++++++++++++++++++++++++
>
> All of ARM, c6x, microblaze, openrisc, powerpc put device tree files
> into arch/${arch}/boot/dts/ - should MIPS follow the same layout?

At this point, I don't see what the benefit of centralizing all of these 
would be.  Currently there is no concept of a single kernel image that 
would work across multiple MIPS system implementations.  So keeping the 
DTS files with their users makes some organizational sense.

Similar arguments could be made for moving all the files in `find . 
-name \*.dts\*` to a top level dts/ directory.

David Daney
