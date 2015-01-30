From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [Patch v2 1/6] soc: qcom: gsbi: Add support for ADM CRCI muxing
Date: Fri, 30 Jan 2015 15:48:26 -0600
Message-ID: <C168E827-6052-4A7B-80EA-6330E8E08D51@codeaurora.org>
References: <1422599135-5588-1-git-send-email-agross@codeaurora.org> <1422599135-5588-2-git-send-email-agross@codeaurora.org> <B36DEAB1-2D89-4B6B-991E-C2EDBEB684D9@codeaurora.org> <54CBF9AE.6060902@codeaurora.org>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54CBF9AE.6060902@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <agross@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Jan 30, 2015, at 3:37 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> On 01/30/15 08:32, Kumar Gala wrote:
>> On Jan 30, 2015, at 12:25 AM, Andy Gross <agross@codeaurora.org> wro=
te:
>>=20
>>> Required properties if child node exists:
>>> - #address-cells: Must be 1
>>> - #size-cells: Must be 1
>>> - ranges: Must be present
>>>=20
>>> +Note: Each GSBI should have an alias correctly numbered in "aliase=
s" node.
>>> +
>>> Properties for children:
>>>=20
>>> A GSBI controller node can contain 0 or more child nodes representi=
ng serial
>>> @@ -37,6 +41,10 @@ Example for APQ8064:
>>>=20
>>> #include <dt-bindings/soc/qcom,gsbi.h>
>>>=20
>>> +	aliases {
>>> +		gsbi4 =3D <&gsbi4>;
>>> +	};
>> You appear to be using the alias name to determine a index number fo=
r the gsbi, if that is the case, than you should probably just add a ce=
ll-index node to the gsbi=92s for this purpose.
>>=20
>=20
> I thought cell-index was "deprecated" and referred more to things lik=
e
> enumerating all the devices on a bus by assigning them a unique ID.
> Aliases, on the other hand, allow us to enumerate a subset of devices
> that share the same bus with other devices of different types. For
> example, how would I know that a device is gsbi1 vs serial1 if they b=
oth
> used cell-index and they both had the same parent node?

I think the problem was cell-index was never well understood and abused=
=2E  For the example you are giving you wouldn=92t use cell-index becau=
se you are talking about things that would have different compatibles. =
 For what it appears we really are enumerating the GSBI hardware to mat=
ch some programming interface convention.  If that is the case than I t=
hink cell-index is proper.

- k

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
