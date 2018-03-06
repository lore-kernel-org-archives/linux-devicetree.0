From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: introduce Command DB for QCOM SoCs
Date: Tue, 6 Mar 2018 08:57:40 -0700
Message-ID: <20180306155740.GB4930@codeaurora.org>
References: <20180226175802.20052-1-ilina@codeaurora.org>
 <20180226175802.20052-3-ilina@codeaurora.org>
 <152029567344.218381.8756848686590091138@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <152029567344.218381.8756848686590091138@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, rnayak@codeaurora.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mahesh Sivasubramanian <msivasub@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 05 2018 at 17:21 -0700, Stephen Boyd wrote:
>Quoting Lina Iyer (2018-02-26 09:58:02)
>> diff --git a/Documentation/devicetree/bindings/arm/msm/cmd-db.txt b/Documentation/devicetree/bindings/arm/msm/cmd-db.txt
>> new file mode 100644
>> index 000000000000..5737ed2ac6e8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/msm/cmd-db.txt
>> @@ -0,0 +1,38 @@
>> +Command DB
>> +---------
>> +
>> +Command DB is a database that provides a mapping between resource key and the
>
>s/between/between the/
>
>> +resource address for a system resource managed by a remote processor. The data
>> +is stored in a shared memory region and is loaded by the remote processor.
>> +
>> +Some of the Qualcomm Technologies Inc SoC's have hardware accelerators for
>
>s/SoC's/SoCs/
>
>> +controlling shared resources. Depending on the board configuration the shared
>> +resource properties may change. These properties are dynamically probed by the
>> +remote processor and made available in the shared memory.
>> +
>> +The bindings for Command DB is specified in the reserved-memory section in
>
>s/bindings/node/
>
>maybe?
>
>> +devicetree. The devicetree representation of the command DB driver should be:
>
>Maybe drop this last sentence entirely.
>
>> +
>> +Properties:
>> +- compatible:
>> +       Usage: required
>> +       Value type: <string>
>> +       Definition: Should be "qcom,cmd-db"
>> +
>> +- reg:
>> +       Usage: required
>> +       Value type: <prop encoded array>
>> +       Definition: The register address that points to the location of the
>> +                   Command DB in memory. Additionally, specify the address
>> +                   and size of the actual lacation in memory.
>
>s/lacation/location/
>
Will take care of these in the next spin.

>> +
>> +Example:
>> +
>> +       reserved-memory {
>> +               [...]
>> +               qcom,cmd-db@c3f000c {
>> +                       reg = <0x0 0xc3f000c 0x0 0x8>,
>> +                             <0x0 0x85fe0000 0x0 0x20000>;
>> +                       compatible = "qcom,cmd-db";
>> +               };
>> +       };
