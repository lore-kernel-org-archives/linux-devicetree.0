From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH RFC v2 3/5] spmi: add generic SPMI controller binding
 documentation
Date: Tue, 27 Aug 2013 15:55:19 -0600
Message-ID: <521D2047.8030300@wwwdotorg.org>
References: <cover.1377202730.git.joshc@codeaurora.org> <e42576b69ef3d4e624fbfa2f32f6f79a931b55d6.1377202730.git.joshc@codeaurora.org> <5217DB0C.7000101@wwwdotorg.org> <20130827170120.GR4035@joshc.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20130827170120.GR4035@joshc.qualcomm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Sagar Dharia <sdharia@codeaurora.org>, Gilad Avidov <gavidov@codeaurora.org>, Michael Bohan <mbohan@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/27/2013 11:01 AM, Josh Cartwright wrote:
...
> If we want to ensure for the generic bindings that we are fulling
> characterizing/describing the SPMI bus, then we'll additionally need to
> tackle an additional identified assumption:
> 
>   4. One master per SPMI bus.  (The SPMI spec allows for up to 4
>      masters)
> 
> On the Snapdragon 800 series, there exists only one software-controlled
> master, but it is conceivably possible to have a setup with two
> software-controlled masters on the same SPMI bus.
> 
> This necessarily means that the description of the slaves and the
> masters will need to be decoupled; I'm imagining a generic binding
> supporting multiple masters would look something like this:

Is there a need to represent the other masters in the DT? Sure they're
there in HW, but if there's no specific way for the
CPU-to-which-the-DT-applies to actually interact with those other
masters (except perhaps by experiencing some arbitration delays) then
presumably there's no need to represent the other masters in DT?

> 	master0: master@0 {
> 		compatible = "...";
> 		#spmi-master-cells = <0>;
> 		spmi-mid = <0>;
> 
> 		...
> 	};
> 
> 	master2: master@2 {
> 		compatible = "...";
> 		#spmi-master-cells = <0>;
> 		spmi-mid = <2>;
> 
> 		...
> 	};
> 
> 	spmi_bus {
> 		compatible = "...";
> 
> 		spmi-masters = <&master0 &master2>;
> 
> 		foo@0 {
> 			compatible = "...";
> 			reg = <0 ...>;
> 		};
> 
> 		foo@8 {
> 			compatible = "...";
> 			reg = <8 ...>;
> 		};
> 	};
> 
> (This will also necessitate a change in the underlying SPMI driver
> model, in the current implementation, a SPMI master 'owns' a particular
> device.  This is not a valid assumption to make.)
> 
> Would this property-containing-phandle-vector be considered the
> canonical way of representing nodes with multiple parents in the device
> tree?

I don't think I've seen anything like this before, although that
in-and-of-itself doesn't make it wrong.

Another approach might be to encode master-vs-slave into a cell in the
reg property? Something like:

cell 0 - address type (0: master, 1: unique ID, 2: group ID, ...)
cell 1 - address value

I haven't thought much about that; perhaps there are disadvantages doing
that.
