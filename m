From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [Patch v2 1/6] soc: qcom: gsbi: Add support for ADM CRCI muxing
Date: Mon, 02 Feb 2015 18:05:04 -0800
Message-ID: <54D02CD0.4090806@codeaurora.org>
References: <1422599135-5588-1-git-send-email-agross@codeaurora.org> <1422599135-5588-2-git-send-email-agross@codeaurora.org> <B36DEAB1-2D89-4B6B-991E-C2EDBEB684D9@codeaurora.org> <54CBF9AE.6060902@codeaurora.org> <C168E827-6052-4A7B-80EA-6330E8E08D51@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <C168E827-6052-4A7B-80EA-6330E8E08D51@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Andy Gross <agross@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On 01/30/15 13:48, Kumar Gala wrote:
> On Jan 30, 2015, at 3:37 PM, Stephen Boyd <sboyd@codeaurora.org> wrot=
e:
>
>> On 01/30/15 08:32, Kumar Gala wrote:
>>> On Jan 30, 2015, at 12:25 AM, Andy Gross <agross@codeaurora.org> wr=
ote:
>>>
>>>> Required properties if child node exists:
>>>> - #address-cells: Must be 1
>>>> - #size-cells: Must be 1
>>>> - ranges: Must be present
>>>>
>>>> +Note: Each GSBI should have an alias correctly numbered in "alias=
es" node.
>>>> +
>>>> Properties for children:
>>>>
>>>> A GSBI controller node can contain 0 or more child nodes represent=
ing serial
>>>> @@ -37,6 +41,10 @@ Example for APQ8064:
>>>>
>>>> #include <dt-bindings/soc/qcom,gsbi.h>
>>>>
>>>> +	aliases {
>>>> +		gsbi4 =3D <&gsbi4>;
>>>> +	};
>>> You appear to be using the alias name to determine a index number f=
or the gsbi, if that is the case, than you should probably just add a c=
ell-index node to the gsbi=92s for this purpose.
>>>
>> I thought cell-index was "deprecated" and referred more to things li=
ke
>> enumerating all the devices on a bus by assigning them a unique ID.
>> Aliases, on the other hand, allow us to enumerate a subset of device=
s
>> that share the same bus with other devices of different types. For
>> example, how would I know that a device is gsbi1 vs serial1 if they =
both
>> used cell-index and they both had the same parent node?
> I think the problem was cell-index was never well understood and abus=
ed.  For the example you are giving you wouldn=92t use cell-index becau=
se you are talking about things that would have different compatibles. =
 For what it appears we really are enumerating the GSBI hardware to mat=
ch some programming interface convention.  If that is the case than I t=
hink cell-index is proper.

Can you please explain when cell-index should be used and when aliases
should be used? I'm confused because I recall this message from Rob
Herring[1] where it's indicated that cell-index is pretty much
deprecated. I'm also interested to find out what cell means in
cell-index. Does it have any relation to *-cells properties?

[1] https://lkml.org/lkml/2012/11/10/102

--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
