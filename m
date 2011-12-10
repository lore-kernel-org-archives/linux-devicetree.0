From: Michael Bohan <mbohan@codeaurora.org>
Subject: Representing SPMI bus in Device Tree
Date: Fri, 09 Dec 2011 16:25:28 -0800
Message-ID: <4EE2A6F8.3010604@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>, David Brown <davidb@codeaurora.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

I am designing a bus driver for the System Power Management Interface, 
which is also known as SPMI. Information about the bus can be found 
through this website:

http://www.mipi.org/specifications/system-power-management-interface

In short, to make a transaction, you need two things: a 4 bit slave ID 
and a 16 bit address offset.

One difference in our model is a requirement to instantiate multiple 
devices on the same slave ID. That is to say, our 16 bit address space 
is segmented. For this reason, I was thinking it would be nice to have 
an optional second level in the tree under the bus driver. The first 
level specifies the slave ID, and the optional second is reserved for 
specifying any number of address ranges for carving out chunks in the 
16-bit address space.

Here is a graphical representation on this model:

/ {
         spmi@abc123 {
         #address-cells = <1>;
                 #size-cells = <0>;
         compatible = "qcom,spmi-platform";
                 pmic@1 {
                         #address-cells = <1>;
                         #size-cells = <1>;
                         reg = <0x1>;
                         spmi-dev-container;

                         coincell@beef {
                                 compatible = "qcom,coincell";
                                 reg = <0xbeef 0x4000>;
                 		interrupts = <100>;
                         };
                         pon@cafe {
                                 compatible = "qcom,pon";
                                 reg = <0xcafe 0x4000 0xf00 0x1000>;
                         };
                 };
                 simple_dev@2 {
                         compatible = "qcom,pon";
                         reg = <0x2>;
             		interrupts = <51>;
                 };
         };
};

For each node entry, the of layer checks for the spmi-dev-container flag 
that instructs whether this node 'contains' another level of devices, of 
which include and number of bus address ranges. I think this approach 
does a good job of describing the hardware and respecting the Device 
Tree conventions.

I can think of a couple other ways to portray this same information, but 
each have what I consider huge problems. For example, we could treat the 
first 'reg' tuple to mean slave ID, and any subsequent ones to be bus 
addresses:


spmi@abc123 {
     #address-cells = <1>;
     #size-cells = <1>;
     compatible = "qcom,spmi-platform";
     coincell@1 {
         compatible = "qcom,coincell";
         reg = <0x1 0x0 0xbeef1 0x4000>;
         interrupts = <100>;
     };
     pon@1 {
         compatible = "qcom,pon";
         reg = <0x1 0x0 0xcafe1 0x4000 0xf001 0x1000>;
     };
     simple_dev@2 {
         compatible = "qcom,pon";
         reg = <0x2>;
         interrupts = <51>;
     };
};

But then we end up with duplicate devices on the same node address for 
the same bus level, which I understand is not allowed in Device Tree. 
Also, I don't like the notion that the address meaning is overloaded 
here. We could establish a new binding to represent bus addresses (eg. 
spmi-bus-addr = <0xcafe 0x4000>, but my understanding is there should be 
only one address specifier per node level.

Another possibility is to have a single level that encapsulates both a 
slave id and bus address within one address. For ex. the upper bits 
represent the bus address and the least significant nibble is the slave 
id. This seems somewhat convoluted, though. Since we require support for 
multiple bus address ranges, then we have redundancy in the sense that 
each address includes a separate declaration of the slave ID. Plus, we 
have the same issue of an arbitrary structure imposed on an address.

I probably dislike this one the most.

Ex.

spmi@abc123 {
     #address-cells = <1>;
     #size-cells = <1>;
     compatible = "qcom,spmi-platform";
     coincell@beef1 {
         compatible = "qcom,coincell";
         reg = <0xbeef1 0x4000>;
         interrupts = <100>;
     };
     pon@cafe1 {
         compatible = "qcom,pon";
         reg = <0xcafe1 0x4000 0xf001 0x1000>;
     };
     simple_dev@2 {
         compatible = "qcom,pon";
         reg = <0x2>;
         interrupts = <51>;
     };
};

To me the first example is the most consistent with what Device Tree 
expects, but I certainly welcome any feedback or additional ideas.

A separate but related problem is how to convey these bus addresses and 
interrupt values in a data structure. The of_platform code puts these in 
a 'struct resource', which is almost exactly what we want here. But the 
problem is that the semantics of a resource include addresses that are 
translatable to cpu addresses, and SPMI addresses are not. For example, 
of_address_to_resource() will fail on this model since it tries to 
translate the addresses. I can always implement it using more primitive 
APIs, but the fact that of_address_to_resource() is designed this way 
makes me think that perhaps 'resources' are not the right mechanism to 
be using. What is the best way to convey a variable amount of bus 
addresses and interrupt numbers? Should we invent a new data structure?

Thanks in advance for any suggestions that people have.

Mike

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum
