From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] regulator: gpio-regulator: add DT bindings
Date: Wed, 12 Sep 2012 12:47:12 -0600
Message-ID: <5050D8B0.10004@wwwdotorg.org>
References: <1347289429-18713-1-git-send-email-zonque@gmail.com>
 <504E4234.9090300@wwwdotorg.org> <50504E6B.9060401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50504E6B.9060401-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/12/2012 02:57 AM, Daniel Mack wrote:
> On 10.09.2012 21:40, Stephen Warren wrote:
>> On 09/10/2012 09:03 AM, Daniel Mack wrote:
>>> Add DT bindings for the gpio-regulator driver and some documentation on
>>> how to use it.
...
>>> +++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
...
>>> +	- "gpios":		bitfield of gpio target-states for the value
>>> +				The n-th bit in the bitfield describes the
>>> +				state of the n-th GPIO from the gpios-array
>>
>> "gpios" sounds like the name of a property that defines which GPIOs are
>> used, rather than the value of those GPIOs. Perhaps "gpio-values" instead?
>>
>> Actually, I wonder if we really even need to represent that values
>> explicitly; rather than have a big set of nodes, perhaps you can instead
>> have a single property that lists the voltage (or current) that each
>> combination of GPIO values gives; something like:
>>
>> reg_gpio {
>>     ...
>>     gpios = <&ggpio 23 0 &gpio 24 0>;
>>     voltages = <0 1000000 2000000 3000000>;
>> };
>>
>> (As inspiration for that, I looked at
>> Documentation/devicetree/bindings/net/mdio-mux-gpio.txt which doesn't
>> have a property defining the value of the GPIOs for each combination,
>> but rather a node per valid combination).
>>
>> Perhaps represent and invalid GPIO combination with 0xffffffff?
> 
> Sorry, I don't follow you on this one. How would you specify the
> voltages that way? And The driver allows for arbitrary GPIO patterns to
> be set on the GPIOs in order to reach a specific voltage. Could you give
> me another example how that would look like in your approach?
> 
> Once that topic is agreed on, I'll send out a new version.

The idea is that you treat the GPIOs as an array of bits. so, two
entries in the gpios property and you've got two bits in your values.
Use that value as the index into the "voltages" property. For each
combination of GPIO values, you have an entry in "voltages" that
indicates what voltage will be produced. This is much more compact than
having a node per setting, but perhaps is more wordy if the subset of
legal GPIO value is much more sparse than all possible 2^n GPIO values.

Put another way,

GPIO0=0, GPIO1=0 -> index 0 -> voltage 0 in the example above
GPIO0=0, GPIO1=1 -> index 1 -> voltage 1000000 in the example above
GPIO0=1, GPIO1=0 -> index 2 -> voltage 2000000 in the example above
GPIO0=1, GPIO1=1 -> index 3 -> voltage 3000000 in the example above
