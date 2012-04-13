From: "Karicheri, Muralidharan" <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: RE: standalone dtc compiler build from
 git://git.jdl.com/software/dtc.git  gives error
Date: Fri, 13 Apr 2012 15:26:04 +0000
Message-ID: <3E54258959B69E4282D79E01AB1F32B7302875@DFLE34.ent.ti.com>
References: <3E54258959B69E4282D79E01AB1F32B7300643@DFLE34.ent.ti.com>
 <4F85CB76.1010904@wwwdotorg.org>
 <3E54258959B69E4282D79E01AB1F32B7300A78@DFLE34.ent.ti.com>
 <4F861023.7080307@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F861023.7080307-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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

Stephen,
>> -----Original Message-----
>> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
>> Sent: Wednesday, April 11, 2012 7:14 PM
>> To: Karicheri, Muralidharan
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Subject: Re: standalone dtc compiler build from git://git.jdl.com/software/dtc.git gives
>> error
>> 
>> On 04/11/2012 04:26 PM, Karicheri, Muralidharan wrote:
>> >>> -----Original Message-----
>> >>> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
>> >>> Sent: Wednesday, April 11, 2012 2:21 PM
>> >>> To: Karicheri, Muralidharan
>> >>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> >>> Subject: Re: standalone dtc compiler build from git://git.jdl.com/software/dtc.git
>> gives
>> >>> error
>> >>>
>> >>> On 04/11/2012 11:59 AM, Karicheri, Muralidharan wrote:
>> >>>> Hi, Jon Lolieger,
>> >>>>
>> >>>> I have tried using the standalone dtc compiler at git://git.jdl.com/software/dtc.git
>> >>>> to compile my dts file and got the following error:-
>> >>>>
>> >>>> a0868495@ares-ubuntu:~/dtc$ dtc -I dts -O dtb tci6614-evm.dts
>> >>>> DTC: dts->dtb  on file "tci6614-evm.dts"
>> >>>> tci6614-evm.dts:4 syntax error
>> >>>>
>> >>> ...
>> >>>> Why is the dtc not able to compile the dts file?
>> >>>
>> >>> I think the only way to answer that is going to be to post your .dts
>> >>> file, or at least the first 4 or 5 lines of it.
>> >
>> > Stephen,
>> >
>> > Thanks for responding.
>> >
>> > Here it is
>> > ...
>> 
>> That's odd. I just tried both v1.3.0 and master dtc, and could compile
>> your example just fine. I also compiled
>> arch/arm/boot/dts/tegra-cardhu.dts from the kernel (next-20120411). Both
>> worked fine.
>> 
>> Note that I get the error you're seeing if I run Ubuntu's packaged dtc,
>> which is 1.1.0.dfsg-1build1 on my system. Are you sure you're running
>> the dtc binary you think you are?

You are right. I never realized that I had a host version of dtc. The problem doesn't happen when I used the git version and I could boot up Linux using the DTB. Now I see the same error when run the command on an ARM
Target machine. I have cross compiled the dtc (using oe (actually Arago)). Not sure if anyone tried this on an ARM target.

root@tci6614-evm:/# ./dtc -I dts -O dtb -o tci6614-evm.dtb tci6614-evm.dts -q
DTC: dts->dtb  on file "tci6614-evm.dts"
tci6614-evm.dts:4 syntax error
FATAL ERROR: Unable to parse input tree
root@tci6614-evm:/# ./dtc -v
Version: DTC 1.2.0

root@tci6614-evm:/# cat tci6614-evm.dts
/dts-v1/;
/include/ "skeleton.dtsi"

/ {
        model = "Texas Instruments TCI6614 EVM";
        compatible = "ti,tci6614-evm";
        #address-cells = <1>;
        #size-cells = <1>;

        chosen {
                bootargs = "console=ttyS0,115200n8 mem=512M rootwait=1 rw ubi.mt
d=2,2048 rootfstype=ubifs root=ubi0:rootfs";
        };

root@tci6614-evm:/# cat skeleton.dtsi
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

Murali
