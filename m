From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 1/3] mfd: devicetree: bindings: Add Qualcomm RPM DT binding
Date: Thu, 29 May 2014 15:32:21 -0700
Message-ID: <5387B575.2040803@gmail.com>
References: <1401211721-19712-1-git-send-email-bjorn.andersson@sonymobile.com> <1401211721-19712-2-git-send-email-bjorn.andersson@sonymobile.com> <09409B75-BBE3-47A6-8B4A-4E3DD29F81CD@codeaurora.org> <CAJAp7OgvChWSWgj6XRhqFC6i+T26PUCTLg5Ff722-oXDCgVuww@mail.gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAJAp7OgvChWSWgj6XRhqFC6i+T26PUCTLg5Ff722-oXDCgVuww@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Kumar Gala <galak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 5/29/2014 11:24 AM, Bjorn Andersson wrote:
> On Wed, May 28, 2014 at 9:34 AM, Kumar Gala <galak@codeaurora.org> wr=
ote:
>>
>> On May 27, 2014, at 12:28 PM, Bjorn Andersson <bjorn.andersson@sonym=
obile.com> wrote:
>>
>>> Add binding for the Qualcomm Resource Power Manager (RPM) found in =
8660, 8960
>>> and 8064 based devices. The binding currently describes the rpm its=
elf and the
>>> regulator subnodes.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
>>> ---
>>> Documentation/devicetree/bindings/mfd/qcom,rpm.txt | 284 ++++++++++=
+++++++++++
>>> include/dt-bindings/mfd/qcom_rpm.h                 | 142 ++++++++++=
+
>>> 2 files changed, 426 insertions(+)
>>> create mode 100644 Documentation/devicetree/bindings/mfd/qcom,rpm.t=
xt
>>> create mode 100644 include/dt-bindings/mfd/qcom_rpm.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,rpm.txt b/D=
ocumentation/devicetree/bindings/mfd/qcom,rpm.txt
>>> new file mode 100644
>>> index 0000000..3908a5d
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mfd/qcom,rpm.txt

< snip >

>>> +
>>> +- qcom,force-mode-none:
>>> +     Usage: optional (default if no other qcom,force-mode is speci=
fied)
>>> +     Value type: <empty>
>>> +     Defintion: indicates that the regulator should not be forced =
to any
>>> +                particular mode
>>> +
>>> +- qcom,force-mode-lpm:
>>> +     Usage: optional
>>> +     Value type: <empty>
>>> +     Definition: indicates that the regulator should be forced to =
operate in
>>> +                 low-power-mode
>>> +
>>> +- qcom,force-mode-auto:
>>> +     Usage: optional (only available for 8960/8064)
>>> +     Value type: <empty>
>>> +     Definition: indicates that the regulator should be automatica=
lly pick
>>> +                 operating mode
>>> +
>>> +- qcom,force-mode-hpm:
>>> +     Usage: optional (only available for 8960/8064)
>>> +     Value type: <empty>
>>> +     Definition: indicates that the regulator should be forced to =
operate in
>>> +                 high-power-mode
>>> +
>>> +- qcom,force-mode-bypass: (only for 8960/8064)
>>> +     Usage: optional (only available for 8960/8064)
>>> +     Value type: <empty>
>>> +     Definition: indicates that the regulator should be forced to =
operate in
>>> +                 bypass mode
>>> +
>>
>> Is force-mode really an enum?  Or can we really have multiple force-=
mode=E2=80=99s set?
>>
>=20
> Force mode is an enum, you can only set one of these.
>=20
> Looking around you can find three ways of doing this:
> 1) Make it an int and provide defines in a dt-bindings header file
> 2) Make it a string and list the possible values
> 3) Make it a set of boolean properties
>=20
> I just spent some time in the pinctrl struff that implements 3), I
> like the feel of it and I like how the dts ended up looking like.
>=20
> But if there's a strong opinion regarding this I could change it.

The problem with separate properties is that there is not a way to
detect the error of specifying multiple conflicting force-modes
at compile time.

It also means you can not override the default force-mode from one
=2Edts/.dtsi in another .dts/.dtsi.

< snip >

-Frank
