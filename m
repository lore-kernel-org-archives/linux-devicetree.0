From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: Add bindings for phy-da8xx-usb
Date: Fri, 15 Apr 2016 20:05:56 +0300
Message-ID: <57111F74.5000601@cogentembedded.com>
References: <1460658919-4965-1-git-send-email-david@lechnology.com>
 <1460658919-4965-3-git-send-email-david@lechnology.com>
 <5710C6E1.8010401@cogentembedded.com> <57111332.5050808@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57111332.5050808@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: petr@barix.com, khilman@kernel.org, nsekhar@ti.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/15/2016 07:13 PM, David Lechner wrote:

>>> Device tree binding for new phy-da8xx-usb driver.
>>>
>>> Signed-off-by: David Lechner <david@lechnology.com>
>>> Acked-by: Rob Herring <robh@kernel.org>
>>> ---
>>>
>>> v4 changes:
>>>
>>> * swapped order of usb20 and usb11 to be in logical order of reg address.
>>>
>>>   .../devicetree/bindings/phy/phy-da8xx-usb.txt      | 40
>>> ++++++++++++++++++++++
>>>   1 file changed, 40 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
>>> b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
>>> new file mode 100644
>>> index 0000000..bead185
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
>>> @@ -0,0 +1,40 @@
>>> +TI DaVinci DA8xx USB PHY
>>
>>     DA8xx is not DaVinci, please omit this.
>
> Just to be sure, you mean omit "DaVinci"?

    Exactly. It would be better to mention OMAP-L1x instead.

MBR, Sergei
