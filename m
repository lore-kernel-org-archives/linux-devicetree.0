From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v5 3/4] dt-bindings: phy: Add support for QMP phy
Date: Mon, 20 Mar 2017 13:56:33 +0530
Message-ID: <CAFp+6iE7JcadaD4zXAt4f3fcYP0O3sAFSW-uu1Rg+2e8DXaVHw@mail.gmail.com>
References: <1489050441-3240-1-git-send-email-vivek.gautam@codeaurora.org>
 <1489050441-3240-4-git-send-email-vivek.gautam@codeaurora.org> <20170315203456.pxroh7nir2iwll3o@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170315203456.pxroh7nir2iwll3o@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: kishon <kishon@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,


On Thu, Mar 16, 2017 at 2:04 AM, Rob Herring <robh@kernel.org> wrote:
> On Thu, Mar 09, 2017 at 02:37:20PM +0530, Vivek Gautam wrote:
>> Qualcomm chipsets have QMP phy controller that provides
>> support to a number of controller, viz. PCIe, UFS, and USB.
>> Adding dt binding information for the same.
>>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>> Cc: Rob Herring <robh@kernel.org>
>> ---
>>
>> Hi Rob,
>> I have removed your Acked-by tag because of the change in bindings.
>> Please consider adding your Ack again if you are fine with these
>> updated bindings.
>>
>> Changes since v4:
>>  - Added bindings for child nodes. Each phy lane is represented by child
>>    node with its own register space (for tx, rx and pcs blocks), and clocks
>>    and resets for power control facility.
>>  - Removed register space and lane offsets for tx, rx and pcs blocks from
>>    qmp phy node.
>>  - #phy-cells is now part of each child node and thus must be 0.
>>  - Added information on list of mandatory clocks and resets for each phy.
>>
>> Changes since v3:
>>  - Added #clock-cells = <1>, indicating that phy is a clock provider.
>>
>> Changes since v2:
>>  - Removed binding for "ref_clk_src" since we don't request this
>>    clock in the driver.
>
> Humm, sounds suspicious. You should describe clocks connected to the h/w
> block, not what the driver uses (currently).

The "ref_clk_src" clock is not really going to the phy block. After
cross-checking
the hardware documents, we decided to remove this.
On the SoC, this is an external clock (outside of the clock
controller) that comes
to a clock pad that feeds few clock tx blocks. These blocks supply the reference
clock to each IP blocks.
Output of these tx blocks is what we refer to as "ref" clock in our bindings.

>
>>  - Addressed s/ref_clk/ref. Don't need to add '_clk' suffix to clock names.
>>  - Using 'phy' for the node name.
>>
>> Changes since v1:
>>  - New patch, forked out of the original driver patch:
>>    "phy: qcom-qmp: new qmp phy driver for qcom-chipsets"
>>  - Added 'Acked-by' from Rob.
>>  - Updated bindings to include mem resource as a list of
>>    offset - length pair for serdes block and for each lane.
>>  - Added a new binding for 'lane-offsets' that contains offsets
>>    to tx, rx and pcs blocks from each lane base address.
>>
>>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 106 +++++++++++++++++++++
>>  1 file changed, 106 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks for reviewing.

Best Regards
Vivek
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
