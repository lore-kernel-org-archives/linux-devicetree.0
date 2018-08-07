From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] phy: qcom-qmp: Fix dts bindings to reflect reality
Date: Mon, 6 Aug 2018 22:18:03 -0700
Message-ID: <CAD=FV=We9OQggYh_vpB6AF4uj=Fk1cqVZZhOijfOv0fEh98DZw@mail.gmail.com>
References: <20180706233142.166296-1-dianders@chromium.org>
 <20180720141059.GA3064@rob-hp-laptop> <CAD=FV=WzjZBYV+yjekC-GGgjyWNbdGX=ZwesQMQhiYHZLyzhzA@mail.gmail.com>
 <CAL_JsqKZUB3P_Z_pRG-Udx0wgWtSjzgF=Rc3t8Xf2n2uZkV3Qw@mail.gmail.com>
 <CAD=FV=XBCeKUrfMCppfhetWNWLJWzsbiBkQnTugoXDff-0SD5w@mail.gmail.com>
 <CAL_Jsq+X=RZK-GU+9LqK-0O1A=cYeudhHvvnrXm6xv=j1Ck4_w@mail.gmail.com>
 <CAD=FV=UDq8oq+nKsa2mZWvAUueUFxEUSYz2JoZ=E7e131SOR=g@mail.gmail.com> <CAL_Jsq+MMunmVWqeW9v2RyzsMKP+=kMzeTHNMG4JDHM7Fy0HBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+MMunmVWqeW9v2RyzsMKP+=kMzeTHNMG4JDHM7Fy0HBg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Manu Gautam <mgautam@codeaurora.org>, Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Jul 23, 2018 at 4:33 PM, Rob Herring <robh@kernel.org> wrote:
>> OK, I guess I will try again then and you can tell me when I get it
>> right (unless you tell me I should just change the driver to not use
>> named registers at all).  How about:
>>
>> - reg:
>>   - For "qcom,sdm845-qmp-usb3-phy":
>>     - index 0: address and length of register set for PHY's common serdes
>>                block.
>>     - index 1: address and length of the DP_COM control block.
>
> Instead of repeating index 0 below, just say "for
> 'qcom,sdm845-qmp-usb3-phy' only" here.
>
>>   - For all others:
>>     - index 0: address and length of register set for PHY's common serdes
>>                block.
>> - reg-names:
>>   - For "qcom,sdm845-qmp-usb3-phy":
>>     - Should be: "reg-base", "dp_com"
>>   - For all others:
>>     - The reg-names property shouldn't be defined.

To close the loop, I've just posted
<https://lore.kernel.org/patchwork/patch/972177/> AKA ("dt-bindings:
phy: qcom-qmp: Cleanup the 'reg' documentation as per review").
Hopefully that addresses everything properly but if not I'm happy to
spin it again.  Thanks for your patience in helping me understand what
you were looking for.

-Doug
