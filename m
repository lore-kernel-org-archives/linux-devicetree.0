From: "Karicheri, Muralidharan" <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: RE: standalone dtc compiler build from
 git://git.jdl.com/software/dtc.git  gives error
Date: Wed, 11 Apr 2012 22:26:20 +0000
Message-ID: <3E54258959B69E4282D79E01AB1F32B7300A78@DFLE34.ent.ti.com>
References: <3E54258959B69E4282D79E01AB1F32B7300643@DFLE34.ent.ti.com>
 <4F85CB76.1010904@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F85CB76.1010904-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>> -----Original Message-----
>> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
>> Sent: Wednesday, April 11, 2012 2:21 PM
>> To: Karicheri, Muralidharan
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Subject: Re: standalone dtc compiler build from git://git.jdl.com/software/dtc.git gives
>> error
>> 
>> On 04/11/2012 11:59 AM, Karicheri, Muralidharan wrote:
>> > Hi, Jon Lolieger,
>> >
>> > I have tried using the standalone dtc compiler at git://git.jdl.com/software/dtc.git
>> > to compile my dts file and got the following error:-
>> >
>> > a0868495@ares-ubuntu:~/dtc$ dtc -I dts -O dtb tci6614-evm.dts
>> > DTC: dts->dtb  on file "tci6614-evm.dts"
>> > tci6614-evm.dts:4 syntax error
>> >
>> ...
>> > Why is the dtc not able to compile the dts file?
>> 
>> I think the only way to answer that is going to be to post your .dts
>> file, or at least the first 4 or 5 lines of it.

Stephen,

Thanks for responding.

Here it is 

/dts-v1/;
/include/ "skeleton.dtsi"

/ {
        model = "Texas Instruments TCI6614 EVM";
        compatible = "ti,tci6614-evm";
        #address-cells = <1>;
        #size-cells = <1>;

And "skeleton.dtsi" has 

/*
 * Skeleton device tree; the bare minimum needed to boot; just include and
 * add a compatible value.  The bootloader will typically populate the memory
 * node.
 */

/ {
        #address-cells = <1>;
        #size-cells = <1>;
        chosen { };
        aliases { };
        memory { device_type = "memory"; reg = <0 0>; };
};

BTW, the dtc compiler in the Linux kernel tree runs fine. Also I get the same error when I run the
dtc against other existing dts files in the Linux 3.2 kernel tree. Any clue?

Thanks

Murali
