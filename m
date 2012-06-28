From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: #size-cells = <0> in a bus node, and kernel messages complaining
 about this
Date: Wed, 27 Jun 2012 14:57:04 -1000
Message-ID: <4FEBABE0.2050503@firmworks.com>
References: <4FEB7A8E.1090409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FEB7A8E.1090409-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 6/27/2012 11:26 AM, Stephen Warren wrote:
> I believe I've seen the following construct bandied about as the correct
> way of representing a bunch of nodes that have the same name (since they
> represent the same type of object) within device-tree.
>
> 	regulators {
> 		compatible = "simple-bus";
> 		#address-cells = <1>;
> 		#size-cells = <0>;
>
> 		regulator@0 {
> 			compatible = "regulator-fixed";
> 			reg = <0>;
> ...
> 		};
>
> 		regulator@1 {
> 			compatible = "regulator-fixed";
> 			reg = <1>;
> ...
> 		};
> 	};
>
> However, when the kernel parses that, it issues messages such as:
>
> prom_parse: Bad cell count for /regulators/regulator@0
> prom_parse: Bad cell count for /regulators/regulator@1

The message comes from __of_translate_address(), which has the comment:

  * Note: We consider that crossing any level with #size-cells == 0 to mean
  * that translation is impossible (that is we are not dealing with a value
  * that can be mapped to a cpu physical address). This is not really specified
  * that way, but this is traditionally the way IBM at least do things

So it seems that the problem only occurs if something tries to translate
the regulator's "reg" address to a CPU address.  Is that possible/meaningful
in your case?

I ran into a problem like this recently.  If I recall correctly, the root cause 
was that some code that I "inherited" was using of_address_to_resource() to 
process a "reg" property in a case where the "reg" was not memory-mappable.
I changed the code to use "of_get_address()" instead.

of_address_to_resource() calls of_get_address(), and then proceeds to convert 
the bus-relative address to a CPU address.

>
> The message is issued when #size-cells==0. Is the response simply "don't
> do that", and so I should set #size-cells=1, and add a fake size cell in
> the reg property too?
>
> Given the number of hits on '#size-cells = <0>' in the kernel source
> tree, it seems like I must be missing something here; it's quite widely
> used. I guess the warning is probably only emitted when the node with
> #size-cells=0 is a bus, and so the children are enumerated to
> instantiated devices; perhaps that's why this hasn't been raised before?
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
