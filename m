From: Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V2 1/3] arm64: dts: Add basic DT to support Spreadtrum's
 SP9860G
Date: Thu, 23 Feb 2017 14:20:26 +0800
Message-ID: <CAAfSe-t8pVM=bO+S4YatE0rYKgeeZntDbV4ufD5sC3jQYCwVMg@mail.gmail.com>
References: <1487660104-15693-1-git-send-email-chunyan.zhang@spreadtrum.com>
 <1487660104-15693-2-git-send-email-chunyan.zhang@spreadtrum.com>
 <20170221162744.GA29581@linaro.org> <20170222034632.GA18116@spreadtrum.com>
 <CANLsYkyba+QscLK5m=Fb4ErK_WEtyteR0ozS47W48izhrbSBfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CANLsYkyba+QscLK5m=Fb4ErK_WEtyteR0ozS47W48izhrbSBfg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Orson Zhai <orson.zhai@spreadtrum.com>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

[...]

>>> > +
>>> > +   soc {
>>> > +           soc_funnel: funnel@10001000 {
>>>
>>> There is no need for a label ("soc_funnel) before the device name if that
>>> device is not referenced elsewhere in the DTS.  The same comment applies to most
>>> of the component listed below.
>>>
>>
>> OK, I will remove these labels from this DT.
>> And there's another issue I'd like to discuss with you, do you think which way is better:
>> 1) use class name which can represent this kind of components as device node name in DT, e.g.
>>         funnel@... {
>>
>>         }
>>         replicator@... {
>>
>>         }
>>         etb@... {
>>
>>         }
>>         etf@...
>>         etm@...
>>         stm@...
>>
>> 2) use more descriptive device name for those which are more than one on
>> a SoC, e.g.
>>         soc-funnel@... {
>>
>>         }
>>         cluster0-funnel@... {
>>
>>         }
>>         cluster1-funnel@... {
>>
>>         }
>>
>> I noticed Juno use the 2), would you suggest that way?
>
> It is better to describe the HW component themselves rather than where
> they are in the topology - the address of the component will make sure
> the names are unique.  So just the component type (etm, funnel,
> replicator, ....) and the address they are located at.
>

OK. And to avoid making other person confused in the future, is it
better to revise juno-base.dtsi according to this convention?

Thanks,
Chunyan

>>
>> Thanks,
>> Chunyan
>>
>>> > +                   compatible = "arm,coresight-funnel", "arm,primecell";
>>> > +                   reg = <0 0x10001000 0 0x1000>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +                   ports {
>>> > +                           #address-cells = <1>;
>>> > +                           #size-cells = <0>;
>>> > +
>>> > +                           port@0 {
>>> > +                                   reg = <0>;
>>> > +                                   soc_funnel_out_port: endpoint {
>>> > +                                           remote-endpoint = <&etb_in>;
>>> > +                                   };
>>> > +                           };
>>> > +
>>> > +                           port@1 {
>>> > +                                   reg = <0>;
>>> > +                                   soc_funnel_in_port: endpoint {
>>> > +                                           slave-mode;
>>> > +                                           remote-endpoint =
>>> > +                                           <&main_funnel_out_port>;
>>> > +                                   };
>>> > +                           };
>>> > +                   };
>>> > +           };
>>> > +
>>> > +           etb@10003000 {
>>> > +                   compatible = "arm,coresight-tmc", "arm,primecell";
>>> > +                   reg = <0 0x10003000 0 0x1000>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +                   port {
>>> > +                           etb_in: endpoint {
>>> > +                                   slave-mode;
>>> > +                                   remote-endpoint =
>>> > +                                           <&soc_funnel_out_port>;
>>> > +                           };
>>> > +                   };
>>> > +           };
>>> > +
>>> > +           cluster0_funnel: funnel@11001000 {
>>> > +                   compatible = "arm,coresight-funnel", "arm,primecell";
>>> > +                   reg = <0 0x11001000 0 0x1000>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +                   ports {
>>> > +                           #address-cells = <1>;
>>> > +                           #size-cells = <0>;
>>> > +
>>> > +                           port@0 {
>>> > +                                   reg = <0>;
>>> > +                                   cluster0_funnel_out_port: endpoint {
>>> > +                                           remote-endpoint =
>>> > +                                                   <&cluster0_etf_in>;
>>> > +                                   };
>>> > +                           };
>>> > +
>>> > +                           port@1 {
>>> > +                                   reg = <0>;
>>> > +                                   cluster0_funnel_in_port0: endpoint {
>>> > +                                           slave-mode;
>>> > +                                           remote-endpoint = <&etm0_out>;
>>> > +                                   };
>>> > +                           };
>>> > +
>>> > +                           port@2 {
>>> > +                                   reg = <1>;
>>> > +                                   cluster0_funnel_in_port1: endpoint {
>>> > +                                           slave-mode;
>>> > +                                           remote-endpoint = <&etm1_out>;
>>> > +                                   };
>>> > +                           };
>>> > +
>>> > +                           port@3 {
>>> > +                                   reg = <2>;
>>> > +                                   cluster0_funnel_in_port2: endpoint {
>>> > +                                           slave-mode;
>>> > +                                           remote-endpoint = <&etm2_out>;
>>> > +                                   };
>>> > +                           };
>>> > +
>>> > +                           port@4 {
>>> > +                                   reg = <4>;
>>> > +                                   cluster0_funnel_in_port3: endpoint {
>>> > +                                           slave-mode;
>>> > +                                           remote-endpoint = <&etm3_out>;
>>> > +                                   };
>>> > +                           };
>>> > +                   };
>>> > +           };
>>> > +
>>> > +           cluster1_funnel: funnel@11002000 {
>>> > +                   compatible = "arm,coresight-funnel", "arm,primecell";
>>> > +                   reg = <0 0x11002000 0 0x1000>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +                   ports {
>>> > +                           #address-cells = <1>;
>>> > +                           #size-cells = <0>;
>>> > +
>>> > +                           port@0 {
>>> > +                                   reg = <0>;
>>> > +                                   cluster1_funnel_out_port: endpoint {
>>> > +                                           remote-endpoint =
>>> > +                                                   <&cluster1_etf_in>;
>>> > +                                   };
>>> > +                           };
>>> > +
>>> > +                           port@1 {
>>> > +                                   reg = <0>;
>>> > +                                   cluster1_funnel_in_port0: endpoint {
>>> > +                                           slave-mode;
>>> > +                                           remote-endpoint = <&etm4_out>;
>>> > +                                   };
>>> > +                           };
>>> > +
>>> > +                           port@2 {
>>> > +                                   reg = <1>;
>>> > +                                   cluster1_funnel_in_port1: endpoint {
>>> > +                                           slave-mode;
>>> > +                                           remote-endpoint = <&etm5_out>;
>>> > +                                   };
>>> > +                           };
>>> > +
>>> > +                           port@3 {
>>> > +                                   reg = <2>;
>>> > +                                   cluster1_funnel_in_port2: endpoint {
>>> > +                                           slave-mode;
>>> > +                                           remote-endpoint = <&etm6_out>;
>>> > +                                   };
>>> > +                           };
>>> > +
>>> > +                           port@4 {
>>> > +                                   reg = <3>;
>>> > +                                   cluster1_funnel_in_port3: endpoint {
>>> > +                                           slave-mode;
>>> > +                                           remote-endpoint = <&etm7_out>;
>>> > +                                   };
>>> > +                           };
>>> > +                   };
>>> > +           };
>>> > +
>>> > +           cluster0_etf: etf@11003000 {
>>> > +                   compatible = "arm,coresight-tmc", "arm,primecell";
>>> > +                   reg = <0 0x11003000 0 0x1000>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +
>>> > +                   port@0 {
>>> > +                           cluster0_etf_out: endpoint {
>>> > +                                   remote-endpoint =
>>> > +                                           <&main_funnel_in_port0>;
>>> > +                           };
>>> > +                   };
>>> > +
>>> > +                   port@1 {
>>> > +                           cluster0_etf_in: endpoint {
>>> > +                                   slave-mode;
>>> > +                                   remote-endpoint =
>>> > +                                           <&cluster0_funnel_out_port>;
>>> > +                           };
>>> > +                   };
>>> > +           };
>>> > +
>>> > +           cluster1_etf: etf@11004000 {
>>> > +                   compatible = "arm,coresight-tmc", "arm,primecell";
>>> > +                   reg = <0 0x11004000 0 0x1000>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +
>>> > +                   port@0 {
>>> > +                           cluster1_etf_out: endpoint {
>>> > +                                   remote-endpoint =
>>> > +                                           <&main_funnel_in_port1>;
>>> > +                           };
>>> > +                   };
>>> > +
>>> > +                   port@1 {
>>> > +                           cluster1_etf_in: endpoint {
>>> > +                                   slave-mode;
>>> > +                                   remote-endpoint =
>>> > +                                           <&cluster1_funnel_out_port>;
>>> > +                           };
>>> > +                   };
>>> > +           };
>>>
>>> When more than one port is present it is customary to add another level of
>>> imbrication like it is done for funnels above:
>>>                          "ports {"
>>>                                 port@0 {
>>>                                 ...
>>>                                 port@1 {
>>>                                 ...
>>>                         }
>>>
>>> The same comment applies to both etf.
>>>
>>
>> OK.
>>
>>> > +
>>> > +           main_funnel: funnel@11005000 {
>>> > +                   compatible = "arm,coresight-funnel", "arm,primecell";
>>> > +                   reg = <0 0x11005000 0 0x1000>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +
>>> > +                   ports {
>>> > +                           #address-cells = <1>;
>>> > +                           #size-cells = <0>;
>>> > +
>>> > +                           port@0 {
>>> > +                                   reg = <0>;
>>> > +                                   main_funnel_out_port: endpoint {
>>> > +                                           remote-endpoint =
>>> > +                                                   <&soc_funnel_in_port>;
>>> > +                                   };
>>> > +                           };
>>> > +
>>> > +                           port@1 {
>>> > +                                   reg = <0>;
>>> > +                                   main_funnel_in_port0: endpoint {
>>> > +                                           slave-mode;
>>> > +                                           remote-endpoint =
>>> > +                                                   <&cluster0_etf_out>;
>>> > +                                   };
>>> > +                           };
>>> > +
>>> > +                           port@2 {
>>> > +                                   reg = <1>;
>>> > +                                   main_funnel_in_port1: endpoint {
>>> > +                                           slave-mode;
>>> > +                                           remote-endpoint =
>>> > +                                                   <&cluster1_etf_out>;
>>> > +                                   };
>>> > +                           };
>>> > +                   };
>>> > +           };
>>> > +
>>> > +           etm@11440000 {
>>> > +                   compatible = "arm,coresight-etm4x", "arm,primecell";
>>> > +                   reg = <0 0x11440000 0 0x1000>;
>>> > +                   cpu = <&CPU0>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +
>>> > +                   port {
>>> > +                           etm0_out: endpoint {
>>> > +                                   remote-endpoint =
>>> > +                                           <&cluster0_funnel_in_port0>;
>>> > +                           };
>>> > +                   };
>>> > +           };
>>> > +
>>> > +           etm@11540000 {
>>> > +                   compatible = "arm,coresight-etm4x", "arm,primecell";
>>> > +                   reg = <0 0x11540000 0 0x1000>;
>>> > +                   cpu = <&CPU1>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +
>>> > +                   port {
>>> > +                           etm1_out: endpoint {
>>> > +                                   remote-endpoint =
>>> > +                                           <&cluster0_funnel_in_port1>;
>>> > +                           };
>>> > +                   };
>>> > +           };
>>> > +
>>> > +           etm@11640000 {
>>> > +                   compatible = "arm,coresight-etm4x", "arm,primecell";
>>> > +                   reg = <0 0x11640000 0 0x1000>;
>>> > +                   cpu = <&CPU2>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +
>>> > +                   port {
>>> > +                           etm2_out: endpoint {
>>> > +                                   remote-endpoint =
>>> > +                                           <&cluster0_funnel_in_port2>;
>>> > +                           };
>>> > +                   };
>>> > +           };
>>> > +
>>> > +           etm@11740000 {
>>> > +                   compatible = "arm,coresight-etm4x", "arm,primecell";
>>> > +                   reg = <0 0x11740000 0 0x1000>;
>>> > +                   cpu = <&CPU3>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +
>>> > +                   port {
>>> > +                           etm3_out: endpoint {
>>> > +                                   remote-endpoint =
>>> > +                                           <&cluster0_funnel_in_port3>;
>>> > +                           };
>>> > +                   };
>>> > +           };
>>> > +
>>> > +           etm@11840000 {
>>> > +                   compatible = "arm,coresight-etm4x", "arm,primecell";
>>> > +                   reg = <0 0x11840000 0 0x1000>;
>>> > +                   cpu = <&CPU4>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +
>>> > +                   port {
>>> > +                           etm4_out: endpoint {
>>> > +                                   remote-endpoint =
>>> > +                                           <&cluster1_funnel_in_port0>;
>>> > +                           };
>>> > +                   };
>>> > +           };
>>> > +
>>> > +           etm@11940000 {
>>> > +                   compatible = "arm,coresight-etm4x", "arm,primecell";
>>> > +                   reg = <0 0x11940000 0 0x1000>;
>>> > +                   cpu = <&CPU5>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +
>>> > +                   port {
>>> > +                           etm5_out: endpoint {
>>> > +                                   remote-endpoint =
>>> > +                                           <&cluster1_funnel_in_port1>;
>>> > +                           };
>>> > +                   };
>>> > +           };
>>> > +
>>> > +           etm@11a40000 {
>>> > +                   compatible = "arm,coresight-etm4x", "arm,primecell";
>>> > +                   reg = <0 0x11a40000 0 0x1000>;
>>> > +                   cpu = <&CPU6>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +
>>> > +                   port {
>>> > +                           etm6_out: endpoint {
>>> > +                                   remote-endpoint =
>>> > +                                           <&cluster1_funnel_in_port2>;
>>> > +                           };
>>> > +                   };
>>> > +           };
>>> > +
>>> > +           etm@11b40000 {
>>> > +                   compatible = "arm,coresight-etm4x", "arm,primecell";
>>> > +                   reg = <0 0x11b40000 0 0x1000>;
>>> > +                   cpu = <&CPU7>;
>>> > +                   clocks = <&ext_26m>;
>>> > +                   clock-names = "apb_pclk";
>>> > +
>>> > +                   port {
>>> > +                           etm7_out: endpoint {
>>> > +                                   remote-endpoint =
>>> > +                                           <&cluster1_funnel_in_port3>;
>>> > +                           };
>>> > +                   };
>>> > +           };
>>> > +   };
>>> > +};

[...]

>>> >
>>> > _______________________________________________
>>> > linux-arm-kernel mailing list
>>> > linux-arm-kernel@lists.infradead.org
>>> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
