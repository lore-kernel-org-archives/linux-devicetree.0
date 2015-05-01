From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v7 3/5] Documentation: Add documentation for the APM
 X-Gene SoC EDAC DTS binding
Date: Thu, 30 Apr 2015 23:44:56 -0700
Message-ID: <CAPw-ZT=MqvAHApSh_stWsMS7HCdDQDqE6X_UHpHakpS9PoJpcw@mail.gmail.com>
References: <1430259045-19012-1-git-send-email-lho@apm.com>
	<CAPw-ZTksYNDE2zVD=ZjGzpKfXQN8KgW85ZnHoQ2eVmSGdSdMOw@mail.gmail.com>
	<CAL_JsqL7emqq=bSaWSi_0G5qSJqO+nVH_JH7VY+ynbrHhaSf_g@mail.gmail.com>
	<3511052.xgXf75lT96@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3511052.xgXf75lT96@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

>> > Now let us discuss the DT layout if it is an single driver:
>> >
>> > xgeneedac: xgeneedac@7e800000 {
>> >         compatible = "apm,xgene-edac";
>> >         regmap-efuse = <&efuse>; /* efuse */
>> >         reg = <0x0 0x78800000 0x0 0x100>, /* Top level interrupt
>> > status resource */
>> >                 <0x0 0x7e200000 0x0 0x1000>, /* CSW for MCB active resource
>> >                 <0x0 0x7e700000 0x0 0x1000>, /* MCB A resource */
>> >                 <0x0 0x7e720000 0x0 0x1000>, /* MCB B resource */
>> >                 <0x0 0x7e800000 0x0 0x1000>, /* MCU 0 resource */
>> >                 <0x0 0x7e840000 0x0 0x1000>, /* MCU 1 resource */
>> >                 <0x0 0x7e880000 0x0 0x1000>, /* MCU 2 resource */
>> >                 <0x0 0x7e8c0000 0x0 0x1000>, /* MCU 3 resource */
>> >                 <0x0 0x7c000000 0x0 0x200000>, /* CPU 0 domain for L1 and L2 */
>> >                 <0x0 0x7c200000 0x0 0x200000>, /* CPU 1 domain for L1 and L2 */
>> >                 <0x0 0x7c400000 0x0 0x200000>, /* CPU 2 domain for L1 and L2 */
>> >                 <0x0 0x7c600000 0x0 0x200000>, /* CPU 3 domain for L1 and L2 */
>> >                 <0x0 0x7e600000 0x0 0x1000>, /* L3 resource */
>> >                 <0x0 0x7e930000 0x0 0x1000>, /* SoC bus resource */
>> >                 <0x0 0x7e000000 0x0 0x1000>, /* SoC device resource */
>>
>> Uggg, no. You were on the right track earlier in the thread. One node
>> per instance of each block.
>>
>
> I agree these should be separate nodes, but I also think that we want a
> separate node for the pcp/pcperror/xgeneedac device. The compatible
> string for that should match whatever the datasheet calls that block,
> no idea why we now have the third name for that.

Let me go back to the regmap in the previous version - one node for
CPU domain bus (PCP), one  node for CPU switch fabric (CSW), one node
for the memory bridge A (MCB A), one node for the memory bridge B (MCB
B). Writing an simple driver that all it will provide is an map of
that those registers space doesn't make sense to me if once can use
the regmap interface. There is really nothing in these IP's that the
OS would care about. Anyone would care would be the FW.

>
> The specific parts could either be subnodes of the pcperror device,
> or they could be separate device nodes that reference the pcperror
> device through a phandle, so the driver can make the connection between
> them. This probably depends on what exactly all those nodes are:
> if the registers in there are all exclusively related to EDAC handling
> of the pcperror, subnodes would be best, but if the registers also
> contain functionality that is not related to EDAC handling, we
> probably want to have separate top-level nodes that a driver could
> bind to, e.g. for doing power management on the memory controller.

Again... Each sub-block does have some other type of register besides
the parity status registers and etc. But they are also divided
according into block of registers.For power management with the memory
controller, those will be handled by the FW. The only exception that I
can see is the CPU clock divider for the P-state which will require an
driver but that region can be mapped as a special area.

Let's just focus on the memory controller first and not worry about
the other just yet. So here is what I have:

/* CPU bus node */
pcp: pcp@78800000 {
        compatible = "syscon";
        reg = <0x0 0x78800000 0x0 0x100>;
};

/* CPU switch fabric node */
csw: csw@7e200000 {
        compatible = "syscon";
        reg = <0x0 0x7e200000 0x0 0x1000>;
};

/* Memory Bridge A */
mcba: mcba@7e700000 {
        compatible = "syscon";
        reg = <0x0 0x7e700000 0x0 0x1000>;
};

/* Memory Bridge B */
mcbb: mcbb@7e720000 {
        compatible = "syscon";
        reg = <0x0 0x7e720000 0x0 0x1000>;
};

/* Memory Controller 0 */
edacmc0: edacmc0@7e800000 {
        compatible = "apm,xgene-edac-mc";
        regmap-pcp = <&pcp>;
        regmap-csw = <&csw>;
        regmap-mcba = <&mcba>;
        regmap-mcbb = <&mcbb>;
        reg = <0x0 0x7e800000 0x0 0x1000>;
        interrupts = <0x0 0x20 0x4>,
                          <0x0 0x21 0x4>;
};

Any comment on this before I generate another version?

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
