From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: RFC of_boardconfig
Date: Tue, 29 Nov 2011 17:22:15 +0100
Message-ID: <4ED506B7.5050001@openwrt.org>
References: <4ECF9DA8.8000504@openwrt.org> <4ED4EF4D.4080806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4ED4EF4D.4080806-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


> How is label used?
>
this would be used as a name when exporting the data, however you are
right and the property name lanmac could be used here


>>                         data = <0x100 0x6>;
>>                 };
>>
>>                 wanmac {
>>                         label = "WAN";
>>                         data = <0x106 0x6>;
>>                 };
>>
>>                 ath9keeprom {
>>                         label = "eeprom";
>>                         partition = <0x200 0x200>;
>>                         magic = <0x0 0x55 0xaa 0xaa 0x55>;
>>                         no-export;
>>                 };
>>         };
>>
>> you can are then able to reference these properties from other nodes:
>>         ethernet {
>>                 compatible = "ethernet";
>>                 phy-mode = "mii";
>>                 //mac-address = [ 00 11 22 33 44 55 ];
> Why throw out the defined way to set a MAC addr and invent something
> new. If it's separating out some of the properties you want, you can
> have multiple "ethernet" nodes with some properties in each node and it
> all gets combined together at dtb compile time. I think the Tegra and
> other ARM dts files have examples of this.
>
> Rob
>
in my usecase there will be only 1 ethernet device. the mac is stored
inside the devices flash and will not be passed as a parameter by the
bootloader. We need to have some means to load things like mac addresses
from memory mapped flash devices. This is the reasoning behind this wrapper
